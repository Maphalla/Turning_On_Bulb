#line 1 "C:/Users/LENOVO/Desktop/micros/p5/p6.c"
unsigned char kp,kp2,kp3,kp4;
unsigned int i;
char keypadPort at PORTB;

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

void initialization()
{
 ANSEL=ANSELH=0X00;
 TRISB=0XFF;
 TRISD=0X00;
 TRISC=0X00;
 PORTC=0X00;
 LCD_INIT();
 LCD_CMD(_LCD_CURSOR_OFF);
 LCD_OUT(1,2,"ENTER PASSWORD");
 KEYPAD_INIT();
 }



void keyPadInput ()
{
 kp = 0;
 do {
 kp = keypad_key_click ();
 }

 while( kp == 0);
 }

 void keyPadInput2 ()
 {
 kp2 = 0;
 do {
 kp2 = keypad_key_click ();
 }

 while( kp2 == 0);
 }

 void keyPadInput3 ()
 {
 kp3 = 0;
 do {
 kp3 = keypad_key_click ();
 }

 while( kp3 == 0);
 }

 void keyPadInput4 ()
 {
 kp4 = 0;
 do {
 kp4 = keypad_key_click ();
 }
 while( kp4 == 0);
 }

void main()
{
 initialization();
 while (1)
 {

 keyPadInput();
 keyPadInput2();
 keyPadInput3();
 keyPadInput4();

 switch (kp)
 {
 case 2: kp = 50;break;
 }

 switch (kp2)
 {
 case 6: kp2 = 53;break;
 }

 switch (kp3)
 {
 case 7: kp3 = 54;break;
 }

 switch (kp4)
 {
 case 9: kp4 = 55;break;
 }

 if(kp==50 && kp2==53 && kp3==54 && kp4==55 )
 {
 lcd_cmd(_lcd_clear);
 Lcd_Out(1,2,"ACCESS GRANTED");
 Lcd_Out(2,4,"DOOR OPEN");
 PORTC.RC5=1;
 PORTC.RC0=1;

 }
 else
 {
 lcd_cmd(_lcd_clear);
 Lcd_Out(1,2,"WRONG PASSWORD");
 delay();
 Lcd_Cmd(_Lcd_Clear);
 Lcd_Out(1,3,"ENTER CORRECT");
 Lcd_Out(2,5,"PASSWORD");
 PORTC.RC5=0;
 PORTC.RC0=0;
 }


}
 }
