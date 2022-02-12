# Install
```sh
git clone https://github.com/weirongxu/dotvim.git ~/.vim
cd ~/.vim

./install.sh # install python,pyyaml,python-neovim and dein.vim
```

save below config to `.config/nvim/init.vim`
```
exec 'set rtp+='.expand('~/.vim')
source ~/.vim/vimrc.vim
```
