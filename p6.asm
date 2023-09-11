
_delay:

;p6.c,19 :: 		void delay(){delay_ms(1000);}
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_delay0:
	DECFSZ     R13+0, 1
	GOTO       L_delay0
	DECFSZ     R12+0, 1
	GOTO       L_delay0
	DECFSZ     R11+0, 1
	GOTO       L_delay0
	NOP
	NOP
L_end_delay:
	RETURN
; end of _delay

_initialization:

;p6.c,21 :: 		void initialization() //FUNTION DEACLERATION
;p6.c,23 :: 		ANSEL=ANSELH=0X00; //CONFIGURING ALL THE OI'S AS DIGITAL PINS
	CLRF       ANSELH+0
	CLRF       ANSEL+0
;p6.c,24 :: 		TRISB=0XFF; //KEYPAD
	MOVLW      255
	MOVWF      TRISB+0
;p6.c,25 :: 		TRISD=0X00; //LCD
	CLRF       TRISD+0
;p6.c,26 :: 		TRISC=0X00; //MAKING PORTC AN OUTPUT
	CLRF       TRISC+0
;p6.c,27 :: 		PORTC=0X00;   //TURNING PORTC OFF
	CLRF       PORTC+0
;p6.c,28 :: 		LCD_INIT();  //LCD DEACLERATION
	CALL       _Lcd_Init+0
;p6.c,29 :: 		LCD_CMD(_LCD_CURSOR_OFF); //TURNING THE LCD CURSOR OFF
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;p6.c,30 :: 		LCD_OUT(1,2,"ENTER PASSWORD"); //DISPLAYING A TEXT ON THE LCD
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_p6+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;p6.c,31 :: 		KEYPAD_INIT();  //KEYPAD DEACLERATION
	CALL       _Keypad_Init+0
;p6.c,32 :: 		}
L_end_initialization:
	RETURN
; end of _initialization

_keyPadInput:

;p6.c,36 :: 		void keyPadInput ()//FUNCTION DEACLERATION
;p6.c,38 :: 		kp = 0;
	CLRF       _kp+0
;p6.c,39 :: 		do {
L_keyPadInput1:
;p6.c,40 :: 		kp = keypad_key_click (); //ASSIGNING THE kp VALUE TO KEYPAD KEY
	CALL       _Keypad_Key_Click+0
	MOVF       R0+0, 0
	MOVWF      _kp+0
;p6.c,43 :: 		while( kp == 0); //WAITIONG FOR A KEYPAD KEY TO BE PRESSED
	MOVF       R0+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_keyPadInput1
;p6.c,44 :: 		}
L_end_keyPadInput:
	RETURN
; end of _keyPadInput

_keyPadInput2:

;p6.c,46 :: 		void keyPadInput2 () //FUNCTION DEACLERATION
;p6.c,48 :: 		kp2 = 0;
	CLRF       _kp2+0
;p6.c,49 :: 		do {
L_keyPadInput24:
;p6.c,50 :: 		kp2 = keypad_key_click (); //ASSIGNING THE kp VALUE TO KEYPAD KEY
	CALL       _Keypad_Key_Click+0
	MOVF       R0+0, 0
	MOVWF      _kp2+0
;p6.c,53 :: 		while( kp2 == 0); //WAITIONG FOR A KEYPAD KEY TO BE PRESSED
	MOVF       R0+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_keyPadInput24
;p6.c,54 :: 		}
L_end_keyPadInput2:
	RETURN
; end of _keyPadInput2

_keyPadInput3:

;p6.c,56 :: 		void keyPadInput3 () //FUNCTION DEACLERATION
;p6.c,58 :: 		kp3 = 0;
	CLRF       _kp3+0
;p6.c,59 :: 		do {
L_keyPadInput37:
;p6.c,60 :: 		kp3 = keypad_key_click (); //ASSIGNING THE kp VALUE TO KEYPAD KEY
	CALL       _Keypad_Key_Click+0
	MOVF       R0+0, 0
	MOVWF      _kp3+0
;p6.c,63 :: 		while( kp3 == 0); //WAITIONG FOR A KEYPAD KEY TO BE PRESSED
	MOVF       R0+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_keyPadInput37
;p6.c,64 :: 		}
L_end_keyPadInput3:
	RETURN
; end of _keyPadInput3

_keyPadInput4:

;p6.c,66 :: 		void keyPadInput4 () //FUNCTION DEACLERATION
;p6.c,68 :: 		kp4 = 0;
	CLRF       _kp4+0
;p6.c,69 :: 		do {
L_keyPadInput410:
;p6.c,70 :: 		kp4 = keypad_key_click (); //ASSIGNING THE kp VALUE TO KEYPAD KEY
	CALL       _Keypad_Key_Click+0
	MOVF       R0+0, 0
	MOVWF      _kp4+0
;p6.c,72 :: 		while( kp4 == 0); //WAITIONG FOR A KEYPAD KEY TO BE PRESSED
	MOVF       R0+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_keyPadInput410
;p6.c,73 :: 		}
L_end_keyPadInput4:
	RETURN
; end of _keyPadInput4

_main:

;p6.c,75 :: 		void main() //STATE OF THE MAIN FUNCTION
;p6.c,77 :: 		initialization(); //FUNCTION CALL
	CALL       _initialization+0
