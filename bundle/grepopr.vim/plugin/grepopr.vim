nnoremap <leader>g :set operatorfunc=<SID>GrepOperator<CR>g@
vnoremap <leader>g <C-u>call <SID>GrepOperator(visualmode())<CR>

function! <SID>GrepOperator(type)
    let saved_reg = @@
    if a:type ==# 'v'
        normal! `<v`>y
    elseif a:type ==# 'char'
        normal! `[v`]y
    else
        echom 'linewise or blockwise search is not available'
    endif
    silent execute 'grep -R ' . shellescape(@@) . ' .'
    redraw!
    copen
    let @@ = saved_reg
endfunction
