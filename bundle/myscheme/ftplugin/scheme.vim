"http://wiki.call-cc.org/vim

setl include=\^\(\\(use\\\|require-extension\\)\\s\\+
setl includeexpr=substitute(v:fname,'$','.scm','')
setl path+=/usr/local/lib/chicken/6
setl suffixesadd=.scm

setl lispwords+=condition-case,with-input-from-string
setl lispwords+=with-output-to-string,handle-exceptions,call/cc,rec,receive
setl lispwords+=call-with-output-file

setl lispwords+=let-optionals,let-optionals*,declare
setl lispwords+=let-values,let*-values,letrec-values
setl lispwords+=define-values,opt-lambda,case-lambda,syntax-rules,with-syntax,syntax-case
setl lispwords+=cond-expand,and-let*,foreign-lambda,foreign-lambda*

setl lispwords+=match


function! Scheme_send_sexp(sexp)
    let ss = escape(a:sexp, '\"')
    "call system("screen -p csi -X stuff \"" . ss . "\n\"")
    "(or for tmux users)
    call system("tmux send-keys -t csi \"" . ss . "\n\"")
endfun

function! Scheme_eval_defun()
    let pos = getpos('.')
    silent! exec "normal! 99[(yab"
    call Scheme_send_sexp(@")
    call setpos('.', pos)
endfunction

function! SetREPL()
    nnoremap <leader>es :call Scheme_eval_defun()<cr>
    nnoremap <leader>ef :call Scheme_send_sexp("(load \"" . expand("%:p") . "\")\n")<cr>
endfunction

call SetREPL()
