#!/bin/bash -
#===============================================================================
#
#          FILE: vim_config_migrate.sh
#
#         USAGE: ./vim_config_migrate.sh
#
#   DESCRIPTION:
#
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (),
#  ORGANIZATION:
#       CREATED: 08/21/2018 07:17:59 PM
#      REVISION:  ---
#===============================================================================

set -o nounset                                  # Treat unset variables as an error
if which yum
then
    pkgmgr="yum"
    printf "%s\n"  "detected system:fedora/centos"
elif which apt
then
    pkgmgr="apt-get"
    echo -e "detected system:ubuntu/debian\n"
else
    echo -e "unknown system package manager!\n"
    exit
fi
echo -e "installing packages with:
sudo $pkgmgr install git vim ctags clang cppcheck wget python python-pip -y
\n"
#exit



if ! sudo $pkgmgr install git vim ctags clang cppcheck wget python python-pip -y
then
    echo -e "something wrong, install deps failed\n"
    exit
fi

pip install autopep8 --user
if [[ -d ~/.vim ]];then
    echo "delete existing vundle"
    rm -rf ~/.vim
fi
while /bin/true
do
    if ! proxychains git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    then
        read -p "clone vundle failed, try again[y/n]: " opt
        if [[ $opt == "y" ]]
        then
            rm -rf ~/.vim
            continue
        else
            exit
        fi
    else
        break
    fi
done


cat << EOF > ~/.vimrc
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
Plugin 'tpope/vim-surround'
Plugin 'majutsushi/tagbar'
Plugin 'vim-scripts/ShowFunc.vim'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'octol/vim-cpp-enhanced-highlight'
call vundle#end()
filetype plugin indent on
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
map <F4> <leader>ci <CR>
map <C-n> :NERDTreeToggle<CR>
nnoremap <space> za
autocmd FileType python noremap <buffer> <F8> :call Autopep8()<CR>
set foldmethod=indent
set foldlevel=99
set encoding=utf-8
let python_highlight_all=1
let g:autopep8_disable_show_diff=1
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
colorscheme madeofcode
set tabstop=4
set shiftwidth=4
set autoindent
set expandtab
set autoread
set mouse=a
set wrap
set hlsearch
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_concepts_highlight = 1
EOF
sed -i 's/colorscheme madeofcode/\"colorscheme madeofcode/' ~/.vimrc
proxychains vim +PluginInstall +qall
sed -i 's/\"colorscheme madeofcode/colorscheme madeofcode/' ~/.vimrc
echo -e "vimconfig migrate successfully!
view the .vimrc in your home directory to find out which plugin has been installed!
And there are additive configurations in this file, you can modified them soon"
