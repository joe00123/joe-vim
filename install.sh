git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

sudo apt install libgtk2.0-dev libgnome2-dev libxt-dev libx11-dev libncurses-dev libgnutls-dev gnutls-utils g++ libgnutls28-dev uuid-dev cmake ruby liblua5.3-dev/xenial
sudo ln -s /usr/include/lua5.3/ /usr/include/lua
sudo ln -s /usr/lib/x86_64-linux-gnu/liblua5.3.so /usr/lib/x86_64-linux-gnu/liblua.so
./configure --with-features=huge --enable-rubyinterp --enable-pythoninterp --enable-python3interp --enable-luainterp --enable-perlinterp  --enable-multibyte   --enable-fontset --enable-cscope --with-tlib=ncurses
