## Swarmlab is a collection of services that aims to

 > -    provide teachers and professors tools to do their lessons
 > 
 > -    give students the opportunity to study real life examples in their chosen area of expertise
 > 
 > -    allow developers to fully test and debug their applications and provide POC’s
 > 
 > -    or you simply want to use a Application (in a microservices-based architecture)
 > 
 >  Swarmlab provides you with all the required tools, tools to teach work or try out demos in a completely virtual environment.
 > 
 > More info: http://docs.swarmlab.io/SwarmLab-HowTos/swarmlab/docs/swarmlab/docs/index.html


![alt text](images/swarmlab-network.png "")

##  LabInstance textLab


## Quickstart

This is a quickstart guide of howto use this **textLab**

   **Clone repo**

    (1) mkdir [dir4project]

    (2) cd [dir4project]

    (3) git clone 
> GIT_SSL_NO_VERIFY=true git clone https://git.swarmlab.io:3000/swarmlab/swarmlab-nvim.git


>  On Error: "x509: certificate signed by unknown authority
>  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>> See http://docs.swarmlab.io/SwarmLab-HowTos/swarmlab/docs/swarmlab/docs/install/install-docker.html#fix-x509-certificate-signed-by-unknown-authority-issue
>


  **HowTo start it**

  (1) Create Project

> make project-create

  (2) Start Project

> make project-start

  (2.a) Stop Project

> make project-stop


  **HowTo use it**

 (1) Edit xelatex/docs/main.tex

> make latex-edit

 (2) Compile LaTeX document

> make latex-build

>> neovim key map features: https://git.swarmlab.io:3000/swarmlab/swarmlab-nvim

 (3) View pdf

> make latex-view


 **How to use biber**

  (1) edit bib

> make latex-bib-edit

  (2) build bib

> make latex-bib-build

------------------------------------

- Default user

> docker

- Default password

> docker

- Default password4root

> pass

### Default xeLatex main file 

>
> /home/main.tex
>

### Backup xeLatex src files

>
> See More Options
>

### Reasons why you must, should, and should not use LaTeX

If you have to write down a document you will run your default text processor (probably MS Word) not even considering any other option. This processor probably fulfills all your needs. I would say that 95% of users out there have no idea what is **LaTeX.** And this is perfectly fine. However, it is a pity. Because LaTeX is one of the most successful and amazing free software projects ever done. It has been around for more than thirty years with two Turing awarded researchers directly participating in its design and implementation. LaTeX must have something special. Hopefully, after reading this post you will consider giving it a try.

I will not showcase how to use LaTeX because there is a lot of wonderful tutorials around. I will only enumerate when you **MUST, SHOULD, and SHOULD NOT use LaTeX.**

#### A bit of history

**Donald Knuth** (Turing Award 1974) published his first edition of The Art of Computer Programming in 1968 when he was thirty. By then, books were printed using monotype settings. Knuth was happy with the final print. However, the second edition in 1976 had to be typeset again because the original fonts were no longer available. When Knuth received the galley proofs he was disappointed. He found them inferior.

He committed himself to design his typesetting system. We are talking about the late seventies, when digital typesetting itself was a problem to be solved. Steve Jobs himself contributed to this topic. Knuth planned to spend his sabbatical year in 1978 to finish the project. He underestimated the complexity of the task. The final solution was not ready until 1989! Knuth called this language TeX with each letter a capital Greek letters tau τ, epsilon ε and chi χ. TeX is the abbreviation for τέχνη (techne) which means “art” and “craft”. Knuth has always insisted that you should pronounce it /tɛk/.

When **Leslie Lamport** (Turing Award 2013) started using Knuth’s TeX he started writing some macros for his own purposes. LaTeX is simply LAmport’s TeX, a collection of macros on top of TeX to make it easier. And this is the main collection we have today.
What can I do with LaTeX?

With LaTeX you can have a high quality typesetting (the best I would say) document with a low effort and no money. With no money because it is free. And with no effort. Yes with no effort. This claim is huge. EVERYBODY can get professional results writing plain text and using markups with a software that is free and can run virtually everywhere. That is why LaTeX is the standard in academia and engineering.

This sounds fantastic… but as you can expect from the title of this article there are some drawbacks. The main one is the learning curve. LaTeX is not a WYSIWYG (What You See Is What You Get) solution and requires a learning period. Let me give you some guidelines about when you MUST, SHOULD and SHOULD NOT use it. Of course all this comes from my point of view and experience after using LaTeX for more than 15 years.

