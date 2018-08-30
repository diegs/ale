" Author: Horacio Sanson <https://github.com/hsanson>
" Description: Support for go-langserver https://github.com/sourcegraph/go-langserver

call ale#Set('go_langserver_bin', 'go-langserver')

function! ale_linters#go#golangserver#Executable(buffer) abort
    return ale#Var(a:buffer, 'go_langserver_bin')
endfunction

call ale#linter#Define('go', {
\   'name': 'golangserver',
\   'lsp': 'stdio',
\   'executable_callback': 'ale_linters#go#golangserver#Executable',
\   'command': '%e',
\   'language': 'go',
\   'project_root_callback': 'ale#go#FindProjectRoot',
\})
