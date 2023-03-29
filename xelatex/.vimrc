map <C-e> :NERDTreeToggle<CR>

autocmd BufNewFile,BufRead *.vue,*.js set syntax=verilog tabstop=2|set shiftwidth=2|set noexpandtab autoindent
augroup remember_folds
  autocmd!
  autocmd BufWinLeave * mkview
  autocmd BufWinEnter * silent! loadview
augroup END
" Useful for my Quick Notes feature in my tmuxrc
augroup QuickNotes
  au BufWrite,VimLeave NOTES.otl mkview
  au BufRead           NOTES.otl silent loadview
augroup END
set swapfile
set dir=~/tmp
