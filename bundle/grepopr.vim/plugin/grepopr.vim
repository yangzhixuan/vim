nnoremap <leader>gr :set operatorfunc=<SID>GrepOperator<CR>g@
vnoremap <leader>gr :<C-u>call <SID>GrepOperator(visualmode())<CR>

function! s:GrepOperator(type)
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
