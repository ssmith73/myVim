mkdir -p ~/.vim/autoload ~/.vim/bundle;
cd bundle
git clone https://github.com/tpope/vim-pathogen.git
git clone https://github.com/scrooloose/nerdcommenter.git
git clone https://github.com/scrooloose/nerdtree.git
git clone https://github.com/tpope/vim-fugitive.git
git clone https://github.com/Lokaltog/vim-easymotion.git
git clone https://github.com/flazz/vim-colorschemes.git
git clone https://github.com/tpope/vim-sensible.git
git clone https://github.com/WeiChungWu/vim-SystemVerilog.git
git clone https://github.com/ervandew/supertab.git
git clone https://github.com/scrooloose/syntastic.git
git clone https://github.com/tpope/vim-sleuth.git
curl -Sso ~/.vim/autoload/pathogen.vim \
    https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim
