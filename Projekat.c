#include <stdlib.h>
#include "Click_MPU_9DOF_types.h"
#include "Click_MPU_9DOF_config.h"
//MPU

// Bitmapa koja predstavlja mrezu
const code char net_bmp[264] = {
      51, 206, 51, 206, 51, 206, 51, 206, 51, 206, 51, 206, 51, 206, 51, 206, 51, 206, 51, 206, 51, 206, 51, 206,
      51, 206, 51, 206, 51, 206, 51, 206, 51, 206, 51, 206, 51, 206, 51, 206, 51, 206, 51, 206, 51, 206, 51, 206,
      51, 206, 51, 206, 51, 206, 51, 206, 51, 206, 51, 206, 51, 206, 51, 206, 51, 206, 51, 206, 51, 206, 51, 206,
      51, 206, 51, 206, 51, 206, 51, 206, 51, 206, 51, 206, 51, 206, 51, 206, 51, 206, 51, 206, 51, 206, 51, 206,
      51, 206, 51, 206, 51, 206, 51, 206, 51, 206, 51, 206, 51, 206, 51, 206, 51, 206, 51, 206, 51, 206, 51, 206,
      51, 206, 51, 206, 51, 206, 51, 206, 51, 206, 51, 206, 51, 206, 51, 206, 51, 206, 51, 206, 51, 206, 51, 206,
      51, 206, 51, 206, 51, 206, 51, 206, 51, 206, 51, 206, 51, 206, 51, 206, 51, 206, 51, 206, 51, 206, 51, 206,
      51, 206, 51, 206, 51, 206, 51, 206, 51, 206, 51, 206, 51, 206, 51, 206, 51, 206, 51, 206, 51, 206, 51, 206,
      51, 206, 51, 206, 51, 206, 51, 206, 51, 206, 51, 206, 51, 206, 51, 206, 51, 206, 51, 206, 51, 206, 51, 206,
      51, 206, 51, 206, 51, 206, 51, 206, 51, 206, 51, 206, 51, 206, 51, 206, 51, 206, 51, 206, 51, 206, 51, 206,
      51, 206, 51, 206, 51, 206, 51, 206, 51, 206, 51, 206, 51, 206, 51, 206, 51, 206, 51, 206, 51, 206, 51, 206,
 };

// Definisanje pinova Glcd modula
char GLCD_DataPort at PORTD;

sbit GLCD_CS1 at RB0_bit;
sbit GLCD_CS2 at RB1_bit;
sbit GLCD_RS  at RB2_bit;
sbit GLCD_RW  at RB3_bit;
sbit GLCD_EN  at RB4_bit;
sbit GLCD_RST at RB5_bit;

sbit GLCD_CS1_Direction at TRISB0_bit;
sbit GLCD_CS2_Direction at TRISB1_bit;
sbit GLCD_RS_Direction  at TRISB2_bit;
sbit GLCD_RW_Direction  at TRISB3_bit;
sbit GLCD_EN_Direction  at TRISB4_bit;
sbit GLCD_RST_Direction at TRISB5_bit;

// inicijalizacija pocetnih vrijednosti
int gameMode = 0, score = 8;
int netX =0, netY=0, netW, netH;
int16_t AxN;
int16_t AyN;
int16_t AzN;
double  tx=1, ty=1, Ax=0, Ay=0, Axtemp=0, Aytemp=0, VxTemp=0, VyTemp=0, Xtemp=0, Ytemp=0;
double AxUsp = 0, AyUsp = 0, Vx=0, Vy=0, XPr=0, YPr=0, Cvx=0, Cvy=0, Cx=0, Cy=0, X=0, Y=0;
const double uspConst = 0.3, bounce = 0.8;
int clearCondition=0, netPosition=0;

char temp[7];

enum game {intro, on, off} game;
enum netContact {clear, contact, stop} netContact;
enum wallHit {noHit, Hit} wallHit;
enum directionX {NaNX, left, right} directionX;
enum directionY {NaNY, up, down} directionY;

void init(){
    mikrobus_gpioInit(_MIKROBUS1,_MIKROBUS_INT_PIN, _GPIO_INPUT );
    mikrobus_gpioInit( _MIKROBUS1, _MIKROBUS_RST_PIN, _GPIO_OUTPUT );
    mikrobus_i2cInit( _MIKROBUS1, &_MPU9DOF_I2C_CFG[0] );
    mikrobus_logInit( _MIKROBUS2, 9600 );
    Delay_100ms();
    mpu9dof_i2cDriverInit( (T_MPU9DOF_P)&_MIKROBUS1_GPIO, (T_MPU9DOF_P)&_MIKROBUS1_I2C, _MPU9DOF_XLG_I2C_ADDR_0 );
    Delay_10ms();


    /* Chip reset */
    mpu9dof_writeData( _MPU9DOF_PWR_MGMT_1, _MPU9DOF_BIT_H_RESET);
    Delay_10ms();


    /* Initialize accel & gyro */
    mpu9dof_writeData( _MPU9DOF_SMPLRT_DIV,_MPU9DOF_DEFAULT );
    Delay_10ms();
    mpu9dof_writeData( _MPU9DOF_CONFIG, _MPU9DOF_BITS_DLPF_CFG_42HZ);
    Delay_10ms();
    mpu9dof_writeData( _MPU9DOF_GYRO_CONFIG, _MPU9DOF_BITS_FS_1000DPS);
    Delay_10ms();
    mpu9dof_writeData( _MPU9DOF_ACCEL_CONFIG, _MPU9DOF_BITS_AFSL_SEL_8G);
    Delay_10ms();
    


    // Disable FIFOs
    mpu9dof_writeData( _MPU9DOF_FIFO_EN , _MPU9DOF_BIT_FIFO_DIS);
    Delay_10ms();

     
    // Bypass mode enabled
    mpu9dof_writeData( _MPU9DOF_INT_PIN_CFG , _MPU9DOF_BIT_INT_PIN_CFG);
    Delay_10ms();

     
    // Disable all interrupts
    mpu9dof_writeData(_MPU9DOF_INT_ENABLE , _MPU9DOF_DEFAULT);
    Delay_10ms();

    // No FIFO and no I2C slaves
    mpu9dof_writeData( _MPU9DOF_USER_CTRL , _MPU9DOF_DEFAULT);
    Delay_10ms();

    // No power management, internal clock source
    mpu9dof_writeData( _MPU9DOF_PWR_MGMT_1, _MPU9DOF_DEFAULT);
    Delay_10ms();
    mpu9dof_writeData( _MPU9DOF_PWR_MGMT_2, _MPU9DOF_DEFAULT);
    Delay_10ms();
}

static void update(char dir){
   if(dir == 'X') {
      tx=1;
      Cvx = Vx;
      Cx = X;
   }
   else {
      ty=1;
      Cvy = Vy;
      Cy = Y;
   }
}

//mehanika udara o zid
static int wallColision(int value, char wall) {
   if (wall=='X') {
      if (X>value) {
         X=value-(value-Xpr)/3;
      }
      else {
         X=value+((Xpr-value)/3);
      }
      Vx = 0;
      Cvx=0;
      Cx=X;
      tx=1;
      wallHit= hit;
      return X;
   }
   else {
      if (Y>value) {
         Y=ceil(value-(value-Ypr)/3);
      }
      else {
         Y=value+((Ypr-value)/3);
      }
      Vy = 0;
      Cvy=0;
      Cy=Y;
      ty=1;
      wallHit= hit;
      return Y;
   }
}

void setNet(int n1, int n2, int n3,int n4, char c1, double d1, double d2) {
     netX=n1;
     netY=n2;
     netW=n3;
     netH=n4;
     Cx=d1;
     Cy=d2;
     X=Cx;
     Y=Cy;
}

void netHit(int n){
     netContact=contact;
     Ax=-1*Vx*0.4;
     Ay=-1*Vy*0.4;
     Cvx=Vx;
     Cvy=Vy;
     clearCondition=n;
}

void screenInit(){
     Glcd_Fill(0x00);
     Glcd_Rectangle(0,0,127,63,1);
}

void gameInit(){
     screenInit();
     clearCondition=0;
     netPosition=0;
     netContact = stop;
     game = intro;
     gameMode=0;
     score = 8;
}

