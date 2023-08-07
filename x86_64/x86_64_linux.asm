extern printf
section .data
    nf db "%d", 10, 0  ; Format string for printing integers with a newline
    buzz db "buzz", 10, 0 ; buzz string
    fizz db "fizz", 10, 0 ; fizz string
section .bss
section .text
    global main
main:
	push rbp
    mov r15, 0      ; Initialize loop counter to 1
.loop:
    inc r15 ; Increment the loop counter
	push rbp ; setup stack
	mov rdi, nf ; printf format string 
	mov rsi, r15 ; pushing first arg
	mov rax, 0 ; 
	call printf
	pop rbp
    ; good place to insert fizzbuzz division checks
    ; check for 5 
    mov r14, 5
    mov rax, r15 
    div r14
    cmp rdx, 0
    jnz .fizz
    ; survived jump so it's divisible by 5 let's print something
    push rbp
    mov rdi, buzz
    mov rax, 0
    call printf
    pop rbp
.fizz
    ; check for 3
    xor rdx, rdx
    mov r14, 3
    mov rax, r15
    div r14
    cmp rdx, 0
    jnz .loop_end
    ; survived print fizz
    push rbp 
    mov rdi, fizz
    mov rax, 0
    call printf
    pop rbp

.loop_end
    ; and last check homekeeping for loop
    cmp r15, 100 ; Compare loop counter with 16 (end condition)
    jnz .loop       ; Jump to the loop label if not equal
    
    ; Exit the program
    mov rax, 60     ; syscall number for sys_exit
    xor rdi, rdi    ; Return code 0
    syscall

