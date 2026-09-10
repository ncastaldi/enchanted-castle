; ============================================================
; Enchanted Castle (EC.COM) - Annotated Disassembly
; Author: Michael R. Wilk, (C) 1986, Release 1
; Compiler: Borland Turbo Pascal 3.0 (1985 runtime library)
; Produced by recursive-descent static analysis (Claude), not 100% complete.
; Load address: CS:0100 (standard DOS .COM)
;
; Confirmed calling-convention idiom used throughout the program's own code
; (not the RTL): 'CALL sub_295d' / 'CALL sub_11e5' are followed *inline* by a
; Pascal-style length-prefixed string literal; the callee reads it, prints or
; pushes a copy, and jumps back to right after the string bytes. This means
; the bytes immediately following such calls are DATA, not code -- do not
; read them as instructions. Recognized meaning:
;   sub_295d = WriteInlineString (prints the literal to the screen)
;   sub_11e5 = PushInlineString   (copies the literal as a value parameter)
; ============================================================

00100 (f+000000)  e9792c         jmp 0x2d7c

sub_0199:  ; 1 known caller(s)
00199 (f+000099)  c70612006e00   mov word ptr [0x12], 0x6e
0019f (f+00009f)  2ec606940100   mov byte ptr cs:[0x194], 0
001a5 (f+0000a5)  be2000         mov si, 0x20
001a8 (f+0000a8)  268b04         mov ax, word ptr es:[si]
001ab (f+0000ab)  2ea39501       mov word ptr cs:[0x195], ax
001af (f+0000af)  268b4402       mov ax, word ptr es:[si + 2]
001b3 (f+0000b3)  2ea39701       mov word ptr cs:[0x197], ax
001b7 (f+0000b7)  fa             cli 
001b8 (f+0000b8)  26c704c401     mov word ptr es:[si], 0x1c4
001bd (f+0000bd)  268c4c02       mov word ptr es:[si + 2], cs
001c1 (f+0000c1)  fb             sti 
001c2 (f+0000c2)  eb22           jmp 0x1e6

sub_01e6:  ; 1 known caller(s)
001e6 (f+0000e6)  e83400         call 0x21d
001e9 (f+0000e9)  2eff069201     inc word ptr cs:[0x192]
001ee (f+0000ee)  2e803e9401ff   cmp byte ptr cs:[0x194], 0xff
001f4 (f+0000f4)  75f0           jne 0x1e6
001f6 (f+0000f6)  2ea19701       mov ax, word ptr cs:[0x197]
001fa (f+0000fa)  fa             cli 
001fb (f+0000fb)  26894402       mov word ptr es:[si + 2], ax
001ff (f+0000ff)  2ea19501       mov ax, word ptr cs:[0x195]
00203 (f+000103)  268904         mov word ptr es:[si], ax
00206 (f+000106)  fb             sti 
00207 (f+000107)  2ea19201       mov ax, word ptr cs:[0x192]
0020b (f+00010b)  03c0           add ax, ax
0020d (f+00010d)  a31200         mov word ptr [0x12], ax
00210 (f+000110)  c3             ret 

sub_0213:  ; 1 known caller(s)
00213 (f+000113)  8bc8           mov cx, ax
00215 (f+000115)  e305           jcxz 0x21c

sub_0217:  ; 1 known caller(s)
00217 (f+000117)  e80300         call 0x21d
0021a (f+00011a)  e2fb           loop 0x217

sub_021c:  ; 1 known caller(s)
0021c (f+00011c)  c3             ret 

sub_021d:  ; 2 known caller(s)
0021d (f+00011d)  51             push cx
0021e (f+00011e)  8b0e1200       mov cx, word ptr [0x12]

sub_0222:  ; 1 known caller(s)
00222 (f+000122)  e2fe           loop 0x222
00224 (f+000124)  59             pop cx
00225 (f+000125)  c3             ret 
0029a (f+00019a)  50             push ax
0029b (f+00019b)  a00000         mov al, byte ptr [0]
0029e (f+00019e)  a20800         mov byte ptr [8], al
002a1 (f+0001a1)  58             pop ax
002a2 (f+0001a2)  c3             ret 

sub_02a3:  ; 3 known caller(s)
002a3 (f+0001a3)  b403           mov ah, 3
002a5 (f+0001a5)  32ff           xor bh, bh
002a7 (f+0001a7)  cd10           int 0x10
002a9 (f+0001a9)  c3             ret 

sub_02aa:  ; 2 known caller(s)
002aa (f+0001aa)  53             push bx
002ab (f+0001ab)  51             push cx
002ac (f+0001ac)  52             push dx
002ad (f+0001ad)  55             push bp
002ae (f+0001ae)  e8f2ff         call 0x2a3
002b1 (f+0001b1)  b80006         mov ax, 0x600
002b4 (f+0001b4)  8a3e0800       mov bh, byte ptr [8]
002b8 (f+0001b8)  8bca           mov cx, dx
002ba (f+0001ba)  2e8a166a01     mov dl, byte ptr cs:[0x16a]
002bf (f+0001bf)  feca           dec dl
002c1 (f+0001c1)  cd10           int 0x10
002c3 (f+0001c3)  5d             pop bp
002c4 (f+0001c4)  5a             pop dx
002c5 (f+0001c5)  59             pop cx
002c6 (f+0001c6)  5b             pop bx
002c7 (f+0001c7)  c3             ret 

sub_02c8:  ; 1 known caller(s)
002c8 (f+0001c8)  e8f802         call 0x5c3
002cb (f+0001cb)  2ea06d01       mov al, byte ptr cs:[0x16d]
002cf (f+0001cf)  3cff           cmp al, 0xff
002d1 (f+0001d1)  7506           jne 0x2d9
002d3 (f+0001d3)  55             push bp
002d4 (f+0001d4)  b40f           mov ah, 0xf
002d6 (f+0001d6)  cd10           int 0x10
002d8 (f+0001d8)  5d             pop bp

sub_02d9:  ; 1 known caller(s)
002d9 (f+0001d9)  c606040000     mov byte ptr [4], 0
002de (f+0001de)  c606050000     mov byte ptr [5], 0
002e3 (f+0001e3)  c6060900ff     mov byte ptr [9], 0xff
002e8 (f+0001e8)  3c07           cmp al, 7
002ea (f+0001ea)  b750           mov bh, 0x50
002ec (f+0001ec)  b300           mov bl, 0
002ee (f+0001ee)  be6f01         mov si, 0x16f
002f1 (f+0001f1)  7420           je 0x313
002f3 (f+0001f3)  be7701         mov si, 0x177
002f6 (f+0001f6)  3c02           cmp al, 2
002f8 (f+0001f8)  7416           je 0x310
002fa (f+0001fa)  3c04           cmp al, 4
002fc (f+0001fc)  7202           jb 0x300
002fe (f+0001fe)  b003           mov al, 3

sub_0300:  ; 1 known caller(s)
00300 (f+000200)  b3ff           mov bl, 0xff
00302 (f+000202)  3c03           cmp al, 3
00304 (f+000204)  740d           je 0x313
00306 (f+000206)  b728           mov bh, 0x28
00308 (f+000208)  3c01           cmp al, 1
0030a (f+00020a)  7407           je 0x313
0030c (f+00020c)  32c0           xor al, al
0030e (f+00020e)  b300           mov bl, 0

sub_0310:  ; 1 known caller(s)
00310 (f+000210)  be7301         mov si, 0x173

sub_0313:  ; 3 known caller(s)
00313 (f+000213)  a20600         mov byte ptr [6], al
00316 (f+000216)  881e0700       mov byte ptr [7], bl
0031a (f+00021a)  2e883e6a01     mov byte ptr cs:[0x16a], bh
0031f (f+00021f)  2e8b04         mov ax, word ptr cs:[si]
00322 (f+000222)  a30000         mov word ptr [0], ax
00325 (f+000225)  2e8b4402       mov ax, word ptr cs:[si + 2]
00329 (f+000229)  a30200         mov word ptr [2], ax
0032c (f+00022c)  55             push bp
0032d (f+00022d)  b40f           mov ah, 0xf
0032f (f+00022f)  cd10           int 0x10
00331 (f+000231)  3a060600       cmp al, byte ptr [6]
00335 (f+000235)  7407           je 0x33e
00337 (f+000237)  a00600         mov al, byte ptr [6]
0033a (f+00023a)  32e4           xor ah, ah
0033c (f+00023c)  cd10           int 0x10

sub_033e:  ; 1 known caller(s)
0033e (f+00023e)  5d             pop bp
0033f (f+00023f)  e958ff         jmp 0x29a
00343 (f+000243)  50             push ax
00344 (f+000244)  53             push bx
00345 (f+000245)  51             push cx
00346 (f+000246)  52             push dx
00347 (f+000247)  56             push si
00348 (f+000248)  57             push di
00349 (f+000249)  55             push bp
0034a (f+00024a)  9c             pushf 
0034b (f+00024b)  86d6           xchg dh, dl
0034d (f+00024d)  03160400       add dx, word ptr [4]
00351 (f+000251)  2e3a366b01     cmp dh, byte ptr cs:[0x16b]
00356 (f+000256)  730d           jae 0x365
00358 (f+000258)  2e3a166a01     cmp dl, byte ptr cs:[0x16a]
0035d (f+00025d)  7306           jae 0x365
0035f (f+00025f)  b402           mov ah, 2
00361 (f+000261)  32ff           xor bh, bh
00363 (f+000263)  cd10           int 0x10

sub_0365:  ; 2 known caller(s)
00365 (f+000265)  9d             popf 
00366 (f+000266)  5d             pop bp
00367 (f+000267)  5f             pop di
00368 (f+000268)  5e             pop si
00369 (f+000269)  5a             pop dx
0036a (f+00026a)  59             pop cx
0036b (f+00026b)  5b             pop bx
0036c (f+00026c)  58             pop ax
0036d (f+00026d)  c3             ret 

sub_036e:  ; 2 known caller(s)
0036e (f+00026e)  e92f07         jmp 0xaa0

sub_0371:  ; 1 known caller(s)
00371 (f+000271)  e82fff         call 0x2a3
00374 (f+000274)  8ac2           mov al, dl
00376 (f+000276)  2a060400       sub al, byte ptr [4]
0037a (f+00027a)  fec0           inc al
0037c (f+00027c)  32e4           xor ah, ah
0037e (f+00027e)  c3             ret 

sub_037f:  ; 1 known caller(s)
0037f (f+00027f)  e821ff         call 0x2a3
00382 (f+000282)  8ac6           mov al, dh
00384 (f+000284)  2a060500       sub al, byte ptr [5]
00388 (f+000288)  fec0           inc al
0038a (f+00028a)  32e4           xor ah, ah
0038c (f+00028c)  c3             ret 

sub_03bb:  ; 6 known caller(s)
003bb (f+0002bb)  241f           and al, 0x1f
003bd (f+0002bd)  a810           test al, 0x10
003bf (f+0002bf)  7404           je 0x3c5
003c1 (f+0002c1)  240f           and al, 0xf
003c3 (f+0002c3)  0c80           or al, 0x80

sub_03c5:  ; 1 known caller(s)
003c5 (f+0002c5)  8026080070     and byte ptr [8], 0x70
003ca (f+0002ca)  08060800       or byte ptr [8], al
003ce (f+0002ce)  c3             ret 

sub_05c3:  ; 1 known caller(s)
005c3 (f+0004c3)  e461           in al, 0x61
005c5 (f+0004c5)  24fc           and al, 0xfc
005c7 (f+0004c7)  e661           out 0x61, al
005c9 (f+0004c9)  c3             ret 

sub_0957:  ; 19 known caller(s)
00957 (f+000857)  80fc3d         cmp ah, 0x3d
0095a (f+00085a)  7414           je 0x970
0095c (f+00085c)  80fc3c         cmp ah, 0x3c
0095f (f+00085f)  740f           je 0x970
00961 (f+000861)  80fc3e         cmp ah, 0x3e
00964 (f+000864)  7432           je 0x998
00966 (f+000866)  80fc80         cmp ah, 0x80
00969 (f+000869)  7447           je 0x9b2

sub_096b:  ; 3 known caller(s)
0096b (f+00086b)  55             push bp
0096c (f+00086c)  cd21           int 0x21
0096e (f+00086e)  5d             pop bp
0096f (f+00086f)  c3             ret 

sub_0970:  ; 1 known caller(s)
00970 (f+000870)  56             push si
00971 (f+000871)  51             push cx
00972 (f+000872)  8b367a01       mov si, word ptr [0x17a]
00976 (f+000876)  8b0e7c01       mov cx, word ptr [0x17c]

sub_097a:  ; 1 known caller(s)
0097a (f+00087a)  833c00         cmp word ptr [si], 0
0097d (f+00087d)  740b           je 0x98a
0097f (f+00087f)  46             inc si
00980 (f+000880)  46             inc si
00981 (f+000881)  e2f7           loop 0x97a
00983 (f+000883)  59             pop cx
00984 (f+000884)  5e             pop si
00985 (f+000885)  b80400         mov ax, 4
00988 (f+000888)  f9             stc 
00989 (f+000889)  c3             ret 
0098a (f+00088a)  59             pop cx
0098b (f+00088b)  1e             push ds
0098c (f+00088c)  06             push es
0098d (f+00088d)  1f             pop ds
0098e (f+00088e)  e8daff         call 0x96b
00991 (f+000891)  1f             pop ds
00992 (f+000892)  7202           jb 0x996
00994 (f+000894)  8904           mov word ptr [si], ax

sub_0996:  ; 1 known caller(s)
00996 (f+000896)  5e             pop si
00997 (f+000897)  c3             ret 
00998 (f+000898)  51             push cx
00999 (f+000899)  56             push si
0099a (f+00089a)  8b367a01       mov si, word ptr [0x17a]
0099e (f+00089e)  8b0e7c01       mov cx, word ptr [0x17c]

sub_09a2:  ; 1 known caller(s)
009a2 (f+0008a2)  391c           cmp word ptr [si], bx
009a4 (f+0008a4)  7504           jne 0x9aa
009a6 (f+0008a6)  c7040000       mov word ptr [si], 0

sub_09aa:  ; 1 known caller(s)
009aa (f+0008aa)  46             inc si
009ab (f+0008ab)  46             inc si
009ac (f+0008ac)  e2f4           loop 0x9a2
009ae (f+0008ae)  5e             pop si
009af (f+0008af)  59             pop cx
009b0 (f+0008b0)  ebb9           jmp 0x96b
009b2 (f+0008b2)  8b367a01       mov si, word ptr [0x17a]
009b6 (f+0008b6)  8b0e7c01       mov cx, word ptr [0x17c]

sub_09ba:  ; 1 known caller(s)
009ba (f+0008ba)  8b1c           mov bx, word ptr [si]
009bc (f+0008bc)  0bdb           or bx, bx
009be (f+0008be)  7409           je 0x9c9
009c0 (f+0008c0)  b43e           mov ah, 0x3e
009c2 (f+0008c2)  e8a6ff         call 0x96b
009c5 (f+0008c5)  c7040000       mov word ptr [si], 0

sub_09c9:  ; 1 known caller(s)
009c9 (f+0008c9)  46             inc si
009ca (f+0008ca)  46             inc si
009cb (f+0008cb)  e2ed           loop 0x9ba
009cd (f+0008cd)  c3             ret 

sub_09d0:  ; 1 known caller(s)
009d0 (f+0008d0)  a37201         mov word ptr [0x172], ax
009d3 (f+0008d3)  bf4002         mov di, 0x240
009d6 (f+0008d6)  893e7a01       mov word ptr [0x17a], di
009da (f+0008da)  890e7c01       mov word ptr [0x17c], cx
009de (f+0008de)  33c0           xor ax, ax
009e0 (f+0008e0)  1e             push ds
009e1 (f+0008e1)  07             pop es
009e2 (f+0008e2)  fc             cld 
009e3 (f+0008e3)  f3ab           rep stosw word ptr es:[di], ax
009e5 (f+0008e5)  8ec0           mov es, ax
009e7 (f+0008e7)  26c7068c00620a mov word ptr es:[0x8c], 0xa62
009ee (f+0008ee)  268c0e8e00     mov word ptr es:[0x8e], cs
009f3 (f+0008f3)  e8a3f7         call 0x199

sub_09f6:  ; 1 known caller(s)
009f6 (f+0008f6)  c606940100     mov byte ptr [0x194], 0

sub_09fb:  ; 1 known caller(s)
009fb (f+0008fb)  be260a         mov si, 0xa26
009fe (f+0008fe)  bf3601         mov di, 0x136
00a01 (f+000901)  1e             push ds
00a02 (f+000902)  07             pop es
00a03 (f+000903)  0e             push cs
00a04 (f+000904)  1f             pop ds
00a05 (f+000905)  b91e00         mov cx, 0x1e
00a08 (f+000908)  fc             cld 
00a09 (f+000909)  f3a5           rep movsw word ptr es:[di], word ptr [si]
00a0b (f+00090b)  06             push es
00a0c (f+00090c)  1f             pop ds
00a0d (f+00090d)  33c0           xor ax, ax
00a0f (f+00090f)  a39201         mov word ptr [0x192], ax
00a12 (f+000912)  a28001         mov byte ptr [0x180], al
00a15 (f+000915)  a38201         mov word ptr [0x182], ax
00a18 (f+000918)  a38401         mov word ptr [0x184], ax
00a1b (f+00091b)  c60681017e     mov byte ptr [0x181], 0x7e
00a20 (f+000920)  c60636000d     mov byte ptr [0x36], 0xd
00a25 (f+000925)  c3             ret 

sub_0a63:  ; 2 known caller(s)
00a63 (f+000963)  53             push bx
00a64 (f+000964)  51             push cx
00a65 (f+000965)  52             push dx
00a66 (f+000966)  57             push di
00a67 (f+000967)  56             push si
00a68 (f+000968)  32e4           xor ah, ah
00a6a (f+00096a)  50             push ax
00a6b (f+00096b)  ff163a01       call word ptr [0x13a]
00a6f (f+00096f)  5e             pop si
00a70 (f+000970)  5f             pop di
00a71 (f+000971)  5a             pop dx
00a72 (f+000972)  59             pop cx
00a73 (f+000973)  5b             pop bx
00a74 (f+000974)  c3             ret 

sub_0a75:  ; 1 known caller(s)
00a75 (f+000975)  53             push bx
00a76 (f+000976)  51             push cx
00a77 (f+000977)  52             push dx
00a78 (f+000978)  57             push di
00a79 (f+000979)  56             push si
00a7a (f+00097a)  4c             dec sp
00a7b (f+00097b)  ff163801       call word ptr [0x138]
00a7f (f+00097f)  ebee           jmp 0xa6f

sub_0a81:  ; 5 known caller(s)
00a81 (f+000981)  55             push bp
00a82 (f+000982)  8bec           mov bp, sp
00a84 (f+000984)  875e02         xchg word ptr [bp + 2], bx

sub_0a87:  ; 1 known caller(s)
00a87 (f+000987)  2e8a07         mov al, byte ptr cs:[bx]
00a8a (f+00098a)  43             inc bx
00a8b (f+00098b)  0ac0           or al, al
00a8d (f+00098d)  7405           je 0xa94
00a8f (f+00098f)  e8d1ff         call 0xa63
00a92 (f+000992)  ebf3           jmp 0xa87
00a94 (f+000994)  875e02         xchg word ptr [bp + 2], bx
00a97 (f+000997)  5d             pop bp
00a98 (f+000998)  c3             ret 

sub_0a99:  ; 1 known caller(s)
00a99 (f+000999)  e8e5ff         call 0xa81
00a9c (f+00099c)  0d0a00         or ax, 0xa
00a9f (f+00099f)  c3             ret 
00aa0 (f+0009a0)  3c61           cmp al, 0x61
00aa2 (f+0009a2)  7206           jb 0xaaa
00aa4 (f+0009a4)  3c7a           cmp al, 0x7a
00aa6 (f+0009a6)  7702           ja 0xaaa
00aa8 (f+0009a8)  2c20           sub al, 0x20

sub_0aaa:  ; 2 known caller(s)
00aaa (f+0009aa)  c3             ret 

sub_0ac9:  ; 3 known caller(s)
00ac9 (f+0009c9)  0ae4           or ah, ah
00acb (f+0009cb)  7408           je 0xad5
00acd (f+0009cd)  f9             stc 
00ace (f+0009ce)  b80000         mov ax, 0
00ad1 (f+0009d1)  7802           js 0xad5
00ad3 (f+0009d3)  fec8           dec al

sub_0ad5:  ; 2 known caller(s)
00ad5 (f+0009d5)  c3             ret 

sub_0ad6:  ; 1 known caller(s)
00ad6 (f+0009d6)  e84e01         call 0xc27
00ad9 (f+0009d9)  5e             pop si
00ada (f+0009da)  8cc8           mov ax, cs
00adc (f+0009dc)  2e034406       add ax, word ptr cs:[si + 6]
00ae0 (f+0009e0)  2e034408       add ax, word ptr cs:[si + 8]
00ae4 (f+0009e4)  2e03440a       add ax, word ptr cs:[si + 0xa]
00ae8 (f+0009e8)  2e3b060200     cmp ax, word ptr cs:[2]
00aed (f+0009ed)  7603           jbe 0xaf2
00aef (f+0009ef)  e94401         jmp 0xc36
00af2 (f+0009f2)  8ccb           mov bx, cs
00af4 (f+0009f4)  2e035c06       add bx, word ptr cs:[si + 6]
00af8 (f+0009f8)  8edb           mov ds, bx
00afa (f+0009fa)  2e035c08       add bx, word ptr cs:[si + 8]
00afe (f+0009fe)  2e8b160200     mov dx, word ptr cs:[2]
00b03 (f+000a03)  2bd3           sub dx, bx
00b05 (f+000a05)  2e3b540c       cmp dx, word ptr cs:[si + 0xc]
00b09 (f+000a09)  7204           jb 0xb0f
00b0b (f+000a0b)  2e8b540c       mov dx, word ptr cs:[si + 0xc]

sub_0b0f:  ; 1 known caller(s)
00b0f (f+000a0f)  8bfa           mov di, dx
00b11 (f+000a11)  b8feff         mov ax, 0xfffe
00b14 (f+000a14)  81ea0010       sub dx, 0x1000
00b18 (f+000a18)  730b           jae 0xb25
00b1a (f+000a1a)  8bc2           mov ax, dx
00b1c (f+000a1c)  050010         add ax, 0x1000
00b1f (f+000a1f)  b104           mov cl, 4
00b21 (f+000a21)  d3e0           shl ax, cl
00b23 (f+000a23)  33d2           xor dx, dx

sub_0b25:  ; 1 known caller(s)
00b25 (f+000a25)  03d3           add dx, bx
00b27 (f+000a27)  8ed2           mov ss, dx
00b29 (f+000a29)  8be0           mov sp, ax
00b2b (f+000a2b)  a37401         mov word ptr [0x174], ax
00b2e (f+000a2e)  33c0           xor ax, ax
00b30 (f+000a30)  a38a01         mov word ptr [0x18a], ax
00b33 (f+000a33)  891e8c01       mov word ptr [0x18c], bx
00b37 (f+000a37)  a32200         mov word ptr [0x22], ax
00b3a (f+000a3a)  891e2400       mov word ptr [0x24], bx
00b3e (f+000a3e)  57             push di
00b3f (f+000a3f)  c43e2200       les di, ptr [0x22]
00b43 (f+000a43)  b90400         mov cx, 4
00b46 (f+000a46)  fc             cld 
00b47 (f+000a47)  f3ab           rep stosw word ptr es:[di], ax
00b49 (f+000a49)  5f             pop di
00b4a (f+000a4a)  2ef7040100     test word ptr cs:[si], 1
00b4f (f+000a4f)  750d           jne 0xb5e
00b51 (f+000a51)  8cc8           mov ax, cs
00b53 (f+000a53)  8ec0           mov es, ax
00b55 (f+000a55)  03df           add bx, di
00b57 (f+000a57)  2bd8           sub bx, ax
00b59 (f+000a59)  b44a           mov ah, 0x4a
00b5b (f+000a5b)  e8f9fd         call 0x957

