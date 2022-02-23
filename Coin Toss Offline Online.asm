.model small
.stack 100h
.data


projectname db 10,13,"**********____________Coin Toss - Offline or Online EXAM______________*************",10,13,"$"

intro1 db 10,13,"WaNnA pLaY a GaMe?",10,13,"LeT's ToSsS!",9,"(Type y to play and n to quit):",32,"$"
intro2 db 10, 13, "Heads its Online...", 10, 13, 9, "Tails its OFFLINE...$"
introExit db 10,13,"oK bYe",3,"$"      

;root choice
choice00 db 10,13, "Heads or Tails?",10,13,9, "(Type h or t):",32,"$"        

;level 2 choices
choice10 db 10,13, "Is it Raining or is there Sunshine?",10,13,9, "(Type r or s):",32,"$"
choice11 db 10,13, "Sun or Moon?",10,13,9, "(Type S or m):",32,"$"   

;level 3 choices
choice20 db 10,13, "Are you Male or Female?",10,13,9, "(Type f or M):",32,"$"
choice21 db 10,13, "Are the teachers Mentally OK?",10,13, 9, "(Type y to say yes or n to say no):",32,"$"
choice22 db 10,13, "Did the sun rise from the West?",10,13, 9, "(Type y to say yes or n to say no):",32,"$"      

;level 4 choices and outputs
outp30 db 10,13,"The exam will be offline, Apu",3,10,13,"$"
outp31 db 10,13,"The exam will be offline, Bro", 9, ";-(",10,13,"$"
outp32 db 10,13,"DEFINITELY offline...",9,"Study while you can... Get help from toppers... Best of luck", 3,"$"
choice33 db 10,13, "Are they Out of their MiNdS?", 10,13, 9, "(Type y if you think yes or n if you think no):", 32,"$"
outp34 db 10,13,"Then hOw do you eXpEcT it to be online???$"
outp35 db 10,13,"Even if the Sun rises from the West the exam will be offline$"    

;level 5 choices and outputs
outp40 db 10,13, "Then it MIGHT BE online...$"
choice41 db 10,13, "Do you think they want what\'s bad for you?", 10,13, 9, "(Type y if you think yes or n if you think no):", 32,"$"    

;level 6 outputs
outp50 db 10,13,"Then and only then can it be online",9,"$"
outp51 db 10,13,"Then how do you expect it to be online?",9,"$"    

;end game outputs
endgameC db 10,10,13, "Do you want to play again?", 9, "(Type y to play and n to quit):",32,"$"
gameOver db 10,13,"It was nice playing with you ;) See you some other time :D$"

;must input correct choice or enter tsukuyomi loop
rectify db 10,13, "Until you enter one of the two valid choices for this query this portion will loop itself. Understood? (y/n) ):-]",32,"$"


L db ?
Lw db ?
R db ?
Rw db ?


