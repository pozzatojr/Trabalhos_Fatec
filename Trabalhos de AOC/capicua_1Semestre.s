.data
	msg1:.asciiz"Digite um numero: "
	msg2:.asciiz"O numero digitado não é palindromo, o número palíndromo (capicua) mais próximo a seguir dele é: "
	msg3:.asciiz" é palindromo"
	space:.asciiz"\n"
.text
main:
	li $v0, 4
	la $a0, msg1
	syscall
	
	li $v0, 5
	syscall
	
	add $t0, $v0, 0 #t0 = valor digitado
	add $t3, $t0, 0
	add $t4, $t0, 0
	
	ble $t3, 1, main
	bge $t3, 10000, main

startLoop:	
	rem $t1, $t0, 10 #t1 = resto
	div $t0, $t0, 10 #div por 10	
	mul $t2, $t2, 10 # começo da formula
	add $t2, $t2, $t1 #restante da formula
	
	bgt $t0, 0, startLoop
	beq $t2, $t3, capicua #verifica se ´e palindromo
	j naoCapicua

naoCapicua:
	add $t3, $t3, 1
	add $t0, $t3, 0	
	li $t2, 0
		
	j startLoop
	
fimCapicua:
	li $v0, 4
	la $a0, msg2
	syscall
	
	li $v0, 1
	add $a0, $t2, 0
	syscall
	j end
	
capicua:	
	blt $t4, $t3, fimCapicua
		
	li $v0, 1
	add $a0, $t2, 0 #mostrando o res da formula
	syscall
	
	li $v0, 4
	la $a0, msg3
	syscall		
end:
