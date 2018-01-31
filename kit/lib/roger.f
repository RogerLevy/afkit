: "  postpone s" ; immediate
: zcount ( zaddr -- addr n )   dup dup if  65535 0 scan drop over - then ;
: zlength ( zaddr -- n )   zcount nip ;
: zplace ( from n to -- )   tuck over + >r  cmove  0 r> c! ;
: zappend ( from n to -- )   zcount + zplace ;
defer alert  ( a c -- )
[undefined] third [if] : third  >r over r> swap ; [then]
[undefined] @+ [if] : @+  dup @ swap cell+ swap ; [then]
: u+  rot + swap ;  \ "under plus"
: ?lit  state @ if postpone literal then ; immediate
: do postpone ?do ; immediate
: for  " 0 do" evaluate ; immediate
: buffer  here swap /allot ;
: move,   here over allot swap move ;
: h?  @ h. ;
: reclaim  h ! ;
: ]#  ] postpone literal ;
: <<  " lshift" evaluate ; immediate
: >>  " rshift" evaluate ; immediate
: bit  dup constant  1 << ;
: clamp  ( n low high -- n ) -rot max min ;
\ : 2clamp  ( x y lowx lowy highx highy -- x y ) 2>r 2max 2r> 2min ;
[defined] locate [if] : l locate ; [then]

\ : getset  ( -- <name> <getcode> ; <setcode> ; )
\     >in @  create
\     >in !

: ifill  ( c-addr count val - )  -rot  0 do  over !+  loop  2drop ;
: ierase   0 ifill ;
: imove  ( from to count - )  cells move ;
: time?  ( xt -- ) ucounter 2>r  execute  ucounter 2r> d-  d>s  . ;
\  : 1af  1f 1sf ;                                         \ fixed-point-to-floats-on-stack primitives (mainly for ALlegro 5)
\  : 2af  1f 1f 1sf 1sf ;
\  : 3af  1f 1f 1f 1sf 1sf 1sf ;
\  : 4af  1f 1f 1f 1f 1sf 1sf 1sf 1sf ;
: kbytes  #1024 * ;
: megs    #1024 * 1024 * ;
: udup  over swap ;
: 2,  swap , , ;
: 3,  rot , swap , , ;
: 4,  2swap swap , , swap , , ;
: :is  :noname  postpone [  [compile] is  ] ;
: 2move  ( src /pitch dest /pitch #rows /bytes -- )
  locals| #bytes #rows deststride dest srcstride src |
  #rows 0 do
    src dest #bytes move
    srcstride +to src  deststride +to dest
  loop ;
: reverse   ( ... count -- ... ) 1+ 1 max 1 ?do i 1- roll loop ;