.code
main proc
    mov ax, @data
    mov ds, ax
    
    mov ah, 9
    lea dx, projectname
    int 21h
    
    play:
    mov ah, 9
    lea dx, intro1
    int 21h
    mov R,  'Y'
    mov Rw, 'y'
    mov L, 'N'
    mov Lw, 'n'
    
    call takeChoice
    
    cmp bl,Rw  
    je start00
    
    cmp bl, R
    je start00
    
    cmp bl, Lw
    je exit
    
    cmp bl, L
    je exit
    
    mov ah,9
    lea dx, rectify
    int 21h
    call takeChoice ;(just to stop the clear screen command until user has read the prompt)
    call clearScr
    jmp play
    
    start00:
    mov ah, 9
    lea dx, intro2
    int 21h
    
    call clearScr
    
    level00:
    mov ah, 9
    lea dx, choice00
    int 21h
    mov L, 'H'
    mov Lw, 'h'
    mov R,  'T'
    mov Rw, 't'
 
    call takeChoice
    
    cmp bl, Lw  
    je level10
    
    cmp bl, L
    je level10
    
    cmp bl, Rw
    je level11
    
    cmp bl, R
    je level11
    
    mov ah,9
    lea dx, rectify
    int 21h
    call takeChoice ;(just to stop the clear screen command until user has read the prompt)
    call clearScr
    jmp level00
    
    level10:
    mov ah, 9
    lea dx, choice10
    int 21h  
    
    mov L, 'R'
    mov Lw, 'r'
    mov R,  'S'
    mov Rw, 's'
       
    call takeChoice
    
    cmp bl, Lw  
    je level20
    
    cmp bl, L
    je level20
    
    cmp bl, Rw
    je level21
    
    cmp bl, R
    je level21
    
    mov ah,9
    lea dx, rectify
    int 21h
    call takeChoice ;(just to stop the clear screen command until user has read the prompt)
    call clearScr
    jmp level10
    
    
    level11:
    mov ah, 9
    lea dx, choice11
    int 21h
 
    mov L, 'M'
    mov Lw, 'm'    
    mov R,  'S'
    mov Rw, 's'
   
    call takeChoice
    
    cmp bl, Lw  
    je level21
    
    cmp bl, L
    je level21
    
    cmp bl, Rw
    je level22
    
    cmp bl, R
    je level22
    
    mov ah,9
    lea dx, rectify
    int 21h
    call takeChoice ;(just to stop the clear screen command until user has read the prompt)
    call clearScr
    jmp level11
    
    level20:
    mov ah, 9
    lea dx, choice20
    int 21h
    
    mov L, 'F'
    mov Lw, 'f'
    mov R,  'M'
    mov Rw, 'm'
   
    call takeChoice
    
    cmp bl, Lw  
    je level30
    
    cmp bl, L
    je level30
    
    cmp bl, Rw
    je level31
    
    cmp bl, R
    je level31
    
    mov ah,9
    lea dx, rectify
    int 21h
    call takeChoice ;(just to stop the clear screen command until user has read the prompt)
    call clearScr
    jmp level20
    
    
    level21:
    mov ah, 9
    lea dx, choice21
    int 21h
    ; I love my life
    mov L, 'Y'
    mov Lw, 'y'
    mov R,  'N'
    mov Rw, 'n'
   
    call takeChoice
    
    cmp bl, Lw  
    je level32
    
    cmp bl, L
    je level32
    
    cmp bl, Rw
    je level33
    
    cmp bl, R
    je level33
               
    mov ah,9
    lea dx, rectify
    int 21h
    call takeChoice ;(just to stop the clear screen command until user has read the prompt)
    call clearScr
    jmp level21           
    
    level22:
    mov ah, 9
    lea dx, choice22
    int 21h
    
    mov L, 'N'
    mov Lw, 'n'
    mov R,  'Y'
    mov Rw, 'y'
   
    call takeChoice
    
    cmp bl, Lw  
    je level34
    
    cmp bl, L
    je level34
    
    cmp bl, Rw
    je level35
    
    cmp bl, R
    je level35
    
    mov ah,9
    lea dx, rectify
    int 21h
    call takeChoice ;(just to stop the clear screen command until user has read the prompt)
    call clearScr
    jmp level22
    
    level30:
    mov ah, 9
    lea dx, outp30
    int 21h
    
    call gamendQ
    
    level31:
    mov ah, 9
    lea dx, outp31
    int 21h
    
    call gamendQ
    
    level32:
    mov ah, 9
    lea dx, outp32
    int 21h
    
    call gamendQ
    
    level33:
    mov ah, 9
    lea dx, choice33
    int 21h
    
    mov L, 'Y'
    mov Lw, 'y'
    mov R,  'N'
    mov Rw, 'n'
   
    call takeChoice
    
    cmp bl, Lw  
    je level40
    
    cmp bl, L
    je level40
    
    cmp bl, Rw
    je level41
    
    cmp bl, R
    je level41
    
    mov ah,9
    lea dx, rectify
    int 21h
    call takeChoice ;(just to stop the clear screen command until user has read the prompt)
    call clearScr
    jmp level33
    
    
    level34: 
    mov ah, 9
    lea dx, outp34
    int 21h 
    
    call gamendQ
    
    level35:
    mov ah, 9
    lea dx, outp35
    int 21h
    
    call gamendQ
    
    level40:
    mov ah, 9
    lea dx, outp40
    int 21h
    
    call gamendQ
    
    level41:
    mov ah, 9
    lea dx, choice41
    int 21h
    
    mov L, 'Y'
    mov Lw, 'y'
    mov R,  'N'
    mov Rw, 'n'
   
    call takeChoice
    
    cmp bl, Lw  
    je level50
    
    cmp bl, L
    je level50
    
    cmp bl, Rw
    je level51
    
    cmp bl, R
    je level51
    
    mov ah,9
    lea dx, rectify
    int 21h
    call takeChoice ;(just to stop the clear screen command until user has read the prompt)
    call clearScr
    jmp level41
    
    
    level50:
    mov ah, 9
    lea dx, outp50
    int 21h
    
    call gamendQ
    
    level51:
    mov ah, 9
    lea dx, outp51
    int 21h
    
    call gamendQ
    
    exit:
    mov ah,9
    lea dx, introExit
    int 21h
    
    mov ah, 4ch
    int 21h
   main endp

takeChoice proc
    mov ah,1
    int 21h
    mov bl,al
    ret
    
   takeChoice endp

clearScr proc
    mov ah,00
    mov al,02
    int 10h
    ret
    
   clearScr endp

gamendQ proc
    mov ah, 9
    lea dx, endgameC
    int 21h
    
    call takeChoice
    call clearScr
    cmp bl, 'y'
    je start00
    
    cmp bl,'Y'
    je start00
    
    cmp bl, 'n'
    je gamend
    
    cmp bl, 'N'
    je gamend
    
    ret
   gamendQ endp

gamend proc
    call clearScr
    mov ah,9
    lea dx, gameOver
    int 21h
    
    mov ah, 4ch
    int 21h
    ret
   gamend endp



end main