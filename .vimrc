" --- PLUGINS ---
call plug#begin('~/.vim/plugged')

Plug 'bluz71/vim-moonfly-colors', { 'as': 'moonfly' } " High contrast base
Plug 'neoclide/coc.nvim', {'branch': 'release'}       " Intelligence

call plug#end()

" --- THE WARM GOTHIC AESTHETIC ---
set termguicolors
syntax on
colorscheme moonfly

" OVERRIDES: Turning the cold UI into a Bloody Sanctuary
highlight Normal       guibg=#0a0000 guifg=#d1c4c4 " Deepest red-black background, bone-white text
highlight CursorLine   guifg=#ff0000 guibg=#0a0000 gui=bold               " Subtle bloody highlight on current line
highlight LineNr       guifg=#5e0000 guibg=#0a0000               " Dried blood color for line numbers
highlight CursorLineNr guifg=#ff0000 gui=bold      " Glowing red for current line number
highlight Statement    guifg=#8b0000 gui=bold      " Dark red for code keywords
highlight Comment      guifg=#4a4242 gui=italic    " Ash-colored comments
highlight Constant     guifg=#ff3333               " Bright blood red for constants/strings
highlight SignColumn   guibg=#0a0000               " Keeps the 'gutter' black

" --- PRODUCTIVITY BINDINGS ---

" Save with Ctrl+S
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>gi

" Save and Quit everything with Ctrl+X (optional but handy)
nnoremap <C-x> :wqa<CR>

" Smooth escape
inoremap jj <Esc>

" Use coc-explorer as the Surgical File Manager
nnoremap <C-n> :CocCommand explorer<CR>

" --- IDE LOGIC (CoC) ---
" Use Tab to navigate suggestions
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ check_back_space() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use Enter to confirm a suggestion
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" --- FUNCTIONAL TWEAKS ---
set laststatus=0          " Minimalist: hides the bulky status bar for a 'clean' look
set number              " Show absolute line numbers
set norelativenumber     " Disable the shifting/jumping numbers
set numberwidth=4       " Give the 'blood red' numbers some breathing room
set fillchars=eob:\       " Hide the '~' at the end of the buffer
set noshowmode       " Hides '-- INSERT --' because your statusline/colors show it
set cmdheight=1      " Keeps the command bar small
set updatetime=300   " Faster diagnostic messages (blood-red errors show up quicker)
set shortmess+=c     " Don't pass messages to |ins-completion-menu|

" --- SURGICAL CURSOR SHAPE ---
" 1 or 0 -> blinking block
" 2 -> solid block
" 3 -> blinking underscore
" 4 -> solid underscore
" 5 -> blinking vertical bar
" 6 -> solid vertical bar

let &t_SI = "\e[6 q" " Insert mode: Solid vertical bar
let &t_SR = "\e[4 q" " Replace mode: Solid underscore
let &t_EI = "\e[2 q" " Normal mode: Solid block

"Split Screen of terminal
set splitright
