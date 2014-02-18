set guioptions-=T               " Hide toolbar buttons.
set guifont=Inconsolata:h16

if has('gui_macvim')
  " Re-map CMD+p to CTRL+p.
  macmenu File.Print key=<nop>
  map <D-p> :CtrlP<CR>
endif
