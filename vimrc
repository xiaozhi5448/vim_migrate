set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'jnurmine/Zenburn'
Plugin 'scrooloose/nerdtree'
Plugin 'Yggdroot/indentLine'
Plugin 'jiangmiao/auto-pairs'
Plugin 'tell-k/vim-autopep8'
Plugin 'scrooloose/nerdcommenter'
Plugin 'flazz/vim-colorschemes'
Plugin 'WolfgangMehner/bash-support'
Plugin 'vim-scripts/taglist.vim'
Plugin 'davidhalter/jedi'
Plugin 'Valloric/YouCompleteMe'
Plugin 'tpope/vim-surround'
Plugin 'majutsushi/tagbar'
Plugin 'vim-scripts/ShowFunc.vim'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'rsaraf/vim-advanced-lint'
"Plugin 'tenfyzhong/CompleteParameter.vim'
"Plugin 'mbbill/echofunc'
call vundle#end()
filetype plugin indent on
"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" open taglist window when you type \t
" comment the selected content when you type F4
map <F4> <leader>ci <CR>
" open file explorer window when you type Crtl-N
map <C-n> :NERDTreeToggle<CR>
" fold and unfold the function/class when you type space
nnoremap <space> za
" modify current python file in pep8 rule
autocmd FileType python noremap <buffer> <F8> :call Autopep8()<CR>
" Enable folding
set foldmethod=indent
set foldlevel=99
set encoding=utf-8
let python_highlight_all=1
let g:autopep8_disable_show_diff=1

" set taglist on the right position of your screen
let g:Tlist_Use_Right_Window=1
let g:TList_Show_Menu=1
let g:Tlist_Exit_OnlyWindow=1
let g:Tlist_Enable_Fold_Column=1
let g:Tlist_Auto_Update=1
let g:Tlist_Auto_Hightlight_Tag=1
let g:Tlist_Display_Tag_Scope=1
let g:Tlist_File_Fold_Auto_Close=1
noremap <leader>t :TlistToggle<CR>
syntax on
set nu
"colorscheme molokai
"colorscheme made_of_code
colorscheme madeofcode
set tabstop=4
set shiftwidth=4
set autoindent
set expandtab
" autoread the file if modified
set autoread
" use mouse
set mouse=a
set wrap
set hlsearch
" ycm_conf
let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'
let g:ycm_show_diagnostics_ui = 0 "关闭语法提示
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_collect_identifiers_from_tags_files=1
" 在注释中可以使用ycm
"leg g:ycm_complete_in_comments=1
" 输入第一个字符就可以补全
"leg g:ycm_min_num_of_chars_for_completion=1
set completeopt-=preview
let g:ycm_semantic_triggers =  {
  \   'c' : ['->', '.', 're!\w{2}'],
  \   'objc' : ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s',
  \             're!\[.*\]\s'],
  \   'ocaml' : ['.', '#'],
  \   'cpp,objcpp' : ['->', '.', '::', 're!\w{2}'],
  \   'perl' : ['->'],
  \   'php' : ['->', '::'],
  \   'cs,java,javascript,typescript,d,python,perl6,scala,vb,elixir,go' : ['.'],
  \   'ruby' : ['.', '::'],
  \   'lua' : ['.', ':'],
  \   'erlang' : [':'],
  \ }

hi Identifier cterm=bold
map <leader>f <Plug>ShowFunc
map! <leader>f <Plug>ShowFunc


let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_concepts_highlight = 1
