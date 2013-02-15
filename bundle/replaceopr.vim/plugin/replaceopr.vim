nnoremap <leader>r :set operatorfunc=<SID>RepOperator<CR>g@
vnoremap <leader>r :<C-u>call <SID>RepOperator(visualmode())<CR>

function! <SID>RepOperator(type)
    let saved_reg = @@
    if a:type ==# 'v'
        normal! `<v`>y
    elseif a:type ==# 'char'
        normal! `[v`]y
    else
        echom 'linewise or blockwise replace is not available'
    endif
    call inputsave()
    let rep = escape(input("Replace " . @@ . " with : "), "/")
    call inputrestore()
    execute "%s/".@@."/".rep."/g"
    execute "normal \<C-o>"
    let @@ = saved_reg
endfunction
