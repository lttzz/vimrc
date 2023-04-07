"----------------------------------------------------------------------
" space + j : make
"----------------------------------------------------------------------
noremap <silent><space>jj  :AsyncRun -cwd=<root> make<cr>
noremap <silent><space>jc  :AsyncRun -cwd=<root> make clean<cr>
noremap <silent><space>jk  :AsyncRun -mode=4 -cwd=<root> make run<cr>
noremap <silent><space>jl  :AsyncRun -mode=4 -cwd=<root> make test<cr>
noremap <silent><space>j1  :AsyncRun -mode=4 -cwd=<root> make t1<cr>
noremap <silent><space>j2  :AsyncRun -mode=4 -cwd=<root> make t2<cr>
noremap <silent><space>j3  :AsyncRun -mode=4 -cwd=<root> make t3<cr>
noremap <silent><space>j4  :AsyncRun -mode=4 -cwd=<root> make t4<cr>
noremap <silent><space>j5  :AsyncRun -mode=4 -cwd=<root> make t5<cr>
noremap <silent><space>k1  :AsyncRun -cwd=<root> make t1<cr>
noremap <silent><space>k2  :AsyncRun -cwd=<root> make t2<cr>
noremap <silent><space>k3  :AsyncRun -cwd=<root> make t3<cr>
noremap <silent><space>k4  :AsyncRun -cwd=<root> make t4<cr>
noremap <silent><space>k5  :AsyncRun -cwd=<root> make t5<cr>

noremap <silent><space>jm :call Tools_SwitchMakeFile()<cr>
