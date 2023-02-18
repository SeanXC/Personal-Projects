  .syntax unified
  .cpu cortex-m3
  .fpu softvfp
  .thumb
  
  .global  Main

Main:
  MOV R11,#10                        @tmp=10
  MOV R4,#16                         @hexTmp=16

identifyNum:
  LDRB R3,[R1]                       @ch3=byte[address1]
  CMP R3,#0                          @while (ch3!=0)
  BEQ end                            @{
  CMP R3,'0'                         @while (ch3!'0')
  BEQ ifHex                          @{
continueIdentifyNum:
  CMP R3,'0'                         @while (0<=ch3<=9)
  BLO endIdentifyNum                 @{
  SUB R3,R3,0x30                     @ch3=ch3-0x30(ASCII->decimal)
  MUL R12,R12,R11                    @currentNumebr=currentNumebr*tmp
  ADD R12,R12,R3                     @currentNumebr=currentNumebr+ch3
  ADD R1,R1,#1                       @address1=address1+1
  B identifyNum                      @}

ifHex:
  ADD R1,R1,#1                       @address1=address1+1
  LDRB R3,[R1]                       @ch3=byte[address1]
  CMP R3,'x'                         @while(ch3!='x')
  BEQ convertHex                     @{
  SUB R1,R1,#1                       @address1=address1-1
  LDRB R3,[R1]                       @ch3=byte[address1]
  B continueIdentifyNum
convertHex:
  ADD R1,R1,#1                       @else  { address1=address1+1
  LDRB R3,[R1]                       @ch3=byte[address1]
  CMP R3,#0                          @if (ch3=0)
  BEQ identifyNum                    @{jump to identifyNum}
  CMP R3,'0'                         @if (ch3='0')
  BLO endIdentifyNum                 @{jump to endIdentifyNum}
  CMP R3,'A'                         @if (ch3='A')
  BLO notConvert                     @{jump to notConvert}
  SUB R3,R3,0x37                     @ch3=ch3-0x37(ASCII->decimal)
  B continueConvert                  @jump to continueConvert
notConvert:
  SUB R3,R3,0x30                     @ch3=ch3-0x30
continueConvert:
  MUL R12,R12,R4                     @currentNumebr=currentNumebr*hexTmp
  ADD R12,R12,R3                     @currentNumebr=currentNumebr+ch3
  B convertHex                       @jump to convertHex



endIdentifyNum:
  ADD R8,R8,#1                       @count=count+1(use count to judge if the number is the first number in expression or not)
  CMP R9,#1                          @if(addFlag)
  BEQ doAdd                          @{jump to doAdd function}
  CMP R9,#2                          @if(subFlag)
  BEQ doSub                          @{jump to doSub function}
  CMP R9,#3                          @if(mulFlage)
  BEQ doMul                          @{jump to doMul function}
  CMP R8,#1                          @if (currentNumber is the first number in the expression)
  BHI resetCurrentNum                @{(get previousnumber)
  MOV R10,R12                        @previousNumebr=currentNumebr   }
resetCurrentNum:
  MOV R12,#0                         @reset currentNumebr=0
identifySymble:
  CMP R3,0x2b                        @if (ch3='+')
  BEQ addFlag                        @{jump to set addFlag}
  CMP R3,0x2d                        @if (ch3='-')
  BEQ subFlag                        @{jump to set subFlag}
  CMP R3,0x2a                        @if (ch3='*')
  BEQ mulFlag                        @{jump to set mulFlag}

addFlag:
  MOV R9,#1                          @set addFlag
  ADD R1,R1,#1                       @address1=address+1
  MOV R12,#0                         @initial current number
  B identifyNum                      @back to get the next numebr
doAdd:
  ADD R10,R10,R12                    @previousNumber=previousNumber+currentNumber
  MOV R9,#0                          @reset flag=0
  B identifyNum                      @back to get the next number

subFlag:
  MOV R9,#2                          @set subFlag
  ADD R1,R1,#1                       @address1=address+1
  MOV R12,#0                         @initial current number
  B identifyNum                      @back to get the next number
doSub:
  SUB R10,R10,R12                    @previousNumber=previousNumber-currentNumber
  MOV R9,#0                          @reset flag=0
  B identifyNum                      @back to get the next number

mulFlag:
  MOV R9,#3                          @set mulFlag
  ADD R1,R1,#1                       @address1=address+1
  MOV R12,#0                         @initial curent number
  B identifyNum                      @back to get the next number
doMul:
  MUL R10,R10,R12                    @previousNumber=previousNumber*currentNumber
  MOV R9,#0                          @initial curent number
  B identifyNum                      @back to get the next number

end:
  CMP R9,#1                          @check addFlag
  BEQ addLast                        @if(addFlag){do addLast}
  CMP R9,#2                          @check subFlag
  BEQ subLast                        @if(addFlag){do mulLast}
  CMP R9,#3                          @check mulFlag
  BEQ mulLast                        @if(addFlag){do mulLast}
addLast:
  ADD R0,R10,R12                     @do addLast=previous+current
  B End_Main                         @done
subLast:
  SUB R0,R10,R12                     @do addLast=previous-current
  B End_Main                         @done
mulLast:
  MUL R0,R10,R12                     @do addLast=previous*current
  B End_Main                         @done

End_Main:
  BX    LR

  .end