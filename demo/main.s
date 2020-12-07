/*
 * main.s
 *
 *  Created on: Oct 24, 2020
 *      Author: Jacob Gerega
 */
  .text
  .global main
main:
	.global add2_func
add2_func:
	ldr x8, =in1
	ldr x0, [x8]
	ldr x8, =in2
	ldr x1, [x8]
	add x2, x1, x0
add2_end:
	br x30

.data
in1:
	.dword 10
in2:
	.dword 15
.end
