let mapleader="\<Space>"
call plug#begin('~/.vim/plugged')
Plug 'sheerun/vim-polyglot'
Plug 'honza/vim-snippets'
Plug 'joshdick/onedark.vim'
Plug 'ryanoasis/vim-devicjoshdick/onedark.vimons'
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
nmap + :vertical resize +5<CR>
nmap _ :vertical resize -5<CR>
nmap <F12> :source $MYVIMRC<CR>
nmap <C-d> yy p
imap <C-d> <ESC> yy p i
nmap <s-w> :bn <cr>
nmap <S-h> ^ 
nmap <S-l> $
nmap <C-s> :tabe<CR>:term<CR>i 
nmap <C-l> :tabe<CR>:term lazygit<CR>
imap mm <ESC>
vmap mm <ESC>
nmap , :noh<CR>
set  pastetoggle=<F9>
set hidden
let g:UltiSnipsExpandTrigger="entry"
let g:UltiSnipsJumpForwardTrigger="<A-j>"
let g:UltiSnipsJumpBackwardTrigger="<A-k>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
" my leader key
nnoremap<leader>e :CocCommand explorer<CR>
nnoremap<leader>q :q!<CR>
nnoremap<leader>w :w<CR>
nnoremap<leader>n :bd<CR>
nnoremap<leader>f :FZF<CR>
nnoremap<leader>h <C-w>h
nnoremap<leader>l <C-w>l
nnoremap<leader>s :vs<CR>
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
		silent! exec "!".g:mkdp_browser." % &"
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