void main() {
     init();
     Glcd_Init();
     gameInit();
     ANCON2=0;
     TRISH=3;

     UART1_init(9600);
     delay_ms(20);

     while(1){
       switch (game) {
          case 0:{
             glcd_fill(0x00);
             delay_ms(10);
             Glcd_Write_Text("Welcome", 0, 0, 1);
             Glcd_Write_Text("1 level = 1 point", 0, 1, 1);
             Glcd_Write_Text("Skip level = 0 points", 0, 2, 1);
             Glcd_Write_Text("RH1 = skip", 0, 4, 1);
             Glcd_Write_Text("Start - RH0", 0, 5, 1);
             Glcd_Write_Text("Good luck", 0, 7, 1);
             delay_ms(400);
             while(1){
                if(RH0_bit==1) {glcd_fill(0x00); break;}
             }
          }
          case 1:{

             while(game==0) {
               if(netContact != 2) {
                   Xpr=X;
                   Ypr=Y;

                   tx+=1;
                   ty+=1;
                   glcd_partialImage(netX, netY, netW, netH, netW, netH, net_bmp);

                   //ocitavanje ubrzanja
                   if (netContact==0){
                       mpu9dof_readAccel(&AxN, &AyN, &AzN);
                       Axtemp = (-1*(AxN)>>7);
                       if(Ax!=Axtemp){
                           Ax=Axtemp;
                           update('X');
                       }
                       Aytemp = (AyN)>>7;
                       if(Ay!=Aytemp){
                           Ay=Aytemp;
                           update('Y');
                       }
                   } else {
                       Ax=0;
                       Ay=0;
                       update('X');
                       update('Y');
                   }

                   if(netContact==0){
                   if (netW==30) {      //vertikalna mreza
                      if(netX==60) {      //sa desne strane
                         netPosition=1;
                         if(X>=netX){
                           netHit(1);
                           update('X');
                           update('Y');
                         }
                      }
                      else if(netX==30){              // sa lijeve strane
                         netPosition=2;
                         if (X<netX+netW){
                           netHit(2);
                           update('X');
                           update('Y');
                         }
                      }
                   }

                   else {                 //horizontalna mreza
                      if(netY==20){       //sa gornje strane
                         netPosition=3;
                         if(Y<netY+netH){
                            netHit(3);
                            update('Y');
                           update('X');
                         }
                      }
                      else if (netY==30){              //sa donje strane
                         netPosition=4;
                         if(Y>netY){
                            netHit(4);
                            update('Y');
                           update('X');
                         }
                      }
                   }
                   }

                   //Proracun usporenja
                   if (Vx!=0) {
                      AxUsp = uspConst*(Vx)*(-1);
                   }  else AxUsp = 0;

                   if (Vy!=0) {
                      AyUsp = uspConst*(Vy)*(-1);
                   }  else AyUsp = 0;


                   //Proracun brzine i pozicije
                   Vx = (Ax+AxUsp)*tx + Cvx;
                   Vy = (Ay+AyUsp)*ty + Cvy;

                   X = (Vx+VxTemp)*tx+Cx;
                   Y = (Vy+VyTemp)*ty+Cy;

                   if (X-floor(X)>0.5) X=ceil(X); else X=floor(X);
                   if (Y-floor(Y)>0.5) Y=ceil(Y); else Y=floor(Y);


                   intToStr(Vy, temp);
                   UART1_Write_Text(temp);

                   //Provjera promjene smijera kretanja
                   if (XPr!=0 && ((directionX==right && X/Xpr<1) || (directionX==left && X/Xpr>1))) {
                       if (wallHit == noHit){
                          if(netContact==2){
                             Ax=0;
                             Vx=0;
                             Cvx=0;
                             X=Cx;
                             Cx=0;
                          }
                          X=XPr;
                          Cx=X;
                          Vx=0;
                          Cvx=0;
                          tx=0;
                          if(Ax>0) directionX=right;
                          if(Ax<0) directionX=left;

                       }

                   }

                   if (YPr!=0 && ((directionY==up && Y/Ypr<1) || (directionY==down && Y/Ypr>1))) {
                      if(wallHit==noHit){
                         if(netContact==2){
                             Ay=0;
                             Vy=0;
                             Cvy=0;
                             Y=Cx;
                             Cy=0;
                         }
                         Y=YPr;
                         Cy=Y;
                         Vy=0;
                         Cvy=0;
                         ty=0;
                         if(Ay>0) directionY=up;
                         if(Ay<0) directionY=down;
                      }
                   }


                   if (wallHit == hit) {
                      wallHit = noHit;
                   }

                   Xtemp=Xpr+(X-Xpr)/2;
                   Ytemp=Ypr+(Y-Ypr)/2;
                   //Provjera udara o zid
                   if (X>122) {
                      if(netPosition==1) netPosition=0;
                      else {
                           X=wallColision(122, 'X');
                           Xtemp=122;
                      }
                      
                      
                   }

                   if (X<5) {
                      if(netPosition==2) netPosition=0;
                      else {
                           X=wallColision(5, 'X');
                           Xtemp=5;
                      }
                   }

                   if (Y<5) {
                      if(netPosition==3) netPosition=0;
                      else {
                           Y=wallColision(5, 'Y');
                           Ytemp=5;
                      }
                   }

                   if (Y>58){
                      if(netPosition==4) netPosition=0;
                      else {
                           Y=wallColision(58, 'Y');
                           Ytemp=58;
                      }
                   }
                   if(wallHit==1) {
                      Glcd_Circle_Fill(Xtemp, Ytemp, 4, 1);
                      delay_ms(60);
                      Glcd_Circle_Fill(Xtemp, Ytemp, 4, 0);
                   }


                   if (netContact==1 && X==Xpr && Y==Ypr) netContact=2;
                   if (RH1_bit==1) {gameMode++; netContact=2; score--; delay_ms(300); };

                   Glcd_Circle_Fill(Xpr, Ypr, 4, 0);
                   Glcd_Circle_Fill(X, Y, 4, 1);
                   delay_ms(150);
               }
               else {

                  netContact=clear;
                  Ax=0;
                  Ay=0;
                  Vx=0;
                  Cvx=0;
                  Vy=0;
                  Cvy=0;
                  if(netPosition!=0){
                    switch(clearCondition) {
                       case 1: {
                          if(X>90 && X<122) gameMode++;
                          break;
                       }
                       case 2: {
                          if(X>5 && X<25) gameMode++;
                          break;
                       }
                       case 3: {
                          if(Y>5 && Y<16) gameMode++;
                          break;
                       }
                       case 4: {
                          if(Y>44 && Y<58) gameMode++;
                          break;
                       }
                       default: {break;}
                    }
                  }
                  switch(gameMode) {
                    case 0: {
                         setNet(60, 0, 30, 64, 'X', 5, 28);
                       break;
                    }
                    case 1: {
                         setNet(60, 0, 30, 64, 'X', 40, 28);
                       break;
                    }
                    case 2: {
                         setNet(30, 0, 30, 64, 'X', 115, 28);
                       break;
                    }
                    case 3: {
                         setNet(30, 0, 30, 64, 'X', 70, 28);
                       break;
                    }
                    case 4: {
                         setNet(0, 20, 128, 14, 'Y', 57, 50);
                       break;
                    }
                    case 5: {
                         setNet(0, 20, 128, 14, 'Y', 56,40);
                       break;
                    }
                    case 6: {
                         setNet(0, 30, 128, 14, 'Y', 56, 5);
                       break;
                    }
                    case 7: {
                         setNet(0, 30, 128, 14, 'Y', 56, 22);
                       break;
                    }
                    default: {
                       game = off;
                    }
                  }

                  screenInit();

               }
             }
          }
          case 2: {
               intToStr(score, temp);
               glcd_fill(0x00);
               Glcd_Write_Text("Finish", 0, 0, 1);
               Glcd_Write_Text("Score", 0, 2, 1);
               Glcd_Write_Text(temp, 30, 2, 1);
               Glcd_Write_Text("Restart ->RH0", 0, 4, 1);
               while(1){
                  if(RH0_bit==1) {
                     gameInit();
                     break;
                  }
               }
          }
       }
     }
     
}