sub_0b5e:  ; 1 known caller(s)
00b5e (f+000a5e)  2e8b4402       mov ax, word ptr cs:[si + 2]
00b62 (f+000a62)  a37601         mov word ptr [0x176], ax
00b65 (f+000a65)  2e8b4404       mov ax, word ptr cs:[si + 4]
00b69 (f+000a69)  a37801         mov word ptr [0x178], ax
00b6c (f+000a6c)  2e8b04         mov ax, word ptr cs:[si]
00b6f (f+000a6f)  2e8b4c0e       mov cx, word ptr cs:[si + 0xe]
00b73 (f+000a73)  51             push cx
00b74 (f+000a74)  56             push si
00b75 (f+000a75)  e858fe         call 0x9d0
00b78 (f+000a78)  5e             pop si
00b79 (f+000a79)  59             pop cx
00b7a (f+000a7a)  bf4002         mov di, 0x240
00b7d (f+000a7d)  03f9           add di, cx
00b7f (f+000a7f)  03f9           add di, cx
00b81 (f+000a81)  893e5e01       mov word ptr [0x15e], di
00b85 (f+000a85)  2e8b4410       mov ax, word ptr cs:[si + 0x10]
00b89 (f+000a89)  a36001         mov word ptr [0x160], ax
00b8c (f+000a8c)  03f8           add di, ax
00b8e (f+000a8e)  0bc0           or ax, ax
00b90 (f+000a90)  740b           je 0xb9d
00b92 (f+000a92)  c7065a010000   mov word ptr [0x15a], 0
00b98 (f+000a98)  c6065c0100     mov byte ptr [0x15c], 0

sub_0b9d:  ; 1 known caller(s)
00b9d (f+000a9d)  893e6a01       mov word ptr [0x16a], di
00ba1 (f+000aa1)  2e8b4412       mov ax, word ptr cs:[si + 0x12]
00ba5 (f+000aa5)  a36c01         mov word ptr [0x16c], ax
00ba8 (f+000aa8)  0bc0           or ax, ax
00baa (f+000aaa)  740b           je 0xbb7
00bac (f+000aac)  c70666010100   mov word ptr [0x166], 1
00bb2 (f+000ab2)  c606680100     mov byte ptr [0x168], 0

sub_0bb7:  ; 1 known caller(s)
00bb7 (f+000ab7)  83c614         add si, 0x14
00bba (f+000aba)  56             push si
00bbb (f+000abb)  33c0           xor ax, ax
00bbd (f+000abd)  8ec0           mov es, ax
00bbf (f+000abf)  26a10000       mov ax, word ptr es:[0]
00bc3 (f+000ac3)  a38e01         mov word ptr [0x18e], ax
00bc6 (f+000ac6)  26a10200       mov ax, word ptr es:[2]
00bca (f+000aca)  a39001         mov word ptr [0x190], ax
00bcd (f+000acd)  26c70600003210 mov word ptr es:[0], 0x1032
00bd4 (f+000ad4)  268c0e0200     mov word ptr es:[2], cs
00bd9 (f+000ad9)  f70672010800   test word ptr [0x172], 8
00bdf (f+000adf)  740c           je 0xbed
00be1 (f+000ae1)  26c7060c00f00f mov word ptr es:[0xc], 0xff0
00be8 (f+000ae8)  268c0e0e00     mov word ptr es:[0xe], cs

sub_0bed:  ; 1 known caller(s)
00bed (f+000aed)  f70672010400   test word ptr [0x172], 4
00bf3 (f+000af3)  7405           je 0xbfa
00bf5 (f+000af5)  c606940101     mov byte ptr [0x194], 1

sub_0bfa:  ; 1 known caller(s)
00bfa (f+000afa)  c7067e01d010   mov word ptr [0x17e], 0x10d0
00c00 (f+000b00)  33c0           xor ax, ax
00c02 (f+000b02)  a38801         mov word ptr [0x188], ax
00c05 (f+000b05)  a29601         mov byte ptr [0x196], al
00c08 (f+000b08)  8b0e6001       mov cx, word ptr [0x160]
00c0c (f+000b0c)  1e             push ds
00c0d (f+000b0d)  bf5a01         mov di, 0x15a
00c10 (f+000b10)  e81717         call 0x232a
00c13 (f+000b13)  8b0e6c01       mov cx, word ptr [0x16c]
00c17 (f+000b17)  1e             push ds
00c18 (f+000b18)  bf6601         mov di, 0x166
00c1b (f+000b1b)  e81017         call 0x232e
00c1e (f+000b1e)  c606fa0100     mov byte ptr [0x1fa], 0
00c23 (f+000b23)  e8a2f6         call 0x2c8
00c26 (f+000b26)  c3             ret 

sub_0c27:  ; 1 known caller(s)
00c27 (f+000b27)  b430           mov ah, 0x30
00c29 (f+000b29)  e82bfd         call 0x957
00c2c (f+000b2c)  0ac0           or al, al
00c2e (f+000b2e)  7401           je 0xc31
00c30 (f+000b30)  c3             ret 
00c31 (f+000b31)  ba5f0c         mov dx, 0xc5f
00c34 (f+000b34)  eb03           jmp 0xc39
00c36 (f+000b36)  ba4d0c         mov dx, 0xc4d

sub_0c39:  ; 1 known caller(s)
00c39 (f+000b39)  0e             push cs
00c3a (f+000b3a)  1f             pop ds
00c3b (f+000b3b)  b409           mov ah, 9
00c3d (f+000b3d)  e817fd         call 0x957
00c40 (f+000b40)  ba750c         mov dx, 0xc75
00c43 (f+000b43)  b409           mov ah, 9
00c45 (f+000b45)  e80ffd         call 0x957
00c48 (f+000b48)  b400           mov ah, 0
00c4a (f+000b4a)  e80afd         call 0x957
00c4d (f+000b4d)  4e             dec si
00c4e (f+000b4e)  6f             outsw dx, word ptr [si]
00c4f (f+000b4f)  7420           je 0xc71
00c51 (f+000b51)  656e           outsb dx, byte ptr gs:[si]
00c53 (f+000b53)  6f             outsw dx, word ptr [si]
00c54 (f+000b54)  7567           jne 0xcbd
00c56 (f+000b56)  68206d         push 0x6d20
00c59 (f+000b59)  656d           insw word ptr es:[di], dx
00c5b (f+000b5b)  6f             outsw dx, word ptr [si]
00c5c (f+000b5c)  7279           jb 0xcd7
00c5e (f+000b5e)  2449           and al, 0x49
00c60 (f+000b60)  6e             outsb dx, byte ptr [si]
00c61 (f+000b61)  636f72         arpl word ptr [bx + 0x72], bp
00c64 (f+000b64)  7265           jb 0xccb
00c66 (f+000b66)  637420         arpl word ptr [si + 0x20], si
00c69 (f+000b69)  44             inc sp
00c6a (f+000b6a)  4f             dec di
00c6b (f+000b6b)  53             push bx
00c6c (f+000b6c)  207665         and byte ptr [bp + 0x65], dh
00c6f (f+000b6f)  7273           jb 0xce4

sub_0c71:  ; 1 known caller(s)
00c71 (f+000b71)  696f6e240d     imul bp, word ptr [bx + 0x6e], 0xd24
00c76 (f+000b76)  0a5072         or dl, byte ptr [bx + si + 0x72]
00c79 (f+000b79)  6f             outsw dx, word ptr [si]
00c7a (f+000b7a)  677261         jb 0xcde
00c7d (f+000b7d)  6d             insw word ptr es:[di], dx
00c7e (f+000b7e)  206162         and byte ptr [bx + di + 0x62], ah
00c81 (f+000b81)  6f             outsw dx, word ptr [si]
00c82 (f+000b82)  7274           jb 0xcf8
00c84 (f+000b84)  65640d0a24     or ax, 0x240a
00c89 (f+000b89)  50             push ax
00c8a (f+000b8a)  1e             push ds
00c8b (f+000b8b)  bf5a01         mov di, 0x15a
00c8e (f+000b8e)  e8c217         call 0x2453
00c91 (f+000b91)  1e             push ds
00c92 (f+000b92)  bf6601         mov di, 0x166
00c95 (f+000b95)  e8bb17         call 0x2453
00c98 (f+000b98)  33c0           xor ax, ax
00c9a (f+000b9a)  8ec0           mov es, ax
00c9c (f+000b9c)  a18e01         mov ax, word ptr [0x18e]
00c9f (f+000b9f)  26a30000       mov word ptr es:[0], ax
00ca3 (f+000ba3)  a19001         mov ax, word ptr [0x190]
00ca6 (f+000ba6)  26a30200       mov word ptr es:[2], ax
00caa (f+000baa)  58             pop ax
00cab (f+000bab)  f70672010100   test word ptr [0x172], 1
00cb1 (f+000bb1)  7505           jne 0xcb8
00cb3 (f+000bb3)  b44c           mov ah, 0x4c
00cb5 (f+000bb5)  e89ffc         call 0x957

sub_0cb8:  ; 1 known caller(s)
00cb8 (f+000bb8)  b480           mov ah, 0x80
00cba (f+000bba)  e89afc         call 0x957

sub_0cbd:  ; 1 known caller(s)
00cbd (f+000bbd)  ff367601       push word ptr [0x176]
00cc1 (f+000bc1)  b8023d         mov ax, 0x3d02
00cc4 (f+000bc4)  50             push ax
00cc5 (f+000bc5)  1e             push ds
00cc6 (f+000bc6)  07             pop es
00cc7 (f+000bc7)  8e1e7801       mov ds, word ptr [0x178]

sub_0ccb:  ; 1 known caller(s)
00ccb (f+000bcb)  cb             retf 

sub_0ccc:  ; 1 known caller(s)
00ccc (f+000bcc)  5b             pop bx
00ccd (f+000bcd)  2e8b07         mov ax, word ptr cs:[bx]
00cd0 (f+000bd0)  0bc0           or ax, ax
00cd2 (f+000bd2)  7435           je 0xd09
00cd4 (f+000bd4)  1e             push ds
00cd5 (f+000bd5)  0e             push cs
00cd6 (f+000bd6)  1f             pop ds

sub_0cd7:  ; 1 known caller(s)
00cd7 (f+000bd7)  0e             push cs
00cd8 (f+000bd8)  07             pop es
00cd9 (f+000bd9)  33d2           xor dx, dx

sub_0cdb:  ; 1 known caller(s)
00cdb (f+000bdb)  8b07           mov ax, word ptr [bx]
00cdd (f+000bdd)  0bc0           or ax, ax
00cde (f+000bde)  c0740653       sal byte ptr [si + 6], 0x53
00cdf (f+000bdf)  7406           je 0xce7
00ce1 (f+000be1)  53             push bx
00ce2 (f+000be2)  03d8           add bx, ax

sub_0ce4:  ; 1 known caller(s)
00ce4 (f+000be4)  42             inc dx
00ce5 (f+000be5)  ebf4           jmp 0xcdb

sub_0ce7:  ; 1 known caller(s)
00ce7 (f+000be7)  8bcb           mov cx, bx
00ce9 (f+000be9)  5b             pop bx
00cea (f+000bea)  8bf3           mov si, bx
00cec (f+000bec)  83c604         add si, 4
00cef (f+000bef)  8b7f02         mov di, word ptr [bx + 2]
00cf2 (f+000bf2)  3bf7           cmp si, di
00cf4 (f+000bf4)  740b           je 0xd01
00cf6 (f+000bf6)  2bce           sub cx, si

sub_0cf8:  ; 1 known caller(s)
00cf8 (f+000bf8)  03f1           add si, cx
00cfa (f+000bfa)  03f9           add di, cx
00cfc (f+000bfc)  4e             dec si
00cfd (f+000bfd)  4f             dec di
00cfe (f+000bfe)  fd             std 
00cff (f+000bff)  f3a4           rep movsb byte ptr es:[di], byte ptr [si]

sub_0d01:  ; 1 known caller(s)
00d01 (f+000c01)  4a             dec dx
00d02 (f+000c02)  75e3           jne 0xce7
00d04 (f+000c04)  c7070000       mov word ptr [bx], 0
00d08 (f+000c08)  1f             pop ds
00d09 (f+000c09)  83c304         add bx, 4
00d0c (f+000c0c)  ffe3           jmp bx

sub_0da4:  ; 1 known caller(s)
00da4 (f+000ca4)  4c             dec sp
00da5 (f+000ca5)  ff163601       call word ptr [0x136]
00da9 (f+000ca9)  c3             ret 

sub_0daa:  ; 2 known caller(s)
00daa (f+000caa)  5b             pop bx
00dab (f+000cab)  59             pop cx
00dac (f+000cac)  53             push bx
00dad (f+000cad)  8ad0           mov dl, al
00daf (f+000caf)  8af1           mov dh, cl
00db1 (f+000cb1)  feca           dec dl
00db3 (f+000cb3)  fece           dec dh
00db5 (f+000cb5)  e98bf5         jmp 0x343

sub_0f4d:  ; 1 known caller(s)
00f4d (f+000e4d)  91             xchg cx, ax
00f4e (f+000e4e)  8cda           mov dx, ds
00f50 (f+000e50)  5b             pop bx
00f51 (f+000e51)  5f             pop di
00f52 (f+000e52)  07             pop es
00f53 (f+000e53)  5e             pop si
00f54 (f+000e54)  1f             pop ds
00f55 (f+000e55)  fc             cld 
00f56 (f+000e56)  3bf7           cmp si, di
00f58 (f+000e58)  7307           jae 0xf61
00f5a (f+000e5a)  03f1           add si, cx
00f5c (f+000e5c)  03f9           add di, cx
00f5e (f+000e5e)  4e             dec si
00f5f (f+000e5f)  4f             dec di
00f60 (f+000e60)  fd             std 

sub_0f61:  ; 1 known caller(s)
00f61 (f+000e61)  f3a4           rep movsb byte ptr es:[di], byte ptr [si]
00f63 (f+000e63)  8eda           mov ds, dx
00f65 (f+000e65)  ffe3           jmp bx

sub_103c:  ; 1 known caller(s)
0103c (f+000f3c)  b602           mov dh, 2
0103e (f+000f3e)  52             push dx
0103f (f+000f3f)  e8b4f9         call 0x9f6
01042 (f+000f42)  5a             pop dx
01043 (f+000f43)  a18601         mov ax, word ptr [0x186]
01046 (f+000f46)  2d0300         sub ax, 3
01049 (f+000f49)  87068801       xchg word ptr [0x188], ax
0104d (f+000f4d)  0bc0           or ax, ax
0104f (f+000f4f)  750b           jne 0x105c
01051 (f+000f51)  52             push dx
01052 (f+000f52)  52             push dx
01053 (f+000f53)  ff368801       push word ptr [0x188]
01057 (f+000f57)  ff167e01       call word ptr [0x17e]
0105b (f+000f5b)  5a             pop dx

sub_105c:  ; 1 known caller(s)
0105c (f+000f5c)  80fe01         cmp dh, 1
0105f (f+000f5f)  7314           jae 0x1075
01061 (f+000f61)  e81dfa         call 0xa81
01064 (f+000f64)  5e             pop si
01065 (f+000f65)  43             inc bx
01066 (f+000f66)  0d0a55         or ax, 0x550a
01069 (f+000f69)  7365           jae 0x10d0
0106b (f+000f6b)  7220           jb 0x108d
0106d (f+000f6d)  42             inc dx
0106e (f+000f6e)  7265           jb 0x10d5
01070 (f+000f70)  61             popaw 
01071 (f+000f71)  6b00eb         imul ax, word ptr [bx + si], -0x15
01074 (f+000f74)  30c6           xor dh, al
01075 (f+000f75)  c606fa01ff     mov byte ptr [0x1fa], 0xff
01076 (f+000f76)  06             push es
01077 (f+000f77)  fa             cli 
01078 (f+000f78)  01ff           add di, di
0107a (f+000f7a)  770b           ja 0x1087
0107c (f+000f7c)  e802fa         call 0xa81
0107f (f+000f7f)  0d0a49         or ax, 0x490a
01082 (f+000f82)  2f             das 
01083 (f+000f83)  4f             dec di
01084 (f+000f84)  00eb           add bl, ch
01086 (f+000f86)  0e             push cs

sub_1087:  ; 1 known caller(s)
01087 (f+000f87)  e8f7f9         call 0xa81
0108a (f+000f8a)  0d0a52         or ax, 0x520a

sub_108d:  ; 1 known caller(s)
0108d (f+000f8d)  756e           jne 0x10fd
0108f (f+000f8f)  2d7469         sub ax, 0x6974
01092 (f+000f92)  6d             insw word ptr es:[di], dx
01093 (f+000f93)  6500e8         add al, ch
01096 (f+000f96)  e9f920         jmp 0x3192
010d0 (f+000fd0)  c20400         ret 4
010d5 (f+000fd5)  7902           jns 0x10d9
010d7 (f+000fd7)  f7d8           neg ax

sub_10d9:  ; 1 known caller(s)
010d9 (f+000fd9)  c3             ret 
010fd (f+000ffd)  dbd1           fcmovnbe st(0), st(1)
010ff (f+000fff)  d95803         fstp dword ptr [bx + si + 3]
01102 (f+001002)  c85813d8       enter 0x1358, -0x28
01106 (f+001006)  b8e962         mov ax, 0x62e9
01109 (f+001009)  03c8           add cx, ax
0110b (f+00100b)  b81936         mov ax, 0x3619
0110e (f+00100e)  13d8           adc bx, ax
01110 (f+001010)  891efe01       mov word ptr [0x1fe], bx
01114 (f+001014)  890efc01       mov word ptr [0x1fc], cx
01118 (f+001018)  8bc3           mov ax, bx
0111a (f+00101a)  c3             ret 

sub_11cc:  ; 23 known caller(s)
011cc (f+0010cc)  5b             pop bx
011cd (f+0010cd)  07             pop es
011ce (f+0010ce)  8bf7           mov si, di
011d0 (f+0010d0)  268a0c         mov cl, byte ptr es:[si]
011d3 (f+0010d3)  32ed           xor ch, ch
011d5 (f+0010d5)  41             inc cx
011d6 (f+0010d6)  2be1           sub sp, cx
011d8 (f+0010d8)  8bfc           mov di, sp
011da (f+0010da)  1e             push ds
011db (f+0010db)  06             push es
011dc (f+0010dc)  1f             pop ds
011dd (f+0010dd)  16             push ss
011de (f+0010de)  07             pop es
011df (f+0010df)  fc             cld 
011e0 (f+0010e0)  f3a4           rep movsb byte ptr es:[di], byte ptr [si]
011e2 (f+0010e2)  1f             pop ds
011e3 (f+0010e3)  ffe3           jmp bx

sub_11e5:  ; 12 known caller(s)
011e5 (f+0010e5)  5e             pop si
011e6 (f+0010e6)  2e8a0c         mov cl, byte ptr cs:[si]
011e9 (f+0010e9)  32ed           xor ch, ch
011eb (f+0010eb)  41             inc cx
011ec (f+0010ec)  2be1           sub sp, cx
011ee (f+0010ee)  8bfc           mov di, sp
011f0 (f+0010f0)  1e             push ds
011f1 (f+0010f1)  0e             push cs
011f2 (f+0010f2)  1f             pop ds
011f3 (f+0010f3)  16             push ss
011f4 (f+0010f4)  07             pop es
011f5 (f+0010f5)  fc             cld 
011f6 (f+0010f6)  f3a4           rep movsb byte ptr es:[di], byte ptr [si]
011f8 (f+0010f8)  1f             pop ds
011f9 (f+0010f9)  ffe6           jmp si

sub_11fb:  ; 7 known caller(s)
011fb (f+0010fb)  5a             pop dx
011fc (f+0010fc)  8ac1           mov al, cl
011fe (f+0010fe)  8bdc           mov bx, sp
01200 (f+001100)  368a0f         mov cl, byte ptr ss:[bx]
01203 (f+001103)  32ed           xor ch, ch
01205 (f+001105)  03d9           add bx, cx
01207 (f+001107)  43             inc bx
01208 (f+001108)  36c43f         les di, ptr ss:[bx]
0120b (f+00110b)  8bf4           mov si, sp
0120d (f+00110d)  3ac8           cmp cl, al
0120f (f+00110f)  7605           jbe 0x1216
01211 (f+001111)  8ac8           mov cl, al
01213 (f+001113)  368804         mov byte ptr ss:[si], al

sub_1216:  ; 1 known caller(s)
01216 (f+001116)  41             inc cx
01217 (f+001117)  1e             push ds
01218 (f+001118)  16             push ss
01219 (f+001119)  1f             pop ds
0121a (f+00111a)  fc             cld 
0121b (f+00111b)  f3a4           rep movsb byte ptr es:[di], byte ptr [si]
0121d (f+00111d)  1f             pop ds
0121e (f+00111e)  8d6704         lea sp, [bx + 4]
01221 (f+001121)  ffe2           jmp dx

sub_123d:  ; 7 known caller(s)
0123d (f+00113d)  5b             pop bx
0123e (f+00113e)  32ed           xor ch, ch
01240 (f+001140)  8bf4           mov si, sp
01242 (f+001142)  368a04         mov al, byte ptr ss:[si]
01245 (f+001145)  32e4           xor ah, ah
01247 (f+001147)  2bc1           sub ax, cx
01249 (f+001149)  8bfe           mov di, si
0124b (f+00114b)  03f8           add di, ax
0124d (f+00114d)  0bc0           or ax, ax
0124f (f+00114f)  7427           je 0x1278
01251 (f+001151)  7911           jns 0x1264
01253 (f+001153)  8be7           mov sp, di
01255 (f+001155)  368a0c         mov cl, byte ptr ss:[si]
01258 (f+001158)  41             inc cx
01259 (f+001159)  1e             push ds
0125a (f+00115a)  16             push ss
0125b (f+00115b)  1f             pop ds
0125c (f+00115c)  16             push ss
0125d (f+00115d)  07             pop es
0125e (f+00115e)  fc             cld 
0125f (f+00115f)  f3a4           rep movsb byte ptr es:[di], byte ptr [si]
01261 (f+001161)  1f             pop ds
01262 (f+001162)  eb14           jmp 0x1278
01264 (f+001164)  36880c         mov byte ptr ss:[si], cl
01267 (f+001167)  03f9           add di, cx
01269 (f+001169)  03f1           add si, cx
0126b (f+00116b)  41             inc cx
0126c (f+00116c)  1e             push ds
0126d (f+00116d)  16             push ss
0126e (f+00116e)  1f             pop ds
0126f (f+00116f)  16             push ss
01270 (f+001170)  07             pop es
01271 (f+001171)  fd             std 
01272 (f+001172)  f3a4           rep movsb byte ptr es:[di], byte ptr [si]
01274 (f+001174)  1f             pop ds
01275 (f+001175)  47             inc di
01276 (f+001176)  8be7           mov sp, di

sub_1278:  ; 1 known caller(s)
01278 (f+001178)  ffe3           jmp bx

sub_127a:  ; 1 known caller(s)
0127a (f+00117a)  e84500         call 0x12c2
0127d (f+00117d)  b80100         mov ax, 1
01280 (f+001180)  7401           je 0x1283
01282 (f+001182)  48             dec ax

