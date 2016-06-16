" File header for C files 
function FileHeading()
  let s:line=line(".")
  call setline(s:line,   "/*")
  call append (s:line,   " * Author: Christoph Steefel")
  call append (s:line+1, " * Filename:        ".expand("%"))
  call append (s:line+2, " * Date: ".strftime("%b-%d-%Y"))
  call append (s:line+3, " * Description:     TODO")
  call append (s:line+4, " */")
  unlet s:line
endfunction

inoremap <F4> <ESC>mz:execute FileHeading()<CR>`z4jA"

" Javadoc file header
function CFuncHeading()
  let s:line=getline(".")
  let s:type=split(split(s:line, "(")[0])[0]
  let s:name=split(split(s:line, "(")[0])[1]
  normal! f(l
  normal! vi("ay
  let s:args=split(join(split(@a, "\n"), ""), ",")
  normal! O<ESC>k
  let s:newline=line(".")
  let s:i = 0
  call setline(s:newline, "/*")
  call append (s:newline+s:i, " * Function name: " . s:name . "()")
  let s:i += 1
  call append (s:newline+s:i, " * Function prototype: " . s:type . s:name .
        \ "(")
  let s:i += 1
  for arg in s:args
    let s:temp = substitute(arg, '^\s*\(.\{-}\)\s*$', '\1', '')
    call append(s:newline+s:i, " *    " . s:temp  . ",")
    let s:i += 1
  endfor
  call append(s:newline+s:i, " * )")
  let s:i += 1
  unlet s:line
  call append (s:newline+s:i, " * Description:  TODO")
  let s:i += 1
  call append (s:newline+s:i, " * Arguments:")
  let s:i += 1
  for arg in s:args
    let s:temp = substitute(arg, '^\s*\(.\{-}\)\s*$', '\1', '')
    call append(s:newline+s:i, " *  " . s:temp  . " - ")
    let s:i += 1
  endfor
  unlet s:args
  call append (s:newline+s:i, " * Side Effects: TODO")
  let s:i += 1
  call append (s:newline+s:i, " * Error Conditions: TODO")
  let s:i += 1
  call append(s:newline+s:i, " * return " . s:type . ": ")
  let s:i += 1
  unlet s:type
  call append(s:newline+s:i, " */")
  unlet s:name
  unlet s:i
  unlet s:newline
endfunction

inoremap <F3> <ESC>:execute CFuncHeading()<CR>?TODO<CR>Ncw

