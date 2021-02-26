let mapleader="\<Space>"
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'sheerun/vim-polyglot'
Plug 'honza/vim-snippets'
Plug 'joshdick/onedark.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'bling/vim-bufferline'
Plug 'SirVer/ultisnips'
call plug#end()
syntax on
set foldcolumn=0 
set t_Co=256
set ts=4
set sw=4
set number
set relativenumber
nnoremap + :vertical resize +5<CR>
nnoremap _ :vertical resize -5<CR>
nnoremap <F12> :source $MYVIMRC<CR>
nnoremap <C-d> yy p
inoremap <C-d> <ESC> yy p i
nnoremap <s-w> :bn <cr>
nnoremap <S-h> ^ 
nnoremap <S-l> $
nnoremap <C-s> :tabe<CR>:term<CR>i 
nnoremap <C-l> :tabe<CR>:term lazygit<CR>i
inoremap dj <ESC>
vnoremap dj <ESC>
nmap , :noh<CR>
nnoremap wh <c-w>h
nnoremap wl <C-w>l
set  pastetoggle=<F9>
set hidden
let g:UltiSnipsExpandTrigger="entry"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-k>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
" my leader key
nnoremap<leader>e :CocCommand explorer<CR>
nnoremap<leader>q :q!<CR>
nnoremap<leader>w :w<CR>
nnoremap<leader>n :bd<CR>
nnoremap<leader>f :FZF<CR>
nnoremap<leader>s :vs 
" coc config
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
     \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
inoremap <silent><expr> <c-space> coc#refresh()


" coc mapkey 
nmap <silent> [o <Plug>(coc-diagnostic-prev)
nmap <silent> [p <Plug>(coc-diagnostic-next)
nmap <leader>rn <Plug>(coc-rename)
nnoremap <silent><nowait> <C-j> :<C-u>CocNext<CR>
nnoremap <silent><nowait> <C-k> :<C-u>CocPrev<CR>

colorscheme onedark

noremap <leader>r :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec "!g++ % -o %<"
		exec "!time ./%<"
	elseif &filetype == 'cpp'
		set splitbelow
		exec "!g++ -std=c++11 % -Wall -o %<"
		:!./%<
	elseif &filetype == 'java'
		exec "!javac %"
		exec "!time java %<"
	elseif &filetype == 'sh'
		:!time bash %
	elseif &filetype == 'python'
		set splitbelow
		:!python3 %
	elseif &filetype == 'html'
		:!chromium %
	elseif &filetype == 'markdown'
		exec "InstantMarkdownPreview"
	elseif &filetype == 'tex'
		silent! exec "VimtexStop"
		silent! exec "VimtexCompile"
	elseif &filetype == 'dart'
		exec "CocCommand flutter.run -d ".g:flutter_default_device." ".g:flutter_run_args
		silent! exec "CocCommand flutter.dev.openDevLog"
	elseif &filetype == 'javascript'
		set splitbelow
		:!export DEBUG="INFO,ERROR,WARNING"; node --trace-warnings .
	elseif &filetype == 'go'
		set splitbelow
		:!go run .
	endif
endfunc
