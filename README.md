# godoctor.vim

vim plugin for the [godoctor](https://github.com/godoctor/godoctor)

## Install

godoctor.vim follows the standard runtime path structure, so we highly recommend to use
a common and well known plugin manager to install godoctor.vim. `filetype plugin
indent on` must also be set (add this to your `~/.vimrc`).

* [Pathogen](https://github.com/tpope/vim-pathogen)
  * `git clone https://github.com/godoctor/godoctor.vim.git ~/.vim/bundle/godoctor.vim`
* [vim-plug](https://github.com/junegunn/vim-plug)
  * `Plug 'godoctor/godoctor.vim'`
* [NeoBundle](https://github.com/Shougo/neobundle.vim)
  * `NeoBundle 'godoctor/godoctor.vim'`
* [Vundle](https://github.com/gmarik/vundle)
  * `Plugin 'godoctor/godoctor.vim'`
* manual
  * `git clone https://github.com/godoctor/godoctor.vim ~/.vim/godoctor.vim`
  * `echo 'set rtp+=~/.vim/godoctor.vim' >> ~/.vimrc`

If `godoctor` is not already installed and in your `$PATH`, just type
`:GoDoctorInstall`. This will install it to `$GOPATH/bin`, which will also need
to be in your `$PATH`, which assumes you have `$GOPATH` set.
`git` must be installed for `:GoDoctorInstall` to work.

## Getting started

With cursor in thing to rename:

`:Rename <newname>`

Highlighting block to extract:

`:Refactor extract newfunc`

<!-- TODO mo betta docs -->
