" Author: Horacio Sanson <https://github.com/hsanson>
" Description: Support for go-langserver https://github.com/sourcegraph/go-langserver

call ale#Set('go_langserver_executable', 'go-langserver')

call ale#linter#Define('go', {
\   'name': 'golangserver',
\   'lsp': 'stdio',
\   'executable_callback': ale#VarFunc('go_langserver_executable'),
\   'command': '%e',
\   'project_root_callback': 'ale#go#FindProjectRoot',
\})
