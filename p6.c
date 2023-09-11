unsigned char kp,kp2,kp3,kp4; //VARIABLES DEACLERATION
unsigned int i;
char keypadPort at PORTB; //CONNECTION THE KEYPAD A PORTB

sbit LCD_EN at RD5_bit;
sbit LCD_RS at RD4_bit;
sbit LCD_D4 at RD0_bit;
sbit LCD_D5 at RD1_bit;
sbit LCD_D6 at RD2_bit;
sbit LCD_D7 at RD3_bit;

sbit LCD_RS_Direction at TRISD4_bit;
sbit LCD_EN_Direction at TRISD5_bit;
sbit LCD_D4_Direction at TRISD0_bit;
sbit LCD_D5_Direction at TRISD1_bit;
sbit LCD_D6_Direction at TRISD2_bit;
sbit LCD_D7_Direction at TRISD3_bit;

void delay(){delay_ms(1000);}

void initialization() //FUNTION DEACLERATION
{
  ANSEL=ANSELH=0X00; //CONFIGURING ALL THE OI'S AS DIGITAL PINS
  TRISB=0XFF; //KEYPAD
  TRISD=0X00; //LCD
  TRISC=0X00; //MAKING PORTC AN OUTPUT
  PORTC=0X00;   //TURNING PORTC OFF
  LCD_INIT();  //LCD DEACLERATION
  LCD_CMD(_LCD_CURSOR_OFF); //TURNING THE LCD CURSOR OFF
  LCD_OUT(1,2,"ENTER PASSWORD"); //DISPLAYING A TEXT ON THE LCD
  KEYPAD_INIT();  //KEYPAD DEACLERATION
  }

//void delay(){delay_ms(50);}

void keyPadInput ()//FUNCTION DEACLERATION
{
  kp = 0;
  do {
      kp = keypad_key_click (); //ASSIGNING THE kp VALUE TO KEYPAD KEY
     }

  while( kp == 0); //WAITIONG FOR A KEYPAD KEY TO BE PRESSED
 }

 void keyPadInput2 () //FUNCTION DEACLERATION
 {
  kp2 = 0;
  do {
      kp2 = keypad_key_click (); //ASSIGNING THE kp VALUE TO KEYPAD KEY
     }

  while( kp2 == 0); //WAITIONG FOR A KEYPAD KEY TO BE PRESSED
 }
 
 void keyPadInput3 () //FUNCTION DEACLERATION
 {
  kp3 = 0;
  do {
      kp3 = keypad_key_click (); //ASSIGNING THE kp VALUE TO KEYPAD KEY
     }

  while( kp3 == 0); //WAITIONG FOR A KEYPAD KEY TO BE PRESSED
 }

 void keyPadInput4 () //FUNCTION DEACLERATION
 {
  kp4 = 0;
  do {
      kp4 = keypad_key_click (); //ASSIGNING THE kp VALUE TO KEYPAD KEY
     }
  while( kp4 == 0); //WAITIONG FOR A KEYPAD KEY TO BE PRESSED
 }

void main() //STATE OF THE MAIN FUNCTION
{
     initialization(); //FUNCTION CALL
 while (1) // STATE OF THE WHILE LOOP
 {

      keyPadInput();  //FUNCTION CALL
      keyPadInput2(); //FUNCTION CALL
      keyPadInput3(); //FUNCTION CALL
      keyPadInput4(); //FUNCTION CALL

      switch (kp) //CHECKING THE STATE OF THE INPUT
      {
      case 2:  kp = 50;break;  //2
      }

      switch (kp2) //CHECKING THE STATE OF THE INPUT
      {
      case 6:  kp2  = 53;break; //5
      }
    
      switch (kp3) //CHECKING THE STATE OF THE INPUT
      {
      case 7:  kp3  = 54;break;  //6
      }
    
      switch (kp4)  //CHECKING THE STATE OF THE INPUT
      {
      case 9:  kp4  = 55;break; //7
      }
                           //PASSWORD = 2567
      if(kp==50 && kp2==53 && kp3==54 && kp4==55  ) //CHECKING THE STATE OF THE INPUT
      {
         lcd_cmd(_lcd_clear); //CLEARING THE LCD
         Lcd_Out(1,2,"ACCESS GRANTED"); //WRITING A TEXT ON THE LCD
         Lcd_Out(2,4,"DOOR OPEN"); //WRITING A TEXT ON THE LCD
         PORTC.RC5=1;  //TURNING PIN RC5 ONN
         PORTC.RC0=1; //TURNING PIN RC0 ONN

      }
      else
      {
         lcd_cmd(_lcd_clear); //CLEARING THE LCD
         Lcd_Out(1,2,"WRONG PASSWORD"); //WRITING A TEXT ON THE LCD
         delay(); //FUNCTION CALL
         Lcd_Cmd(_Lcd_Clear); //CLEARING THE LCD
         Lcd_Out(1,3,"ENTER CORRECT"); //WRITING A TEXT ON THE LCD
         Lcd_Out(2,5,"PASSWORD"); //WRITING A TEXT ON THE LCD
         PORTC.RC5=0;    //TURNING PIN RC5 OFF
         PORTC.RC0=0;    //TURNING PIN RC0 OFF
      }


} //END OF THE WHILE LOOP
 } //END OF THE MAIN FUNCTION