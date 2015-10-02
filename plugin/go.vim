" ~stolen from github.com/fatih/vim-go -- same license

" install necessary Go tools
if exists("g:go_doctor_loaded_install")
    finish
endif
let g:go_doctor_loaded_install = 1

" These commands are available on any filetypes
command! GoDoctorInstall call s:GoDoctorInstall()

" GoDoctorInstall downloads and install all necessary binaries stated in the
" packages variable. It uses by default $GOPATH/bin as the binary
" target install directory. Either installs or attempts update.
function! s:GoDoctorInstall()
    if $GOPATH == ""
        echohl Error
        echomsg "vim.go: $GOPATH is not set"
        echohl None
        return
    endif

    let err = s:CheckBinaries()
    if err != 0
        return
    endif

    " when shellslash is set on MS-* systems, shellescape puts single quotes
    " around the output string. cmd on Windows does not handle single quotes
    " correctly. Unsetting shellslash forces shellescape to use double quotes
    " instead.
    let resetshellslash = 0
    if has('win32') && &shellslash
        let resetshellslash = 1
        set noshellslash
    endif

    let cmd = "go get -u -v "

    let s:go_version = matchstr(system("go version"), '\d.\d.\d')

    " https://github.com/golang/go/issues/10791
    if s:go_version > "1.4.0" && s:go_version < "1.5.0"
        let cmd .= "-f " 
    endif

    let pkg = "github.com/godoctor/godoctor"

    let out = system(cmd . shellescape(pkg))
    if v:shell_error
        echo "Error installing ". pkg . ": " . out
    endif
endfunction

" CheckBinaries checks if the necessary binaries to install the Go tool
" commands are available.
function! s:CheckBinaries()
    if !executable('go')
        echohl Error | echomsg "vim-go: go executable not found." | echohl None
        return -1
    endif

    if !executable('git')
        echohl Error | echomsg "vim-go: git executable not found." | echohl None
        return -1
    endif
endfunction
