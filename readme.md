# Install
```sh
git clone https://github.com/weirongxu/dotvim.git ~/.vim
cd ~/.vim

# install python,pyyaml,python-neovim and dein.vim
./install.sh
```

below config save to `.config/nvim/init.vim`
```
exec 'set rtp+='.expand('~/.vim')
source ~/.vim/vimrc.rc.vim
```
