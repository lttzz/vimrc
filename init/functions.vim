" compile
map <F6> :call Compile()<CR>
func! Compile()
    exec "w"
    if &filetype == 'c'
        " exec "AsyncRun -save=1 -mode=term -pos=bottom -rows=10 -focus=0 gcc % -std=c17 -Wall -Werror -g3 -ggdb -fsanitize=address -DLOCAL -o %<.o"
        exec "AsyncRun -save=1 -rows=10 -focus=0 gcc % -std=c17 -Wall -Werror -g3 -ggdb -fsanitize=address -DLOCAL -o %<.o"
    elseif &filetype == 'cpp'
        exec "AsyncRun -save=1 -rows=10 -focus=0 g++ % -std=c++17 -Wall -Werror -g3 -ggdb -fsanitize=address -DLOCAL -o %<.o"
    endif
endfunc


map <F5> :call Run()<CR>
func! Run()
    exec "w"
    if &filetype == 'c'
        exec "AsyncRun -save=1 -rows=10 focus=0 ./%<.o"
    elseif &filetype == 'cpp'
        exec "AsyncRun -save=1 -rows=10 -focus=0 ./%<.o"
    elseif &filetype == 'go'
        exec "AsyncRun -save=1 -rows=10 -focus=0 -mode=term go run %"
    elseif &filetype == 'rust'
        exec "AsyncRun -save=1 -rows=10 -focus=0 cargo run"
    elseif &filetype == 'java'
        exec "AsyncRun -save=1 -rows=10 -focus=0 java %"
    elseif &filetype == 'python'
        exec "AsyncRun -save=1 -rows=10 -focus=0 python %"
    elseif &filetype == 'lisp'
        exec "AsyncRun -save=1 -rows=10 -focus=0 scheme < %"
    endif
endfunc


" compile
map <F9> :call CompileAndRun()<CR>
func! CompileAndRun()
    exec "w"
    if &filetype == 'c'
        exec "!gcc % -std=c17 -Wall -g -DLOCAL -o %<.o"
        exec "!time ./%<.o"
    elseif &filetype == 'cpp'
        exec "!clang++ % -std=c++17 -Wall -g -DLOCAL -o %<.o"
        exec "!time ./%<.o"
    elseif &filetype == 'go'
        exec "!time go run %"
    elseif &filetype == 'rust'
        exec "!time cargo run"
    elseif &filetype == 'java'
        exec "!java %"
    elseif &filetype == 'python'
        exec "!time python %"
    elseif &filetype == 'scheme'
        exec "!time scheme < %"
    endif
endfunc


" template
"   BufNewFile  each time edit a new file
"   silent!     execute silently, no error message if failed
"   0r          read file and insert content at top into the new file
if has("autocmd")
    autocmd BufNewFile *.* silent! 0r ~/.vim/templates/skeleton.%:e
endif

" remember last update or view postion
" Only do this part when compiled with support for autocommands
if has("autocmd")
   " When editing a file, always jump to the last cursor position
   autocmd BufReadPost *
   \ if line("'\"") > 0 && line ("'\"") <= line("$") |
   \ exe "normal g'\"" |
   \ endif
endif
