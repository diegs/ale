" Author: Horacio Sanson https://github.com/hsanson
" Description: Functions for integrating with Go tools

" Find the nearest dir listed in GOPATH and assume it the root of the go
" project.
function! ale#go#FindProjectRoot(buffer) abort

    let l:sep = has('win32') ? ';' : ':'

    for l:name in split($GOPATH, l:sep)
        let l:dir = fnamemodify(
        \   ale#path#FindParentDirectory(a:buffer, l:name),
        \   ':h'
        \)

        if l:dir isnot# '.'
          return l:dir
        endif
    endfor

    return ''
endfunction

