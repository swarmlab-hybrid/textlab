		FROM hub.swarmlab.io:5480/xelatex-basegui
		#
		USER root

		COPY sec_bootstrap /usr/bin
		COPY get_hosts /usr/bin
		COPY auto_update_hosts /usr/bin
		COPY install-vim-plugin.sh .

		ENV NOTVISIBLE "in users profile"
		ENV USER1 docker
		ENV USER_HOME /home/docker
                ENV SSHDIR ${USER_HOME}/.ssh
                ENV PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:/usr/sbin:/home/zeus/appl/docker/unilab/nvim-ide/mynvim/swarmlab-nvim:/home/zeus/.fzf/bin:/usr/local/texlive/bin/x86_64-linuxmusl:/usr/local/texlive/2020/bin/x86_64-linuxmusl
		COPY ssh/ ${SSHDIR}/

		RUN export DEBIAN_FRONTEND=noninteractive  		 && rm -rf /usr/share/doc 		 && rm -rf /usr/share/man 		 && rm -rf /usr/share/locale 		 && mkdir -p /var/run/sshd                  && addgroup -S docker && adduser -S docker -G docker 		 && echo 'root:pass' | chpasswd 		 && echo "export VISIBLE=now" >> /etc/profile 		 && mkdir -p /home/docker/project 		 && mkdir -p /etc/opt 		&& echo "docker:docker" | chpasswd 		&& echo "StrictHostKeyChecking no" > ${SSHDIR}/config 		&& cat ${SSHDIR}/*.pub >> ${SSHDIR}/authorized_keys 		&& chmod -R 600 ${SSHDIR}/* 	        && chown -R ${USER1}:${USER1} ${SSHDIR}


                COPY custom /tmp/bin
                RUN /tmp/bin/setup.sh


		COPY  .vimrc /home/docker 
		EXPOSE 3787