sub_1283:  ; 1 known caller(s)
01283 (f+001183)  0bc0           or ax, ax
01285 (f+001185)  c3             ret 

sub_12c2:  ; 1 known caller(s)
012c2 (f+0011c2)  8bfc           mov di, sp
012c4 (f+0011c4)  83c704         add di, 4
012c7 (f+0011c7)  368a0d         mov cl, byte ptr ss:[di]
012ca (f+0011ca)  32ed           xor ch, ch
012cc (f+0011cc)  47             inc di
012cd (f+0011cd)  8bf7           mov si, di
012cf (f+0011cf)  03f1           add si, cx
012d1 (f+0011d1)  368a14         mov dl, byte ptr ss:[si]
012d4 (f+0011d4)  32f6           xor dh, dh
012d6 (f+0011d6)  46             inc si
012d7 (f+0011d7)  8bde           mov bx, si
012d9 (f+0011d9)  03da           add bx, dx
012db (f+0011db)  8ac1           mov al, cl
012dd (f+0011dd)  8ae2           mov ah, dl
012df (f+0011df)  3bca           cmp cx, dx
012e1 (f+0011e1)  7602           jbe 0x12e5
012e3 (f+0011e3)  87ca           xchg dx, cx

sub_12e5:  ; 1 known caller(s)
012e5 (f+0011e5)  0bc9           or cx, cx
012e7 (f+0011e7)  740b           je 0x12f4
012e9 (f+0011e9)  1e             push ds
012ea (f+0011ea)  16             push ss
012eb (f+0011eb)  07             pop es
012ec (f+0011ec)  16             push ss
012ed (f+0011ed)  1f             pop ds
012ee (f+0011ee)  fc             cld 
012ef (f+0011ef)  f3a6           repe cmpsb byte ptr [si], byte ptr es:[di]
012f1 (f+0011f1)  1f             pop ds
012f2 (f+0011f2)  7502           jne 0x12f6

sub_12f4:  ; 1 known caller(s)
012f4 (f+0011f4)  3ae0           cmp ah, al

sub_12f6:  ; 1 known caller(s)
012f6 (f+0011f6)  5a             pop dx
012f7 (f+0011f7)  59             pop cx
012f8 (f+0011f8)  8be3           mov sp, bx
012fa (f+0011fa)  51             push cx
012fb (f+0011fb)  ffe2           jmp dx

sub_12fd:  ; 2 known caller(s)
012fd (f+0011fd)  8f068601       pop word ptr [0x186]
01301 (f+001201)  8bfc           mov di, sp
01303 (f+001203)  368a15         mov dl, byte ptr ss:[di]
01306 (f+001206)  32f6           xor dh, dh
01308 (f+001208)  8bf7           mov si, di
0130a (f+00120a)  46             inc si
0130b (f+00120b)  03f2           add si, dx
0130d (f+00120d)  368a0c         mov cl, byte ptr ss:[si]
01310 (f+001210)  02d1           add dl, cl
01312 (f+001212)  7226           jb 0x133a
01314 (f+001214)  368814         mov byte ptr ss:[si], dl
01317 (f+001217)  32ed           xor ch, ch
01319 (f+001219)  2bf9           sub di, cx
0131b (f+00121b)  8be7           mov sp, di
0131d (f+00121d)  41             inc cx
0131e (f+00121e)  1e             push ds
0131f (f+00121f)  56             push si
01320 (f+001220)  16             push ss
01321 (f+001221)  07             pop es
01322 (f+001222)  16             push ss
01323 (f+001223)  1f             pop ds
01324 (f+001224)  fc             cld 
01325 (f+001225)  f3a4           rep movsb byte ptr es:[di], byte ptr [si]
01327 (f+001227)  8bfe           mov di, si
01329 (f+001229)  5e             pop si
0132a (f+00122a)  4e             dec si
0132b (f+00122b)  4f             dec di
0132c (f+00122c)  8bca           mov cx, dx
0132e (f+00122e)  41             inc cx
0132f (f+00122f)  fd             std 
01330 (f+001230)  f3a4           rep movsb byte ptr es:[di], byte ptr [si]
01332 (f+001232)  1f             pop ds
01333 (f+001233)  47             inc di
01334 (f+001234)  8be7           mov sp, di
01336 (f+001236)  ff268601       jmp word ptr [0x186]
0133a (f+00123a)  b210           mov dl, 0x10
0133c (f+00123c)  e9fdfc         jmp 0x103c

sub_133f:  ; 2 known caller(s)
0133f (f+00123f)  8f068601       pop word ptr [0x186]
01343 (f+001243)  e883f7         call 0xac9
01346 (f+001246)  8bc8           mov cx, ax
01348 (f+001248)  58             pop ax
01349 (f+001249)  e87201         call 0x14be
0134c (f+00124c)  48             dec ax
0134d (f+00124d)  8bf4           mov si, sp
0134f (f+00124f)  368a14         mov dl, byte ptr ss:[si]
01352 (f+001252)  32f6           xor dh, dh
01354 (f+001254)  8bfc           mov di, sp
01356 (f+001256)  03fa           add di, dx
01358 (f+001258)  2bd0           sub dx, ax
0135a (f+00125a)  7615           jbe 0x1371
0135c (f+00125c)  03f0           add si, ax
0135e (f+00125e)  3bd1           cmp dx, cx
01360 (f+001260)  7613           jbe 0x1375
01362 (f+001262)  03f1           add si, cx
01364 (f+001264)  8bd1           mov dx, cx
01366 (f+001266)  1e             push ds
01367 (f+001267)  16             push ss
01368 (f+001268)  07             pop es
01369 (f+001269)  16             push ss
0136a (f+00126a)  1f             pop ds
0136b (f+00126b)  fd             std 
0136c (f+00126c)  f3a4           rep movsb byte ptr es:[di], byte ptr [si]
0136e (f+00126e)  1f             pop ds
0136f (f+00126f)  eb02           jmp 0x1373
01371 (f+001271)  33d2           xor dx, dx

sub_1373:  ; 1 known caller(s)
01373 (f+001273)  87f7           xchg di, si

sub_1375:  ; 1 known caller(s)
01375 (f+001275)  368814         mov byte ptr ss:[si], dl
01378 (f+001278)  8be6           mov sp, si
0137a (f+00127a)  ff268601       jmp word ptr [0x186]

sub_137e:  ; 14 known caller(s)
0137e (f+00127e)  5b             pop bx
0137f (f+00127f)  8bfc           mov di, sp
01381 (f+001281)  368a05         mov al, byte ptr ss:[di]
01384 (f+001284)  32e4           xor ah, ah
01386 (f+001286)  03e0           add sp, ax
01388 (f+001288)  44             inc sp
01389 (f+001289)  ffe3           jmp bx

sub_1427:  ; 2 known caller(s)
01427 (f+001327)  a30402         mov word ptr [0x204], ax
0142a (f+00132a)  5b             pop bx
0142b (f+00132b)  8f060202       pop word ptr [0x202]
0142f (f+00132f)  8f060602       pop word ptr [0x206]
01433 (f+001333)  8f060802       pop word ptr [0x208]
01437 (f+001337)  53             push bx
01438 (f+001338)  c43e0602       les di, ptr [0x206]
0143c (f+00133c)  06             push es
0143d (f+00133d)  57             push di
0143e (f+00133e)  06             push es
0143f (f+00133f)  e88afd         call 0x11cc
01442 (f+001342)  b80100         mov ax, 1
01445 (f+001345)  50             push ax
01446 (f+001346)  a10202         mov ax, word ptr [0x202]
01449 (f+001349)  48             dec ax
0144a (f+00134a)  e8f2fe         call 0x133f
0144d (f+00134d)  a10202         mov ax, word ptr [0x202]
01450 (f+001350)  03060402       add ax, word ptr [0x204]
01454 (f+001354)  0ae4           or ah, ah
01456 (f+001356)  7512           jne 0x146a
01458 (f+001358)  c43e0602       les di, ptr [0x206]
0145c (f+00135c)  06             push es
0145d (f+00135d)  e86cfd         call 0x11cc
01460 (f+001360)  50             push ax
01461 (f+001361)  b8ff00         mov ax, 0xff
01464 (f+001364)  e8d8fe         call 0x133f
01467 (f+001367)  e893fe         call 0x12fd

sub_146a:  ; 1 known caller(s)
0146a (f+00136a)  b1ff           mov cl, 0xff
0146c (f+00136c)  e88cfd         call 0x11fb
0146f (f+00136f)  c3             ret 

sub_14be:  ; 1 known caller(s)
014be (f+0013be)  0ae4           or ah, ah
014c0 (f+0013c0)  7505           jne 0x14c7
014c2 (f+0013c2)  0ac0           or al, al
014c4 (f+0013c4)  7401           je 0x14c7
014c6 (f+0013c6)  c3             ret 

sub_14c7:  ; 1 known caller(s)
014c7 (f+0013c7)  b211           mov dl, 0x11
014c9 (f+0013c9)  e970fb         jmp 0x103c

sub_14cc:  ; 1 known caller(s)
014cc (f+0013cc)  5b             pop bx
014cd (f+0013cd)  5a             pop dx
014ce (f+0013ce)  8bf7           mov si, di
014d0 (f+0013d0)  83ec20         sub sp, 0x20
014d3 (f+0013d3)  8bfc           mov di, sp
014d5 (f+0013d5)  51             push cx
014d6 (f+0013d6)  16             push ss
014d7 (f+0013d7)  07             pop es
014d8 (f+0013d8)  fc             cld 
014d9 (f+0013d9)  0aed           or ch, ch
014db (f+0013db)  7407           je 0x14e4
014dd (f+0013dd)  32c0           xor al, al

sub_14df:  ; 1 known caller(s)
014df (f+0013df)  aa             stosb byte ptr es:[di], al
014e0 (f+0013e0)  fecd           dec ch
014e2 (f+0013e2)  75fb           jne 0x14df

sub_14e4:  ; 1 known caller(s)
014e4 (f+0013e4)  1e             push ds
014e5 (f+0013e5)  8eda           mov ds, dx
014e7 (f+0013e7)  f3a4           rep movsb byte ptr es:[di], byte ptr [si]
014e9 (f+0013e9)  1f             pop ds
014ea (f+0013ea)  59             pop cx
014eb (f+0013eb)  b420           mov ah, 0x20
014ed (f+0013ed)  2ae5           sub ah, ch
014ef (f+0013ef)  2ae1           sub ah, cl
014f1 (f+0013f1)  7407           je 0x14fa
014f3 (f+0013f3)  32c0           xor al, al

sub_14f5:  ; 1 known caller(s)
014f5 (f+0013f5)  aa             stosb byte ptr es:[di], al
014f6 (f+0013f6)  fecc           dec ah
014f8 (f+0013f8)  75fb           jne 0x14f5

sub_14fa:  ; 1 known caller(s)
014fa (f+0013fa)  ffe3           jmp bx

sub_14fc:  ; 8 known caller(s)
014fc (f+0013fc)  5b             pop bx
014fd (f+0013fd)  83ec20         sub sp, 0x20
01500 (f+001400)  8bfc           mov di, sp
01502 (f+001402)  16             push ss
01503 (f+001403)  07             pop es
01504 (f+001404)  b91000         mov cx, 0x10
01507 (f+001407)  33c0           xor ax, ax
01509 (f+001409)  fc             cld 
0150a (f+00140a)  f3ab           rep stosw word ptr es:[di], ax
0150c (f+00140c)  ffe3           jmp bx

sub_150e:  ; 14 known caller(s)
0150e (f+00140e)  e8ef00         call 0x1600
01511 (f+001411)  360807         or byte ptr ss:[bx], al
01514 (f+001414)  c3             ret 

sub_1515:  ; 6 known caller(s)
01515 (f+001415)  91             xchg cx, ax
01516 (f+001416)  5b             pop bx
01517 (f+001417)  58             pop ax
01518 (f+001418)  53             push bx
01519 (f+001419)  2ac8           sub cl, al
0151b (f+00141b)  7216           jb 0x1533
0151d (f+00141d)  32ed           xor ch, ch
0151f (f+00141f)  41             inc cx
01520 (f+001420)  8ae1           mov ah, cl
01522 (f+001422)  e8db00         call 0x1600
01525 (f+001425)  8acc           mov cl, ah

sub_1527:  ; 1 known caller(s)
01527 (f+001427)  360807         or byte ptr ss:[bx], al
0152a (f+00142a)  d0e0           shl al, 1
0152c (f+00142c)  7303           jae 0x1531
0152e (f+00142e)  43             inc bx
0152f (f+00142f)  b001           mov al, 1

sub_1531:  ; 1 known caller(s)
01531 (f+001431)  e2f4           loop 0x1527

sub_1533:  ; 1 known caller(s)
01533 (f+001433)  c3             ret 

sub_1552:  ; 1 known caller(s)
01552 (f+001452)  5b             pop bx
01553 (f+001453)  8ad5           mov dl, ch
01555 (f+001455)  32f6           xor dh, dh
01557 (f+001457)  32ed           xor ch, ch
01559 (f+001459)  8bf4           mov si, sp
0155b (f+00145b)  03f2           add si, dx
0155d (f+00145d)  03f1           add si, cx
0155f (f+00145f)  8bfc           mov di, sp
01561 (f+001461)  83c720         add di, 0x20
01564 (f+001464)  3bf7           cmp si, di
01566 (f+001466)  740e           je 0x1576
01568 (f+001468)  4e             dec si
01569 (f+001469)  4f             dec di
0156a (f+00146a)  1e             push ds
0156b (f+00146b)  16             push ss
0156c (f+00146c)  07             pop es
0156d (f+00146d)  16             push ss
0156e (f+00146e)  1f             pop ds
0156f (f+00146f)  fd             std 
01570 (f+001470)  f3a4           rep movsb byte ptr es:[di], byte ptr [si]
01572 (f+001472)  1f             pop ds
01573 (f+001473)  47             inc di
01574 (f+001474)  8be7           mov sp, di

sub_1576:  ; 1 known caller(s)
01576 (f+001476)  ffe3           jmp bx

sub_15e1:  ; 8 known caller(s)
015e1 (f+0014e1)  8bdc           mov bx, sp
015e3 (f+0014e3)  368b4722       mov ax, word ptr ss:[bx + 0x22]
015e7 (f+0014e7)  0ae4           or ah, ah
015e9 (f+0014e9)  7404           je 0x15ef
015eb (f+0014eb)  33c0           xor ax, ax
015ed (f+0014ed)  eb0c           jmp 0x15fb
015ef (f+0014ef)  e80e00         call 0x1600
015f2 (f+0014f2)  362207         and al, byte ptr ss:[bx]
015f5 (f+0014f5)  b80000         mov ax, 0
015f8 (f+0014f8)  7401           je 0x15fb
015fa (f+0014fa)  40             inc ax

sub_15fb:  ; 2 known caller(s)
015fb (f+0014fb)  0bc0           or ax, ax
015fd (f+0014fd)  c22200         ret 0x22

sub_1600:  ; 3 known caller(s)
01600 (f+001500)  8ad8           mov bl, al
01602 (f+001502)  32ff           xor bh, bh
01604 (f+001504)  b103           mov cl, 3
01606 (f+001506)  d3eb           shr bx, cl
01608 (f+001508)  83c304         add bx, 4
0160b (f+00150b)  03dc           add bx, sp
0160d (f+00150d)  8ac8           mov cl, al
0160f (f+00150f)  80e107         and cl, 7
01612 (f+001512)  b001           mov al, 1
01614 (f+001514)  d2e0           shl al, cl
01616 (f+001516)  c3             ret 

sub_232a:  ; 1 known caller(s)
0232a (f+00222a)  32c0           xor al, al
0232c (f+00222c)  eb06           jmp 0x2334

sub_232e:  ; 1 known caller(s)
0232e (f+00222e)  b001           mov al, 1
02330 (f+002230)  eb02           jmp 0x2334

sub_2334:  ; 1 known caller(s)
02334 (f+002234)  a23802         mov byte ptr [0x238], al
02337 (f+002237)  8f068601       pop word ptr [0x186]
0233b (f+00223b)  07             pop es
0233c (f+00223c)  ff368601       push word ptr [0x186]
02340 (f+002240)  268a4502       mov al, byte ptr es:[di + 2]
02344 (f+002244)  240f           and al, 0xf
02346 (f+002246)  7406           je 0x234e
02348 (f+002248)  26806502df     and byte ptr es:[di + 2], 0xdf

sub_234d:  ; 2 known caller(s)
0234d (f+00224d)  c3             ret 
0234e (f+00224e)  26894d06       mov word ptr es:[di + 6], cx
02352 (f+002252)  e80701         call 0x245c
02355 (f+002255)  803e800100     cmp byte ptr [0x180], 0
0235a (f+00225a)  75f1           jne 0x234d
0235c (f+00225c)  e89601         call 0x24f5
0235f (f+00225f)  803e800100     cmp byte ptr [0x180], 0
02364 (f+002264)  75e7           jne 0x234d
02366 (f+002266)  f70672010200   test word ptr [0x172], 2
0236c (f+00226c)  7415           je 0x2383
0236e (f+00226e)  b80044         mov ax, 0x4400
02371 (f+002271)  268b1d         mov bx, word ptr es:[di]
02374 (f+002274)  e8e0e5         call 0x957
02377 (f+002277)  f7c28000       test dx, 0x80
0237b (f+00227b)  7406           je 0x2383
0237d (f+00227d)  26c745060100   mov word ptr es:[di + 6], 1

sub_2383:  ; 2 known caller(s)
02383 (f+002283)  803e380201     cmp byte ptr [0x238], 1
02388 (f+002288)  7312           jae 0x239c
0238a (f+00228a)  26c6450280     mov byte ptr es:[di + 2], 0x80
0238f (f+00228f)  268b5d04       mov bx, word ptr es:[di + 4]
02393 (f+002293)  26895d08       mov word ptr es:[di + 8], bx
02397 (f+002297)  26895d0a       mov word ptr es:[di + 0xa], bx
0239b (f+00229b)  c3             ret 
0239c (f+00229c)  7459           je 0x23f7
0239e (f+00229e)  b80242         mov ax, 0x4202
023a1 (f+0022a1)  268b1d         mov bx, word ptr es:[di]
023a4 (f+0022a4)  33c9           xor cx, cx
023a6 (f+0022a6)  33d2           xor dx, dx
023a8 (f+0022a8)  e8ace5         call 0x957
023ab (f+0022ab)  268b4d06       mov cx, word ptr es:[di + 6]
023af (f+0022af)  81f98000       cmp cx, 0x80
023b3 (f+0022b3)  7203           jb 0x23b8
023b5 (f+0022b5)  b98000         mov cx, 0x80

sub_23b8:  ; 1 known caller(s)
023b8 (f+0022b8)  2bc1           sub ax, cx
023ba (f+0022ba)  83da00         sbb dx, 0
023bd (f+0022bd)  7308           jae 0x23c7
023bf (f+0022bf)  03c1           add ax, cx
023c1 (f+0022c1)  8bc8           mov cx, ax
023c3 (f+0022c3)  33c0           xor ax, ax
023c5 (f+0022c5)  33d2           xor dx, dx

sub_23c7:  ; 1 known caller(s)
023c7 (f+0022c7)  51             push cx
023c8 (f+0022c8)  8bca           mov cx, dx
023ca (f+0022ca)  8bd0           mov dx, ax
023cc (f+0022cc)  b80042         mov ax, 0x4200
023cf (f+0022cf)  268b1d         mov bx, word ptr es:[di]
023d2 (f+0022d2)  e882e5         call 0x957
023d5 (f+0022d5)  e81003         call 0x26e8
023d8 (f+0022d8)  5a             pop dx
023d9 (f+0022d9)  f7da           neg dx
023db (f+0022db)  268b7508       mov si, word ptr es:[di + 8]

sub_23df:  ; 1 known caller(s)
023df (f+0022df)  26803c1a       cmp byte ptr es:[si], 0x1a
023e3 (f+0022e3)  7406           je 0x23eb
023e5 (f+0022e5)  46             inc si
023e6 (f+0022e6)  42             inc dx
023e7 (f+0022e7)  75f6           jne 0x23df
023e9 (f+0022e9)  eb0c           jmp 0x23f7
023eb (f+0022eb)  b80242         mov ax, 0x4202
023ee (f+0022ee)  268b1d         mov bx, word ptr es:[di]
023f1 (f+0022f1)  b9ffff         mov cx, 0xffff
023f4 (f+0022f4)  e860e5         call 0x957

sub_23f7:  ; 1 known caller(s)
023f7 (f+0022f7)  26c6450240     mov byte ptr es:[di + 2], 0x40
023fc (f+0022fc)  268b4504       mov ax, word ptr es:[di + 4]
02400 (f+002300)  26894508       mov word ptr es:[di + 8], ax
02404 (f+002304)  26034506       add ax, word ptr es:[di + 6]
02408 (f+002308)  2689450a       mov word ptr es:[di + 0xa], ax
0240c (f+00230c)  c3             ret 

sub_2448:  ; 1 known caller(s)
02448 (f+002348)  26807d0240     cmp byte ptr es:[di + 2], 0x40
0244d (f+00234d)  7503           jne 0x2452
0244f (f+00234f)  e92104         jmp 0x2873
02452 (f+002352)  c3             ret 

sub_2453:  ; 2 known caller(s)
02453 (f+002353)  8f068601       pop word ptr [0x186]
02457 (f+002357)  07             pop es
02458 (f+002358)  ff368601       push word ptr [0x186]

sub_245c:  ; 1 known caller(s)
0245c (f+00235c)  268a4502       mov al, byte ptr es:[di + 2]
02460 (f+002360)  240f           and al, 0xf
02462 (f+002362)  7526           jne 0x248a
02464 (f+002364)  e8e1ff         call 0x2448
02467 (f+002367)  26c6450200     mov byte ptr es:[di + 2], 0
0246c (f+00236c)  268b1d         mov bx, word ptr es:[di]
0246f (f+00236f)  83fb02         cmp bx, 2
02472 (f+002372)  7616           jbe 0x248a
02474 (f+002374)  83fbff         cmp bx, -1
02477 (f+002377)  7411           je 0x248a
02479 (f+002379)  26c705ffff     mov word ptr es:[di], 0xffff
0247e (f+00237e)  b43e           mov ah, 0x3e
02480 (f+002380)  e8d4e4         call 0x957
02483 (f+002383)  7305           jae 0x248a
02485 (f+002385)  c6068001ff     mov byte ptr [0x180], 0xff

sub_248a:  ; 4 known caller(s)
0248a (f+00238a)  c3             ret 

sub_24f5:  ; 1 known caller(s)
024f5 (f+0023f5)  26833dff       cmp word ptr es:[di], -1
024f9 (f+0023f9)  752d           jne 0x2528
024fb (f+0023fb)  b8023d         mov ax, 0x3d02
024fe (f+0023fe)  b201           mov dl, 1
02500 (f+002400)  f606380201     test byte ptr [0x238], 1
02505 (f+002405)  7406           je 0x250d
02507 (f+002407)  b43c           mov ah, 0x3c
02509 (f+002409)  33c9           xor cx, cx
0250b (f+00240b)  b2f1           mov dl, 0xf1

sub_250d:  ; 1 known caller(s)
0250d (f+00240d)  52             push dx
0250e (f+00240e)  8d550c         lea dx, [di + 0xc]
02511 (f+002411)  e843e4         call 0x957
02514 (f+002414)  5a             pop dx
02515 (f+002415)  7204           jb 0x251b
02517 (f+002417)  268905         mov word ptr es:[di], ax
0251a (f+00241a)  c3             ret 

