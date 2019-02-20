# Exercise 1: Simple Assembly Program

**BIG NOTE: this is x86 assembly for masm** 

**```.386```  directive** tells the project run on this minimum processor (first x86 arch processor)

**```.model``` directive** indicates the memory section, by example ```.model flat``` indicates that we want to use the flat memory segmentation model.

**```.code``` directive** indicates where is the code (procedure)

**```<name> PROC```** indicates the start of the procedure, ex:

```asm
    start PROC
```

**```<name> endp```** ends the procedure, ex:
```asm
    start endp
```    

**```move <register>, <value>``` directive** move us into the specify register ex:
```asm
    move eax, 213
```

move us into the register ```eax``` and store the 213 value.

**```add <register>, <value>``` directive** adds to the value of the specify register, the new value, ex:
```asm
    add eax, 432
```

**```ret``` directive** used to **return**.

**```end <proc_name>```** indicates the end of asm module. Ex:
```asm
    end start
```

### Complete exercise
```asm
.386
.model flat
.code
start PROC
        mov eax,213
        add eax,432

        ret
start endp
end start
```