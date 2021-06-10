.data
prompt: .asciiz "Enter the sequence number: "
result1: .asciiz "F("
result2: .asciiz ")="
endl: .asciiz "\n"

.text
main:

la $a0,prompt   
li $v0,4
syscall

#Read the number
li $v0,5    
syscall

move $t2,$v0    

# Call the fibonacci function
move $a0,$t2
move $v0,$t2
jal fib     
move $t3,$v0    #result 

# Print the output
la $a0,result1  
li $v0,4
syscall

move $a0,$t2    
li $v0,1
syscall

la $a0,result2  
li $v0,4
syscall

#Print the answer
move $a0,$t3   #result
li $v0,1
syscall

la $a0,endl 
li $v0,4
syscall

# End program
li $v0,10
syscall

fib:
beqz $a0,zero   # F(0) = 0
beq $a0,1,one   # F(1) = 1

# fib(n-1)
sub $sp,$sp,4   
sw $ra,0($sp)

sub $a0,$a0,1   
jal fib     #fib(n-1)
add $a0,$a0,1

lw $ra,0($sp)   
add $sp,$sp,4

sub $sp,$sp,4  
sw $v0,0($sp)

# fib(n-2)
sub $sp,$sp,4   
sw $ra,0($sp)

sub $a0,$a0,2   
jal fib     #fib(n-2)
add $a0,$a0,2

lw $ra,0($sp)   
add $sp,$sp,4

lw $s7,0($sp)   
add $sp,$sp,4

# f(n-2) + fib(n-1)
add $v0,$v0,$s7 
jr $ra 

zero:
li $v0,0
jr $ra
one:
li $v0,1
jr $ra