sub_251b:  ; 1 known caller(s)
0251b (f+00241b)  88168001       mov byte ptr [0x180], dl
0251f (f+00241f)  3c04           cmp al, 4
02521 (f+002421)  7505           jne 0x2528
02523 (f+002423)  c6068001f3     mov byte ptr [0x180], 0xf3

sub_2528:  ; 2 known caller(s)
02528 (f+002428)  c3             ret 

sub_253b:  ; 2 known caller(s)
0253b (f+00243b)  8f068601       pop word ptr [0x186]
0253f (f+00243f)  07             pop es
02540 (f+002440)  893e3202       mov word ptr [0x232], di
02544 (f+002444)  8c063402       mov word ptr [0x234], es
02548 (f+002448)  26f6450280     test byte ptr es:[di + 2], 0x80
0254d (f+00244d)  7505           jne 0x2554
0254f (f+00244f)  c606800102     mov byte ptr [0x180], 2

sub_2554:  ; 1 known caller(s)
02554 (f+002454)  ff268601       jmp word ptr [0x186]

sub_2558:  ; 20 known caller(s)
02558 (f+002458)  8f068601       pop word ptr [0x186]
0255c (f+00245c)  c70632026601   mov word ptr [0x232], 0x166
02562 (f+002462)  8c1e3402       mov word ptr [0x234], ds
02566 (f+002466)  ff268601       jmp word ptr [0x186]

sub_25b6:  ; 1 known caller(s)
025b6 (f+0024b6)  8a2e8101       mov ch, byte ptr [0x181]
025ba (f+0024ba)  80fd7e         cmp ch, 0x7e
025bd (f+0024bd)  7202           jb 0x25c1
025bf (f+0024bf)  b57e           mov ch, 0x7e

sub_25c1:  ; 1 known caller(s)
025c1 (f+0024c1)  c60681017e     mov byte ptr [0x181], 0x7e
025c6 (f+0024c6)  bb3600         mov bx, 0x36
025c9 (f+0024c9)  891e8201       mov word ptr [0x182], bx

sub_25cd:  ; 1 known caller(s)
025cd (f+0024cd)  32c9           xor cl, cl

sub_25cf:  ; 7 known caller(s)
025cf (f+0024cf)  e8a3e4         call 0xa75
025d2 (f+0024d2)  b201           mov dl, 1
025d4 (f+0024d4)  3c08           cmp al, 8
025d6 (f+0024d6)  7439           je 0x2611
025d8 (f+0024d8)  3c7f           cmp al, 0x7f
025da (f+0024da)  7435           je 0x2611
025dc (f+0024dc)  3c04           cmp al, 4
025de (f+0024de)  7443           je 0x2623
025e0 (f+0024e0)  feca           dec dl
025e2 (f+0024e2)  3c18           cmp al, 0x18
025e4 (f+0024e4)  742b           je 0x2611
025e6 (f+0024e6)  3c1b           cmp al, 0x1b
025e8 (f+0024e8)  7427           je 0x2611
025ea (f+0024ea)  3c12           cmp al, 0x12
025ec (f+0024ec)  7435           je 0x2623
025ee (f+0024ee)  3c1a           cmp al, 0x1a
025f0 (f+0024f0)  7443           je 0x2635
025f2 (f+0024f2)  3c0d           cmp al, 0xd
025f4 (f+0024f4)  7445           je 0x263b
025f6 (f+0024f6)  3c20           cmp al, 0x20
025f8 (f+0024f8)  72d5           jb 0x25cf
025fa (f+0024fa)  3acd           cmp cl, ch
025fc (f+0024fc)  74d1           je 0x25cf
025fe (f+0024fe)  8a27           mov ah, byte ptr [bx]
02600 (f+002500)  8807           mov byte ptr [bx], al
02602 (f+002502)  fec1           inc cl
02604 (f+002504)  43             inc bx
02605 (f+002505)  80fc20         cmp ah, 0x20
02608 (f+002508)  7302           jae 0x260c
0260a (f+00250a)  8827           mov byte ptr [bx], ah

sub_260c:  ; 1 known caller(s)
0260c (f+00250c)  e84300         call 0x2652
0260f (f+00250f)  ebbe           jmp 0x25cf

sub_2611:  ; 4 known caller(s)
02611 (f+002511)  fec9           dec cl
02613 (f+002513)  78b8           js 0x25cd
02615 (f+002515)  e869e4         call 0xa81
02618 (f+002518)  0820           or byte ptr [bx + si], ah
0261a (f+00251a)  0800           or byte ptr [bx + si], al
0261c (f+00251c)  4b             dec bx
0261d (f+00251d)  feca           dec dl
0261f (f+00251f)  75f0           jne 0x2611
02621 (f+002521)  ebac           jmp 0x25cf

sub_2623:  ; 2 known caller(s)
02623 (f+002523)  8a07           mov al, byte ptr [bx]
02625 (f+002525)  3c20           cmp al, 0x20
02627 (f+002527)  72a6           jb 0x25cf
02629 (f+002529)  e82600         call 0x2652
0262c (f+00252c)  fec1           inc cl
0262e (f+00252e)  43             inc bx
0262f (f+00252f)  feca           dec dl
02631 (f+002531)  75f0           jne 0x2623
02633 (f+002533)  eb9a           jmp 0x25cf
02635 (f+002535)  0af6           or dh, dh
02637 (f+002537)  7496           je 0x25cf
02639 (f+002539)  eb04           jmp 0x263f
0263b (f+00253b)  0af6           or dh, dh
0263d (f+00253d)  7505           jne 0x2644

sub_263f:  ; 1 known caller(s)
0263f (f+00253f)  c6071a         mov byte ptr [bx], 0x1a
02642 (f+002542)  eb08           jmp 0x264c
02644 (f+002544)  e852e4         call 0xa99
02647 (f+002547)  c7070d0a       mov word ptr [bx], 0xa0d
0264b (f+00254b)  43             inc bx

sub_264c:  ; 1 known caller(s)
0264c (f+00254c)  43             inc bx
0264d (f+00254d)  891e8401       mov word ptr [0x184], bx
02651 (f+002551)  c3             ret 

sub_2652:  ; 2 known caller(s)
02652 (f+002552)  8a269401       mov ah, byte ptr [0x194]
02656 (f+002556)  c606940100     mov byte ptr [0x194], 0
0265b (f+00255b)  50             push ax
0265c (f+00255c)  e804e4         call 0xa63
0265f (f+00255f)  58             pop ax
02660 (f+002560)  88269401       mov byte ptr [0x194], ah
02664 (f+002564)  c3             ret 

sub_2665:  ; 1 known caller(s)
02665 (f+002565)  c43e3202       les di, ptr [0x232]
02669 (f+002569)  803e800100     cmp byte ptr [0x180], 0
0266e (f+00256e)  7575           jne 0x26e5
02670 (f+002570)  268a4502       mov al, byte ptr es:[di + 2]
02674 (f+002574)  a820           test al, 0x20
02676 (f+002576)  7568           jne 0x26e0
02678 (f+002578)  240f           and al, 0xf
0267a (f+00257a)  751b           jne 0x2697
0267c (f+00257c)  268b5d08       mov bx, word ptr es:[di + 8]
02680 (f+002580)  263b5d0a       cmp bx, word ptr es:[di + 0xa]
02684 (f+002584)  7207           jb 0x268d
02686 (f+002586)  e85f00         call 0x26e8
02689 (f+002589)  268b5d08       mov bx, word ptr es:[di + 8]

sub_268d:  ; 1 known caller(s)
0268d (f+00258d)  268a07         mov al, byte ptr es:[bx]
02690 (f+002590)  43             inc bx
02691 (f+002591)  26895d08       mov word ptr es:[di + 8], bx
02695 (f+002595)  eb3f           jmp 0x26d6
02697 (f+002597)  06             push es
02698 (f+002598)  57             push di
02699 (f+002599)  3c01           cmp al, 1
0269b (f+00259b)  751c           jne 0x26b9
0269d (f+00259d)  8b1e8201       mov bx, word ptr [0x182]
026a1 (f+0025a1)  3b1e8401       cmp bx, word ptr [0x184]
026a5 (f+0025a5)  7209           jb 0x26b0
026a7 (f+0025a7)  8af0           mov dh, al
026a9 (f+0025a9)  e80aff         call 0x25b6
026ac (f+0025ac)  8b1e8201       mov bx, word ptr [0x182]

sub_26b0:  ; 1 known caller(s)
026b0 (f+0025b0)  8a07           mov al, byte ptr [bx]
026b2 (f+0025b2)  43             inc bx
026b3 (f+0025b3)  891e8201       mov word ptr [0x182], bx
026b7 (f+0025b7)  eb1b           jmp 0x26d4
026b9 (f+0025b9)  3c02           cmp al, 2
026bb (f+0025bb)  7507           jne 0x26c4
026bd (f+0025bd)  4c             dec sp
026be (f+0025be)  ff163801       call word ptr [0x138]
026c2 (f+0025c2)  eb10           jmp 0x26d4
026c4 (f+0025c4)  3c04           cmp al, 4
026c6 (f+0025c6)  7507           jne 0x26cf
026c8 (f+0025c8)  4c             dec sp
026c9 (f+0025c9)  ff164001       call word ptr [0x140]
026cd (f+0025cd)  eb05           jmp 0x26d4
026cf (f+0025cf)  4c             dec sp
026d0 (f+0025d0)  ff164401       call word ptr [0x144]

sub_26d4:  ; 2 known caller(s)
026d4 (f+0025d4)  5f             pop di
026d5 (f+0025d5)  07             pop es
026d6 (f+0025d6)  26884503       mov byte ptr es:[di + 3], al
026da (f+0025da)  26804d0220     or byte ptr es:[di + 2], 0x20
026df (f+0025df)  c3             ret 
026e0 (f+0025e0)  268a4503       mov al, byte ptr es:[di + 3]
026e4 (f+0025e4)  c3             ret 
026e5 (f+0025e5)  b01a           mov al, 0x1a
026e7 (f+0025e7)  c3             ret 

sub_26e8:  ; 2 known caller(s)
026e8 (f+0025e8)  b43f           mov ah, 0x3f
026ea (f+0025ea)  268b1d         mov bx, word ptr es:[di]
026ed (f+0025ed)  268b4d06       mov cx, word ptr es:[di + 6]
026f1 (f+0025f1)  268b5504       mov dx, word ptr es:[di + 4]
026f5 (f+0025f5)  1e             push ds
026f6 (f+0025f6)  06             push es
026f7 (f+0025f7)  1f             pop ds
026f8 (f+0025f8)  e85ce2         call 0x957
026fb (f+0025fb)  1f             pop ds
026fc (f+0025fc)  7302           jae 0x2700
026fe (f+0025fe)  33c0           xor ax, ax

sub_2700:  ; 1 known caller(s)
02700 (f+002600)  268b5d04       mov bx, word ptr es:[di + 4]
02704 (f+002604)  0bc0           or ax, ax
02706 (f+002606)  7505           jne 0x270d
02708 (f+002608)  26c6071a       mov byte ptr es:[bx], 0x1a
0270c (f+00260c)  40             inc ax

sub_270d:  ; 1 known caller(s)
0270d (f+00260d)  26895d08       mov word ptr es:[di + 8], bx
02711 (f+002611)  03d8           add bx, ax
02713 (f+002613)  26895d0a       mov word ptr es:[di + 0xa], bx
02717 (f+002617)  c3             ret 

sub_2762:  ; 2 known caller(s)
02762 (f+002662)  57             push di
02763 (f+002663)  e8fffe         call 0x2665
02766 (f+002666)  26806502df     and byte ptr es:[di + 2], 0xdf
0276b (f+00266b)  5f             pop di
0276c (f+00266c)  5b             pop bx
0276d (f+00266d)  07             pop es
0276e (f+00266e)  268805         mov byte ptr es:[di], al
02771 (f+002671)  ffe3           jmp bx

sub_2828:  ; 7 known caller(s)
02828 (f+002728)  c43e3202       les di, ptr [0x232]
0282c (f+00272c)  803e800100     cmp byte ptr [0x180], 0
02831 (f+002731)  753f           jne 0x2872
02833 (f+002733)  268a4d02       mov cl, byte ptr es:[di + 2]
02837 (f+002737)  80e10f         and cl, 0xf
0283a (f+00273a)  7513           jne 0x284f
0283c (f+00273c)  268b5d08       mov bx, word ptr es:[di + 8]
02840 (f+002740)  268807         mov byte ptr es:[bx], al
02843 (f+002743)  43             inc bx
02844 (f+002744)  26895d08       mov word ptr es:[di + 8], bx
02848 (f+002748)  263b5d0a       cmp bx, word ptr es:[di + 0xa]
0284c (f+00274c)  7425           je 0x2873
0284e (f+00274e)  c3             ret 
0284f (f+00274f)  50             push ax
02850 (f+002750)  80f901         cmp cl, 1
02853 (f+002753)  740f           je 0x2864
02855 (f+002755)  80f903         cmp cl, 3
02858 (f+002758)  740f           je 0x2869
0285a (f+00275a)  80f904         cmp cl, 4
0285d (f+00275d)  740f           je 0x286e
0285f (f+00275f)  ff164201       call word ptr [0x142]
02863 (f+002763)  c3             ret 
02864 (f+002764)  ff163a01       call word ptr [0x13a]
02868 (f+002768)  c3             ret 
02869 (f+002769)  ff163c01       call word ptr [0x13c]
0286d (f+00276d)  c3             ret 
0286e (f+00276e)  ff163e01       call word ptr [0x13e]
02872 (f+002772)  c3             ret 

sub_2873:  ; 1 known caller(s)
02873 (f+002773)  268b4d08       mov cx, word ptr es:[di + 8]
02877 (f+002777)  262b4d04       sub cx, word ptr es:[di + 4]
0287b (f+00277b)  741f           je 0x289c
0287d (f+00277d)  b440           mov ah, 0x40
0287f (f+00277f)  268b1d         mov bx, word ptr es:[di]
02882 (f+002782)  268b5504       mov dx, word ptr es:[di + 4]
02886 (f+002786)  26895508       mov word ptr es:[di + 8], dx
0288a (f+00278a)  1e             push ds
0288b (f+00278b)  06             push es
0288c (f+00278c)  1f             pop ds
0288d (f+00278d)  e8c7e0         call 0x957
02890 (f+002790)  1f             pop ds
02891 (f+002791)  7204           jb 0x2897
02893 (f+002793)  3bc1           cmp ax, cx
02895 (f+002795)  7405           je 0x289c

sub_2897:  ; 1 known caller(s)
02897 (f+002797)  c6068001f0     mov byte ptr [0x180], 0xf0

sub_289c:  ; 2 known caller(s)
0289c (f+00279c)  c3             ret 

sub_289d:  ; 4 known caller(s)
0289d (f+00279d)  0bc0           or ax, ax
0289f (f+00279f)  7412           je 0x28b3
028a1 (f+0027a1)  e825e2         call 0xac9
028a4 (f+0027a4)  3c01           cmp al, 1
028a6 (f+0027a6)  760b           jbe 0x28b3
028a8 (f+0027a8)  91             xchg cx, ax
028a9 (f+0027a9)  49             dec cx

sub_28aa:  ; 1 known caller(s)
028aa (f+0027aa)  b020           mov al, 0x20
028ac (f+0027ac)  51             push cx
028ad (f+0027ad)  e878ff         call 0x2828
028b0 (f+0027b0)  59             pop cx
028b1 (f+0027b1)  e2f7           loop 0x28aa

sub_28b3:  ; 2 known caller(s)
028b3 (f+0027b3)  5b             pop bx
028b4 (f+0027b4)  58             pop ax
028b5 (f+0027b5)  53             push bx
028b6 (f+0027b6)  e96fff         jmp 0x2828

sub_2926:  ; 3 known caller(s)
02926 (f+002826)  e8a0e1         call 0xac9
02929 (f+002829)  8bdc           mov bx, sp
0292b (f+00282b)  43             inc bx
0292c (f+00282c)  43             inc bx
0292d (f+00282d)  362a07         sub al, byte ptr ss:[bx]
02930 (f+002830)  760f           jbe 0x2941
02932 (f+002832)  8ac8           mov cl, al
02934 (f+002834)  32ed           xor ch, ch
02936 (f+002836)  53             push bx

sub_2937:  ; 1 known caller(s)
02937 (f+002837)  b020           mov al, 0x20
02939 (f+002839)  51             push cx
0293a (f+00283a)  e8ebfe         call 0x2828
0293d (f+00283d)  59             pop cx
0293e (f+00283e)  e2f7           loop 0x2937
02940 (f+002840)  5b             pop bx

sub_2941:  ; 1 known caller(s)
02941 (f+002841)  368a0f         mov cl, byte ptr ss:[bx]
02944 (f+002844)  32ed           xor ch, ch
02946 (f+002846)  43             inc bx
02947 (f+002847)  0bc9           or cx, cx
02949 (f+002849)  740d           je 0x2958

sub_294b:  ; 1 known caller(s)
0294b (f+00284b)  368a07         mov al, byte ptr ss:[bx]
0294e (f+00284e)  53             push bx
0294f (f+00284f)  51             push cx
02950 (f+002850)  e8d5fe         call 0x2828
02953 (f+002853)  59             pop cx
02954 (f+002854)  5b             pop bx
02955 (f+002855)  43             inc bx
02956 (f+002856)  e2f3           loop 0x294b

sub_2958:  ; 1 known caller(s)
02958 (f+002858)  5a             pop dx
02959 (f+002859)  8be3           mov sp, bx
0295b (f+00285b)  ffe2           jmp dx

sub_295d:  ; 11 known caller(s)
0295d (f+00285d)  5b             pop bx
0295e (f+00285e)  2e8a0f         mov cl, byte ptr cs:[bx]
02961 (f+002861)  32ed           xor ch, ch
02963 (f+002863)  43             inc bx
02964 (f+002864)  e30d           jcxz 0x2973

sub_2966:  ; 1 known caller(s)
02966 (f+002866)  2e8a07         mov al, byte ptr cs:[bx]
02969 (f+002869)  53             push bx
0296a (f+00286a)  51             push cx
0296b (f+00286b)  e8bafe         call 0x2828
0296e (f+00286e)  59             pop cx
0296f (f+00286f)  5b             pop bx
02970 (f+002870)  43             inc bx
02971 (f+002871)  e2f3           loop 0x2966

sub_2973:  ; 1 known caller(s)
02973 (f+002873)  ffe3           jmp bx

sub_2975:  ; 15 known caller(s)
02975 (f+002875)  b00d           mov al, 0xd
02977 (f+002877)  e8aefe         call 0x2828
0297a (f+00287a)  b00a           mov al, 0xa
0297c (f+00287c)  e9a9fe         jmp 0x2828

sub_2bb3:  ; 1 known caller(s)
02bb3 (f+002ab3)  c70638023f99   mov word ptr [0x238], 0x993f
02bb9 (f+002ab9)  eb06           jmp 0x2bc1
02bc1 (f+002ac1)  8f068601       pop word ptr [0x186]
02bc5 (f+002ac5)  8bcf           mov cx, di
02bc7 (f+002ac7)  5b             pop bx
02bc8 (f+002ac8)  58             pop ax
02bc9 (f+002ac9)  5a             pop dx
02bca (f+002aca)  5e             pop si
02bcb (f+002acb)  5f             pop di
02bcc (f+002acc)  07             pop es
02bcd (f+002acd)  53             push bx
02bce (f+002ace)  51             push cx
02bcf (f+002acf)  e80900         call 0x2bdb
02bd2 (f+002ad2)  5f             pop di
02bd3 (f+002ad3)  07             pop es
02bd4 (f+002ad4)  268905         mov word ptr es:[di], ax
02bd7 (f+002ad7)  ff268601       jmp word ptr [0x186]

sub_2bdb:  ; 1 known caller(s)
02bdb (f+002adb)  26837d0200     cmp word ptr es:[di + 2], 0
02be0 (f+002ae0)  744f           je 0x2c31
02be2 (f+002ae2)  26837d0201     cmp word ptr es:[di + 2], 1
02be7 (f+002ae7)  7406           je 0x2bef
02be9 (f+002ae9)  52             push dx
02bea (f+002aea)  26f76502       mul word ptr es:[di + 2]
02bee (f+002aee)  5a             pop dx

sub_2bef:  ; 1 known caller(s)
02bef (f+002aef)  91             xchg cx, ax
02bf0 (f+002af0)  8a263802       mov ah, byte ptr [0x238]
02bf4 (f+002af4)  268b1d         mov bx, word ptr es:[di]
02bf7 (f+002af7)  1e             push ds
02bf8 (f+002af8)  8ede           mov ds, si
02bfa (f+002afa)  e85add         call 0x957
02bfd (f+002afd)  1f             pop ds
02bfe (f+002afe)  7308           jae 0x2c08
02c00 (f+002b00)  a03902         mov al, byte ptr [0x239]
02c03 (f+002b03)  a28001         mov byte ptr [0x180], al
02c06 (f+002b06)  33c0           xor ax, ax

sub_2c08:  ; 1 known caller(s)
02c08 (f+002b08)  268b4d02       mov cx, word ptr es:[di + 2]
02c0c (f+002b0c)  83f901         cmp cx, 1
02c0f (f+002b0f)  741f           je 0x2c30
02c11 (f+002b11)  8bfa           mov di, dx
02c13 (f+002b13)  03f8           add di, ax
02c15 (f+002b15)  33d2           xor dx, dx
02c17 (f+002b17)  f7f1           div cx
02c19 (f+002b19)  0bd2           or dx, dx
02c1b (f+002b1b)  7413           je 0x2c30
02c1d (f+002b1d)  803e38023f     cmp byte ptr [0x238], 0x3f
02c22 (f+002b22)  750c           jne 0x2c30
02c24 (f+002b24)  50             push ax
02c25 (f+002b25)  2bca           sub cx, dx
02c27 (f+002b27)  8ec6           mov es, si
02c29 (f+002b29)  33c0           xor ax, ax
02c2b (f+002b2b)  fc             cld 
02c2c (f+002b2c)  f3aa           rep stosb byte ptr es:[di], al
02c2e (f+002b2e)  58             pop ax
02c2f (f+002b2f)  40             inc ax

sub_2c30:  ; 3 known caller(s)
02c30 (f+002b30)  c3             ret 
02c31 (f+002b31)  c606800104     mov byte ptr [0x180], 4
02c36 (f+002b36)  c3             ret 
02d39 (f+002c39)  55             push bp
02d3a (f+002c3a)  0ce8           or al, 0xe8
02d3c (f+002c3c)  19dc           sbb sp, bx
02d3e (f+002c3e)  5a             pop dx
02d3f (f+002c3f)  7230           jb 0x2d71
02d41 (f+002c41)  8bd8           mov bx, ax
02d43 (f+002c43)  b80042         mov ax, 0x4200
02d46 (f+002c46)  33c9           xor cx, cx
02d48 (f+002c48)  e80cdc         call 0x957
02d4b (f+002c4b)  7224           jb 0x2d71
02d4d (f+002c4d)  1e             push ds
02d4e (f+002c4e)  0e             push cs
02d4f (f+002c4f)  1f             pop ds
02d50 (f+002c50)  b43f           mov ah, 0x3f
02d52 (f+002c52)  b9ffff         mov cx, 0xffff
02d55 (f+002c55)  ba7c2d         mov dx, 0x2d7c
02d58 (f+002c58)  e8fcdb         call 0x957
02d5b (f+002c5b)  1f             pop ds
02d5c (f+002c5c)  b43e           mov ah, 0x3e
02d5e (f+002c5e)  e8f6db         call 0x957
02d61 (f+002c61)  8b267401       mov sp, word ptr [0x174]
02d65 (f+002c65)  e893dc         call 0x9fb
02d68 (f+002c68)  c7067e01d010   mov word ptr [0x17e], 0x10d0
02d6e (f+002c6e)  e92200         jmp 0x2d93

