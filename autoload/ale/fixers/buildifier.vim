" Author: Diego Pontoriero <dpontor@gmail.com>
" Description: Integration of Bazel buildifier with ALE.

call ale#Set('bazel_buildifier_executable', 'buildifier')

function! ale#fixers#buildifier#Fix(buffer) abort
    let l:executable = ale#Var(a:buffer, 'bazel_buildifier_executable')

    return {
    \   'command': ale#Escape(l:executable)
    \       . ' -mode=fix'
    \       . ' %t',
    \   'read_temporary_file': 1,
    \}
endfunction
