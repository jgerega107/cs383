/*
 * taylor.s
 *
 *  Created on: Dec 4, 2020
 *      Author: Jacob Gerega
 *		Pledge: I pledge my honor that I have abided by the Stevens Honor System.
 */

.text
.global main
.extern printf

main:
	LDR X0, =x
	LDR X1, =i
	LDR D0, [X0] //D0 is x
	FMOV D1, XZR //initialize to zero
	FMOV D2, XZR //initialize to zero
	FMOV D3, XZR //initialize to zero
	FMOV D4, #1.0 //top of term
	LDR X20, [X1] //X19 is iterations
	MOV X19, #0 //set current iterations to 0
loop:
	CMP X19, X20 //counter < total iterations ?
	BGT exit //if so, exit
	MOV X21, #1 //factorial counter
	MOV X22, #1 //total factorial sum
	FMOV D2, #1.0 //x^n product
factorial:
	CMP X21, X19 //counter != i
	BGT taylor //return
	MUL X22, X22, X21 //fact*=counter
	FMUL D2, D2, D0 //xp*=x
	ADD X21, X21, #1 //counter++
	B factorial
taylor:
	SCVTF D19, X22 //convert factorial term to double
	FDIV D5, D2, D19 //divide x^n/factorial
	FADD D3, D3, D5 //add to total sum
	ADD X19, X19, #1 //citerations++
	B loop
exit:
	LDR X0, =str //load base string
	FMOV D0, D3 //move sum to D0
	BL printf //print
	BR X30 //return
.data
x:
.double 7 //x
i:
.dword 14 //total iterations
str:
	.ascii "The approximation is %f\n\0" //printed string