sub_2d71:  ; 1 known caller(s)
02d71 (f+002c71)  b201           mov dl, 1
02d73 (f+002c73)  e9a5f7         jmp 0x251b
02d7c (f+002c7c)  e857dd         call 0xad6
02d7f (f+002c7f)  0200           add al, byte ptr [bx + si]
02d81 (f+002c81)  0006c00f       add byte ptr [0xfc0], al
02d85 (f+002c85)  740d           je 0x2d94
02d87 (f+002c87)  5f             pop di
02d88 (f+002c88)  06             push es
02d89 (f+002c89)  0004           add byte ptr [si], al
02d8b (f+002c8b)  00a00200       add byte ptr [bx + si + 2], ah
02d8f (f+002c8f)  0000           add byte ptr [bx + si], al
02d91 (f+002c91)  0000           add byte ptr [bx + si], al

sub_2d93:  ; 1 known caller(s)
02d93 (f+002c93)  8bec           mov bp, sp
02d94 (f+002c94)  ec             in al, dx
02d95 (f+002c95)  e834df         call 0xccc
02d98 (f+002c98)  a0a99c         mov al, byte ptr [0x9ca9]
02d9b (f+002c9b)  2de93e         sub ax, 0x3ee9
02d9e (f+002c9e)  a8b5           test al, 0xb5
02da0 (f+002ca0)  f5             cmc 
02da1 (f+002ca1)  5f             pop di
02da2 (f+002ca2)  8e03           mov es, word ptr [bp + di]
02da4 (f+002ca4)  50             push ax
02da5 (f+002ca5)  0877fc         or byte ptr [bx - 4], dh
02da8 (f+002ca8)  6afe           push -2
02daa (f+002caa)  a7             cmpsw word ptr [si], word ptr es:[di]
02dab (f+002cab)  7074           jo 0x2e21
02dad (f+002cad)  e08a           loopne 0x2d39
02daf (f+002caf)  d0e4           shl ah, 1
02db1 (f+002cb1)  e90e60         jmp 0x8dc2

sub_2db4:  ; 1 known caller(s)
02db4 (f+002cb4)  e9969c         jmp 0xffffca4d

sub_2db7:  ; 2 known caller(s)
02db7 (f+002cb7)  e90235         jmp 0x62bc
02e21 (f+002d21)  fc             cld 
02e22 (f+002d22)  16             push ss
02e23 (f+002d23)  e88dfd         call 0x2bb3
02e26 (f+002d26)  8dbefcfd       lea di, [bp - 0x204]
02e2a (f+002d2a)  16             push ss
02e2b (f+002d2b)  57             push di
02e2c (f+002d2c)  c47e08         les di, ptr [bp + 8]
02e2f (f+002d2f)  8cc0           mov ax, es
02e31 (f+002d31)  50             push ax
02e32 (f+002d32)  c47e08         les di, ptr [bp + 8]
02e35 (f+002d35)  97             xchg di, ax
02e36 (f+002d36)  50             push ax
02e37 (f+002d37)  b80002         mov ax, 0x200
02e3a (f+002d3a)  f7aefafd       imul word ptr [bp - 0x206]
02e3e (f+002d3e)  59             pop cx
02e3f (f+002d3f)  03c1           add ax, cx
02e41 (f+002d41)  97             xchg di, ax
02e42 (f+002d42)  07             pop es
02e43 (f+002d43)  06             push es
02e44 (f+002d44)  57             push di
02e45 (f+002d45)  8b86f8fd       mov ax, word ptr [bp - 0x208]
02e49 (f+002d49)  e801e1         call 0xf4d
02e4c (f+002d4c)  e90000         jmp 0x2e4f
02e4f (f+002d4f)  8be5           mov sp, bp
02e51 (f+002d51)  5d             pop bp
02e52 (f+002d52)  c20c00         ret 0xc

sub_2e55:  ; 2 known caller(s)
02e55 (f+002d55)  55             push bp
02e56 (f+002d56)  8bec           mov bp, sp
02e58 (f+002d58)  55             push bp
02e59 (f+002d59)  e90000         jmp 0x2e5c
02e5c (f+002d5c)  4c             dec sp
02e5d (f+002d5d)  bf4a01         mov di, 0x14a
02e60 (f+002d60)  1e             push ds
02e61 (f+002d61)  e8d7f6         call 0x253b
02e64 (f+002d64)  8d7efd         lea di, [bp - 3]
02e67 (f+002d67)  16             push ss
02e68 (f+002d68)  e8f7f8         call 0x2762
02e6b (f+002d6b)  e836df         call 0xda4
02e6e (f+002d6e)  7503           jne 0x2e73
02e70 (f+002d70)  e91c00         jmp 0x2e8f
02e73 (f+002d73)  bf4a01         mov di, 0x14a
02e76 (f+002d76)  1e             push ds
02e77 (f+002d77)  e8c1f6         call 0x253b
02e7a (f+002d7a)  8d7efd         lea di, [bp - 3]
02e7d (f+002d7d)  16             push ss
02e7e (f+002d7e)  e8e1f8         call 0x2762
02e81 (f+002d81)  8a46fd         mov al, byte ptr [bp - 3]
02e84 (f+002d84)  32e4           xor ah, ah
02e86 (f+002d86)  057b00         add ax, 0x7b
02e89 (f+002d89)  894604         mov word ptr [bp + 4], ax
02e8c (f+002d8c)  e90800         jmp 0x2e97
02e8f (f+002d8f)  8a46fd         mov al, byte ptr [bp - 3]
02e92 (f+002d92)  32e4           xor ah, ah
02e94 (f+002d94)  894604         mov word ptr [bp + 4], ax

sub_2e97:  ; 1 known caller(s)
02e97 (f+002d97)  e90000         jmp 0x2e9a
02e9a (f+002d9a)  8b4604         mov ax, word ptr [bp + 4]
02e9d (f+002d9d)  8be5           mov sp, bp
02e9f (f+002d9f)  5d             pop bp
02ea0 (f+002da0)  c20200         ret 2

sub_2ef7:  ; 2 known caller(s)
02ef7 (f+002df7)  55             push bp
02ef8 (f+002df8)  8bec           mov bp, sp
02efa (f+002dfa)  55             push bp
02efb (f+002dfb)  e90000         jmp 0x2efe
02efe (f+002dfe)  8a4604         mov al, byte ptr [bp + 4]
02f01 (f+002e01)  32e4           xor ah, ah
02f03 (f+002e03)  50             push ax
02f04 (f+002e04)  e8f5e5         call 0x14fc
02f07 (f+002e07)  b84100         mov ax, 0x41
02f0a (f+002e0a)  50             push ax
02f0b (f+002e0b)  b85a00         mov ax, 0x5a
02f0e (f+002e0e)  e804e6         call 0x1515
02f11 (f+002e11)  e8cde6         call 0x15e1
02f14 (f+002e14)  7503           jne 0x2f19
02f16 (f+002e16)  e90e00         jmp 0x2f27
02f19 (f+002e19)  8a4604         mov al, byte ptr [bp + 4]
02f1c (f+002e1c)  32e4           xor ah, ah
02f1e (f+002e1e)  052000         add ax, 0x20
02f21 (f+002e21)  884606         mov byte ptr [bp + 6], al
02f24 (f+002e24)  e90800         jmp 0x2f2f
02f27 (f+002e27)  8a4604         mov al, byte ptr [bp + 4]
02f2a (f+002e2a)  32e4           xor ah, ah
02f2c (f+002e2c)  884606         mov byte ptr [bp + 6], al

sub_2f2f:  ; 1 known caller(s)
02f2f (f+002e2f)  e90000         jmp 0x2f32
02f32 (f+002e32)  8a4606         mov al, byte ptr [bp + 6]
02f35 (f+002e35)  32e4           xor ah, ah
02f37 (f+002e37)  8be5           mov sp, bp
02f39 (f+002e39)  5d             pop bp
02f3a (f+002e3a)  c20300         ret 3

sub_30f3:  ; 1 known caller(s)
030f3 (f+002ff3)  55             push bp
030f4 (f+002ff4)  8bec           mov bp, sp
030f6 (f+002ff6)  55             push bp
030f7 (f+002ff7)  e90000         jmp 0x30fa
030fa (f+002ffa)  4c             dec sp
030fb (f+002ffb)  4c             dec sp
030fc (f+002ffc)  8a4608         mov al, byte ptr [bp + 8]
030ff (f+002fff)  32e4           xor ah, ah
03101 (f+003001)  0bc0           or ax, ax
03103 (f+003003)  7503           jne 0x3108
03105 (f+003005)  e90d00         jmp 0x3115
03108 (f+003008)  b80100         mov ax, 1
0310b (f+00300b)  50             push ax
0310c (f+00300c)  b81900         mov ax, 0x19
0310f (f+00300f)  e898dc         call 0xdaa
03112 (f+003012)  e895d1         call 0x2aa

sub_3115:  ; 1 known caller(s)
03115 (f+003015)  e840f4         call 0x2558
03118 (f+003018)  8d7e2a         lea di, [bp + 0x2a]
0311b (f+00301b)  16             push ss
0311c (f+00301c)  e8ade0         call 0x11cc
0311f (f+00301f)  b80000         mov ax, 0
03122 (f+003022)  e801f8         call 0x2926
03125 (f+003025)  b82000         mov ax, 0x20
03128 (f+003028)  50             push ax
03129 (f+003029)  b80000         mov ax, 0
0312c (f+00302c)  e86ef7         call 0x289d

sub_312f:  ; 1 known caller(s)
0312f (f+00302f)  4c             dec sp
03130 (f+003030)  4c             dec sp
03131 (f+003031)  e821fd         call 0x2e55
03134 (f+003034)  8946fc         mov word ptr [bp - 4], ax
03137 (f+003037)  c47e04         les di, ptr [bp + 4]
0313a (f+00303a)  06             push es
0313b (f+00303b)  57             push di
0313c (f+00303c)  8b46fc         mov ax, word ptr [bp - 4]
0313f (f+00303f)  e82cd2         call 0x36e
03142 (f+003042)  5f             pop di
03143 (f+003043)  07             pop es
03144 (f+003044)  268805         mov byte ptr es:[di], al
03147 (f+003047)  c47e04         les di, ptr [bp + 4]
0314a (f+00304a)  268a05         mov al, byte ptr es:[di]
0314d (f+00304d)  32e4           xor ah, ah
0314f (f+00304f)  50             push ax
03150 (f+003050)  8d7e0a         lea di, [bp + 0xa]
03153 (f+003053)  16             push ss
03154 (f+003054)  b92000         mov cx, 0x20
03157 (f+003057)  e872e3         call 0x14cc
0315a (f+00305a)  e884e4         call 0x15e1
0315d (f+00305d)  7503           jne 0x3162
0315f (f+00305f)  e9cdff         jmp 0x312f
03162 (f+003062)  b80300         mov ax, 3
03165 (f+003065)  e853d2         call 0x3bb
03168 (f+003068)  c47e04         les di, ptr [bp + 4]
0316b (f+00306b)  e8eaf3         call 0x2558
0316e (f+00306e)  268a05         mov al, byte ptr es:[di]
03171 (f+003071)  32e4           xor ah, ah
03173 (f+003073)  50             push ax
03174 (f+003074)  b80000         mov ax, 0
03177 (f+003077)  e823f7         call 0x289d
0317a (f+00307a)  b80700         mov ax, 7
0317d (f+00307d)  e83bd2         call 0x3bb
03180 (f+003080)  8a4608         mov al, byte ptr [bp + 8]
03183 (f+003083)  32e4           xor ah, ah
03185 (f+003085)  0bc0           or ax, ax
03187 (f+003087)  7503           jne 0x318c
03189 (f+003089)  e90600         jmp 0x3192
0318c (f+00308c)  b8f401         mov ax, 0x1f4
0318f (f+00308f)  e881d0         call 0x213

sub_3192:  ; 2 known caller(s)
03192 (f+003092)  e90000         jmp 0x3195
03195 (f+003095)  8be5           mov sp, bp
03197 (f+003097)  5d             pop bp
03198 (f+003098)  c27700         ret 0x77

sub_3ffd:  ; 6 known caller(s)
03ffd (f+003efd)  55             push bp
03ffe (f+003efe)  8bec           mov bp, sp
04000 (f+003f00)  55             push bp
04001 (f+003f01)  e90000         jmp 0x4004
04004 (f+003f04)  e851e5         call 0x2558
04007 (f+003f07)  8d7e04         lea di, [bp + 4]
0400a (f+003f0a)  16             push ss
0400b (f+003f0b)  e8bed1         call 0x11cc
0400e (f+003f0e)  b80000         mov ax, 0
04011 (f+003f11)  e812e9         call 0x2926
04014 (f+003f14)  e85ee9         call 0x2975
04017 (f+003f17)  b80000         mov ax, 0
0401a (f+003f1a)  a28b3b         mov byte ptr [0x3b8b], al
0401d (f+003f1d)  e90000         jmp 0x4020
04020 (f+003f20)  8be5           mov sp, bp
04022 (f+003f22)  5d             pop bp
04023 (f+003f23)  c25100         ret 0x51

sub_422e:  ; 1 known caller(s)
0422e (f+00412e)  55             push bp
0422f (f+00412f)  8bec           mov bp, sp
04231 (f+004131)  55             push bp
04232 (f+004132)  e90000         jmp 0x4235
04235 (f+004135)  8a4604         mov al, byte ptr [bp + 4]
04238 (f+004138)  32e4           xor ah, ah
0423a (f+00413a)  d1e0           shl ax, 1
0423c (f+00413c)  97             xchg di, ax
0423d (f+00413d)  8a857c64       mov al, byte ptr [di + 0x647c]
04241 (f+004141)  32e4           xor ah, ah
04243 (f+004143)  50             push ax
04244 (f+004144)  a05764         mov al, byte ptr [0x6457]
04247 (f+004147)  32e4           xor ah, ah
04249 (f+004149)  59             pop cx
0424a (f+00414a)  91             xchg cx, ax
0424b (f+00414b)  3bc1           cmp ax, cx
0424d (f+00414d)  b80100         mov ax, 1
04250 (f+004150)  7401           je 0x4253
04252 (f+004152)  48             dec ax

sub_4253:  ; 1 known caller(s)
04253 (f+004153)  884606         mov byte ptr [bp + 6], al
04256 (f+004156)  e90000         jmp 0x4259
04259 (f+004159)  8a4606         mov al, byte ptr [bp + 6]
0425c (f+00415c)  32e4           xor ah, ah
0425e (f+00415e)  0bc0           or ax, ax
04260 (f+004160)  8be5           mov sp, bp
04262 (f+004162)  5d             pop bp
04263 (f+004163)  c20300         ret 3

sub_4266:  ; 4 known caller(s)
04266 (f+004166)  55             push bp
04267 (f+004167)  8bec           mov bp, sp
04269 (f+004169)  55             push bp
0426a (f+00416a)  e90000         jmp 0x426d
0426d (f+00416d)  8a4604         mov al, byte ptr [bp + 4]
04270 (f+004170)  32e4           xor ah, ah
04272 (f+004172)  3d1200         cmp ax, 0x12
04275 (f+004175)  7f03           jg 0x427a
04277 (f+004177)  e90900         jmp 0x4283
0427a (f+00417a)  b80000         mov ax, 0
0427d (f+00417d)  884606         mov byte ptr [bp + 6], al
04280 (f+004180)  e91a00         jmp 0x429d
04283 (f+004183)  8a4604         mov al, byte ptr [bp + 4]
04286 (f+004186)  32e4           xor ah, ah
04288 (f+004188)  d1e0           shl ax, 1
0428a (f+00418a)  97             xchg di, ax
0428b (f+00418b)  8a857c64       mov al, byte ptr [di + 0x647c]
0428f (f+00418f)  32e4           xor ah, ah
04291 (f+004191)  3d0000         cmp ax, 0
04294 (f+004194)  b80100         mov ax, 1
04297 (f+004197)  7401           je 0x429a
04299 (f+004199)  48             dec ax

sub_429a:  ; 1 known caller(s)
0429a (f+00419a)  884606         mov byte ptr [bp + 6], al

sub_429d:  ; 1 known caller(s)
0429d (f+00419d)  e90000         jmp 0x42a0
042a0 (f+0041a0)  8a4606         mov al, byte ptr [bp + 6]
042a3 (f+0041a3)  32e4           xor ah, ah
042a5 (f+0041a5)  0bc0           or ax, ax
042a7 (f+0041a7)  8be5           mov sp, bp
042a9 (f+0041a9)  5d             pop bp
042aa (f+0041aa)  c20300         ret 3

sub_42ad:  ; 1 known caller(s)
042ad (f+0041ad)  55             push bp
042ae (f+0041ae)  8bec           mov bp, sp
042b0 (f+0041b0)  55             push bp
042b1 (f+0041b1)  e90000         jmp 0x42b4
042b4 (f+0041b4)  4c             dec sp
042b5 (f+0041b5)  8a4604         mov al, byte ptr [bp + 4]
042b8 (f+0041b8)  32e4           xor ah, ah
042ba (f+0041ba)  50             push ax
042bb (f+0041bb)  e870ff         call 0x422e
042be (f+0041be)  50             push ax
042bf (f+0041bf)  4c             dec sp
042c0 (f+0041c0)  8a4604         mov al, byte ptr [bp + 4]
042c3 (f+0041c3)  32e4           xor ah, ah
042c5 (f+0041c5)  50             push ax
042c6 (f+0041c6)  e89dff         call 0x4266
042c9 (f+0041c9)  59             pop cx
042ca (f+0041ca)  0bc1           or ax, cx
042cc (f+0041cc)  884606         mov byte ptr [bp + 6], al
042cf (f+0041cf)  e90000         jmp 0x42d2
042d2 (f+0041d2)  8a4606         mov al, byte ptr [bp + 6]
042d5 (f+0041d5)  32e4           xor ah, ah
042d7 (f+0041d7)  0bc0           or ax, ax
042d9 (f+0041d9)  8be5           mov sp, bp
042db (f+0041db)  5d             pop bp
042dc (f+0041dc)  c20300         ret 3

sub_46b7:  ; 1 known caller(s)
046b7 (f+0045b7)  55             push bp
046b8 (f+0045b8)  8bec           mov bp, sp
046ba (f+0045ba)  55             push bp
046bb (f+0045bb)  e90000         jmp 0x46be
046be (f+0045be)  4c             dec sp
046bf (f+0045bf)  8a4604         mov al, byte ptr [bp + 4]
046c2 (f+0045c2)  32e4           xor ah, ah
046c4 (f+0045c4)  50             push ax
046c5 (f+0045c5)  e89efb         call 0x4266
046c8 (f+0045c8)  7503           jne 0x46cd
046ca (f+0045ca)  e99b00         jmp 0x4768
046cd (f+0045cd)  8a4604         mov al, byte ptr [bp + 4]
046d0 (f+0045d0)  32e4           xor ah, ah
046d2 (f+0045d2)  d1e0           shl ax, 1
046d4 (f+0045d4)  8bc8           mov cx, ax
046d6 (f+0045d6)  d1e0           shl ax, 1
046d8 (f+0045d8)  03c1           add ax, cx
046da (f+0045da)  97             xchg di, ax
046db (f+0045db)  81c7913b       add di, 0x3b91
046df (f+0045df)  1e             push ds
046e0 (f+0045e0)  57             push di
046e1 (f+0045e1)  8a4604         mov al, byte ptr [bp + 4]
046e4 (f+0045e4)  32e4           xor ah, ah
046e6 (f+0045e6)  d1e0           shl ax, 1
046e8 (f+0045e8)  97             xchg di, ax
046e9 (f+0045e9)  81c77b64       add di, 0x647b
046ed (f+0045ed)  1e             push ds
046ee (f+0045ee)  57             push di
046ef (f+0045ef)  a14f64         mov ax, word ptr [0x644f]
046f2 (f+0045f2)  2d0100         sub ax, 1
046f5 (f+0045f5)  a34f64         mov word ptr [0x644f], ax
046f8 (f+0045f8)  8a4604         mov al, byte ptr [bp + 4]
046fb (f+0045fb)  32e4           xor ah, ah
046fd (f+0045fd)  3d0200         cmp ax, 2
04700 (f+004600)  7403           je 0x4705
04702 (f+004602)  e90600         jmp 0x470b
04705 (f+004605)  b80000         mov ax, 0
04708 (f+004608)  a27d65         mov byte ptr [0x657d], al

sub_470b:  ; 1 known caller(s)
0470b (f+00460b)  8a4604         mov al, byte ptr [bp + 4]
0470e (f+00460e)  32e4           xor ah, ah
04710 (f+004610)  3d0600         cmp ax, 6
04713 (f+004613)  b80100         mov ax, 1
04716 (f+004616)  7401           je 0x4719
04718 (f+004618)  48             dec ax

sub_4719:  ; 1 known caller(s)
04719 (f+004619)  50             push ax
0471a (f+00461a)  c47ef6         les di, ptr [bp - 0xa]
0471d (f+00461d)  268a05         mov al, byte ptr es:[di]
04720 (f+004620)  32e4           xor ah, ah
04722 (f+004622)  3d0100         cmp ax, 1
04725 (f+004625)  b80100         mov ax, 1
04728 (f+004628)  7401           je 0x472b
0472a (f+00462a)  48             dec ax

sub_472b:  ; 1 known caller(s)
0472b (f+00462b)  59             pop cx
0472c (f+00462c)  23c1           and ax, cx
0472e (f+00462e)  0bc0           or ax, ax
04730 (f+004630)  7503           jne 0x4735
04732 (f+004632)  e90c00         jmp 0x4741
04735 (f+004635)  c47ef6         les di, ptr [bp - 0xa]
04738 (f+004638)  b80000         mov ax, 0
0473b (f+00463b)  268805         mov byte ptr es:[di], al
0473e (f+00463e)  e91400         jmp 0x4755
04741 (f+004641)  a14764         mov ax, word ptr [0x6447]
04744 (f+004644)  50             push ax
04745 (f+004645)  c47efa         les di, ptr [bp - 6]
04748 (f+004648)  268a4505       mov al, byte ptr es:[di + 5]
0474c (f+00464c)  32e4           xor ah, ah
0474e (f+00464e)  59             pop cx
0474f (f+00464f)  91             xchg cx, ax
04750 (f+004650)  2bc1           sub ax, cx
04752 (f+004652)  a34764         mov word ptr [0x6447], ax

sub_4755:  ; 1 known caller(s)
04755 (f+004655)  c47ef6         les di, ptr [bp - 0xa]
04758 (f+004658)  06             push es
04759 (f+004659)  57             push di
0475a (f+00465a)  a05764         mov al, byte ptr [0x6457]
0475d (f+00465d)  32e4           xor ah, ah
0475f (f+00465f)  5f             pop di
04760 (f+004660)  07             pop es
04761 (f+004661)  26884501       mov byte ptr es:[di + 1], al
04765 (f+004665)  83c408         add sp, 8
04768 (f+004668)  e90000         jmp 0x476b
0476b (f+00466b)  8be5           mov sp, bp
0476d (f+00466d)  5d             pop bp
0476e (f+00466e)  c20200         ret 2

