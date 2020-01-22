/*

    argc= %rdi
    argv= %rsi
    n1= %r13
    operator: %r12
    n2: %r10
*/

.global main
.text

main:
    enter $0, $0

    /*
    if(argc != 4 || (strncmp(argv[2], "+", 8) && strncmp(argv[2], "-", 8) && strncmp(argv[2], "*", 8) && strncmp(argv[2], "/", 8)) ){
        puts("Usage:\n./ccalc N op N");
        return 1;
    }
    */
    cmp $4, %rdi
    jne error

    mov %rsi, %r12

    //int x = atoi(argv[1]);
    mov 8(%r12), %rdi
    call atoi
    mov %rax, %r13

    //int y = atoi(argv[3]);
    mov 24(%r12), %rdi
    call atoi
    mov %rax, %r14

    mov 16(%r12), %rax
    mov (%rax), %al

    cmpb  $'+, %al
    je addition

    cmpb $'-, %al
    je subtraction

    cmpb $'*, %al
    je multiplication

    cmpb $'/, %al
    je division

error:
    mov $error_msg, %rdi
    call puts
    mov $1, %rax
    jmp main_done

addition:
    mov %r14, %rax
    add %r13, %rax
    mov %rax, %r8   
    jmp print_output

subtraction:
    mov %r13, %rax
    sub %r14, %rax
    mov %rax, %r8
    jmp print_output

multiplication:
    mov %r14, %rax
    imul %r13, %rax
    mov %rax, %r8
    jmp print_output

division:
    mov %r13, %rax
    cqo
    idiv %r14
    mov %rax, %r8
    jmp print_output

print_output:
    mov $result, %rdi
    mov $0, %rsi
    mov $1, %rdx
    mov $0, %rcx 
    mov $0, %al
    call printf

main_done:
    leave
    ret

.data
    error_msg: .string "Usage:\n./acalc N op N"
    result: .string "%d %d %d = %d\n"