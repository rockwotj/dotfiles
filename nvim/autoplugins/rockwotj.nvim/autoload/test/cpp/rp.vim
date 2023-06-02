if !exists('g:test#cpp#rp#file_pattern')
  let g:test#cpp#rp#file_pattern = '\v[tT]est.*(\.cc)$'
endif

if !exists('g:test#cpp#rp#test_patterns')
  let g:test#cpp#rp#test_patterns = {
        \ 'test': ['\vBOOST_AUTO_TEST_CASE\(\s*"([^"]*)"', '\vSEASTAR_THREAD_TEST_CASE\(\s*"([^"]*)"'],
        \ 'namespace': []
    \ }
endif

let s:is_suite = v:false

" Returns true if the given file belongs to your test runner
function! test#cpp#rp#test_file(file)
  return a:file =~# g:test#cpp#rp#file_pattern
endfunction

" Returns test runner's arguments(as a list) which will run the current file and/or line
" position: a dictionary with the file, line and col
function! test#cpp#rp#build_position(type, position)
    if a:type ==# 'nearest'
        let name = s:nearest_test(a:position)
        return map(name,'shellescape(v:val)') "Since name may have spaces in it
    elseif a:type ==# 'file'
        return []
    elseif a:type ==# 'suite'
        let s:is_suite = v:true
        return []
    endif
endfunction

function! s:nearest_test(position) abort
  let name = test#base#nearest_test(a:position, g:test#cpp#rp#test_patterns)
  if empty(name['test'])
      " Search forward for the first declared method
      let f_name = test#base#nearest_test_in_lines(
                  \ a:position['file'],
                  \ a:position['line'],
                  \ "$",
                  \ g:test#cpp#rp#test_patterns
                  \ )
      return f_name['test']
  endif
  return name['test']
endfunction


" Returns processed args (if you need to do any processing)
function! test#cpp#rp#build_args(args)
  echo a:args
  return a:args
endfunction

" Returns the executable of your test runner
function! test#cpp#rp#executable()
    if !exists('g:test#cpp#rp#test_target')
        let g:test#cpp#rp#test_target = expand("%:t:r")
    endif
    return "cd " . getcwd()
          \ . " && CTEST_ARGS='-R " . g:test#cpp#rp#test_target . "_rpunit$' task rp:unit-tests"
endfunction