sub_4771:  ; 1 known caller(s)
04771 (f+004671)  55             push bp
04772 (f+004672)  8bec           mov bp, sp
04774 (f+004674)  55             push bp
04775 (f+004675)  e90000         jmp 0x4778
04778 (f+004678)  8a4604         mov al, byte ptr [bp + 4]
0477b (f+00467b)  32e4           xor ah, ah
0477d (f+00467d)  d1e0           shl ax, 1
0477f (f+00467f)  97             xchg di, ax
04780 (f+004680)  81c77b64       add di, 0x647b
04784 (f+004684)  1e             push ds
04785 (f+004685)  57             push di
04786 (f+004686)  4c             dec sp
04787 (f+004687)  8a4604         mov al, byte ptr [bp + 4]
0478a (f+00468a)  32e4           xor ah, ah
0478c (f+00468c)  50             push ax
0478d (f+00468d)  e8d6fa         call 0x4266
04790 (f+004690)  7503           jne 0x4795
04792 (f+004692)  e90c00         jmp 0x47a1
04795 (f+004695)  8a4604         mov al, byte ptr [bp + 4]
04798 (f+004698)  32e4           xor ah, ah
0479a (f+00469a)  50             push ax
0479b (f+00469b)  e819ff         call 0x46b7
0479e (f+00469e)  e92300         jmp 0x47c4
047a1 (f+0046a1)  c47efa         les di, ptr [bp - 6]
047a4 (f+0046a4)  268a05         mov al, byte ptr es:[di]
047a7 (f+0046a7)  32e4           xor ah, ah
047a9 (f+0046a9)  3d0200         cmp ax, 2
047ac (f+0046ac)  7403           je 0x47b1
047ae (f+0046ae)  e91300         jmp 0x47c4
047b1 (f+0046b1)  c47efa         les di, ptr [bp - 6]
047b4 (f+0046b4)  268a4501       mov al, byte ptr es:[di + 1]
047b8 (f+0046b8)  32e4           xor ah, ah
047ba (f+0046ba)  d1e0           shl ax, 1
047bc (f+0046bc)  97             xchg di, ax
047bd (f+0046bd)  b80100         mov ax, 1
047c0 (f+0046c0)  8885bd64       mov byte ptr [di + 0x64bd], al

sub_47c4:  ; 1 known caller(s)
047c4 (f+0046c4)  c47efa         les di, ptr [bp - 6]
047c7 (f+0046c7)  b89100         mov ax, 0x91
047ca (f+0046ca)  26884501       mov byte ptr es:[di + 1], al
047ce (f+0046ce)  c47efa         les di, ptr [bp - 6]
047d1 (f+0046d1)  b80200         mov ax, 2
047d4 (f+0046d4)  268805         mov byte ptr es:[di], al
047d7 (f+0046d7)  83c404         add sp, 4
047da (f+0046da)  8a4604         mov al, byte ptr [bp + 4]
047dd (f+0046dd)  32e4           xor ah, ah
047df (f+0046df)  3d0b00         cmp ax, 0xb
047e2 (f+0046e2)  7403           je 0x47e7
047e4 (f+0046e4)  e90600         jmp 0x47ed
047e7 (f+0046e7)  b8ff7f         mov ax, 0x7fff
047ea (f+0046ea)  a34564         mov word ptr [0x6445], ax

sub_47ed:  ; 1 known caller(s)
047ed (f+0046ed)  e90000         jmp 0x47f0
047f0 (f+0046f0)  8be5           mov sp, bp
047f2 (f+0046f2)  5d             pop bp
047f3 (f+0046f3)  c20200         ret 2

sub_47f6:  ; 1 known caller(s)
047f6 (f+0046f6)  55             push bp
047f7 (f+0046f7)  8bec           mov bp, sp
047f9 (f+0046f9)  55             push bp
047fa (f+0046fa)  e90000         jmp 0x47fd
047fd (f+0046fd)  4c             dec sp
047fe (f+0046fe)  b80000         mov ax, 0
04801 (f+004701)  50             push ax
04802 (f+004702)  b81200         mov ax, 0x12
04805 (f+004705)  59             pop cx
04806 (f+004706)  91             xchg cx, ax
04807 (f+004707)  2bc8           sub cx, ax
04809 (f+004709)  7d03           jge 0x480e
0480b (f+00470b)  e92700         jmp 0x4835
0480e (f+00470e)  41             inc cx
0480f (f+00470f)  8846fd         mov byte ptr [bp - 3], al

sub_4812:  ; 1 known caller(s)
04812 (f+004712)  51             push cx
04813 (f+004713)  4c             dec sp
04814 (f+004714)  8a46fd         mov al, byte ptr [bp - 3]
04817 (f+004717)  32e4           xor ah, ah
04819 (f+004719)  50             push ax
0481a (f+00471a)  e890fa         call 0x42ad
0481d (f+00471d)  7503           jne 0x4822
0481f (f+00471f)  e90900         jmp 0x482b
04822 (f+004722)  8a46fd         mov al, byte ptr [bp - 3]
04825 (f+004725)  32e4           xor ah, ah
04827 (f+004727)  50             push ax
04828 (f+004728)  e846ff         call 0x4771

sub_482b:  ; 1 known caller(s)
0482b (f+00472b)  59             pop cx
0482c (f+00472c)  49             dec cx
0482d (f+00472d)  7406           je 0x4835
0482f (f+00472f)  fe46fd         inc byte ptr [bp - 3]
04832 (f+004732)  e9ddff         jmp 0x4812

sub_4835:  ; 1 known caller(s)
04835 (f+004735)  e90000         jmp 0x4838
04838 (f+004738)  8be5           mov sp, bp
0483a (f+00473a)  5d             pop bp
0483b (f+00473b)  c3             ret 

sub_4a56:  ; 1 known caller(s)
04a56 (f+004956)  55             push bp
04a57 (f+004957)  8bec           mov bp, sp
04a59 (f+004959)  55             push bp
04a5a (f+00495a)  e90000         jmp 0x4a5d
04a5d (f+00495d)  e885c7         call 0x11e5    ; --> inline literal [PushStr] b"There doesn't seem to be any way to do that here."
04a92 (f+004992)  b150           mov cl, 0x50
04a94 (f+004994)  e8a6c7         call 0x123d
04a97 (f+004997)  e863f5         call 0x3ffd
04a9a (f+00499a)  e90000         jmp 0x4a9d
04a9d (f+00499d)  8be5           mov sp, bp
04a9f (f+00499f)  5d             pop bp
04aa0 (f+0049a0)  c3             ret 

sub_4b57:  ; 1 known caller(s)
04b57 (f+004a57)  55             push bp
04b58 (f+004a58)  8bec           mov bp, sp
04b5a (f+004a5a)  55             push bp
04b5b (f+004a5b)  e90000         jmp 0x4b5e
04b5e (f+004a5e)  83ec04         sub sp, 4
04b61 (f+004a61)  bf973a         mov di, 0x3a97
04b64 (f+004a64)  1e             push ds
04b65 (f+004a65)  57             push di
04b66 (f+004a66)  e87cc6         call 0x11e5
04b69 (f+004a69)  00b150e8       add byte ptr [bx + di - 0x17b0], dh
04b6d (f+004a6d)  8cc6           mov si, es
04b6f (f+004a6f)  b86600         mov ax, 0x66
04b72 (f+004a72)  a28d3b         mov byte ptr [0x3b8d], al

sub_4b75:  ; 1 known caller(s)
04b75 (f+004a75)  4c             dec sp
04b76 (f+004a76)  4c             dec sp
04b77 (f+004a77)  e8dbe2         call 0x2e55
04b7a (f+004a7a)  8946fa         mov word ptr [bp - 6], ax
04b7d (f+004a7d)  bf973a         mov di, 0x3a97
04b80 (f+004a80)  1e             push ds
04b81 (f+004a81)  e848c6         call 0x11cc
04b84 (f+004a84)  e8f7c7         call 0x137e
04b87 (f+004a87)  3d0000         cmp ax, 0
04b8a (f+004a8a)  b80100         mov ax, 1
04b8d (f+004a8d)  7401           je 0x4b90
04b8f (f+004a8f)  48             dec ax

sub_4b90:  ; 1 known caller(s)
04b90 (f+004a90)  50             push ax
04b91 (f+004a91)  8b46fa         mov ax, word ptr [bp - 6]
04b94 (f+004a94)  50             push ax
04b95 (f+004a95)  e864c9         call 0x14fc
04b98 (f+004a98)  b82a00         mov ax, 0x2a
04b9b (f+004a9b)  e870c9         call 0x150e
04b9e (f+004a9e)  b82e00         mov ax, 0x2e
04ba1 (f+004aa1)  50             push ax
04ba2 (f+004aa2)  b83900         mov ax, 0x39
04ba5 (f+004aa5)  e86dc9         call 0x1515
04ba8 (f+004aa8)  e836ca         call 0x15e1
04bab (f+004aab)  59             pop cx
04bac (f+004aac)  23c1           and ax, cx
04bae (f+004aae)  0bc0           or ax, ax
04bb0 (f+004ab0)  7503           jne 0x4bb5
04bb2 (f+004ab2)  e90800         jmp 0x4bbd
04bb5 (f+004ab5)  8b46fa         mov ax, word ptr [bp - 6]
04bb8 (f+004ab8)  f7d8           neg ax
04bba (f+004aba)  8946fa         mov word ptr [bp - 6], ax

sub_4bbd:  ; 1 known caller(s)
04bbd (f+004abd)  8b46fa         mov ax, word ptr [bp - 6]
04bc0 (f+004ac0)  3d0800         cmp ax, 8
04bc3 (f+004ac3)  7403           je 0x4bc8
04bc5 (f+004ac5)  e93b00         jmp 0x4c03
04bc8 (f+004ac8)  bf973a         mov di, 0x3a97
04bcb (f+004acb)  1e             push ds
04bcc (f+004acc)  e8fdc5         call 0x11cc
04bcf (f+004acf)  e8acc7         call 0x137e
04bd2 (f+004ad2)  3d0000         cmp ax, 0
04bd5 (f+004ad5)  7f03           jg 0x4bda
04bd7 (f+004ad7)  e92600         jmp 0x4c00
04bda (f+004ada)  e894b7         call 0x371
04bdd (f+004add)  2d0100         sub ax, 1
04be0 (f+004ae0)  50             push ax
04be1 (f+004ae1)  e89bb7         call 0x37f
04be4 (f+004ae4)  e8c3c1         call 0xdaa
04be7 (f+004ae7)  e8c0b6         call 0x2aa
04bea (f+004aea)  bf973a         mov di, 0x3a97
04bed (f+004aed)  1e             push ds
04bee (f+004aee)  57             push di
04bef (f+004aef)  bf973a         mov di, 0x3a97
04bf2 (f+004af2)  1e             push ds
04bf3 (f+004af3)  e8d6c5         call 0x11cc
04bf6 (f+004af6)  e885c7         call 0x137e
04bf9 (f+004af9)  50             push ax
04bfa (f+004afa)  b80100         mov ax, 1
04bfd (f+004afd)  e827c8         call 0x1427

sub_4c00:  ; 1 known caller(s)
04c00 (f+004b00)  e9a701         jmp 0x4daa
04c03 (f+004b03)  3d0d00         cmp ax, 0xd
04c06 (f+004b06)  7403           je 0x4c0b
04c08 (f+004b08)  e90900         jmp 0x4c14
04c0b (f+004b0b)  e84ad9         call 0x2558
04c0e (f+004b0e)  e864dd         call 0x2975
04c11 (f+004b11)  e99601         jmp 0x4daa
04c14 (f+004b14)  3dce00         cmp ax, 0xce
04c17 (f+004b17)  7408           je 0x4c21
04c19 (f+004b19)  3dd2ff         cmp ax, 0xffd2
04c1c (f+004b1c)  7403           je 0x4c21
04c1e (f+004b1e)  e90900         jmp 0x4c2a

sub_4c21:  ; 1 known caller(s)
04c21 (f+004b21)  b81000         mov ax, 0x10
04c24 (f+004b24)  a28d3b         mov byte ptr [0x3b8d], al
04c27 (f+004b27)  e98001         jmp 0x4daa
04c2a (f+004b2a)  3dcb00         cmp ax, 0xcb
04c2d (f+004b2d)  7408           je 0x4c37
04c2f (f+004b2f)  3dceff         cmp ax, 0xffce
04c32 (f+004b32)  7403           je 0x4c37
04c34 (f+004b34)  e90900         jmp 0x4c40

sub_4c37:  ; 1 known caller(s)
04c37 (f+004b37)  b80100         mov ax, 1
04c3a (f+004b3a)  a28d3b         mov byte ptr [0x3b8d], al
04c3d (f+004b3d)  e96a01         jmp 0x4daa
04c40 (f+004b40)  3dca00         cmp ax, 0xca
04c43 (f+004b43)  7408           je 0x4c4d
04c45 (f+004b45)  3dcfff         cmp ax, 0xffcf
04c48 (f+004b48)  7403           je 0x4c4d
04c4a (f+004b4a)  e90900         jmp 0x4c56

sub_4c4d:  ; 1 known caller(s)
04c4d (f+004b4d)  b80900         mov ax, 9
04c50 (f+004b50)  a28d3b         mov byte ptr [0x3b8d], al
04c53 (f+004b53)  e95401         jmp 0x4daa
04c56 (f+004b56)  3dc200         cmp ax, 0xc2
04c59 (f+004b59)  7408           je 0x4c63
04c5b (f+004b5b)  3dc9ff         cmp ax, 0xffc9
04c5e (f+004b5e)  7403           je 0x4c63
04c60 (f+004b60)  e90900         jmp 0x4c6c

sub_4c63:  ; 1 known caller(s)
04c63 (f+004b63)  b80800         mov ax, 8
04c66 (f+004b66)  a28d3b         mov byte ptr [0x3b8d], al
04c69 (f+004b69)  e93e01         jmp 0x4daa
04c6c (f+004b6c)  3dcd00         cmp ax, 0xcd
04c6f (f+004b6f)  7408           je 0x4c79
04c71 (f+004b71)  3dd0ff         cmp ax, 0xffd0
04c74 (f+004b74)  7403           je 0x4c79
04c76 (f+004b76)  e90900         jmp 0x4c82

sub_4c79:  ; 1 known caller(s)
04c79 (f+004b79)  b80f00         mov ax, 0xf
04c7c (f+004b7c)  a28d3b         mov byte ptr [0x3b8d], al
04c7f (f+004b7f)  e92801         jmp 0x4daa
04c82 (f+004b82)  3dc600         cmp ax, 0xc6
04c85 (f+004b85)  7408           je 0x4c8f
04c87 (f+004b87)  3dccff         cmp ax, 0xffcc
04c8a (f+004b8a)  7403           je 0x4c8f
04c8c (f+004b8c)  e90900         jmp 0x4c98

sub_4c8f:  ; 1 known caller(s)
04c8f (f+004b8f)  b80300         mov ax, 3
04c92 (f+004b92)  a28d3b         mov byte ptr [0x3b8d], al
04c95 (f+004b95)  e91201         jmp 0x4daa
04c98 (f+004b98)  3d2b00         cmp ax, 0x2b
04c9b (f+004b9b)  7403           je 0x4ca0
04c9d (f+004b9d)  e90900         jmp 0x4ca9
04ca0 (f+004ba0)  b80500         mov ax, 5
04ca3 (f+004ba3)  a28d3b         mov byte ptr [0x3b8d], al
04ca6 (f+004ba6)  e90101         jmp 0x4daa
04ca9 (f+004ba9)  3dc800         cmp ax, 0xc8
04cac (f+004bac)  7408           je 0x4cb6
04cae (f+004bae)  3dcaff         cmp ax, 0xffca
04cb1 (f+004bb1)  7403           je 0x4cb6
04cb3 (f+004bb3)  e90900         jmp 0x4cbf

sub_4cb6:  ; 1 known caller(s)
04cb6 (f+004bb6)  b80200         mov ax, 2
04cb9 (f+004bb9)  a28d3b         mov byte ptr [0x3b8d], al
04cbc (f+004bbc)  e9eb00         jmp 0x4daa
04cbf (f+004bbf)  3d2d00         cmp ax, 0x2d
04cc2 (f+004bc2)  7408           je 0x4ccc
04cc4 (f+004bc4)  3dd6ff         cmp ax, 0xffd6
04cc7 (f+004bc7)  7403           je 0x4ccc
04cc9 (f+004bc9)  e90900         jmp 0x4cd5

sub_4ccc:  ; 1 known caller(s)
04ccc (f+004bcc)  b80400         mov ax, 4
04ccf (f+004bcf)  a28d3b         mov byte ptr [0x3b8d], al
04cd2 (f+004bd2)  e9d500         jmp 0x4daa
04cd5 (f+004bd5)  3dcc00         cmp ax, 0xcc
04cd8 (f+004bd8)  7408           je 0x4ce2
04cda (f+004bda)  3dcdff         cmp ax, 0xffcd
04cdd (f+004bdd)  7403           je 0x4ce2
04cdf (f+004bdf)  e90900         jmp 0x4ceb

sub_4ce2:  ; 1 known caller(s)
04ce2 (f+004be2)  b80700         mov ax, 7
04ce5 (f+004be5)  a28d3b         mov byte ptr [0x3b8d], al
04ce8 (f+004be8)  e9bf00         jmp 0x4daa
04ceb (f+004beb)  3dc400         cmp ax, 0xc4
04cee (f+004bee)  7408           je 0x4cf8
04cf0 (f+004bf0)  3dc7ff         cmp ax, 0xffc7
04cf3 (f+004bf3)  7403           je 0x4cf8
04cf5 (f+004bf5)  e90900         jmp 0x4d01

sub_4cf8:  ; 1 known caller(s)
04cf8 (f+004bf8)  b80600         mov ax, 6
04cfb (f+004bfb)  a28d3b         mov byte ptr [0x3b8d], al
04cfe (f+004bfe)  e9a900         jmp 0x4daa
04d01 (f+004c01)  3dc300         cmp ax, 0xc3
04d04 (f+004c04)  7408           je 0x4d0e
04d06 (f+004c06)  3dc8ff         cmp ax, 0xffc8
04d09 (f+004c09)  7403           je 0x4d0e
04d0b (f+004c0b)  e90900         jmp 0x4d17

sub_4d0e:  ; 1 known caller(s)
04d0e (f+004c0e)  b80000         mov ax, 0
04d11 (f+004c11)  a28d3b         mov byte ptr [0x3b8d], al
04d14 (f+004c14)  e99300         jmp 0x4daa
04d17 (f+004c17)  bf973a         mov di, 0x3a97
04d1a (f+004c1a)  1e             push ds
04d1b (f+004c1b)  e8aec4         call 0x11cc
04d1e (f+004c1e)  e85dc6         call 0x137e
04d21 (f+004c21)  3d0000         cmp ax, 0
04d24 (f+004c24)  b80100         mov ax, 1
04d27 (f+004c27)  7f01           jg 0x4d2a
04d29 (f+004c29)  48             dec ax

sub_4d2a:  ; 1 known caller(s)
04d2a (f+004c2a)  50             push ax
04d2b (f+004c2b)  8b46fa         mov ax, word ptr [bp - 6]
04d2e (f+004c2e)  3d2000         cmp ax, 0x20
04d31 (f+004c31)  b80100         mov ax, 1
04d34 (f+004c34)  7501           jne 0x4d37
04d36 (f+004c36)  48             dec ax

sub_4d37:  ; 1 known caller(s)
04d37 (f+004c37)  59             pop cx
04d38 (f+004c38)  0bc1           or ax, cx
04d3a (f+004c3a)  50             push ax
04d3b (f+004c3b)  8b46fa         mov ax, word ptr [bp - 6]
04d3e (f+004c3e)  50             push ax
04d3f (f+004c3f)  e8bac7         call 0x14fc
04d42 (f+004c42)  b82000         mov ax, 0x20
04d45 (f+004c45)  50             push ax
04d46 (f+004c46)  b87e00         mov ax, 0x7e
04d49 (f+004c49)  e8c9c7         call 0x1515
04d4c (f+004c4c)  e892c8         call 0x15e1
04d4f (f+004c4f)  59             pop cx
04d50 (f+004c50)  23c1           and ax, cx
04d52 (f+004c52)  50             push ax
04d53 (f+004c53)  bf973a         mov di, 0x3a97
04d56 (f+004c56)  1e             push ds
04d57 (f+004c57)  e872c4         call 0x11cc
04d5a (f+004c5a)  e821c6         call 0x137e
04d5d (f+004c5d)  3d4900         cmp ax, 0x49
04d60 (f+004c60)  b80100         mov ax, 1
04d63 (f+004c63)  7c01           jl 0x4d66
04d65 (f+004c65)  48             dec ax

sub_4d66:  ; 1 known caller(s)
04d66 (f+004c66)  59             pop cx
04d67 (f+004c67)  23c1           and ax, cx
04d69 (f+004c69)  0bc0           or ax, ax
04d6b (f+004c6b)  7503           jne 0x4d70
04d6d (f+004c6d)  e93a00         jmp 0x4daa
04d70 (f+004c70)  b80300         mov ax, 3
04d73 (f+004c73)  e845b6         call 0x3bb
04d76 (f+004c76)  e8dfd7         call 0x2558
04d79 (f+004c79)  8b46fa         mov ax, word ptr [bp - 6]
04d7c (f+004c7c)  50             push ax
04d7d (f+004c7d)  b80000         mov ax, 0
04d80 (f+004c80)  e81adb         call 0x289d
04d83 (f+004c83)  b80700         mov ax, 7
04d86 (f+004c86)  e832b6         call 0x3bb
04d89 (f+004c89)  bf973a         mov di, 0x3a97
04d8c (f+004c8c)  1e             push ds
04d8d (f+004c8d)  57             push di
04d8e (f+004c8e)  bf973a         mov di, 0x3a97
04d91 (f+004c91)  1e             push ds
04d92 (f+004c92)  e837c4         call 0x11cc
04d95 (f+004c95)  4c             dec sp
04d96 (f+004c96)  8b46fa         mov ax, word ptr [bp - 6]
04d99 (f+004c99)  50             push ax
04d9a (f+004c9a)  e85ae1         call 0x2ef7
04d9d (f+004c9d)  8ae0           mov ah, al
04d9f (f+004c9f)  b001           mov al, 1
04da1 (f+004ca1)  50             push ax
04da2 (f+004ca2)  e858c5         call 0x12fd
04da5 (f+004ca5)  b150           mov cl, 0x50
04da7 (f+004ca7)  e851c4         call 0x11fb

sub_4daa:  ; 14 known caller(s)
04daa (f+004caa)  bf973a         mov di, 0x3a97
04dad (f+004cad)  1e             push ds
04dae (f+004cae)  e81bc4         call 0x11cc
04db1 (f+004cb1)  e8cac5         call 0x137e
04db4 (f+004cb4)  3d0000         cmp ax, 0
04db7 (f+004cb7)  7f03           jg 0x4dbc
04db9 (f+004cb9)  e90600         jmp 0x4dc2
04dbc (f+004cbc)  b86600         mov ax, 0x66
04dbf (f+004cbf)  a28d3b         mov byte ptr [0x3b8d], al

sub_4dc2:  ; 1 known caller(s)
04dc2 (f+004cc2)  8b46fa         mov ax, word ptr [bp - 6]
04dc5 (f+004cc5)  3d0d00         cmp ax, 0xd
04dc8 (f+004cc8)  b80100         mov ax, 1
04dcb (f+004ccb)  7401           je 0x4dce
04dcd (f+004ccd)  48             dec ax

