;Program to decide the eligilibity for voting
;Input : User enters the age.
;Output: Prints whether or not eligible for voting
;Date  : 06-02-13

section .data
   
   message1: db 'Enter your age',10,0   
   formatin: db "%d", 0               
   age     : dd 0             
   message2:db 'Eligible for voting',10,0
   message3:db 'Not Eligible for voting',10,0
   min_age: dd 18


section .text

  global main
  extern printf
  extern scanf

main:

   push ebp             ; save registers
   mov ebp,esp 

   push message1        ; prompt to input age
   call printf

   add esp, 4           ; remove parameters
   push age             ; address of age (second parameter)
   push formatin        ; arguments are right to left (first parameter)
   call scanf           ; getting the age from the user

   mov eax,[age]        ; moving the age into accumulator

   cmp eax,[min_age]    ; comparing the age with the minimum age

   jge label1           ; jump to label1 if greater than or equal to

   push message3        ; if not print message3 
   call printf
   jmp finish


label1:

   push message2        ; prints message 2 and exits
   call printf
   jmp finish

finish:

   mov esp,ebp;
   pop ebp
   ret



