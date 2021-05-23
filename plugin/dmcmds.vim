


" GPL-3.0 License

" prevent the plugin from loading twice
if exists('g:loaded_DuckumentManners') | finish | endif

let s:save_cpo = &cpo " save user coptions
set cpo&vim " reset them to defaults

function! dmcmds#available_args_tool_align() abort
	return luaeval('require("duckument-manners.utils.available_args.args_tool_align").available_commands_align()')
endfunction

function! s:Get_first_arg(...)
	return a:1
endfunction



" Interface {{{
" command! -nargs=1 -complete=custom,s:complete_args_tool_align DMAlign lua require'duckument-manners.main'.main(0, '<args>')
command! -nargs=1 -complete=custom,s:complete_args_tool_align DMAlign | let g:fgt_align = call s:Get_first_arg(<f-args>) | lua require'duckument-manners.main'.main(0, g:fgt_align)
" }}}

" Tab Completion {{{
function! s:complete_args_tool_align(arg, line, pos) abort
	return join(dmcmds#available_args_tool_align(), "\n")
endfunction
" }}}

let &cpo = s:save_cpo " and restore after
unlet s:save_cpo

" set to true the var that controls the plugin's loading
let g:loaded_DuckumentManners = 1