sub_4dce:  ; 1 known caller(s)
04dce (f+004cce)  50             push ax
04dcf (f+004ccf)  bf973a         mov di, 0x3a97
04dd2 (f+004cd2)  1e             push ds
04dd3 (f+004cd3)  e8f6c3         call 0x11cc
04dd6 (f+004cd6)  e8a5c5         call 0x137e
04dd9 (f+004cd9)  3d0000         cmp ax, 0
04ddc (f+004cdc)  b80100         mov ax, 1
04ddf (f+004cdf)  7f01           jg 0x4de2
04de1 (f+004ce1)  48             dec ax

sub_4de2:  ; 1 known caller(s)
04de2 (f+004ce2)  59             pop cx
04de3 (f+004ce3)  23c1           and ax, cx
04de5 (f+004ce5)  50             push ax
04de6 (f+004ce6)  a08d3b         mov al, byte ptr [0x3b8d]
04de9 (f+004ce9)  32e4           xor ah, ah
04deb (f+004ceb)  3d6600         cmp ax, 0x66
04dee (f+004cee)  b80100         mov ax, 1
04df1 (f+004cf1)  7501           jne 0x4df4
04df3 (f+004cf3)  48             dec ax

sub_4df4:  ; 1 known caller(s)
04df4 (f+004cf4)  59             pop cx
04df5 (f+004cf5)  0bc1           or ax, cx
04df7 (f+004cf7)  0bc0           or ax, ax
04df9 (f+004cf9)  7503           jne 0x4dfe
04dfb (f+004cfb)  e977fd         jmp 0x4b75
04dfe (f+004cfe)  bf973a         mov di, 0x3a97
04e01 (f+004d01)  1e             push ds
04e02 (f+004d02)  e8c7c3         call 0x11cc
04e05 (f+004d05)  e876c5         call 0x137e
04e08 (f+004d08)  3d0000         cmp ax, 0
04e0b (f+004d0b)  7f03           jg 0x4e10
04e0d (f+004d0d)  e99c00         jmp 0x4eac
04e10 (f+004d10)  b80200         mov ax, 2
04e13 (f+004d13)  50             push ax
04e14 (f+004d14)  bf973a         mov di, 0x3a97
04e17 (f+004d17)  1e             push ds
04e18 (f+004d18)  e8b1c3         call 0x11cc
04e1b (f+004d1b)  e860c5         call 0x137e
04e1e (f+004d1e)  59             pop cx
04e1f (f+004d1f)  91             xchg cx, ax
04e20 (f+004d20)  2bc8           sub cx, ax
04e22 (f+004d22)  7d03           jge 0x4e27
04e24 (f+004d24)  e95000         jmp 0x4e77
04e27 (f+004d27)  41             inc cx
04e28 (f+004d28)  8946fc         mov word ptr [bp - 4], ax

sub_4e2b:  ; 1 known caller(s)
04e2b (f+004d2b)  51             push cx
04e2c (f+004d2c)  8b46fc         mov ax, word ptr [bp - 4]
04e2f (f+004d2f)  97             xchg di, ax
04e30 (f+004d30)  8a85973a       mov al, byte ptr [di + 0x3a97]
04e34 (f+004d34)  32e4           xor ah, ah
04e36 (f+004d36)  50             push ax
04e37 (f+004d37)  e8c2c6         call 0x14fc
04e3a (f+004d3a)  b83000         mov ax, 0x30
04e3d (f+004d3d)  50             push ax
04e3e (f+004d3e)  b83900         mov ax, 0x39
04e41 (f+004d41)  e8d1c6         call 0x1515
04e44 (f+004d44)  b84100         mov ax, 0x41
04e47 (f+004d47)  50             push ax
04e48 (f+004d48)  b85a00         mov ax, 0x5a
04e4b (f+004d4b)  e8c7c6         call 0x1515
04e4e (f+004d4e)  b86100         mov ax, 0x61
04e51 (f+004d51)  50             push ax
04e52 (f+004d52)  b87a00         mov ax, 0x7a
04e55 (f+004d55)  e8bdc6         call 0x1515
04e58 (f+004d58)  e886c7         call 0x15e1
04e5b (f+004d5b)  3401           xor al, 1
04e5d (f+004d5d)  7503           jne 0x4e62
04e5f (f+004d5f)  e90b00         jmp 0x4e6d
04e62 (f+004d62)  8b46fc         mov ax, word ptr [bp - 4]
04e65 (f+004d65)  97             xchg di, ax
04e66 (f+004d66)  b82000         mov ax, 0x20
04e69 (f+004d69)  8885973a       mov byte ptr [di + 0x3a97], al

sub_4e6d:  ; 1 known caller(s)
04e6d (f+004d6d)  59             pop cx
04e6e (f+004d6e)  49             dec cx
04e6f (f+004d6f)  7406           je 0x4e77
04e71 (f+004d71)  ff46fc         inc word ptr [bp - 4]
04e74 (f+004d74)  e9b4ff         jmp 0x4e2b

sub_4e77:  ; 2 known caller(s)
04e77 (f+004d77)  bf973a         mov di, 0x3a97
04e7a (f+004d7a)  1e             push ds
04e7b (f+004d7b)  e84ec3         call 0x11cc
04e7e (f+004d7e)  e8fdc4         call 0x137e
04e81 (f+004d81)  97             xchg di, ax
04e82 (f+004d82)  8a85973a       mov al, byte ptr [di + 0x3a97]
04e86 (f+004d86)  32e4           xor ah, ah
04e88 (f+004d88)  3d2000         cmp ax, 0x20
04e8b (f+004d8b)  7403           je 0x4e90
04e8d (f+004d8d)  e91900         jmp 0x4ea9
04e90 (f+004d90)  bf973a         mov di, 0x3a97
04e93 (f+004d93)  1e             push ds
04e94 (f+004d94)  57             push di
04e95 (f+004d95)  bf973a         mov di, 0x3a97
04e98 (f+004d98)  1e             push ds
04e99 (f+004d99)  e830c3         call 0x11cc
04e9c (f+004d9c)  e8dfc4         call 0x137e
04e9f (f+004d9f)  50             push ax
04ea0 (f+004da0)  b80100         mov ax, 1
04ea3 (f+004da3)  e881c5         call 0x1427
04ea6 (f+004da6)  e9ceff         jmp 0x4e77
04ea9 (f+004da9)  e9e500         jmp 0x4f91
04eac (f+004dac)  a08d3b         mov al, byte ptr [0x3b8d]
04eaf (f+004daf)  32e4           xor ah, ah
04eb1 (f+004db1)  3d6600         cmp ax, 0x66
04eb4 (f+004db4)  7503           jne 0x4eb9
04eb6 (f+004db6)  e9d800         jmp 0x4f91
04eb9 (f+004db9)  a08d3b         mov al, byte ptr [0x3b8d]
04ebc (f+004dbc)  32e4           xor ah, ah
04ebe (f+004dbe)  3d0f00         cmp ax, 0xf
04ec1 (f+004dc1)  7403           je 0x4ec6
04ec3 (f+004dc3)  e91a00         jmp 0x4ee0
04ec6 (f+004dc6)  bf393b         mov di, 0x3b39
04ec9 (f+004dc9)  1e             push ds
04eca (f+004dca)  57             push di
04ecb (f+004dcb)  e817c3         call 0x11e5    ; --> inline literal [PushStr] b'inventory'
04ed8 (f+004dd8)  b150           mov cl, 0x50
04eda (f+004dda)  e81ec3         call 0x11fb
04edd (f+004ddd)  e92000         jmp 0x4f00
04ee0 (f+004de0)  bf393b         mov di, 0x3b39
04ee3 (f+004de3)  1e             push ds
04ee4 (f+004de4)  57             push di
04ee5 (f+004de5)  a08d3b         mov al, byte ptr [0x3b8d]
04ee8 (f+004de8)  32e4           xor ah, ah
04eea (f+004dea)  d1e0           shl ax, 1
04eec (f+004dec)  8bc8           mov cx, ax
04eee (f+004dee)  d1e0           shl ax, 1
04ef0 (f+004df0)  03c1           add ax, cx
04ef2 (f+004df2)  97             xchg di, ax
04ef3 (f+004df3)  81c7f661       add di, 0x61f6
04ef7 (f+004df7)  1e             push ds
04ef8 (f+004df8)  e8d1c2         call 0x11cc
04efb (f+004dfb)  b150           mov cl, 0x50
04efd (f+004dfd)  e8fbc2         call 0x11fb

sub_4f00:  ; 1 known caller(s)
04f00 (f+004e00)  b80300         mov ax, 3
04f03 (f+004e03)  e8b5b4         call 0x3bb
04f06 (f+004e06)  b84000         mov ax, 0x40
04f09 (f+004e09)  50             push ax
04f0a (f+004e0a)  b81700         mov ax, 0x17
04f0d (f+004e0d)  97             xchg di, ax
04f0e (f+004e0e)  07             pop es
04f0f (f+004e0f)  268a05         mov al, byte ptr es:[di]
04f12 (f+004e12)  32e4           xor ah, ah
04f14 (f+004e14)  254000         and ax, 0x40
04f17 (f+004e17)  0bc0           or ax, ax
04f19 (f+004e19)  7503           jne 0x4f1e
04f1b (f+004e1b)  e94600         jmp 0x4f64
04f1e (f+004e1e)  b80100         mov ax, 1
04f21 (f+004e21)  50             push ax
04f22 (f+004e22)  bf393b         mov di, 0x3b39
04f25 (f+004e25)  1e             push ds
04f26 (f+004e26)  e8a3c2         call 0x11cc
04f29 (f+004e29)  e852c4         call 0x137e
04f2c (f+004e2c)  59             pop cx
04f2d (f+004e2d)  91             xchg cx, ax
04f2e (f+004e2e)  2bc8           sub cx, ax
04f30 (f+004e30)  7d03           jge 0x4f35
04f32 (f+004e32)  e92600         jmp 0x4f5b
04f35 (f+004e35)  41             inc cx
04f36 (f+004e36)  8946fc         mov word ptr [bp - 4], ax

sub_4f39:  ; 1 known caller(s)
04f39 (f+004e39)  51             push cx
04f3a (f+004e3a)  e81bd6         call 0x2558
04f3d (f+004e3d)  8b46fc         mov ax, word ptr [bp - 4]
04f40 (f+004e40)  97             xchg di, ax
04f41 (f+004e41)  8a85393b       mov al, byte ptr [di + 0x3b39]
04f45 (f+004e45)  32e4           xor ah, ah
04f47 (f+004e47)  e824b4         call 0x36e
04f4a (f+004e4a)  50             push ax
04f4b (f+004e4b)  b80000         mov ax, 0
04f4e (f+004e4e)  e84cd9         call 0x289d
04f51 (f+004e51)  59             pop cx
04f52 (f+004e52)  49             dec cx
04f53 (f+004e53)  7406           je 0x4f5b
04f55 (f+004e55)  ff46fc         inc word ptr [bp - 4]
04f58 (f+004e58)  e9deff         jmp 0x4f39

sub_4f5b:  ; 1 known caller(s)
04f5b (f+004e5b)  e8fad5         call 0x2558
04f5e (f+004e5e)  e814da         call 0x2975
04f61 (f+004e61)  e91300         jmp 0x4f77
04f64 (f+004e64)  e8f1d5         call 0x2558
04f67 (f+004e67)  bf393b         mov di, 0x3b39
04f6a (f+004e6a)  1e             push ds
04f6b (f+004e6b)  e85ec2         call 0x11cc
04f6e (f+004e6e)  b80000         mov ax, 0
04f71 (f+004e71)  e8b2d9         call 0x2926
04f74 (f+004e74)  e8fed9         call 0x2975

sub_4f77:  ; 1 known caller(s)
04f77 (f+004e77)  b80700         mov ax, 7
04f7a (f+004e7a)  e83eb4         call 0x3bb
04f7d (f+004e7d)  b82200         mov ax, 0x22
04f80 (f+004e80)  a28a3b         mov byte ptr [0x3b8a], al
04f83 (f+004e83)  bf393b         mov di, 0x3b39
04f86 (f+004e86)  1e             push ds
04f87 (f+004e87)  57             push di
04f88 (f+004e88)  e85ac2         call 0x11e5
04f8b (f+004e8b)  00b150e8       add byte ptr [bx + di - 0x17b0], dh
04f8f (f+004e8f)  6ac2           push -0x3e

sub_4f91:  ; 1 known caller(s)
04f91 (f+004e91)  e90000         jmp 0x4f94
04f94 (f+004e94)  8be5           mov sp, bp
04f96 (f+004e96)  5d             pop bp
04f97 (f+004e97)  c3             ret 

sub_6192:  ; 1 known caller(s)
06192 (f+006092)  55             push bp
06193 (f+006093)  8bec           mov bp, sp
06195 (f+006095)  55             push bp
06196 (f+006096)  e90000         jmp 0x6199
06199 (f+006099)  e849b0         call 0x11e5    ; --> inline literal [PushStr] b'The river is too treacherous here for that.'
061c8 (f+0060c8)  b150           mov cl, 0x50
061ca (f+0060ca)  e870b0         call 0x123d
061cd (f+0060cd)  e82dde         call 0x3ffd
061d0 (f+0060d0)  e90000         jmp 0x61d3
061d3 (f+0060d3)  8be5           mov sp, bp
061d5 (f+0060d5)  5d             pop bp
061d6 (f+0060d6)  c3             ret 

sub_6238:  ; 1 known caller(s)
06238 (f+006138)  55             push bp
06239 (f+006139)  8bec           mov bp, sp
0623b (f+00613b)  55             push bp
0623c (f+00613c)  e90000         jmp 0x623f
0623f (f+00613f)  bf393b         mov di, 0x3b39
06242 (f+006142)  1e             push ds
06243 (f+006143)  e886af         call 0x11cc
06246 (f+006146)  e835b1         call 0x137e
06249 (f+006149)  3d0000         cmp ax, 0
0624c (f+00614c)  7f03           jg 0x6251
0624e (f+00614e)  e94400         jmp 0x6295
06251 (f+006151)  bf973a         mov di, 0x3a97
06254 (f+006154)  1e             push ds
06255 (f+006155)  57             push di
06256 (f+006156)  bf393b         mov di, 0x3b39
06259 (f+006159)  1e             push ds
0625a (f+00615a)  e86faf         call 0x11cc
0625d (f+00615d)  b150           mov cl, 0x50
0625f (f+00615f)  e899af         call 0x11fb
06262 (f+006162)  b86600         mov ax, 0x66
06265 (f+006165)  a28d3b         mov byte ptr [0x3b8d], al
06268 (f+006168)  bf973a         mov di, 0x3a97
0626b (f+00616b)  1e             push ds
0626c (f+00616c)  e85daf         call 0x11cc
0626f (f+00616f)  e873af         call 0x11e5    ; --> inline literal [PushStr] b'through'
0627a (f+00617a)  e8fdaf         call 0x127a
0627d (f+00617d)  7503           jne 0x6282
0627f (f+00617f)  e91000         jmp 0x6292
06282 (f+006182)  bf973a         mov di, 0x3a97
06285 (f+006185)  1e             push ds
06286 (f+006186)  57             push di
06287 (f+006187)  e85baf         call 0x11e5    ; --> inline literal [PushStr] b'in'
0628d (f+00618d)  b150           mov cl, 0x50
0628f (f+00618f)  e869af         call 0x11fb

sub_6292:  ; 1 known caller(s)
06292 (f+006192)  e91d00         jmp 0x62b2
06295 (f+006195)  e8c0c2         call 0x2558
06298 (f+006198)  e8c2c6         call 0x295d    ; --> inline literal [Write] b'In what direction? '
062af (f+0061af)  e8a5e8         call 0x4b57

sub_62b2:  ; 1 known caller(s)
062b2 (f+0061b2)  e8ffca         call 0x2db4
062b5 (f+0061b5)  e90000         jmp 0x62b8
062b8 (f+0061b8)  8be5           mov sp, bp
062ba (f+0061ba)  5d             pop bp
062bb (f+0061bb)  c3             ret 
062bc (f+0061bc)  55             push bp
062bd (f+0061bd)  8bec           mov bp, sp
062bf (f+0061bf)  55             push bp
062c0 (f+0061c0)  e90000         jmp 0x62c3
062c3 (f+0061c3)  a05764         mov al, byte ptr [0x6457]
062c6 (f+0061c6)  32e4           xor ah, ah
062c8 (f+0061c8)  3d0b00         cmp ax, 0xb
062cb (f+0061cb)  7403           je 0x62d0
062cd (f+0061cd)  e92900         jmp 0x62f9
062d0 (f+0061d0)  b80600         mov ax, 6
062d3 (f+0061d3)  a25764         mov byte ptr [0x6457], al
062d6 (f+0061d6)  b86600         mov ax, 0x66
062d9 (f+0061d9)  a2953a         mov byte ptr [0x3a95], al
062dc (f+0061dc)  b89100         mov ax, 0x91
062df (f+0061df)  a25664         mov byte ptr [0x6456], al
062e2 (f+0061e2)  e873c2         call 0x2558
062e5 (f+0061e5)  e875c6         call 0x295d    ; --> inline literal [Write] b'Splash!'
062f0 (f+0061f0)  e882c6         call 0x2975
062f3 (f+0061f3)  e800e5         call 0x47f6
062f6 (f+0061f6)  e99b00         jmp 0x6394
062f9 (f+0061f9)  3d3300         cmp ax, 0x33
062fc (f+0061fc)  7408           je 0x6306
062fe (f+0061fe)  3d5000         cmp ax, 0x50
06301 (f+006201)  7403           je 0x6306
06303 (f+006203)  e92e00         jmp 0x6334

sub_6306:  ; 1 known caller(s)
06306 (f+006206)  e8dcae         call 0x11e5    ; --> inline literal [PushStr] b'The room above is too far away.'
06329 (f+006229)  b150           mov cl, 0x50
0632b (f+00622b)  e80faf         call 0x123d
0632e (f+00622e)  e8ccdc         call 0x3ffd
06331 (f+006231)  e96000         jmp 0x6394
06334 (f+006234)  3d0c00         cmp ax, 0xc
06337 (f+006237)  743f           je 0x6378
06339 (f+006239)  3d3600         cmp ax, 0x36
0633c (f+00623c)  743a           je 0x6378
0633e (f+00623e)  3d4900         cmp ax, 0x49
06341 (f+006241)  7435           je 0x6378
06343 (f+006243)  3d4a00         cmp ax, 0x4a
06346 (f+006246)  7430           je 0x6378
06348 (f+006248)  3d4f00         cmp ax, 0x4f
0634b (f+00624b)  742b           je 0x6378
0634d (f+00624d)  3d5700         cmp ax, 0x57
06350 (f+006250)  7426           je 0x6378
06352 (f+006252)  3d5e00         cmp ax, 0x5e
06355 (f+006255)  7421           je 0x6378
06357 (f+006257)  3d6400         cmp ax, 0x64
0635a (f+00625a)  741c           je 0x6378
0635c (f+00625c)  3d6600         cmp ax, 0x66
0635f (f+00625f)  7417           je 0x6378
06361 (f+006261)  3d6c00         cmp ax, 0x6c
06364 (f+006264)  7412           je 0x6378
06366 (f+006266)  3d8b00         cmp ax, 0x8b
06369 (f+006269)  740d           je 0x6378
0636b (f+00626b)  3d8f00         cmp ax, 0x8f
0636e (f+00626e)  7408           je 0x6378
06370 (f+006270)  3d9000         cmp ax, 0x90
06373 (f+006273)  7403           je 0x6378
06375 (f+006275)  e91900         jmp 0x6391

sub_6378:  ; 12 known caller(s)
06378 (f+006278)  e8ddc1         call 0x2558
0637b (f+00627b)  e8dfc5         call 0x295d    ; --> inline literal [Write] b'Splat!'
06385 (f+006285)  e8edc5         call 0x2975
06388 (f+006288)  b89300         mov ax, 0x93
0638b (f+00628b)  a25764         mov byte ptr [0x6457], al
0638e (f+00628e)  e90300         jmp 0x6394
06391 (f+006291)  e8a4fe         call 0x6238

sub_6394:  ; 2 known caller(s)
06394 (f+006294)  e90000         jmp 0x6397
06397 (f+006297)  8be5           mov sp, bp
06399 (f+006299)  5d             pop bp
0639a (f+00629a)  c3             ret 

sub_8b3f:  ; 1 known caller(s)
08b3f (f+008a3f)  55             push bp
08b40 (f+008a40)  8bec           mov bp, sp
08b42 (f+008a42)  55             push bp
08b43 (f+008a43)  e90000         jmp 0x8b46
08b46 (f+008a46)  e89c86         call 0x11e5    ; --> inline literal [PushStr] b"You can't go in or out from here.  Please use compass directions."
08b8b (f+008a8b)  b150           mov cl, 0x50
08b8d (f+008a8d)  e8ad86         call 0x123d
08b90 (f+008a90)  e86ab4         call 0x3ffd
08b93 (f+008a93)  e90000         jmp 0x8b96
08b96 (f+008a96)  8be5           mov sp, bp
08b98 (f+008a98)  5d             pop bp
08b99 (f+008a99)  c3             ret 

sub_8b9a:  ; 1 known caller(s)
08b9a (f+008a9a)  55             push bp
08b9b (f+008a9b)  8bec           mov bp, sp
08b9d (f+008a9d)  55             push bp
08b9e (f+008a9e)  e90000         jmp 0x8ba1
08ba1 (f+008aa1)  a05764         mov al, byte ptr [0x6457]
08ba4 (f+008aa4)  32e4           xor ah, ah
08ba6 (f+008aa6)  3d0600         cmp ax, 6
08ba9 (f+008aa9)  7403           je 0x8bae
08bab (f+008aab)  e93400         jmp 0x8be2
08bae (f+008aae)  e8a799         call 0x2558
08bb1 (f+008ab1)  e8a99d         call 0x295d    ; --> inline literal [Write] b'You swim about lazily, getting nowhere.'
08bdc (f+008adc)  e8969d         call 0x2975
08bdf (f+008adf)  e9d901         jmp 0x8dbb
08be2 (f+008ae2)  a05764         mov al, byte ptr [0x6457]
08be5 (f+008ae5)  32e4           xor ah, ah
08be7 (f+008ae7)  3d0b00         cmp ax, 0xb
08bea (f+008aea)  7403           je 0x8bef
08bec (f+008aec)  e90600         jmp 0x8bf5
08bef (f+008aef)  e8c5a1         call 0x2db7
08bf2 (f+008af2)  e9c601         jmp 0x8dbb
08bf5 (f+008af5)  a05764         mov al, byte ptr [0x6457]
08bf8 (f+008af8)  32e4           xor ah, ah
08bfa (f+008afa)  3d3400         cmp ax, 0x34
08bfd (f+008afd)  7403           je 0x8c02
08bff (f+008aff)  e92f00         jmp 0x8c31
08c02 (f+008b02)  e8e085         call 0x11e5    ; --> inline literal [PushStr] b'Better get an asbestos swimsuit!'
08c26 (f+008b26)  b150           mov cl, 0x50
08c28 (f+008b28)  e81286         call 0x123d
08c2b (f+008b2b)  e8cfb3         call 0x3ffd
08c2e (f+008b2e)  e98a01         jmp 0x8dbb
08c31 (f+008b31)  a05764         mov al, byte ptr [0x6457]
08c34 (f+008b34)  32e4           xor ah, ah
08c36 (f+008b36)  50             push ax
08c37 (f+008b37)  e8c288         call 0x14fc
08c3a (f+008b3a)  b84200         mov ax, 0x42
08c3d (f+008b3d)  e8ce88         call 0x150e
08c40 (f+008b40)  b84500         mov ax, 0x45
08c43 (f+008b43)  e8c888         call 0x150e
08c46 (f+008b46)  e89889         call 0x15e1
08c49 (f+008b49)  7503           jne 0x8c4e
08c4b (f+008b4b)  e90600         jmp 0x8c54
08c4e (f+008b4e)  e841d5         call 0x6192
08c51 (f+008b51)  e96701         jmp 0x8dbb
08c54 (f+008b54)  a05764         mov al, byte ptr [0x6457]
08c57 (f+008b57)  32e4           xor ah, ah
08c59 (f+008b59)  50             push ax
08c5a (f+008b5a)  e89f88         call 0x14fc
08c5d (f+008b5d)  b80d00         mov ax, 0xd
08c60 (f+008b60)  e8ab88         call 0x150e
08c63 (f+008b63)  b83d00         mov ax, 0x3d
08c66 (f+008b66)  e8a588         call 0x150e
08c69 (f+008b69)  b84100         mov ax, 0x41
08c6c (f+008b6c)  e89f88         call 0x150e
08c6f (f+008b6f)  e86f89         call 0x15e1
08c72 (f+008b72)  3401           xor al, 1
08c74 (f+008b74)  7503           jne 0x8c79
08c76 (f+008b76)  e90600         jmp 0x8c7f
08c79 (f+008b79)  e8dabd         call 0x4a56
08c7c (f+008b7c)  e93c01         jmp 0x8dbb
08c7f (f+008b7f)  a14f64         mov ax, word ptr [0x644f]
08c82 (f+008b82)  3d0000         cmp ax, 0
08c85 (f+008b85)  b80100         mov ax, 1
08c88 (f+008b88)  7f01           jg 0x8c8b
08c8a (f+008b8a)  48             dec ax

