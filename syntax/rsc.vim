" Vim syntax file
" Language:    RouterOS scripts
" Maintainer:  zainin
" Last Change: 2015-01-17

syntax clear
if exists("b:current_syntax")
  if b:current_syntax =~ "rsc"
    finish
  else
    unlet b:current_syntax
  endif
endif

syn case ignore

" set iskeyword=@,-,_,.
set iskeyword=A-Z,a-z,:

" comments
syn match     rscComment      /^#.*/

" options submenus: /interface ether1 etc
syn match     rscSubMenu      "\([a-z]\)\@<!/[a-zA-Z-]*"
syn match     rscSubMenu      "\([a-z]\)\@<!/ [a-zA-Z-]*"


" variables are matched by looking at strings ending with "=", e.g. var=
syn match     rscVariable     "[a-zA-Z0-9-/]*\(=\)\@="
syn match     rscVariable     "$[a-zA-Z0-9-]*"

" colored for clarity
syn match     rscDelimiter    "[,=]"
" match slash in CIDR notation (1.2.3.4/24)
syn match     rscDelimiter    "\(\d\)\@<=\/\(\d\)\@="
" dash in IP ranges
syn match     rscDelimiter    "\(\d\)\@<=-\(\d\)\@="

" match service names after "set", like in original routeros syntax
syn match     rscService      "\(set\)\@<=\s\(api-ssl\|api\|dns\|ftp\|http\|https\|pim\|ntp\|smb\|ssh\|telnet\|winbox\|www\|www-ssl\)"

" colors various interfaces
syn match     rscInterface    "bridge\d\|ether\d\|wlan\d\|pppoe-\(out\|in\)\d"

syn keyword   rscBoolean      yes no

syn keyword   rscConditional  if

" operators
syn match     rscOperator     " [\+\-\*\<\>\=\!\~\^\&\.\,] "
syn match     rscOperator     "[\<\>\!]="
syn match     rscOperator     "\(<<\|>>\)"
syn match     rscOperator     "[\+\-]\(\d\)\@="

" commands
syn keyword   rscCommands     beep delay put len typeof pick log time set find environment
syn keyword   rscCommands     terminal error parse resolve toarray tobool toid toip toip6
syn keyword   rscCommands     tonum tostr totime add remove enable disable set get print
syn keyword   rscCommands     export edit find append as-value brief detail count-only file
syn keyword   rscCommands     follow follow-only from interval terse value-list without-paging

" variable types
syn keyword   rscType         global local :global :local

" loop keywords
syn keyword   rscRepeat       do while for foreach

syn match     rscSpecial      "[():\[\]{|}]"


"-----------

syn keyword   rscKeyword      detail error file info led nothing password time


"syn region    rscString       start=+L\="+ skip=+\\\\\|\\"+ end=+"+ contains=rscSpecial


syn keyword   rscProtocol     bgp ip ipsec ipv6 ldp ospf ospf-v3 ppp rip snmp  tcp udp

syn keyword   rscConnState    new related established invalid


  "
  "  *Comment  any comment
  "
  "  *Constant any constant
  "   String   a string constant: "this is a string"
  "   Character  a character constant: 'c', '\n'
  "   Number   a number constant: 234, 0xff
  "   Boolean  a boolean constant: TRUE, false
  "   Float    a floating point constant: 2.3e10
  "
  "  *Identifier any variable name
  "   Function function name (also: methods for classes)
  "
  "  *Statement  any statement
  "   Conditional  if, then, else, endif, switch, etc.
  "   Repeat   for, do, while, etc.
  "   Label    case, default, etc.
  "   Operator "sizeof", "+", "*", etc.
  "   Keyword  any other keyword
  "   Exception  try, catch, throw
  "
  "  *PreProc  generic Preprocessor
  "   Include  preprocessor #include
  "   Define   preprocessor #define
  "   Macro    same as Define
  "   PreCondit  preprocessor #if, #else, #endif, etc.
  "
  "  *Type   int, long, char, etc.
  "   StorageClass static, register, volatile, etc.
  "   Structure  struct, union, enum, etc.
  "   Typedef  A typedef
  "
  "  *Special  any special symbol
  "   SpecialChar  special character in a constant
  "   Tag    you can use CTRL-] on this
  "   Delimiter  character that needs attention
  "   SpecialComment special things inside a comment
  "   Debug    debugging statements
  "
  "  *Underlined text that stands out, HTML links
  "
  "  *Ignore   left blank, hidden  |hl-Ignore|
  "
  "  *Error    any erroneous construct
  "
  "  *Todo   anything that needs extra attention; mostly the
  "      keywords TODO FIXME and XXX
  "

hi link rscComment              Comment
hi link rscSubMenu              Function
hi link rscVariable             Identifier
hi link rscDelimiter            Operator
hi link rscService              Type
hi link rscInterface            Type
hi link rscBoolean              Boolean
hi link rscConditional          Conditional
hi link rscOperator             Operator
hi link rscCommands             Operator
hi link rscType                 Type
hi link rscRepeat               Repeat
hi link rscSpecial              Delimiter
hi link rscConnState            Type

hi link rscKeyword              Identifier
hi link rscProtocol             Type
hi link rscString               String

" source <sfile>:p:h/rsc.vim

let b:current_syntax = "rsc"
