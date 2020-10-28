/*
 * fibonacci.s
 *
 *  Created on: Oct 27, 2020
 *      Author: Jacob Gerega
 *		Pledge: I pledge my honor that I have abided by the Stevens Honor System.
 */
.text
.global main
.extern printf
main:
	LDR X1, =n //load reference to n
	MOV X19, XZR //r1
	MOV X20, #1 //r2
	LDR X23, [X1] //actually load n
	SUB X23, X23, #1
loop:
	CMP X23, XZR //see if counter (n) is zero
	BEQ exit //if zero, exit and print
	ADD X21, X19, X20 //r3
	ADD X19, XZR, X20 //copy r2 to r1
	ADD X20, XZR, X21 //copy r3 to r2
	SUB X23, X23, #1 //sub 1 from n
	B loop
exit:
	LDR X0, =str //load base string
	MOV X1, X19 //load r1
	BL printf //print
	BR X30 //return
.data
n:
	.dword 6
str:
	.ascii "%d\n\0"
.end