#### When you MUST use LaTeX?

- You are in academia, particularly in any STEM discipline. In this scenario manuscripts are everything. Content is really important and requires a tremendous amount of work. In the case of Ph.D. manuscripts, you MUST consider spending some time learning LaTeX to make the difference in your final outcome. I have seen Ph.D. manuscripts written in MS Word and I have to say that somehow (for me) it diminishes the value of the manuscript.
- You work with abundant bibliography. Professional works may manage hundreds of citations. Citations must have a consistent format, otherwise your bibliography section will be a mess. To save time, you must go with LaTex + BibTeX. Fill your BibTex file with your citation entries, tag them, and use the tag in your latex document as a reference. The compiler will do the rest of the work. I know there are plugins and solutions for MS Word and other text processors. But remember, for thirty years, this problem has been solved with plain text. And from my experience, these plugins result cumbersome.
- You are using formulas. 
- You expect figures using the best quality possible. Formats such as SVG cannot be available for your text processor. With LaTeX, you can generate PDF documents with embedded SVG figures. Not many solutions around can offer something like this.
- You want a free solution.
- You want it to be forward compatible. LaTeX has been around for more than thirty years. We can typeset old documents and see how they were intended to be.
- One entry point, several output formats. Because LaTeX is a typesetting system, you can get outputs in DVI, PDF, HTML, XML, etc. with a single document.
- Forget about the document layout. LaTeX is somehow like HTML + CSS. Once you define the document structure, you use a markup language, and the compiler will make everything coherent for you. No more paragraphs separated with double spacing instead of a single space.

#### When you SHOULD use LaTeX?

- You are new to LaTeX, you have to start a new project and you are looking for all the advantages that it offers.
- You want your documents to stand out among others. And you will. LaTeX outcomes have a distinguishing quality everybody appreciates.
- You are considering writing a book, article, or manuscript and maybe self-publish it. This is a common situation nowadays with the adoption of platforms such as Amazon Self Publishing. With LaTeX, you can go from your raw text to a high quality .epub, .mobi ebook file.

#### When you SHOULD NOT use LaTeX?

- Your document is already written in another format. The content is probably easy to be moved to LaTeX. However, the document’s layout could be hard to get.
- You are doing collaborative work, and you are the only LaTeX practitioner. Do not move into LaTeX. Do not even consider it. My experience says that after starting a shared LaTeX project, your colleagues will complain, and you will finally move everything to a commonly understood format two hours before the deadline.
- The layout of your document means everything to you. You are thinking about a mesmerizing print with 30 types of fonts, text lines crossing the text body, images in every possible place across the document, etc. Then probably LaTeX is not your candidate.

#### When people complain about LaTeX they say…

- It is difficult. LaTeX has a much steeper learning curve when compared with MS Word that is true. However, getting a basic LaTeX (text, figures, titles, tables) document is not so difficult. There are a million examples out there. The complexity comes in understanding the concepts used by LaTeX, such as floating objects.
- I cannot see what I am doing. LaTeX is not a WYSIWYG solution. You have to compile and then check the output. Fortunately, there are some programs such as TeXMaker that offer a better user experience.
- Figures do not appear where I want. Well, this is a classic misconception about how figures placement works in LaTeX. LaTeX computes the best location for your figures in your document. However, the position can be changed using modifiers.
- I cannot easily change the layout of my document. This is true. If you want to set your own document structure you need to have a deeper understanding of the macros. There is a nice community to help you with it. However, this may require some time and effort. Fortunately, there is a vast number of templates already defined ready to be used.

#### And now…

If you have read this far, thanks. I probably captured your interest. If so, you can start learning some basics here, and if you need some help check out the StackExchange.

What about you? What is your experience using LaTeX? What are your pieces of advice for newbies or experienced users?


**A first version of this article was published at:** 

 https://jmtirado.net/why-you-should-learn-latex-or-at-least-give-it-a-try/

 https://towardsdatascience.com/why-should-you-learn-latex-or-at-least-give-it-a-try-8d0f3218b8e

 https://typeset.io/resources/learn-latex-beginners-step-by-step-guide/




### More info

https://www.youtube.com/watch?v=21oADyhhX4I

https://www.youtube.com/watch?v=ZmcOBdmImFs

http://www.docs.is.ed.ac.uk/skills/documents/3722/3722-2014.pdf

 

