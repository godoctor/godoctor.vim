# godoctor.vim

Vim plugin for the [godoctor](https://github.com/godoctor/godoctor).
Tested with vim 7.3 and 7.4.

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
  * Add these lines to ~/.vimrc

    ```
    if exists("g:did_load_filetypes")
      filetype off
      filetype plugin indent off
    endif
    set rtp+=~/.vim/godoctor.vim
    filetype plugin indent on
    syntax on
    ```

If `godoctor` is not already installed and in your `$PATH`, just type
`:GoDoctorInstall`. This will install it to `$GOPATH/bin`, which will also need
to be in your `$PATH`, which assumes you have `$GOPATH` set.
`git` must be installed for `:GoDoctorInstall` to work.

We took express care not to conflict with anything in
<https://github.com/fatih/vim-go>. This means (`vim-go` note aside) that it is
safe to have `vim-go` installed alongside `godoctor.vim`. Notably, vim-go has `:GoRename`
and `:GoRefactor` where we have `:Rename` and `:Refactor` when editing a `.go` file.

## Getting started

With cursor in thing to rename:

`:Rename <newname>`

Highlighting block to extract:

`:Refactor extract newfunc`

## Setting scope to git root

The default scope will be `$PWD`, if none is set explicitly with
`g:doctor_scope`. If you would prefer to use the git root scope on every
refactoring, you may do the following:

Add the following to your `.vimrc`:

```viml
function! s:find_git_root()
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction

function! DoctorScopeFunc()
  let l:gp = $GOPATH
  if l:gp == ""
    return ""
  endif

  let l:gp = l:gp."/src/"
  let l:gr = s:find_git_root()

  return substitute(l:gr, l:gp, "", "")
endfunction
```

<!-- TODO mo betta docs -->
