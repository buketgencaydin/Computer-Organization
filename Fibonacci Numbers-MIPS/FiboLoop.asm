.data
prompt: .asciiz "Enter the sequence number: "
output1: .asciiz "F("
output2: .asciiz ")="
endl: .asciiz "\n"
.text

.globl main
main:

la $a0,prompt
li $v0,4
syscall

#Read the number
li $v0,5
syscall

add $a0,$v0,$zero

jal fib

# Print the output
la $a0,output1  
li $v0,4
syscall

move $a0,$t4   
li $v0,1
syscall

la $a0,output2  
li $v0,4
syscall

#Print the answer
move $a0,$t3    #result
li $v0,1
syscall

la $a0,endl 
li $v0,4
syscall

# End program
li $v0,10
syscall

fib:    
addi $t0,$zero,1

beqz $a0,zero
beq $a0,$t0,one

add $t1,$zero,$zero
add $t2,$zero,$zero
addi $t3,$zero,1
addi $t4,$zero,1

loop:
bge $t4,$a0,end
add $t1,$t2,$t3
add $t2,$zero,$t3
add $t3,$zero,$t1
addi $t4,$t4,1
j loop

end:
add $v0,$zero,$t1
jr $ra

zero:
add $v0,$zero,$zero
jr $ra

one:
addi $v0,$zero,1
jr $ra