sub_8c8b:  ; 1 known caller(s)
08c8b (f+008b8b)  50             push ax
08c8c (f+008b8c)  a14f64         mov ax, word ptr [0x644f]
08c8f (f+008b8f)  3d0100         cmp ax, 1
08c92 (f+008b92)  b80100         mov ax, 1
08c95 (f+008b95)  7f01           jg 0x8c98
08c97 (f+008b97)  48             dec ax

sub_8c98:  ; 1 known caller(s)
08c98 (f+008b98)  50             push ax
08c99 (f+008b99)  4c             dec sp
08c9a (f+008b9a)  b80500         mov ax, 5
08c9d (f+008b9d)  50             push ax
08c9e (f+008b9e)  e8c5b5         call 0x4266
08ca1 (f+008ba1)  3401           xor al, 1
08ca3 (f+008ba3)  59             pop cx
08ca4 (f+008ba4)  0bc1           or ax, cx
08ca6 (f+008ba6)  59             pop cx
08ca7 (f+008ba7)  23c1           and ax, cx
08ca9 (f+008ba9)  0bc0           or ax, ax
08cab (f+008bab)  7503           jne 0x8cb0
08cad (f+008bad)  e94c00         jmp 0x8cfc
08cb0 (f+008bb0)  e83285         call 0x11e5    ; --> inline literal [PushStr] b"You'll have to drop what you're carrying before you can swim."
08cf1 (f+008bf1)  b150           mov cl, 0x50
08cf3 (f+008bf3)  e84785         call 0x123d
08cf6 (f+008bf6)  e804b3         call 0x3ffd
08cf9 (f+008bf9)  e9bf00         jmp 0x8dbb
08cfc (f+008bfc)  a05764         mov al, byte ptr [0x6457]
08cff (f+008bff)  32e4           xor ah, ah
08d01 (f+008c01)  3d0d00         cmp ax, 0xd
08d04 (f+008c04)  7403           je 0x8d09
08d06 (f+008c06)  e93c00         jmp 0x8d45
08d09 (f+008c09)  e84c98         call 0x2558
08d0c (f+008c0c)  e84e9c         call 0x295d    ; --> inline literal [Write] b'You have been eaten by a large alligator!'
08d39 (f+008c39)  e8399c         call 0x2975
08d3c (f+008c3c)  b89300         mov ax, 0x93
08d3f (f+008c3f)  a25764         mov byte ptr [0x6457], al
08d42 (f+008c42)  e97600         jmp 0x8dbb
08d45 (f+008c45)  e81098         call 0x2558
08d48 (f+008c48)  e8129c         call 0x295d    ; --> inline literal [Write] b'Splash!  You swim the river and scramble up the opposite bank.'
08d8a (f+008c8a)  e8e89b         call 0x2975
08d8d (f+008c8d)  b89100         mov ax, 0x91
08d90 (f+008c90)  a25664         mov byte ptr [0x6456], al
08d93 (f+008c93)  b86600         mov ax, 0x66
08d96 (f+008c96)  a2953a         mov byte ptr [0x3a95], al
08d99 (f+008c99)  a05764         mov al, byte ptr [0x6457]
08d9c (f+008c9c)  32e4           xor ah, ah
08d9e (f+008c9e)  3d3d00         cmp ax, 0x3d
08da1 (f+008ca1)  7403           je 0x8da6
08da3 (f+008ca3)  e90900         jmp 0x8daf
08da6 (f+008ca6)  b84100         mov ax, 0x41
08da9 (f+008ca9)  a25764         mov byte ptr [0x6457], al
08dac (f+008cac)  e90600         jmp 0x8db5
08daf (f+008caf)  b83d00         mov ax, 0x3d
08db2 (f+008cb2)  a25764         mov byte ptr [0x6457], al

sub_8db5:  ; 1 known caller(s)
08db5 (f+008cb5)  b89100         mov ax, 0x91
08db8 (f+008cb8)  a25964         mov byte ptr [0x6459], al

sub_8dbb:  ; 6 known caller(s)
08dbb (f+008cbb)  e90000         jmp 0x8dbe
08dbe (f+008cbe)  8be5           mov sp, bp
08dc0 (f+008cc0)  5d             pop bp
08dc1 (f+008cc1)  c3             ret 
08dc2 (f+008cc2)  55             push bp
08dc3 (f+008cc3)  8bec           mov bp, sp
08dc5 (f+008cc5)  55             push bp
08dc6 (f+008cc6)  e90000         jmp 0x8dc9
08dc9 (f+008cc9)  4c             dec sp
08dca (f+008cca)  4c             dec sp
08dcb (f+008ccb)  a05764         mov al, byte ptr [0x6457]
08dce (f+008cce)  32e4           xor ah, ah
08dd0 (f+008cd0)  d1e0           shl ax, 1
08dd2 (f+008cd2)  97             xchg di, ax
08dd3 (f+008cd3)  81c7bd64       add di, 0x64bd
08dd7 (f+008cd7)  1e             push ds
08dd8 (f+008cd8)  57             push di
08dd9 (f+008cd9)  a05764         mov al, byte ptr [0x6457]
08ddc (f+008cdc)  32e4           xor ah, ah
08dde (f+008cde)  3d0b00         cmp ax, 0xb
08de1 (f+008ce1)  7403           je 0x8de6
08de3 (f+008ce3)  e90600         jmp 0x8dec
08de6 (f+008ce6)  e8ce9f         call 0x2db7
08de9 (f+008ce9)  e9ef02         jmp 0x90db
08dec (f+008cec)  3d0f00         cmp ax, 0xf
08def (f+008cef)  7403           je 0x8df4
08df1 (f+008cf1)  e90502         jmp 0x8ff9
08df4 (f+008cf4)  bf393b         mov di, 0x3b39
08df7 (f+008cf7)  1e             push ds
08df8 (f+008cf8)  e8d183         call 0x11cc
08dfb (f+008cfb)  e88085         call 0x137e
08dfe (f+008cfe)  3d0000         cmp ax, 0
08e01 (f+008d01)  b80100         mov ax, 1
08e04 (f+008d04)  7401           je 0x8e07
08e06 (f+008d06)  48             dec ax

sub_8e07:  ; 1 known caller(s)
08e07 (f+008d07)  50             push ax
08e08 (f+008d08)  a03a3b         mov al, byte ptr [0x3b3a]
08e0b (f+008d0b)  32e4           xor ah, ah
08e0d (f+008d0d)  50             push ax
08e0e (f+008d0e)  e8eb86         call 0x14fc
08e11 (f+008d11)  b87200         mov ax, 0x72
08e14 (f+008d14)  e8f786         call 0x150e
08e17 (f+008d17)  b86c00         mov ax, 0x6c
08e1a (f+008d1a)  e8f186         call 0x150e
08e1d (f+008d1d)  b86d00         mov ax, 0x6d
08e20 (f+008d20)  e8eb86         call 0x150e
08e23 (f+008d23)  e8bb87         call 0x15e1
08e26 (f+008d26)  3401           xor al, 1
08e28 (f+008d28)  59             pop cx
08e29 (f+008d29)  0bc1           or ax, cx
08e2b (f+008d2b)  0bc0           or ax, ax
08e2d (f+008d2d)  7503           jne 0x8e32
08e2f (f+008d2f)  e90801         jmp 0x8f3a
08e32 (f+008d32)  e8b083         call 0x11e5    ; --> inline literal [PushStr] b'Which door (right, left, or middle)?'
08e5a (f+008d5a)  b150           mov cl, 0x50
08e5c (f+008d5c)  e8de83         call 0x123d
08e5f (f+008d5f)  e89a86         call 0x14fc
08e62 (f+008d62)  b80d00         mov ax, 0xd
08e65 (f+008d65)  e8a686         call 0x150e
08e68 (f+008d68)  b85200         mov ax, 0x52
08e6b (f+008d6b)  e8a086         call 0x150e
08e6e (f+008d6e)  b84c00         mov ax, 0x4c
08e71 (f+008d71)  e89a86         call 0x150e
08e74 (f+008d74)  b84d00         mov ax, 0x4d
08e77 (f+008d77)  e89486         call 0x150e
08e7a (f+008d7a)  b84e00         mov ax, 0x4e
08e7d (f+008d7d)  e88e86         call 0x150e
08e80 (f+008d80)  b92000         mov cx, 0x20
08e83 (f+008d83)  e8cc86         call 0x1552
08e86 (f+008d86)  b80000         mov ax, 0
08e89 (f+008d89)  50             push ax
08e8a (f+008d8a)  8d7efd         lea di, [bp - 3]
08e8d (f+008d8d)  16             push ss
08e8e (f+008d8e)  57             push di
08e8f (f+008d8f)  e861a2         call 0x30f3
08e92 (f+008d92)  8a46fd         mov al, byte ptr [bp - 3]
08e95 (f+008d95)  32e4           xor ah, ah
08e97 (f+008d97)  50             push ax
08e98 (f+008d98)  b80d00         mov ax, 0xd
08e9b (f+008d9b)  59             pop cx
08e9c (f+008d9c)  91             xchg cx, ax
08e9d (f+008d9d)  3bc1           cmp ax, cx
08e9f (f+008d9f)  7403           je 0x8ea4
08ea1 (f+008da1)  e90900         jmp 0x8ead
08ea4 (f+008da4)  e8b196         call 0x2558
08ea7 (f+008da7)  e8cb9a         call 0x2975
08eaa (f+008daa)  e93402         jmp 0x90e1
08ead (f+008dad)  b80300         mov ax, 3
08eb0 (f+008db0)  e80875         call 0x103bb
08eb3 (f+008db3)  8a46fd         mov al, byte ptr [bp - 3]
08eb6 (f+008db6)  32e4           xor ah, ah
08eb8 (f+008db8)  3d5200         cmp ax, 0x52
08ebb (f+008dbb)  7403           je 0x8ec0
08ebd (f+008dbd)  e91100         jmp 0x8ed1
08ec0 (f+008dc0)  e89596         call 0x2558
08ec3 (f+008dc3)  e8979a         call 0x295d    ; --> inline literal [Write] b'ight'
08ecb (f+008dcb)  e8a79a         call 0x2975
08ece (f+008dce)  e94a00         jmp 0x8f1b
08ed1 (f+008dd1)  3d4c00         cmp ax, 0x4c
08ed4 (f+008dd4)  7403           je 0x8ed9
08ed6 (f+008dd6)  e91000         jmp 0x8ee9
08ed9 (f+008dd9)  e87c96         call 0x2558
08edc (f+008ddc)  e87e9a         call 0x295d    ; --> inline literal [Write] b'eft'
08ee3 (f+008de3)  e88f9a         call 0x2975
08ee6 (f+008de6)  e93200         jmp 0x8f1b
08ee9 (f+008de9)  3d4d00         cmp ax, 0x4d
08eec (f+008dec)  7403           je 0x8ef1
08eee (f+008dee)  e91200         jmp 0x8f03
08ef1 (f+008df1)  e86496         call 0x2558
08ef4 (f+008df4)  e8669a         call 0x295d    ; --> inline literal [Write] b'iddle'
08efd (f+008dfd)  e8759a         call 0x2975
08f00 (f+008e00)  e91800         jmp 0x8f1b
08f03 (f+008e03)  3d4e00         cmp ax, 0x4e
08f06 (f+008e06)  7403           je 0x8f0b
08f08 (f+008e08)  e91000         jmp 0x8f1b
08f0b (f+008e0b)  e84a96         call 0x2558
08f0e (f+008e0e)  e84c9a         call 0x295d    ; --> inline literal [Write] b'one'
08f15 (f+008e15)  e85d9a         call 0x2975
08f18 (f+008e18)  e9cb01         jmp 0x90e6

sub_8f1b:  ; 3 known caller(s)
08f1b (f+008e1b)  b80700         mov ax, 7
08f1e (f+008e1e)  e89a74         call 0x103bb
08f21 (f+008e21)  bf393b         mov di, 0x3b39
08f24 (f+008e24)  1e             push ds
08f25 (f+008e25)  57             push di
08f26 (f+008e26)  4c             dec sp
08f27 (f+008e27)  8a46fd         mov al, byte ptr [bp - 3]
08f2a (f+008e2a)  32e4           xor ah, ah
08f2c (f+008e2c)  50             push ax
08f2d (f+008e2d)  e8c79f         call 0x2ef7
08f30 (f+008e30)  8ae0           mov ah, al
08f32 (f+008e32)  b001           mov al, 1
08f34 (f+008e34)  50             push ax
08f35 (f+008e35)  b150           mov cl, 0x50
08f37 (f+008e37)  e8c182         call 0x11fb
08f3a (f+008e3a)  a03a3b         mov al, byte ptr [0x3b3a]
08f3d (f+008e3d)  32e4           xor ah, ah
08f3f (f+008e3f)  3d7200         cmp ax, 0x72
08f42 (f+008e42)  7403           je 0x8f47
08f44 (f+008e44)  e90900         jmp 0x8f50
08f47 (f+008e47)  b80200         mov ax, 2
08f4a (f+008e4a)  8846fc         mov byte ptr [bp - 4], al
08f4d (f+008e4d)  e91f00         jmp 0x8f6f
08f50 (f+008e50)  3d6c00         cmp ax, 0x6c
08f53 (f+008e53)  7403           je 0x8f58
08f55 (f+008e55)  e90900         jmp 0x8f61
08f58 (f+008e58)  b80000         mov ax, 0
08f5b (f+008e5b)  8846fc         mov byte ptr [bp - 4], al
08f5e (f+008e5e)  e90e00         jmp 0x8f6f
08f61 (f+008e61)  3d6d00         cmp ax, 0x6d
08f64 (f+008e64)  7403           je 0x8f69
08f66 (f+008e66)  e90600         jmp 0x8f6f
08f69 (f+008e69)  b80100         mov ax, 1
08f6c (f+008e6c)  8846fc         mov byte ptr [bp - 4], al

sub_8f6f:  ; 2 known caller(s)
08f6f (f+008e6f)  8a46fc         mov al, byte ptr [bp - 4]
08f72 (f+008e72)  32e4           xor ah, ah
08f74 (f+008e74)  50             push ax
08f75 (f+008e75)  a0e165         mov al, byte ptr [0x65e1]
08f78 (f+008e78)  32e4           xor ah, ah
08f7a (f+008e7a)  59             pop cx
08f7b (f+008e7b)  91             xchg cx, ax
08f7c (f+008e7c)  3bc1           cmp ax, cx
08f7e (f+008e7e)  7503           jne 0x8f83
08f80 (f+008e80)  e96100         jmp 0x8fe4
08f83 (f+008e83)  e8d295         call 0x2558
08f86 (f+008e86)  e8d499         call 0x295d    ; --> inline literal [Write] b'As you open the door, huge granite stones fall from above and strike you dead.'
08fd8 (f+008ed8)  e89a99         call 0x2975
08fdb (f+008edb)  b89300         mov ax, 0x93
08fde (f+008ede)  a25764         mov byte ptr [0x6457], al
08fe1 (f+008ee1)  e91200         jmp 0x8ff6
08fe4 (f+008ee4)  b80f00         mov ax, 0xf
08fe7 (f+008ee7)  a25664         mov byte ptr [0x6456], al
08fea (f+008eea)  b81000         mov ax, 0x10
08fed (f+008eed)  a25764         mov byte ptr [0x6457], al
08ff0 (f+008ef0)  b86600         mov ax, 0x66
08ff3 (f+008ef3)  a2953a         mov byte ptr [0x3a95], al

sub_8ff6:  ; 1 known caller(s)
08ff6 (f+008ef6)  e9e200         jmp 0x90db
08ff9 (f+008ef9)  3d0e00         cmp ax, 0xe
08ffc (f+008efc)  7403           je 0x9001
08ffe (f+008efe)  e91700         jmp 0x9018
09001 (f+008f01)  a05764         mov al, byte ptr [0x6457]
09004 (f+008f04)  32e4           xor ah, ah
09006 (f+008f06)  a25664         mov byte ptr [0x6456], al
09009 (f+008f09)  b80f00         mov ax, 0xf
0900c (f+008f0c)  a25764         mov byte ptr [0x6457], al
0900f (f+008f0f)  b86600         mov ax, 0x66
09012 (f+008f12)  a2953a         mov byte ptr [0x3a95], al
09015 (f+008f15)  e9c300         jmp 0x90db
09018 (f+008f18)  3d4200         cmp ax, 0x42
0901b (f+008f1b)  7417           je 0x9034
0901d (f+008f1d)  3d4500         cmp ax, 0x45
09020 (f+008f20)  7412           je 0x9034
09022 (f+008f22)  3d0d00         cmp ax, 0xd
09025 (f+008f25)  740d           je 0x9034
09027 (f+008f27)  3d3d00         cmp ax, 0x3d
0902a (f+008f2a)  7408           je 0x9034
0902c (f+008f2c)  3d4100         cmp ax, 0x41
0902f (f+008f2f)  7403           je 0x9034
09031 (f+008f31)  e90600         jmp 0x903a

sub_9034:  ; 4 known caller(s)
09034 (f+008f34)  e863fb         call 0x8b9a
09037 (f+008f37)  e9a100         jmp 0x90db
0903a (f+008f3a)  a05764         mov al, byte ptr [0x6457]
0903d (f+008f3d)  32e4           xor ah, ah
0903f (f+008f3f)  3d7e00         cmp ax, 0x7e
09042 (f+008f42)  b80100         mov ax, 1
09045 (f+008f45)  7401           je 0x9048
09047 (f+008f47)  48             dec ax

sub_9048:  ; 1 known caller(s)
09048 (f+008f48)  50             push ax
09049 (f+008f49)  c47ef8         les di, ptr [bp - 8]
0904c (f+008f4c)  268a05         mov al, byte ptr es:[di]
0904f (f+008f4f)  32e4           xor ah, ah
09051 (f+008f51)  3d0100         cmp ax, 1
09054 (f+008f54)  b80100         mov ax, 1
09057 (f+008f57)  7401           je 0x905a
09059 (f+008f59)  48             dec ax

sub_905a:  ; 1 known caller(s)
0905a (f+008f5a)  59             pop cx
0905b (f+008f5b)  23c1           and ax, cx
0905d (f+008f5d)  0bc0           or ax, ax
0905f (f+008f5f)  7503           jne 0x9064
09061 (f+008f61)  e91700         jmp 0x907b
09064 (f+008f64)  a05764         mov al, byte ptr [0x6457]
09067 (f+008f67)  32e4           xor ah, ah
09069 (f+008f69)  a25664         mov byte ptr [0x6456], al
0906c (f+008f6c)  b88a00         mov ax, 0x8a
0906f (f+008f6f)  a25764         mov byte ptr [0x6457], al
09072 (f+008f72)  b80300         mov ax, 3
09075 (f+008f75)  a2953a         mov byte ptr [0x3a95], al
09078 (f+008f78)  e96000         jmp 0x90db
0907b (f+008f7b)  a05764         mov al, byte ptr [0x6457]
0907e (f+008f7e)  32e4           xor ah, ah
09080 (f+008f80)  3d2e00         cmp ax, 0x2e
09083 (f+008f83)  b80100         mov ax, 1
09086 (f+008f86)  7401           je 0x9089
09088 (f+008f88)  48             dec ax

sub_9089:  ; 1 known caller(s)
09089 (f+008f89)  50             push ax
0908a (f+008f8a)  c47ef8         les di, ptr [bp - 8]
0908d (f+008f8d)  268a05         mov al, byte ptr es:[di]
09090 (f+008f90)  32e4           xor ah, ah
09092 (f+008f92)  3d0100         cmp ax, 1
09095 (f+008f95)  b80100         mov ax, 1
09098 (f+008f98)  7401           je 0x909b
0909a (f+008f9a)  48             dec ax

sub_909b:  ; 1 known caller(s)
0909b (f+008f9b)  59             pop cx
0909c (f+008f9c)  23c1           and ax, cx
0909e (f+008f9e)  0bc0           or ax, ax
090a0 (f+008fa0)  7503           jne 0x90a5
090a2 (f+008fa2)  e91500         jmp 0x90ba
090a5 (f+008fa5)  b89100         mov ax, 0x91
090a8 (f+008fa8)  a25664         mov byte ptr [0x6456], al
090ab (f+008fab)  b83300         mov ax, 0x33
090ae (f+008fae)  a25764         mov byte ptr [0x6457], al
090b1 (f+008fb1)  b86600         mov ax, 0x66
090b4 (f+008fb4)  a2953a         mov byte ptr [0x3a95], al
090b7 (f+008fb7)  e92100         jmp 0x90db
090ba (f+008fba)  a05764         mov al, byte ptr [0x6457]
090bd (f+008fbd)  32e4           xor ah, ah
090bf (f+008fbf)  3d4300         cmp ax, 0x43
090c2 (f+008fc2)  7403           je 0x90c7
090c4 (f+008fc4)  e91100         jmp 0x90d8
090c7 (f+008fc7)  a05764         mov al, byte ptr [0x6457]
090ca (f+008fca)  32e4           xor ah, ah
090cc (f+008fcc)  a25664         mov byte ptr [0x6456], al
090cf (f+008fcf)  b84000         mov ax, 0x40
090d2 (f+008fd2)  a25764         mov byte ptr [0x6457], al
090d5 (f+008fd5)  e90300         jmp 0x90db
090d8 (f+008fd8)  e864fa         call 0x8b3f

sub_90db:  ; 6 known caller(s)
090db (f+008fdb)  83c404         add sp, 4

sub_90de:  ; 2 known caller(s)
090de (f+008fde)  e90a00         jmp 0x90eb
090e1 (f+008fe1)  58             pop ax
090e2 (f+008fe2)  58             pop ax
090e3 (f+008fe3)  e9f8ff         jmp 0x90de
090e6 (f+008fe6)  58             pop ax
090e7 (f+008fe7)  58             pop ax
090e8 (f+008fe8)  e9f3ff         jmp 0x90de
090eb (f+008feb)  8be5           mov sp, bp
090ed (f+008fed)  5d             pop bp
090ee (f+008fee)  c3             ret 