;p6.c,78 :: 		while (1) // STATE OF THE WHILE LOOP
L_main13:
;p6.c,81 :: 		keyPadInput();  //FUNCTION CALL
	CALL       _keyPadInput+0
;p6.c,82 :: 		keyPadInput2(); //FUNCTION CALL
	CALL       _keyPadInput2+0
;p6.c,83 :: 		keyPadInput3(); //FUNCTION CALL
	CALL       _keyPadInput3+0
;p6.c,84 :: 		keyPadInput4(); //FUNCTION CALL
	CALL       _keyPadInput4+0
;p6.c,86 :: 		switch (kp) //CHECKING THE STATE OF THE INPUT
	GOTO       L_main15
;p6.c,88 :: 		case 2:  kp = 50;break;  //2
L_main17:
	MOVLW      50
	MOVWF      _kp+0
	GOTO       L_main16
;p6.c,89 :: 		}
L_main15:
	MOVF       _kp+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_main17
L_main16:
;p6.c,91 :: 		switch (kp2) //CHECKING THE STATE OF THE INPUT
	GOTO       L_main18
;p6.c,93 :: 		case 6:  kp2  = 53;break; //5
L_main20:
	MOVLW      53
	MOVWF      _kp2+0
	GOTO       L_main19
;p6.c,94 :: 		}
L_main18:
	MOVF       _kp2+0, 0
	XORLW      6
	BTFSC      STATUS+0, 2
	GOTO       L_main20
L_main19:
;p6.c,96 :: 		switch (kp3) //CHECKING THE STATE OF THE INPUT
	GOTO       L_main21
;p6.c,98 :: 		case 7:  kp3  = 54;break;  //6
L_main23:
	MOVLW      54
	MOVWF      _kp3+0
	GOTO       L_main22
;p6.c,99 :: 		}
L_main21:
	MOVF       _kp3+0, 0
	XORLW      7
	BTFSC      STATUS+0, 2
	GOTO       L_main23
L_main22:
;p6.c,101 :: 		switch (kp4)  //CHECKING THE STATE OF THE INPUT
	GOTO       L_main24
;p6.c,103 :: 		case 9:  kp4  = 55;break; //7
L_main26:
	MOVLW      55
	MOVWF      _kp4+0
	GOTO       L_main25
;p6.c,104 :: 		}
L_main24:
	MOVF       _kp4+0, 0
	XORLW      9
	BTFSC      STATUS+0, 2
	GOTO       L_main26
L_main25:
;p6.c,106 :: 		if(kp==50 && kp2==53 && kp3==54 && kp4==55  ) //CHECKING THE STATE OF THE INPUT
	MOVF       _kp+0, 0
	XORLW      50
	BTFSS      STATUS+0, 2
	GOTO       L_main29
	MOVF       _kp2+0, 0
	XORLW      53
	BTFSS      STATUS+0, 2
	GOTO       L_main29
	MOVF       _kp3+0, 0
	XORLW      54
	BTFSS      STATUS+0, 2
	GOTO       L_main29
	MOVF       _kp4+0, 0
	XORLW      55
	BTFSS      STATUS+0, 2
	GOTO       L_main29
L__main31:
;p6.c,108 :: 		lcd_cmd(_lcd_clear); //CLEARING THE LCD
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;p6.c,109 :: 		Lcd_Out(1,2,"ACCESS GRANTED"); //WRITING A TEXT ON THE LCD
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_p6+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;p6.c,110 :: 		Lcd_Out(2,4,"DOOR OPEN"); //WRITING A TEXT ON THE LCD
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      4
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_p6+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;p6.c,111 :: 		PORTC.RC5=1;  //TURNING PIN RC5 ONN
	BSF        PORTC+0, 5
;p6.c,112 :: 		PORTC.RC0=1; //TURNING PIN RC0 ONN
	BSF        PORTC+0, 0
;p6.c,114 :: 		}
	GOTO       L_main30
L_main29:
;p6.c,117 :: 		lcd_cmd(_lcd_clear); //CLEARING THE LCD
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;p6.c,118 :: 		Lcd_Out(1,2,"WRONG PASSWORD"); //WRITING A TEXT ON THE LCD
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr4_p6+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;p6.c,119 :: 		delay(); //FUNCTION CALL
	CALL       _delay+0
;p6.c,120 :: 		Lcd_Cmd(_Lcd_Clear); //CLEARING THE LCD
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;p6.c,121 :: 		Lcd_Out(1,3,"ENTER CORRECT"); //WRITING A TEXT ON THE LCD
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      3
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr5_p6+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;p6.c,122 :: 		Lcd_Out(2,5,"PASSWORD"); //WRITING A TEXT ON THE LCD
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      5
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr6_p6+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;p6.c,123 :: 		PORTC.RC5=0;    //TURNING PIN RC5 OFF
	BCF        PORTC+0, 5
;p6.c,124 :: 		PORTC.RC0=0;    //TURNING PIN RC0 OFF
	BCF        PORTC+0, 0
;p6.c,125 :: 		}
L_main30:
;p6.c,128 :: 		} //END OF THE WHILE LOOP
	GOTO       L_main13
;p6.c,129 :: 		} //END OF THE MAIN FUNCTION
L_end_main:
	GOTO       $+0
; end of _main
