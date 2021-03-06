" @Author:      Tom Link (micathom AT gmail com?subject=[vim])
" @Website:     http://www.vim.org/account/profile.php?user_id=4037
" @License:     GPL (see http://www.gnu.org/licenses/gpl.txt)
" @Revision:    126


" :def: function! tlib#string#RemoveBackslashes(text, ?chars=' ')
" Remove backslashes from text (but only in front of the characters in 
" chars).
function! tlib#string#RemoveBackslashes(text, ...) "{{{3
    exec tlib#arg#Get(1, 'chars', ' ')
    " TLogVAR chars
    let rv = substitute(a:text, '\\\(['. chars .']\)', '\1', 'g')
    return rv
endf


" :display: tlib#string#Chomp(string, ?max=0)
function! tlib#string#Chomp(string, ...) "{{{3
    let quant = a:0 >= 1 ? '\{,'. a:1 .'}' : '\+'
    return substitute(a:string, '[[:cntrl:][:space:]]'. quant .'$', '', '')
endf


" Format a template string. Placeholders have the format "%{NAME}". A 
" "%" can be inserted as "%%".
"
" Examples:
"   echo tlib#string#Format("foo %{bar} foo", {'bar': 123})
"   => foo 123 foo
function! tlib#string#Format(template, dict) "{{{3
    let parts = split(a:template, '\ze%\({.\{-}}\|.\)')
    let out = []
    for part in parts
        let ml   = matchlist(part, '^%\({\(.\{-}\)}\|\(.\)\)\(.*\)$')
        if empty(ml)
            let rest = part
        else
            let var  = empty(ml[2]) ? ml[3] : ml[2]
            let rest = ml[4]
            if has_key(a:dict, var)
                call add(out, a:dict[var])
            elseif var == '%%'
                call add(out, '%')
            else
                call add(out, ml[1])
            endif
        endif
        call add(out, rest)
    endfor
    return join(out, '')
endf


" This function deviates from |printf()| in certain ways.
" Additional items:
"     %{rx}      ... insert escaped regexp
"     %{fuzzyrx} ... insert typo-tolerant regexp
function! tlib#string#Printf1(format, string) "{{{3
    let s = split(a:format, '%.\zs')
    " TLogVAR s
    return join(map(s, 's:PrintFormat(v:val, a:string)'), '')
endf

function! s:PrintFormat(format, string) "{{{3
    let cut = match(a:format, '%\({.\{-}}\|.\)$')
    if cut == -1
        return a:format
    else
        let head = cut > 0 ? a:format[0 : cut - 1] : ''
        let tail = a:format[cut : -1]
        " TLogVAR head, tail
        if tail == '%{fuzzyrx}'
            let frx = []
            for i in range(len(a:string))
                if i > 0
                    let pb = i - 1
                else
                    let pb = 0
                endif
                let slice = tlib#rx#Escape(a:string[pb : i + 1])
                call add(frx, '['. slice .']')
                call add(frx, '.\?')
            endfor
            let tail = join(frx, '')
        elseif tail == '%{rx}'
            let tail = tlib#rx#Escape(a:string)
        elseif tail == '%%'
            let tail = '%'
        elseif tail == '%s'
            let tail = a:string
        endif
        " TLogVAR tail
        return head . tail
    endif
endf
" function! tlib#string#Printf1(format, string) "{{{3
"     let n = len(split(a:format, '%\@<!%s', 1)) - 1
"     let f = a:format
"     if f =~ '%\@<!%{fuzzyrx}'
"         let frx = []
"         for i in range(len(a:string))
"             if i > 0
"                 let pb = i - 1
"             else
"                 let pb = 0
"             endif
"             let slice = tlib#rx#Escape(a:string[pb : i + 1])
"             call add(frx, '['. slice .']')
"             call add(frx, '.\?')
"         endfor
"         let f = s:RewriteFormatString(f, '%{fuzzyrx}', join(frx, ''))
"     endif
"     if f =~ '%\@<!%{rx}'
"         let f = s:RewriteFormatString(f, '%{rx}', tlib#rx#Escape(a:string))
"     endif
"     if n == 0
"         return substitute(f, '%%', '%', 'g')
"     else
"         let a = repeat([a:string], n)
"         return call('printf', insert(a, f))
"     endif
" endf


function! s:RewriteFormatString(format, pattern, string) "{{{3
    let string = substitute(a:string, '%', '%%', 'g')
    return substitute(a:format, tlib#rx#Escape(a:pattern), escape(string, '\'), 'g')
endf


function! tlib#string#TrimLeft(string) "{{{3
    return substitute(a:string, '^[[:space:][:cntrl:]]\+', '', '')
endf


function! tlib#string#TrimRight(string) "{{{3
    return substitute(a:string, '[[:space:][:cntrl:]]\+$', '', '')
endf


function! tlib#string#Strip(string) "{{{3
    return tlib#string#TrimRight(tlib#string#TrimLeft(a:string))
endf


function! tlib#string#Count(string, rx) "{{{3
    let s:count = 0
    call substitute(a:string, a:rx, '\=s:CountHelper()', 'g')
    return s:count
endf

function! s:CountHelper() "{{{3
    let s:count += 1
endf


function! tlib#string#SplitCommaList(text, ...) abort "{{{3
    let sep = a:0 >= 1 ? a:1 : ',\s*'
    let parts = split(a:text, '\\\@<!\zs'. sep)
    let parts = map(parts, 'substitute(v:val, ''\\\(.\)'', ''\1'', ''g'')')
    return parts
endf


function! tlib#string#Input(...) abort "{{{3
    TVarArg ['text', ''], ['completion', '']
    call inputsave()
    let rv = call(function('input'), a:000)
    call inputrestore()
    return rv
endf
