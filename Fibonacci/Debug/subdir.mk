################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
S_SRCS += \
../fibonacci.s 

OBJS += \
./fibonacci.o 


# Each subdirectory must supply rules for building sources it contributes
%.o: ../%.s
	@echo 'Building file: $<'
	@echo 'Invoking: GCC Assembler 7.5.0 [aarch64-elf]'
	aarch64-elf-as -g -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


