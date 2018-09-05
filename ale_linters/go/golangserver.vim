" Author: Horacio Sanson <https://github.com/hsanson>
" Description: Support for go-langserver https://github.com/sourcegraph/go-langserver

call ale#Set('go_langserver_executable', 'go-langserver')

function! ale_linters#go#golangserver#GetCommand(buffer) abort
    let l:executable = ale#Var(a:buffer, 'go_langserver_executable')
    let l:completion_enabled = ale#Var(a:buffer, 'completion_enabled')
    let l:exec_args = l:completion_enabled == 1 ? ' -gocodecompletion' : ''
    return ale#Escape(l:executable) . l:exec_args
endfunction

call ale#linter#Define('go', {
\   'name': 'golangserver',
\   'lsp': 'stdio',
\   'executable_callback': ale#VarFunc('go_langserver_executable'),
\   'command_callback': 'ale_linters#go#golangserver#GetCommand',
\   'project_root_callback': 'ale#go#FindProjectRoot',
\})
