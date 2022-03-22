
_init:

;Projekat.c,55 :: 		void init(){
;Projekat.c,56 :: 		mikrobus_gpioInit(_MIKROBUS1,_MIKROBUS_INT_PIN, _GPIO_INPUT );
	CLRF        FARG_mikrobus_gpioInit_bus+0 
	MOVLW       7
	MOVWF       FARG_mikrobus_gpioInit_pin+0 
	MOVLW       1
	MOVWF       FARG_mikrobus_gpioInit_direction+0 
	CALL        _mikrobus_gpioInit+0, 0
;Projekat.c,57 :: 		mikrobus_gpioInit( _MIKROBUS1, _MIKROBUS_RST_PIN, _GPIO_OUTPUT );
	CLRF        FARG_mikrobus_gpioInit_bus+0 
	MOVLW       1
	MOVWF       FARG_mikrobus_gpioInit_pin+0 
	CLRF        FARG_mikrobus_gpioInit_direction+0 
	CALL        _mikrobus_gpioInit+0, 0
;Projekat.c,58 :: 		mikrobus_i2cInit( _MIKROBUS1, &_MPU9DOF_I2C_CFG[0] );
	CLRF        FARG_mikrobus_i2cInit_bus+0 
	MOVLW       __MPU9DOF_I2C_CFG+0
	MOVWF       FARG_mikrobus_i2cInit_cfg+0 
	MOVLW       hi_addr(__MPU9DOF_I2C_CFG+0)
	MOVWF       FARG_mikrobus_i2cInit_cfg+1 
	MOVLW       higher_addr(__MPU9DOF_I2C_CFG+0)
	MOVWF       FARG_mikrobus_i2cInit_cfg+2 
	CALL        _mikrobus_i2cInit+0, 0
;Projekat.c,59 :: 		mikrobus_logInit( _MIKROBUS2, 9600 );
	MOVLW       1
	MOVWF       FARG_mikrobus_logInit_port+0 
	MOVLW       128
	MOVWF       FARG_mikrobus_logInit_baud+0 
	MOVLW       37
	MOVWF       FARG_mikrobus_logInit_baud+1 
	MOVLW       0
	MOVWF       FARG_mikrobus_logInit_baud+2 
	MOVWF       FARG_mikrobus_logInit_baud+3 
	CALL        _mikrobus_logInit+0, 0
;Projekat.c,60 :: 		Delay_100ms();
	CALL        _Delay_100ms+0, 0
;Projekat.c,61 :: 		mpu9dof_i2cDriverInit( (T_MPU9DOF_P)&_MIKROBUS1_GPIO, (T_MPU9DOF_P)&_MIKROBUS1_I2C, _MPU9DOF_XLG_I2C_ADDR_0 );
	MOVLW       __MIKROBUS1_GPIO+0
	MOVWF       FARG_mpu9dof_i2cDriverInit_gpioObj+0 
	MOVLW       hi_addr(__MIKROBUS1_GPIO+0)
	MOVWF       FARG_mpu9dof_i2cDriverInit_gpioObj+1 
	MOVLW       higher_addr(__MIKROBUS1_GPIO+0)
	MOVWF       FARG_mpu9dof_i2cDriverInit_gpioObj+2 
	MOVLW       __MIKROBUS1_I2C+0
	MOVWF       FARG_mpu9dof_i2cDriverInit_i2cObj+0 
	MOVLW       hi_addr(__MIKROBUS1_I2C+0)
	MOVWF       FARG_mpu9dof_i2cDriverInit_i2cObj+1 
	MOVLW       higher_addr(__MIKROBUS1_I2C+0)
	MOVWF       FARG_mpu9dof_i2cDriverInit_i2cObj+2 
	MOVLW       104
	MOVWF       FARG_mpu9dof_i2cDriverInit_slave+0 
	CALL        _mpu9dof_i2cDriverInit+0, 0
;Projekat.c,62 :: 		Delay_10ms();
	CALL        _Delay_10ms+0, 0
;Projekat.c,66 :: 		mpu9dof_writeData( _MPU9DOF_PWR_MGMT_1, _MPU9DOF_BIT_H_RESET);
	MOVLW       107
	MOVWF       FARG_mpu9dof_writeData_address+0 
	MOVLW       128
	MOVWF       FARG_mpu9dof_writeData_writeCommand+0 
	CALL        _mpu9dof_writeData+0, 0
;Projekat.c,67 :: 		Delay_10ms();
	CALL        _Delay_10ms+0, 0
;Projekat.c,71 :: 		mpu9dof_writeData( _MPU9DOF_SMPLRT_DIV,_MPU9DOF_DEFAULT );
	MOVLW       25
	MOVWF       FARG_mpu9dof_writeData_address+0 
	CLRF        FARG_mpu9dof_writeData_writeCommand+0 
	CALL        _mpu9dof_writeData+0, 0
;Projekat.c,72 :: 		Delay_10ms();
	CALL        _Delay_10ms+0, 0
;Projekat.c,73 :: 		mpu9dof_writeData( _MPU9DOF_CONFIG, _MPU9DOF_BITS_DLPF_CFG_42HZ);
	MOVLW       26
	MOVWF       FARG_mpu9dof_writeData_address+0 
	MOVLW       3
	MOVWF       FARG_mpu9dof_writeData_writeCommand+0 
	CALL        _mpu9dof_writeData+0, 0
;Projekat.c,74 :: 		Delay_10ms();
	CALL        _Delay_10ms+0, 0
;Projekat.c,75 :: 		mpu9dof_writeData( _MPU9DOF_GYRO_CONFIG, _MPU9DOF_BITS_FS_1000DPS);
	MOVLW       27
	MOVWF       FARG_mpu9dof_writeData_address+0 
	MOVLW       16
	MOVWF       FARG_mpu9dof_writeData_writeCommand+0 
	CALL        _mpu9dof_writeData+0, 0
;Projekat.c,76 :: 		Delay_10ms();
	CALL        _Delay_10ms+0, 0
;Projekat.c,77 :: 		mpu9dof_writeData( _MPU9DOF_ACCEL_CONFIG, _MPU9DOF_BITS_AFSL_SEL_8G);
	MOVLW       28
	MOVWF       FARG_mpu9dof_writeData_address+0 
	MOVLW       16
	MOVWF       FARG_mpu9dof_writeData_writeCommand+0 
	CALL        _mpu9dof_writeData+0, 0
;Projekat.c,78 :: 		Delay_10ms();
	CALL        _Delay_10ms+0, 0
;Projekat.c,83 :: 		mpu9dof_writeData( _MPU9DOF_FIFO_EN , _MPU9DOF_BIT_FIFO_DIS);
	MOVLW       35
	MOVWF       FARG_mpu9dof_writeData_address+0 
	CLRF        FARG_mpu9dof_writeData_writeCommand+0 
	CALL        _mpu9dof_writeData+0, 0
;Projekat.c,84 :: 		Delay_10ms();
	CALL        _Delay_10ms+0, 0
;Projekat.c,88 :: 		mpu9dof_writeData( _MPU9DOF_INT_PIN_CFG , _MPU9DOF_BIT_INT_PIN_CFG);
	MOVLW       55
	MOVWF       FARG_mpu9dof_writeData_address+0 
	MOVLW       2
	MOVWF       FARG_mpu9dof_writeData_writeCommand+0 
	CALL        _mpu9dof_writeData+0, 0
;Projekat.c,89 :: 		Delay_10ms();
	CALL        _Delay_10ms+0, 0
;Projekat.c,93 :: 		mpu9dof_writeData(_MPU9DOF_INT_ENABLE , _MPU9DOF_DEFAULT);
	MOVLW       56
	MOVWF       FARG_mpu9dof_writeData_address+0 
	CLRF        FARG_mpu9dof_writeData_writeCommand+0 
	CALL        _mpu9dof_writeData+0, 0
;Projekat.c,94 :: 		Delay_10ms();
	CALL        _Delay_10ms+0, 0
;Projekat.c,97 :: 		mpu9dof_writeData( _MPU9DOF_USER_CTRL , _MPU9DOF_DEFAULT);
	MOVLW       106
	MOVWF       FARG_mpu9dof_writeData_address+0 
	CLRF        FARG_mpu9dof_writeData_writeCommand+0 
	CALL        _mpu9dof_writeData+0, 0
;Projekat.c,98 :: 		Delay_10ms();
	CALL        _Delay_10ms+0, 0
;Projekat.c,101 :: 		mpu9dof_writeData( _MPU9DOF_PWR_MGMT_1, _MPU9DOF_DEFAULT);
	MOVLW       107
	MOVWF       FARG_mpu9dof_writeData_address+0 
	CLRF        FARG_mpu9dof_writeData_writeCommand+0 
	CALL        _mpu9dof_writeData+0, 0
;Projekat.c,102 :: 		Delay_10ms();
	CALL        _Delay_10ms+0, 0
;Projekat.c,103 :: 		mpu9dof_writeData( _MPU9DOF_PWR_MGMT_2, _MPU9DOF_DEFAULT);
	MOVLW       108
	MOVWF       FARG_mpu9dof_writeData_address+0 
	CLRF        FARG_mpu9dof_writeData_writeCommand+0 
	CALL        _mpu9dof_writeData+0, 0
;Projekat.c,104 :: 		Delay_10ms();
	CALL        _Delay_10ms+0, 0
;Projekat.c,105 :: 		}
L_end_init:
	RETURN      0
; end of _init

Projekat_update:

;Projekat.c,107 :: 		static void update(char dir){
;Projekat.c,108 :: 		if(dir == 'X') {
	MOVF        FARG_Projekat_update_dir+0, 0 
	XORLW       88
	BTFSS       STATUS+0, 2 
	GOTO        L_Projekat_update0
;Projekat.c,109 :: 		tx=1;
	MOVLW       0
	MOVWF       _tx+0 
	MOVLW       0
	MOVWF       _tx+1 
	MOVLW       0
	MOVWF       _tx+2 
	MOVLW       127
	MOVWF       _tx+3 
;Projekat.c,110 :: 		Cvx = Vx;
	MOVF        _Vx+0, 0 
	MOVWF       _Cvx+0 
	MOVF        _Vx+1, 0 
	MOVWF       _Cvx+1 
	MOVF        _Vx+2, 0 
	MOVWF       _Cvx+2 
	MOVF        _Vx+3, 0 
	MOVWF       _Cvx+3 
;Projekat.c,111 :: 		Cx = X;
	MOVF        _X+0, 0 
	MOVWF       _Cx+0 
	MOVF        _X+1, 0 
	MOVWF       _Cx+1 
	MOVF        _X+2, 0 
	MOVWF       _Cx+2 
	MOVF        _X+3, 0 
	MOVWF       _Cx+3 
;Projekat.c,112 :: 		}
	GOTO        L_Projekat_update1
L_Projekat_update0:
;Projekat.c,114 :: 		ty=1;
	MOVLW       0
	MOVWF       _ty+0 
	MOVLW       0
	MOVWF       _ty+1 
	MOVLW       0
	MOVWF       _ty+2 
	MOVLW       127
	MOVWF       _ty+3 
;Projekat.c,115 :: 		Cvy = Vy;
	MOVF        _Vy+0, 0 
	MOVWF       _Cvy+0 
	MOVF        _Vy+1, 0 
	MOVWF       _Cvy+1 
	MOVF        _Vy+2, 0 
	MOVWF       _Cvy+2 
	MOVF        _Vy+3, 0 
	MOVWF       _Cvy+3 
;Projekat.c,116 :: 		Cy = Y;
	MOVF        _Y+0, 0 
	MOVWF       _Cy+0 
	MOVF        _Y+1, 0 
	MOVWF       _Cy+1 
	MOVF        _Y+2, 0 
	MOVWF       _Cy+2 
	MOVF        _Y+3, 0 
	MOVWF       _Cy+3 
;Projekat.c,117 :: 		}
L_Projekat_update1:
;Projekat.c,118 :: 		}
L_end_update:
	RETURN      0
; end of Projekat_update

Projekat_wallColision:

;Projekat.c,121 :: 		static int wallColision(int value, char wall) {
;Projekat.c,122 :: 		if (wall=='X') {
	MOVF        FARG_Projekat_wallColision_wall+0, 0 
	XORLW       88
	BTFSS       STATUS+0, 2 
	GOTO        L_Projekat_wallColision2
;Projekat.c,123 :: 		if (X>value) {
	MOVF        FARG_Projekat_wallColision_value+0, 0 
	MOVWF       R0 
	MOVF        FARG_Projekat_wallColision_value+1, 0 
	MOVWF       R1 
	CALL        _int2double+0, 0
	MOVF        _X+0, 0 
	MOVWF       R4 
	MOVF        _X+1, 0 
	MOVWF       R5 
	MOVF        _X+2, 0 
	MOVWF       R6 
	MOVF        _X+3, 0 
	MOVWF       R7 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_Projekat_wallColision3
;Projekat.c,124 :: 		X=value-(value-Xpr)/3;
	MOVF        FARG_Projekat_wallColision_value+0, 0 
	MOVWF       R0 
	MOVF        FARG_Projekat_wallColision_value+1, 0 
	MOVWF       R1 
	CALL        _int2double+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC_Projekat_wallColision+0 
	MOVF        R1, 0 
	MOVWF       FLOC_Projekat_wallColision+1 
	MOVF        R2, 0 
	MOVWF       FLOC_Projekat_wallColision+2 
	MOVF        R3, 0 
	MOVWF       FLOC_Projekat_wallColision+3 
	MOVF        _XPr+0, 0 
	MOVWF       R4 
	MOVF        _XPr+1, 0 
	MOVWF       R5 
	MOVF        _XPr+2, 0 
	MOVWF       R6 
	MOVF        _XPr+3, 0 
	MOVWF       R7 
	MOVF        FLOC_Projekat_wallColision+0, 0 
	MOVWF       R0 
	MOVF        FLOC_Projekat_wallColision+1, 0 
	MOVWF       R1 
	MOVF        FLOC_Projekat_wallColision+2, 0 
	MOVWF       R2 
	MOVF        FLOC_Projekat_wallColision+3, 0 
	MOVWF       R3 
	CALL        _Sub_32x32_FP+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       64
	MOVWF       R6 
	MOVLW       128
	MOVWF       R7 
	CALL        _Div_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       R4 
	MOVF        R1, 0 
	MOVWF       R5 
	MOVF        R2, 0 
	MOVWF       R6 
	MOVF        R3, 0 
	MOVWF       R7 
	MOVF        FLOC_Projekat_wallColision+0, 0 
	MOVWF       R0 
	MOVF        FLOC_Projekat_wallColision+1, 0 
	MOVWF       R1 
	MOVF        FLOC_Projekat_wallColision+2, 0 
	MOVWF       R2 
	MOVF        FLOC_Projekat_wallColision+3, 0 
	MOVWF       R3 
	CALL        _Sub_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _X+0 
	MOVF        R1, 0 
	MOVWF       _X+1 
	MOVF        R2, 0 
	MOVWF       _X+2 
	MOVF        R3, 0 
	MOVWF       _X+3 
;Projekat.c,125 :: 		}
	GOTO        L_Projekat_wallColision4
L_Projekat_wallColision3:
;Projekat.c,127 :: 		X=value+((Xpr-value)/3);
	MOVF        FARG_Projekat_wallColision_value+0, 0 
	MOVWF       R0 
	MOVF        FARG_Projekat_wallColision_value+1, 0 
	MOVWF       R1 
	CALL        _int2double+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC_Projekat_wallColision+0 
	MOVF        R1, 0 
	MOVWF       FLOC_Projekat_wallColision+1 
	MOVF        R2, 0 
	MOVWF       FLOC_Projekat_wallColision+2 
	MOVF        R3, 0 
	MOVWF       FLOC_Projekat_wallColision+3 
	MOVF        FLOC_Projekat_wallColision+0, 0 
	MOVWF       R4 
	MOVF        FLOC_Projekat_wallColision+1, 0 
	MOVWF       R5 
	MOVF        FLOC_Projekat_wallColision+2, 0 
	MOVWF       R6 
	MOVF        FLOC_Projekat_wallColision+3, 0 
	MOVWF       R7 
	MOVF        _XPr+0, 0 
	MOVWF       R0 
	MOVF        _XPr+1, 0 
	MOVWF       R1 
	MOVF        _XPr+2, 0 
	MOVWF       R2 
	MOVF        _XPr+3, 0 
	MOVWF       R3 
	CALL        _Sub_32x32_FP+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       64
	MOVWF       R6 
	MOVLW       128
	MOVWF       R7 
	CALL        _Div_32x32_FP+0, 0
	MOVF        FLOC_Projekat_wallColision+0, 0 
	MOVWF       R4 
	MOVF        FLOC_Projekat_wallColision+1, 0 
	MOVWF       R5 
	MOVF        FLOC_Projekat_wallColision+2, 0 
	MOVWF       R6 
	MOVF        FLOC_Projekat_wallColision+3, 0 
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _X+0 
	MOVF        R1, 0 
	MOVWF       _X+1 
	MOVF        R2, 0 
	MOVWF       _X+2 
	MOVF        R3, 0 
	MOVWF       _X+3 
;Projekat.c,128 :: 		}
L_Projekat_wallColision4:
;Projekat.c,129 :: 		Vx = 0;
	CLRF        _Vx+0 
	CLRF        _Vx+1 
	CLRF        _Vx+2 
	CLRF        _Vx+3 
;Projekat.c,130 :: 		Cvx=0;
	CLRF        _Cvx+0 
	CLRF        _Cvx+1 
	CLRF        _Cvx+2 
	CLRF        _Cvx+3 
;Projekat.c,131 :: 		Cx=X;
	MOVF        _X+0, 0 
	MOVWF       _Cx+0 
	MOVF        _X+1, 0 
	MOVWF       _Cx+1 
	MOVF        _X+2, 0 
	MOVWF       _Cx+2 
	MOVF        _X+3, 0 
	MOVWF       _Cx+3 
;Projekat.c,132 :: 		tx=1;
	MOVLW       0
	MOVWF       _tx+0 
	MOVLW       0
	MOVWF       _tx+1 
	MOVLW       0
	MOVWF       _tx+2 
	MOVLW       127
	MOVWF       _tx+3 
;Projekat.c,133 :: 		wallHit= hit;
	MOVLW       1
	MOVWF       _wallHit+0 
;Projekat.c,134 :: 		return X;
	MOVF        _X+0, 0 
	MOVWF       R0 
	MOVF        _X+1, 0 
	MOVWF       R1 
	MOVF        _X+2, 0 
	MOVWF       R2 
	MOVF        _X+3, 0 
	MOVWF       R3 
	CALL        _double2int+0, 0
	GOTO        L_end_wallColision
;Projekat.c,135 :: 		}
L_Projekat_wallColision2:
;Projekat.c,137 :: 		if (Y>value) {
	MOVF        FARG_Projekat_wallColision_value+0, 0 
	MOVWF       R0 
	MOVF        FARG_Projekat_wallColision_value+1, 0 
	MOVWF       R1 
	CALL        _int2double+0, 0
	MOVF        _Y+0, 0 
	MOVWF       R4 
	MOVF        _Y+1, 0 
	MOVWF       R5 
	MOVF        _Y+2, 0 
	MOVWF       R6 
	MOVF        _Y+3, 0 
	MOVWF       R7 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_Projekat_wallColision6
;Projekat.c,138 :: 		Y=ceil(value-(value-Ypr)/3);
	MOVF        FARG_Projekat_wallColision_value+0, 0 
	MOVWF       R0 
	MOVF        FARG_Projekat_wallColision_value+1, 0 
	MOVWF       R1 
	CALL        _int2double+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC_Projekat_wallColision+0 
	MOVF        R1, 0 
	MOVWF       FLOC_Projekat_wallColision+1 
	MOVF        R2, 0 
	MOVWF       FLOC_Projekat_wallColision+2 
	MOVF        R3, 0 
	MOVWF       FLOC_Projekat_wallColision+3 
	MOVF        _YPr+0, 0 
	MOVWF       R4 
	MOVF        _YPr+1, 0 
	MOVWF       R5 
	MOVF        _YPr+2, 0 
	MOVWF       R6 
	MOVF        _YPr+3, 0 
	MOVWF       R7 
	MOVF        FLOC_Projekat_wallColision+0, 0 
	MOVWF       R0 
	MOVF        FLOC_Projekat_wallColision+1, 0 
	MOVWF       R1 
	MOVF        FLOC_Projekat_wallColision+2, 0 
	MOVWF       R2 
	MOVF        FLOC_Projekat_wallColision+3, 0 
	MOVWF       R3 
	CALL        _Sub_32x32_FP+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       64
	MOVWF       R6 
	MOVLW       128
	MOVWF       R7 
	CALL        _Div_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       R4 
	MOVF        R1, 0 
	MOVWF       R5 
	MOVF        R2, 0 
	MOVWF       R6 
	MOVF        R3, 0 
	MOVWF       R7 
	MOVF        FLOC_Projekat_wallColision+0, 0 
	MOVWF       R0 
	MOVF        FLOC_Projekat_wallColision+1, 0 
	MOVWF       R1 
	MOVF        FLOC_Projekat_wallColision+2, 0 
	MOVWF       R2 
	MOVF        FLOC_Projekat_wallColision+3, 0 
	MOVWF       R3 
	CALL        _Sub_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_ceil_x+0 
	MOVF        R1, 0 
	MOVWF       FARG_ceil_x+1 
	MOVF        R2, 0 
	MOVWF       FARG_ceil_x+2 
	MOVF        R3, 0 
	MOVWF       FARG_ceil_x+3 
	CALL        _ceil+0, 0
	MOVF        R0, 0 
	MOVWF       _Y+0 
	MOVF        R1, 0 
	MOVWF       _Y+1 
	MOVF        R2, 0 
	MOVWF       _Y+2 
	MOVF        R3, 0 
	MOVWF       _Y+3 
;Projekat.c,139 :: 		}
	GOTO        L_Projekat_wallColision7
L_Projekat_wallColision6:
;Projekat.c,141 :: 		Y=value+((Ypr-value)/3);
	MOVF        FARG_Projekat_wallColision_value+0, 0 
	MOVWF       R0 
	MOVF        FARG_Projekat_wallColision_value+1, 0 
	MOVWF       R1 
	CALL        _int2double+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC_Projekat_wallColision+0 
	MOVF        R1, 0 
	MOVWF       FLOC_Projekat_wallColision+1 
	MOVF        R2, 0 
	MOVWF       FLOC_Projekat_wallColision+2 
	MOVF        R3, 0 
	MOVWF       FLOC_Projekat_wallColision+3 
	MOVF        FLOC_Projekat_wallColision+0, 0 
	MOVWF       R4 
	MOVF        FLOC_Projekat_wallColision+1, 0 
	MOVWF       R5 
	MOVF        FLOC_Projekat_wallColision+2, 0 
	MOVWF       R6 
	MOVF        FLOC_Projekat_wallColision+3, 0 
	MOVWF       R7 
	MOVF        _YPr+0, 0 
	MOVWF       R0 
	MOVF        _YPr+1, 0 
	MOVWF       R1 
	MOVF        _YPr+2, 0 
	MOVWF       R2 
	MOVF        _YPr+3, 0 
	MOVWF       R3 
	CALL        _Sub_32x32_FP+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       64
	MOVWF       R6 
	MOVLW       128
	MOVWF       R7 
	CALL        _Div_32x32_FP+0, 0
	MOVF        FLOC_Projekat_wallColision+0, 0 
	MOVWF       R4 
	MOVF        FLOC_Projekat_wallColision+1, 0 
	MOVWF       R5 
	MOVF        FLOC_Projekat_wallColision+2, 0 
	MOVWF       R6 
	MOVF        FLOC_Projekat_wallColision+3, 0 
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _Y+0 
	MOVF        R1, 0 
	MOVWF       _Y+1 
	MOVF        R2, 0 
	MOVWF       _Y+2 
	MOVF        R3, 0 
	MOVWF       _Y+3 
;Projekat.c,142 :: 		}
L_Projekat_wallColision7:
;Projekat.c,143 :: 		Vy = 0;
	CLRF        _Vy+0 
	CLRF        _Vy+1 
	CLRF        _Vy+2 
	CLRF        _Vy+3 
;Projekat.c,144 :: 		Cvy=0;
	CLRF        _Cvy+0 
	CLRF        _Cvy+1 
	CLRF        _Cvy+2 
	CLRF        _Cvy+3 
;Projekat.c,145 :: 		Cy=Y;
	MOVF        _Y+0, 0 
	MOVWF       _Cy+0 
	MOVF        _Y+1, 0 
	MOVWF       _Cy+1 
	MOVF        _Y+2, 0 
	MOVWF       _Cy+2 
	MOVF        _Y+3, 0 
	MOVWF       _Cy+3 
;Projekat.c,146 :: 		ty=1;
	MOVLW       0
	MOVWF       _ty+0 
	MOVLW       0
	MOVWF       _ty+1 
	MOVLW       0
	MOVWF       _ty+2 
	MOVLW       127
	MOVWF       _ty+3 
;Projekat.c,147 :: 		wallHit= hit;
	MOVLW       1
	MOVWF       _wallHit+0 
;Projekat.c,148 :: 		return Y;
	MOVF        _Y+0, 0 
	MOVWF       R0 
	MOVF        _Y+1, 0 
	MOVWF       R1 
	MOVF        _Y+2, 0 
	MOVWF       R2 
	MOVF        _Y+3, 0 
	MOVWF       R3 
	CALL        _double2int+0, 0
;Projekat.c,150 :: 		}
L_end_wallColision:
	RETURN      0
; end of Projekat_wallColision

_setNet:

;Projekat.c,152 :: 		void setNet(int n1, int n2, int n3,int n4, char c1, double d1, double d2) {
;Projekat.c,153 :: 		netX=n1;
	MOVF        FARG_setNet_n1+0, 0 
	MOVWF       _netX+0 
	MOVF        FARG_setNet_n1+1, 0 
	MOVWF       _netX+1 
;Projekat.c,154 :: 		netY=n2;
	MOVF        FARG_setNet_n2+0, 0 
	MOVWF       _netY+0 
	MOVF        FARG_setNet_n2+1, 0 
	MOVWF       _netY+1 
;Projekat.c,155 :: 		netW=n3;
	MOVF        FARG_setNet_n3+0, 0 
	MOVWF       _netW+0 
	MOVF        FARG_setNet_n3+1, 0 
	MOVWF       _netW+1 
;Projekat.c,156 :: 		netH=n4;
	MOVF        FARG_setNet_n4+0, 0 
	MOVWF       _netH+0 
	MOVF        FARG_setNet_n4+1, 0 
	MOVWF       _netH+1 
;Projekat.c,157 :: 		Cx=d1;
	MOVF        FARG_setNet_d1+0, 0 
	MOVWF       _Cx+0 
	MOVF        FARG_setNet_d1+1, 0 
	MOVWF       _Cx+1 
	MOVF        FARG_setNet_d1+2, 0 
	MOVWF       _Cx+2 
	MOVF        FARG_setNet_d1+3, 0 
	MOVWF       _Cx+3 
;Projekat.c,158 :: 		Cy=d2;
	MOVF        FARG_setNet_d2+0, 0 
	MOVWF       _Cy+0 
	MOVF        FARG_setNet_d2+1, 0 
	MOVWF       _Cy+1 
	MOVF        FARG_setNet_d2+2, 0 
	MOVWF       _Cy+2 
	MOVF        FARG_setNet_d2+3, 0 
	MOVWF       _Cy+3 
;Projekat.c,159 :: 		X=Cx;
	MOVF        FARG_setNet_d1+0, 0 
	MOVWF       _X+0 
	MOVF        FARG_setNet_d1+1, 0 
	MOVWF       _X+1 
	MOVF        FARG_setNet_d1+2, 0 
	MOVWF       _X+2 
	MOVF        FARG_setNet_d1+3, 0 
	MOVWF       _X+3 
;Projekat.c,160 :: 		Y=Cy;
	MOVF        FARG_setNet_d2+0, 0 
	MOVWF       _Y+0 
	MOVF        FARG_setNet_d2+1, 0 
	MOVWF       _Y+1 
	MOVF        FARG_setNet_d2+2, 0 
	MOVWF       _Y+2 
	MOVF        FARG_setNet_d2+3, 0 
	MOVWF       _Y+3 
;Projekat.c,161 :: 		}
L_end_setNet:
	RETURN      0
; end of _setNet

_netHit:

;Projekat.c,163 :: 		void netHit(int n){
;Projekat.c,164 :: 		netContact=contact;
	MOVLW       1
	MOVWF       _netContact+0 
;Projekat.c,165 :: 		Ax=-1*Vx*0.4;
	MOVLW       0
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       128
	MOVWF       R2 
	MOVLW       127
	MOVWF       R3 
	MOVF        _Vx+0, 0 
	MOVWF       R4 
	MOVF        _Vx+1, 0 
	MOVWF       R5 
	MOVF        _Vx+2, 0 
	MOVWF       R6 
	MOVF        _Vx+3, 0 
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVLW       205
	MOVWF       R4 
	MOVLW       204
	MOVWF       R5 
	MOVLW       76
	MOVWF       R6 
	MOVLW       125
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _Ax+0 
	MOVF        R1, 0 
	MOVWF       _Ax+1 
	MOVF        R2, 0 
	MOVWF       _Ax+2 
	MOVF        R3, 0 
	MOVWF       _Ax+3 
;Projekat.c,166 :: 		Ay=-1*Vy*0.4;
	MOVLW       0
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       128
	MOVWF       R2 
	MOVLW       127
	MOVWF       R3 
	MOVF        _Vy+0, 0 
	MOVWF       R4 
	MOVF        _Vy+1, 0 
	MOVWF       R5 
	MOVF        _Vy+2, 0 
	MOVWF       R6 
	MOVF        _Vy+3, 0 
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVLW       205
	MOVWF       R4 
	MOVLW       204
	MOVWF       R5 
	MOVLW       76
	MOVWF       R6 
	MOVLW       125
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _Ay+0 
	MOVF        R1, 0 
	MOVWF       _Ay+1 
	MOVF        R2, 0 
	MOVWF       _Ay+2 
	MOVF        R3, 0 
	MOVWF       _Ay+3 
;Projekat.c,167 :: 		Cvx=Vx;
	MOVF        _Vx+0, 0 
	MOVWF       _Cvx+0 
	MOVF        _Vx+1, 0 
	MOVWF       _Cvx+1 
	MOVF        _Vx+2, 0 
	MOVWF       _Cvx+2 
	MOVF        _Vx+3, 0 
	MOVWF       _Cvx+3 
;Projekat.c,168 :: 		Cvy=Vy;
	MOVF        _Vy+0, 0 
	MOVWF       _Cvy+0 
	MOVF        _Vy+1, 0 
	MOVWF       _Cvy+1 
	MOVF        _Vy+2, 0 
	MOVWF       _Cvy+2 
	MOVF        _Vy+3, 0 
	MOVWF       _Cvy+3 
;Projekat.c,169 :: 		clearCondition=n;
	MOVF        FARG_netHit_n+0, 0 
	MOVWF       _clearCondition+0 
	MOVF        FARG_netHit_n+1, 0 
	MOVWF       _clearCondition+1 
;Projekat.c,170 :: 		}
L_end_netHit:
	RETURN      0
; end of _netHit

_screenInit:

;Projekat.c,172 :: 		void screenInit(){
;Projekat.c,173 :: 		Glcd_Fill(0x00);
	CLRF        FARG_Glcd_Fill_pattern+0 
	CALL        _Glcd_Fill+0, 0
;Projekat.c,174 :: 		Glcd_Rectangle(0,0,127,63,1);
	CLRF        FARG_Glcd_Rectangle_x_upper_left+0 
	CLRF        FARG_Glcd_Rectangle_y_upper_left+0 
	MOVLW       127
	MOVWF       FARG_Glcd_Rectangle_x_bottom_right+0 
	MOVLW       63
	MOVWF       FARG_Glcd_Rectangle_y_bottom_right+0 
	MOVLW       1
	MOVWF       FARG_Glcd_Rectangle_color+0 
	CALL        _Glcd_Rectangle+0, 0
;Projekat.c,175 :: 		}
L_end_screenInit:
	RETURN      0
; end of _screenInit

_gameInit:

;Projekat.c,177 :: 		void gameInit(){
;Projekat.c,178 :: 		screenInit();
	CALL        _screenInit+0, 0
;Projekat.c,179 :: 		clearCondition=0;
	CLRF        _clearCondition+0 
	CLRF        _clearCondition+1 
;Projekat.c,180 :: 		netPosition=0;
	CLRF        _netPosition+0 
	CLRF        _netPosition+1 
;Projekat.c,181 :: 		netContact = stop;
	MOVLW       2
	MOVWF       _netContact+0 
;Projekat.c,182 :: 		game = intro;
	CLRF        _game+0 
;Projekat.c,183 :: 		gameMode=0;
	CLRF        _gameMode+0 
	CLRF        _gameMode+1 
;Projekat.c,184 :: 		score = 8;
	MOVLW       8
	MOVWF       _score+0 
	MOVLW       0
	MOVWF       _score+1 
;Projekat.c,185 :: 		}
L_end_gameInit:
	RETURN      0
; end of _gameInit

_main:

;Projekat.c,187 :: 		void main() {
;Projekat.c,188 :: 		init();
	CALL        _init+0, 0
;Projekat.c,189 :: 		Glcd_Init();
	CALL        _Glcd_Init+0, 0
;Projekat.c,190 :: 		gameInit();
	CALL        _gameInit+0, 0
;Projekat.c,191 :: 		ANCON2=0;
	CLRF        ANCON2+0 
;Projekat.c,192 :: 		TRISH=3;
	MOVLW       3
	MOVWF       TRISH+0 
;Projekat.c,194 :: 		UART1_init(9600);
	MOVLW       103
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;Projekat.c,195 :: 		delay_ms(20);
	MOVLW       104
	MOVWF       R12, 0
	MOVLW       228
	MOVWF       R13, 0
L_main8:
	DECFSZ      R13, 1, 1
	BRA         L_main8
	DECFSZ      R12, 1, 1
	BRA         L_main8
	NOP
;Projekat.c,197 :: 		while(1){
L_main9:
;Projekat.c,198 :: 		switch (game) {
	GOTO        L_main11
;Projekat.c,199 :: 		case 0:{
L_main13:
;Projekat.c,200 :: 		glcd_fill(0x00);
	CLRF        FARG_Glcd_Fill_pattern+0 
	CALL        _Glcd_Fill+0, 0
;Projekat.c,201 :: 		delay_ms(10);
	MOVLW       52
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_main14:
	DECFSZ      R13, 1, 1
	BRA         L_main14
	DECFSZ      R12, 1, 1
	BRA         L_main14
	NOP
	NOP
;Projekat.c,202 :: 		Glcd_Write_Text("Welcome", 0, 0, 1);
	MOVLW       ?lstr1_Projekat+0
	MOVWF       FARG_Glcd_Write_Text_text+0 
	MOVLW       hi_addr(?lstr1_Projekat+0)
	MOVWF       FARG_Glcd_Write_Text_text+1 
	CLRF        FARG_Glcd_Write_Text_x_pos+0 
	CLRF        FARG_Glcd_Write_Text_page_num+0 
	MOVLW       1
	MOVWF       FARG_Glcd_Write_Text_color+0 
	CALL        _Glcd_Write_Text+0, 0
;Projekat.c,203 :: 		Glcd_Write_Text("1 level = 1 point", 0, 1, 1);
	MOVLW       ?lstr2_Projekat+0
	MOVWF       FARG_Glcd_Write_Text_text+0 
	MOVLW       hi_addr(?lstr2_Projekat+0)
	MOVWF       FARG_Glcd_Write_Text_text+1 
	CLRF        FARG_Glcd_Write_Text_x_pos+0 
	MOVLW       1
	MOVWF       FARG_Glcd_Write_Text_page_num+0 
	MOVLW       1
	MOVWF       FARG_Glcd_Write_Text_color+0 
	CALL        _Glcd_Write_Text+0, 0
;Projekat.c,204 :: 		Glcd_Write_Text("Skip level = 0 points", 0, 2, 1);
	MOVLW       ?lstr3_Projekat+0
	MOVWF       FARG_Glcd_Write_Text_text+0 
	MOVLW       hi_addr(?lstr3_Projekat+0)
	MOVWF       FARG_Glcd_Write_Text_text+1 
	CLRF        FARG_Glcd_Write_Text_x_pos+0 
	MOVLW       2
	MOVWF       FARG_Glcd_Write_Text_page_num+0 
	MOVLW       1
	MOVWF       FARG_Glcd_Write_Text_color+0 
	CALL        _Glcd_Write_Text+0, 0
;Projekat.c,205 :: 		Glcd_Write_Text("RH1 = skip", 0, 4, 1);
	MOVLW       ?lstr4_Projekat+0
	MOVWF       FARG_Glcd_Write_Text_text+0 
	MOVLW       hi_addr(?lstr4_Projekat+0)
	MOVWF       FARG_Glcd_Write_Text_text+1 
	CLRF        FARG_Glcd_Write_Text_x_pos+0 
	MOVLW       4
	MOVWF       FARG_Glcd_Write_Text_page_num+0 
	MOVLW       1
	MOVWF       FARG_Glcd_Write_Text_color+0 
	CALL        _Glcd_Write_Text+0, 0
;Projekat.c,206 :: 		Glcd_Write_Text("Start - RH0", 0, 5, 1);
	MOVLW       ?lstr5_Projekat+0
	MOVWF       FARG_Glcd_Write_Text_text+0 
	MOVLW       hi_addr(?lstr5_Projekat+0)
	MOVWF       FARG_Glcd_Write_Text_text+1 
	CLRF        FARG_Glcd_Write_Text_x_pos+0 
	MOVLW       5
	MOVWF       FARG_Glcd_Write_Text_page_num+0 
	MOVLW       1
	MOVWF       FARG_Glcd_Write_Text_color+0 
	CALL        _Glcd_Write_Text+0, 0
;Projekat.c,207 :: 		Glcd_Write_Text("Good luck", 0, 7, 1);
	MOVLW       ?lstr6_Projekat+0
	MOVWF       FARG_Glcd_Write_Text_text+0 
	MOVLW       hi_addr(?lstr6_Projekat+0)
	MOVWF       FARG_Glcd_Write_Text_text+1 
	CLRF        FARG_Glcd_Write_Text_x_pos+0 
	MOVLW       7
	MOVWF       FARG_Glcd_Write_Text_page_num+0 
	MOVLW       1
	MOVWF       FARG_Glcd_Write_Text_color+0 
	CALL        _Glcd_Write_Text+0, 0
;Projekat.c,208 :: 		delay_ms(400);
	MOVLW       9
	MOVWF       R11, 0
	MOVLW       30
	MOVWF       R12, 0
	MOVLW       228
	MOVWF       R13, 0
L_main15:
	DECFSZ      R13, 1, 1
	BRA         L_main15
	DECFSZ      R12, 1, 1
	BRA         L_main15
	DECFSZ      R11, 1, 1
	BRA         L_main15
	NOP
;Projekat.c,209 :: 		while(1){
L_main16:
;Projekat.c,210 :: 		if(RH0_bit==1) {glcd_fill(0x00); break;}
	BTFSS       RH0_bit+0, BitPos(RH0_bit+0) 
	GOTO        L_main18
	CLRF        FARG_Glcd_Fill_pattern+0 
	CALL        _Glcd_Fill+0, 0
	GOTO        L_main17
L_main18:
;Projekat.c,211 :: 		}
	GOTO        L_main16
L_main17:
;Projekat.c,213 :: 		case 1:{
L_main19:
;Projekat.c,215 :: 		while(game==0) {
L_main20:
	MOVF        _game+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_main21
;Projekat.c,216 :: 		if(netContact != 2) {
	MOVF        _netContact+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_main22
;Projekat.c,217 :: 		Xpr=X;
	MOVF        _X+0, 0 
	MOVWF       _XPr+0 
	MOVF        _X+1, 0 
	MOVWF       _XPr+1 
	MOVF        _X+2, 0 
	MOVWF       _XPr+2 
	MOVF        _X+3, 0 
	MOVWF       _XPr+3 
;Projekat.c,218 :: 		Ypr=Y;
	MOVF        _Y+0, 0 
	MOVWF       _YPr+0 
	MOVF        _Y+1, 0 
	MOVWF       _YPr+1 
	MOVF        _Y+2, 0 
	MOVWF       _YPr+2 
	MOVF        _Y+3, 0 
	MOVWF       _YPr+3 
;Projekat.c,220 :: 		tx+=1;
	MOVF        _tx+0, 0 
	MOVWF       R0 
	MOVF        _tx+1, 0 
	MOVWF       R1 
	MOVF        _tx+2, 0 
	MOVWF       R2 
	MOVF        _tx+3, 0 
	MOVWF       R3 
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       0
	MOVWF       R6 
	MOVLW       127
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _tx+0 
	MOVF        R1, 0 
	MOVWF       _tx+1 
	MOVF        R2, 0 
	MOVWF       _tx+2 
	MOVF        R3, 0 
	MOVWF       _tx+3 
;Projekat.c,221 :: 		ty+=1;
	MOVF        _ty+0, 0 
	MOVWF       R0 
	MOVF        _ty+1, 0 
	MOVWF       R1 
	MOVF        _ty+2, 0 
	MOVWF       R2 
	MOVF        _ty+3, 0 
	MOVWF       R3 
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       0
	MOVWF       R6 
	MOVLW       127
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _ty+0 
	MOVF        R1, 0 
	MOVWF       _ty+1 
	MOVF        R2, 0 
	MOVWF       _ty+2 
	MOVF        R3, 0 
	MOVWF       _ty+3 
;Projekat.c,222 :: 		glcd_partialImage(netX, netY, netW, netH, netW, netH, net_bmp);
	MOVF        _netX+0, 0 
	MOVWF       FARG_Glcd_PartialImage_x_left+0 
	MOVF        _netX+1, 0 
	MOVWF       FARG_Glcd_PartialImage_x_left+1 
	MOVF        _netY+0, 0 
	MOVWF       FARG_Glcd_PartialImage_y_top+0 
	MOVF        _netY+1, 0 
	MOVWF       FARG_Glcd_PartialImage_y_top+1 
	MOVF        _netW+0, 0 
	MOVWF       FARG_Glcd_PartialImage_width+0 
	MOVF        _netW+1, 0 
	MOVWF       FARG_Glcd_PartialImage_width+1 
	MOVF        _netH+0, 0 
	MOVWF       FARG_Glcd_PartialImage_height+0 
	MOVF        _netH+1, 0 
	MOVWF       FARG_Glcd_PartialImage_height+1 
	MOVF        _netW+0, 0 
	MOVWF       FARG_Glcd_PartialImage_picture_width+0 
	MOVF        _netW+1, 0 
	MOVWF       FARG_Glcd_PartialImage_picture_width+1 
	MOVF        _netH+0, 0 
	MOVWF       FARG_Glcd_PartialImage_picture_height+0 
	MOVF        _netH+1, 0 
	MOVWF       FARG_Glcd_PartialImage_picture_height+1 
	MOVLW       _net_bmp+0
	MOVWF       FARG_Glcd_PartialImage_image+0 
	MOVLW       hi_addr(_net_bmp+0)
	MOVWF       FARG_Glcd_PartialImage_image+1 
	MOVLW       higher_addr(_net_bmp+0)
	MOVWF       FARG_Glcd_PartialImage_image+2 
	CALL        _Glcd_PartialImage+0, 0
;Projekat.c,225 :: 		if (netContact==0){
	MOVF        _netContact+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_main23
;Projekat.c,226 :: 		mpu9dof_readAccel(&AxN, &AyN, &AzN);
	MOVLW       _AxN+0
	MOVWF       FARG_mpu9dof_readAccel_accelX+0 
	MOVLW       hi_addr(_AxN+0)
	MOVWF       FARG_mpu9dof_readAccel_accelX+1 
	MOVLW       _AyN+0
	MOVWF       FARG_mpu9dof_readAccel_accelY+0 
	MOVLW       hi_addr(_AyN+0)
	MOVWF       FARG_mpu9dof_readAccel_accelY+1 
	MOVLW       _AzN+0
	MOVWF       FARG_mpu9dof_readAccel_accelZ+0 
	MOVLW       hi_addr(_AzN+0)
	MOVWF       FARG_mpu9dof_readAccel_accelZ+1 
	CALL        _mpu9dof_readAccel+0, 0
;Projekat.c,227 :: 		Axtemp = (-1*(AxN)>>7);
	MOVLW       255
	MOVWF       R0 
	MOVLW       255
	MOVWF       R1 
	MOVF        _AxN+0, 0 
	MOVWF       R4 
	MOVF        _AxN+1, 0 
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVLW       7
	MOVWF       R2 
	MOVF        R0, 0 
	MOVWF       R4 
	MOVF        R1, 0 
	MOVWF       R5 
	MOVF        R2, 0 
L__main152:
	BZ          L__main153
	RRCF        R5, 1 
	RRCF        R4, 1 
	BCF         R5, 7 
	BTFSC       R5, 6 
	BSF         R5, 7 
	ADDLW       255
	GOTO        L__main152
L__main153:
	MOVF        R4, 0 
	MOVWF       R0 
	MOVF        R5, 0 
	MOVWF       R1 
	CALL        _int2double+0, 0
	MOVF        R0, 0 
	MOVWF       _Axtemp+0 
	MOVF        R1, 0 
	MOVWF       _Axtemp+1 
	MOVF        R2, 0 
	MOVWF       _Axtemp+2 
	MOVF        R3, 0 
	MOVWF       _Axtemp+3 
;Projekat.c,228 :: 		if(Ax!=Axtemp){
	MOVF        _Ax+0, 0 
	MOVWF       R4 
	MOVF        _Ax+1, 0 
	MOVWF       R5 
	MOVF        _Ax+2, 0 
	MOVWF       R6 
	MOVF        _Ax+3, 0 
	MOVWF       R7 
	CALL        _Equals_Double+0, 0
	MOVLW       0
	BTFSS       STATUS+0, 2 
	MOVLW       1
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main24
;Projekat.c,229 :: 		Ax=Axtemp;
	MOVF        _Axtemp+0, 0 
	MOVWF       _Ax+0 
	MOVF        _Axtemp+1, 0 
	MOVWF       _Ax+1 
	MOVF        _Axtemp+2, 0 
	MOVWF       _Ax+2 
	MOVF        _Axtemp+3, 0 
	MOVWF       _Ax+3 
;Projekat.c,230 :: 		update('X');
	MOVLW       88
	MOVWF       FARG_Projekat_update_dir+0 
	CALL        Projekat_update+0, 0
;Projekat.c,231 :: 		}
L_main24:
;Projekat.c,232 :: 		Aytemp = (AyN)>>7;
	MOVLW       7
	MOVWF       R2 
	MOVF        _AyN+0, 0 
	MOVWF       R0 
	MOVF        _AyN+1, 0 
	MOVWF       R1 
	MOVF        R2, 0 
L__main154:
	BZ          L__main155
	RRCF        R1, 1 
	RRCF        R0, 1 
	BCF         R1, 7 
	BTFSC       R1, 6 
	BSF         R1, 7 
	ADDLW       255
	GOTO        L__main154
L__main155:
	CALL        _int2double+0, 0
	MOVF        R0, 0 
	MOVWF       _Aytemp+0 
	MOVF        R1, 0 
	MOVWF       _Aytemp+1 
	MOVF        R2, 0 
	MOVWF       _Aytemp+2 
	MOVF        R3, 0 
	MOVWF       _Aytemp+3 
;Projekat.c,233 :: 		if(Ay!=Aytemp){
	MOVF        _Ay+0, 0 
	MOVWF       R4 
	MOVF        _Ay+1, 0 
	MOVWF       R5 
	MOVF        _Ay+2, 0 
	MOVWF       R6 
	MOVF        _Ay+3, 0 
	MOVWF       R7 
	CALL        _Equals_Double+0, 0
	MOVLW       0
	BTFSS       STATUS+0, 2 
	MOVLW       1
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main25
;Projekat.c,234 :: 		Ay=Aytemp;
	MOVF        _Aytemp+0, 0 
	MOVWF       _Ay+0 
	MOVF        _Aytemp+1, 0 
	MOVWF       _Ay+1 
	MOVF        _Aytemp+2, 0 
	MOVWF       _Ay+2 
	MOVF        _Aytemp+3, 0 
	MOVWF       _Ay+3 
;Projekat.c,235 :: 		update('Y');
	MOVLW       89
	MOVWF       FARG_Projekat_update_dir+0 
	CALL        Projekat_update+0, 0
;Projekat.c,236 :: 		}
L_main25:
;Projekat.c,237 :: 		} else {
	GOTO        L_main26
L_main23:
;Projekat.c,238 :: 		Ax=0;
	CLRF        _Ax+0 
	CLRF        _Ax+1 
	CLRF        _Ax+2 
	CLRF        _Ax+3 
;Projekat.c,239 :: 		Ay=0;
	CLRF        _Ay+0 
	CLRF        _Ay+1 
	CLRF        _Ay+2 
	CLRF        _Ay+3 
;Projekat.c,240 :: 		update('X');
	MOVLW       88
	MOVWF       FARG_Projekat_update_dir+0 
	CALL        Projekat_update+0, 0
;Projekat.c,241 :: 		update('Y');
	MOVLW       89
	MOVWF       FARG_Projekat_update_dir+0 
	CALL        Projekat_update+0, 0
;Projekat.c,242 :: 		}
L_main26:
;Projekat.c,244 :: 		if(netContact==0){
	MOVF        _netContact+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_main27
;Projekat.c,245 :: 		if (netW==30) {      //vertikalna mreza
	MOVLW       0
	XORWF       _netW+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main156
	MOVLW       30
	XORWF       _netW+0, 0 
L__main156:
	BTFSS       STATUS+0, 2 
	GOTO        L_main28
;Projekat.c,246 :: 		if(netX==60) {      //sa desne strane
	MOVLW       0
	XORWF       _netX+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main157
	MOVLW       60
	XORWF       _netX+0, 0 
L__main157:
	BTFSS       STATUS+0, 2 
	GOTO        L_main29
;Projekat.c,247 :: 		netPosition=1;
	MOVLW       1
	MOVWF       _netPosition+0 
	MOVLW       0
	MOVWF       _netPosition+1 
;Projekat.c,248 :: 		if(X>=netX){
	MOVF        _netX+0, 0 
	MOVWF       R0 
	MOVF        _netX+1, 0 
	MOVWF       R1 
	CALL        _int2double+0, 0
	MOVF        R0, 0 
	MOVWF       R4 
	MOVF        R1, 0 
	MOVWF       R5 
	MOVF        R2, 0 
	MOVWF       R6 
	MOVF        R3, 0 
	MOVWF       R7 
	MOVF        _X+0, 0 
	MOVWF       R0 
	MOVF        _X+1, 0 
	MOVWF       R1 
	MOVF        _X+2, 0 
	MOVWF       R2 
	MOVF        _X+3, 0 
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       0
	BTFSC       STATUS+0, 0 
	MOVLW       1
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main30
;Projekat.c,249 :: 		netHit(1);
	MOVLW       1
	MOVWF       FARG_netHit_n+0 
	MOVLW       0
	MOVWF       FARG_netHit_n+1 
	CALL        _netHit+0, 0
;Projekat.c,250 :: 		update('X');
	MOVLW       88
	MOVWF       FARG_Projekat_update_dir+0 
	CALL        Projekat_update+0, 0
;Projekat.c,251 :: 		update('Y');
	MOVLW       89
	MOVWF       FARG_Projekat_update_dir+0 
	CALL        Projekat_update+0, 0
;Projekat.c,252 :: 		}
L_main30:
;Projekat.c,253 :: 		}
	GOTO        L_main31
L_main29:
;Projekat.c,254 :: 		else if(netX==30){              // sa lijeve strane
	MOVLW       0
	XORWF       _netX+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main158
	MOVLW       30
	XORWF       _netX+0, 0 
L__main158:
	BTFSS       STATUS+0, 2 
	GOTO        L_main32
;Projekat.c,255 :: 		netPosition=2;
	MOVLW       2
	MOVWF       _netPosition+0 
	MOVLW       0
	MOVWF       _netPosition+1 
;Projekat.c,256 :: 		if (X<netX+netW){
	MOVF        _netW+0, 0 
	ADDWF       _netX+0, 0 
	MOVWF       R0 
	MOVF        _netW+1, 0 
	ADDWFC      _netX+1, 0 
	MOVWF       R1 
	CALL        _int2double+0, 0
	MOVF        R0, 0 
	MOVWF       R4 
	MOVF        R1, 0 
	MOVWF       R5 
	MOVF        R2, 0 
	MOVWF       R6 
	MOVF        R3, 0 
	MOVWF       R7 
	MOVF        _X+0, 0 
	MOVWF       R0 
	MOVF        _X+1, 0 
	MOVWF       R1 
	MOVF        _X+2, 0 
	MOVWF       R2 
	MOVF        _X+3, 0 
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main33
;Projekat.c,257 :: 		netHit(2);
	MOVLW       2
	MOVWF       FARG_netHit_n+0 
	MOVLW       0
	MOVWF       FARG_netHit_n+1 
	CALL        _netHit+0, 0
;Projekat.c,258 :: 		update('X');
	MOVLW       88
	MOVWF       FARG_Projekat_update_dir+0 
	CALL        Projekat_update+0, 0
;Projekat.c,259 :: 		update('Y');
	MOVLW       89
	MOVWF       FARG_Projekat_update_dir+0 
	CALL        Projekat_update+0, 0
;Projekat.c,260 :: 		}
L_main33:
;Projekat.c,261 :: 		}
L_main32:
L_main31:
;Projekat.c,262 :: 		}
	GOTO        L_main34
L_main28:
;Projekat.c,265 :: 		if(netY==20){       //sa gornje strane
	MOVLW       0
	XORWF       _netY+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main159
	MOVLW       20
	XORWF       _netY+0, 0 
L__main159:
	BTFSS       STATUS+0, 2 
	GOTO        L_main35
;Projekat.c,266 :: 		netPosition=3;
	MOVLW       3
	MOVWF       _netPosition+0 
	MOVLW       0
	MOVWF       _netPosition+1 
;Projekat.c,267 :: 		if(Y<netY+netH){
	MOVF        _netH+0, 0 
	ADDWF       _netY+0, 0 
	MOVWF       R0 
	MOVF        _netH+1, 0 
	ADDWFC      _netY+1, 0 
	MOVWF       R1 
	CALL        _int2double+0, 0
	MOVF        R0, 0 
	MOVWF       R4 
	MOVF        R1, 0 
	MOVWF       R5 
	MOVF        R2, 0 
	MOVWF       R6 
	MOVF        R3, 0 
	MOVWF       R7 
	MOVF        _Y+0, 0 
	MOVWF       R0 
	MOVF        _Y+1, 0 
	MOVWF       R1 
	MOVF        _Y+2, 0 
	MOVWF       R2 
	MOVF        _Y+3, 0 
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main36
;Projekat.c,268 :: 		netHit(3);
	MOVLW       3
	MOVWF       FARG_netHit_n+0 
	MOVLW       0
	MOVWF       FARG_netHit_n+1 
	CALL        _netHit+0, 0
;Projekat.c,269 :: 		update('Y');
	MOVLW       89
	MOVWF       FARG_Projekat_update_dir+0 
	CALL        Projekat_update+0, 0
;Projekat.c,270 :: 		update('X');
	MOVLW       88
	MOVWF       FARG_Projekat_update_dir+0 
	CALL        Projekat_update+0, 0
;Projekat.c,271 :: 		}
L_main36:
;Projekat.c,272 :: 		}
	GOTO        L_main37
L_main35:
;Projekat.c,273 :: 		else if (netY==30){              //sa donje strane
	MOVLW       0
	XORWF       _netY+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main160
	MOVLW       30
	XORWF       _netY+0, 0 
L__main160:
	BTFSS       STATUS+0, 2 
	GOTO        L_main38
;Projekat.c,274 :: 		netPosition=4;
	MOVLW       4
	MOVWF       _netPosition+0 
	MOVLW       0
	MOVWF       _netPosition+1 
;Projekat.c,275 :: 		if(Y>netY){
	MOVF        _netY+0, 0 
	MOVWF       R0 
	MOVF        _netY+1, 0 
	MOVWF       R1 
	CALL        _int2double+0, 0
	MOVF        _Y+0, 0 
	MOVWF       R4 
	MOVF        _Y+1, 0 
	MOVWF       R5 
	MOVF        _Y+2, 0 
	MOVWF       R6 
	MOVF        _Y+3, 0 
	MOVWF       R7 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main39
;Projekat.c,276 :: 		netHit(4);
	MOVLW       4
	MOVWF       FARG_netHit_n+0 
	MOVLW       0
	MOVWF       FARG_netHit_n+1 
	CALL        _netHit+0, 0
;Projekat.c,277 :: 		update('Y');
	MOVLW       89
	MOVWF       FARG_Projekat_update_dir+0 
	CALL        Projekat_update+0, 0
;Projekat.c,278 :: 		update('X');
	MOVLW       88
	MOVWF       FARG_Projekat_update_dir+0 
	CALL        Projekat_update+0, 0
;Projekat.c,279 :: 		}
L_main39:
;Projekat.c,280 :: 		}
L_main38:
L_main37:
;Projekat.c,281 :: 		}
L_main34:
;Projekat.c,282 :: 		}
L_main27:
;Projekat.c,285 :: 		if (Vx!=0) {
	MOVF        _Vx+0, 0 
	MOVWF       R0 
	MOVF        _Vx+1, 0 
	MOVWF       R1 
	MOVF        _Vx+2, 0 
	MOVWF       R2 
	MOVF        _Vx+3, 0 
	MOVWF       R3 
	CLRF        R4 
	CLRF        R5 
	CLRF        R6 
	CLRF        R7 
	CALL        _Equals_Double+0, 0
	MOVLW       0
	BTFSS       STATUS+0, 2 
	MOVLW       1
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main40
;Projekat.c,286 :: 		AxUsp = uspConst*(Vx)*(-1);
	MOVLW       154
	MOVWF       R0 
	MOVLW       153
	MOVWF       R1 
	MOVLW       25
	MOVWF       R2 
	MOVLW       125
	MOVWF       R3 
	MOVF        _Vx+0, 0 
	MOVWF       R4 
	MOVF        _Vx+1, 0 
	MOVWF       R5 
	MOVF        _Vx+2, 0 
	MOVWF       R6 
	MOVF        _Vx+3, 0 
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       128
	MOVWF       R6 
	MOVLW       127
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _AxUsp+0 
	MOVF        R1, 0 
	MOVWF       _AxUsp+1 
	MOVF        R2, 0 
	MOVWF       _AxUsp+2 
	MOVF        R3, 0 
	MOVWF       _AxUsp+3 
;Projekat.c,287 :: 		}  else AxUsp = 0;
	GOTO        L_main41
L_main40:
	CLRF        _AxUsp+0 
	CLRF        _AxUsp+1 
	CLRF        _AxUsp+2 
	CLRF        _AxUsp+3 
L_main41:
;Projekat.c,289 :: 		if (Vy!=0) {
	MOVF        _Vy+0, 0 
	MOVWF       R0 
	MOVF        _Vy+1, 0 
	MOVWF       R1 
	MOVF        _Vy+2, 0 
	MOVWF       R2 
	MOVF        _Vy+3, 0 
	MOVWF       R3 
	CLRF        R4 
	CLRF        R5 
	CLRF        R6 
	CLRF        R7 
	CALL        _Equals_Double+0, 0
	MOVLW       0
	BTFSS       STATUS+0, 2 
	MOVLW       1
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main42
;Projekat.c,290 :: 		AyUsp = uspConst*(Vy)*(-1);
	MOVLW       154
	MOVWF       R0 
	MOVLW       153
	MOVWF       R1 
	MOVLW       25
	MOVWF       R2 
	MOVLW       125
	MOVWF       R3 
	MOVF        _Vy+0, 0 
	MOVWF       R4 
	MOVF        _Vy+1, 0 
	MOVWF       R5 
	MOVF        _Vy+2, 0 
	MOVWF       R6 
	MOVF        _Vy+3, 0 
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       128
	MOVWF       R6 
	MOVLW       127
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _AyUsp+0 
	MOVF        R1, 0 
	MOVWF       _AyUsp+1 
	MOVF        R2, 0 
	MOVWF       _AyUsp+2 
	MOVF        R3, 0 
	MOVWF       _AyUsp+3 
;Projekat.c,291 :: 		}  else AyUsp = 0;
	GOTO        L_main43
L_main42:
	CLRF        _AyUsp+0 
	CLRF        _AyUsp+1 
	CLRF        _AyUsp+2 
	CLRF        _AyUsp+3 
L_main43:
;Projekat.c,295 :: 		Vx = (Ax+AxUsp)*tx + Cvx;
	MOVF        _Ax+0, 0 
	MOVWF       R0 
	MOVF        _Ax+1, 0 
	MOVWF       R1 
	MOVF        _Ax+2, 0 
	MOVWF       R2 
	MOVF        _Ax+3, 0 
	MOVWF       R3 
	MOVF        _AxUsp+0, 0 
	MOVWF       R4 
	MOVF        _AxUsp+1, 0 
	MOVWF       R5 
	MOVF        _AxUsp+2, 0 
	MOVWF       R6 
	MOVF        _AxUsp+3, 0 
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        _tx+0, 0 
	MOVWF       R4 
	MOVF        _tx+1, 0 
	MOVWF       R5 
	MOVF        _tx+2, 0 
	MOVWF       R6 
	MOVF        _tx+3, 0 
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        _Cvx+0, 0 
	MOVWF       R4 
	MOVF        _Cvx+1, 0 
	MOVWF       R5 
	MOVF        _Cvx+2, 0 
	MOVWF       R6 
	MOVF        _Cvx+3, 0 
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC__main+0 
	MOVF        R1, 0 
	MOVWF       FLOC__main+1 
	MOVF        R2, 0 
	MOVWF       FLOC__main+2 
	MOVF        R3, 0 
	MOVWF       FLOC__main+3 
	MOVF        FLOC__main+0, 0 
	MOVWF       _Vx+0 
	MOVF        FLOC__main+1, 0 
	MOVWF       _Vx+1 
	MOVF        FLOC__main+2, 0 
	MOVWF       _Vx+2 
	MOVF        FLOC__main+3, 0 
	MOVWF       _Vx+3 
;Projekat.c,296 :: 		Vy = (Ay+AyUsp)*ty + Cvy;
	MOVF        _Ay+0, 0 
	MOVWF       R0 
	MOVF        _Ay+1, 0 
	MOVWF       R1 
	MOVF        _Ay+2, 0 
	MOVWF       R2 
	MOVF        _Ay+3, 0 
	MOVWF       R3 
	MOVF        _AyUsp+0, 0 
	MOVWF       R4 
	MOVF        _AyUsp+1, 0 
	MOVWF       R5 
	MOVF        _AyUsp+2, 0 
	MOVWF       R6 
	MOVF        _AyUsp+3, 0 
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        _ty+0, 0 
	MOVWF       R4 
	MOVF        _ty+1, 0 
	MOVWF       R5 
	MOVF        _ty+2, 0 
	MOVWF       R6 
	MOVF        _ty+3, 0 
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        _Cvy+0, 0 
	MOVWF       R4 
	MOVF        _Cvy+1, 0 
	MOVWF       R5 
	MOVF        _Cvy+2, 0 
	MOVWF       R6 
	MOVF        _Cvy+3, 0 
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC__main+4 
	MOVF        R1, 0 
	MOVWF       FLOC__main+5 
	MOVF        R2, 0 
	MOVWF       FLOC__main+6 
	MOVF        R3, 0 
	MOVWF       FLOC__main+7 
	MOVF        FLOC__main+4, 0 
	MOVWF       _Vy+0 
	MOVF        FLOC__main+5, 0 
	MOVWF       _Vy+1 
	MOVF        FLOC__main+6, 0 
	MOVWF       _Vy+2 
	MOVF        FLOC__main+7, 0 
	MOVWF       _Vy+3 
;Projekat.c,298 :: 		X = (Vx+VxTemp)*tx+Cx;
	MOVF        FLOC__main+0, 0 
	MOVWF       R0 
	MOVF        FLOC__main+1, 0 
	MOVWF       R1 
	MOVF        FLOC__main+2, 0 
	MOVWF       R2 
	MOVF        FLOC__main+3, 0 
	MOVWF       R3 
	MOVF        _VxTemp+0, 0 
	MOVWF       R4 
	MOVF        _VxTemp+1, 0 
	MOVWF       R5 
	MOVF        _VxTemp+2, 0 
	MOVWF       R6 
	MOVF        _VxTemp+3, 0 
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        _tx+0, 0 
	MOVWF       R4 
	MOVF        _tx+1, 0 
	MOVWF       R5 
	MOVF        _tx+2, 0 
	MOVWF       R6 
	MOVF        _tx+3, 0 
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        _Cx+0, 0 
	MOVWF       R4 
	MOVF        _Cx+1, 0 
	MOVWF       R5 
	MOVF        _Cx+2, 0 
	MOVWF       R6 
	MOVF        _Cx+3, 0 
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC__main+0 
	MOVF        R1, 0 
	MOVWF       FLOC__main+1 
	MOVF        R2, 0 
	MOVWF       FLOC__main+2 
	MOVF        R3, 0 
	MOVWF       FLOC__main+3 
	MOVF        FLOC__main+0, 0 
	MOVWF       _X+0 
	MOVF        FLOC__main+1, 0 
	MOVWF       _X+1 
	MOVF        FLOC__main+2, 0 
	MOVWF       _X+2 
	MOVF        FLOC__main+3, 0 
	MOVWF       _X+3 
;Projekat.c,299 :: 		Y = (Vy+VyTemp)*ty+Cy;
	MOVF        FLOC__main+4, 0 
	MOVWF       R0 
	MOVF        FLOC__main+5, 0 
	MOVWF       R1 
	MOVF        FLOC__main+6, 0 
	MOVWF       R2 
	MOVF        FLOC__main+7, 0 
	MOVWF       R3 
	MOVF        _VyTemp+0, 0 
	MOVWF       R4 
	MOVF        _VyTemp+1, 0 
	MOVWF       R5 
	MOVF        _VyTemp+2, 0 
	MOVWF       R6 
	MOVF        _VyTemp+3, 0 
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        _ty+0, 0 
	MOVWF       R4 
	MOVF        _ty+1, 0 
	MOVWF       R5 
	MOVF        _ty+2, 0 
	MOVWF       R6 
	MOVF        _ty+3, 0 
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        _Cy+0, 0 
	MOVWF       R4 
	MOVF        _Cy+1, 0 
	MOVWF       R5 
	MOVF        _Cy+2, 0 
	MOVWF       R6 
	MOVF        _Cy+3, 0 
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _Y+0 
	MOVF        R1, 0 
	MOVWF       _Y+1 
	MOVF        R2, 0 
	MOVWF       _Y+2 
	MOVF        R3, 0 
	MOVWF       _Y+3 
;Projekat.c,301 :: 		if (X-floor(X)>0.5) X=ceil(X); else X=floor(X);
	MOVF        FLOC__main+0, 0 
	MOVWF       FARG_floor_x+0 
	MOVF        FLOC__main+1, 0 
	MOVWF       FARG_floor_x+1 
	MOVF        FLOC__main+2, 0 
	MOVWF       FARG_floor_x+2 
	MOVF        FLOC__main+3, 0 
	MOVWF       FARG_floor_x+3 
	CALL        _floor+0, 0
	MOVF        R0, 0 
	MOVWF       R4 
	MOVF        R1, 0 
	MOVWF       R5 
	MOVF        R2, 0 
	MOVWF       R6 
	MOVF        R3, 0 
	MOVWF       R7 
	MOVF        _X+0, 0 
	MOVWF       R0 
	MOVF        _X+1, 0 
	MOVWF       R1 
	MOVF        _X+2, 0 
	MOVWF       R2 
	MOVF        _X+3, 0 
	MOVWF       R3 
	CALL        _Sub_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       R4 
	MOVF        R1, 0 
	MOVWF       R5 
	MOVF        R2, 0 
	MOVWF       R6 
	MOVF        R3, 0 
	MOVWF       R7 
	MOVLW       0
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       0
	MOVWF       R2 
	MOVLW       126
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main44
	MOVF        _X+0, 0 
	MOVWF       FARG_ceil_x+0 
	MOVF        _X+1, 0 
	MOVWF       FARG_ceil_x+1 
	MOVF        _X+2, 0 
	MOVWF       FARG_ceil_x+2 
	MOVF        _X+3, 0 
	MOVWF       FARG_ceil_x+3 
	CALL        _ceil+0, 0
	MOVF        R0, 0 
	MOVWF       _X+0 
	MOVF        R1, 0 
	MOVWF       _X+1 
	MOVF        R2, 0 
	MOVWF       _X+2 
	MOVF        R3, 0 
	MOVWF       _X+3 
	GOTO        L_main45
L_main44:
	MOVF        _X+0, 0 
	MOVWF       FARG_floor_x+0 
	MOVF        _X+1, 0 
	MOVWF       FARG_floor_x+1 
	MOVF        _X+2, 0 
	MOVWF       FARG_floor_x+2 
	MOVF        _X+3, 0 
	MOVWF       FARG_floor_x+3 
	CALL        _floor+0, 0
	MOVF        R0, 0 
	MOVWF       _X+0 
	MOVF        R1, 0 
	MOVWF       _X+1 
	MOVF        R2, 0 
	MOVWF       _X+2 
	MOVF        R3, 0 
	MOVWF       _X+3 
L_main45:
;Projekat.c,302 :: 		if (Y-floor(Y)>0.5) Y=ceil(Y); else Y=floor(Y);
	MOVF        _Y+0, 0 
	MOVWF       FARG_floor_x+0 
	MOVF        _Y+1, 0 
	MOVWF       FARG_floor_x+1 
	MOVF        _Y+2, 0 
	MOVWF       FARG_floor_x+2 
	MOVF        _Y+3, 0 
	MOVWF       FARG_floor_x+3 
	CALL        _floor+0, 0
	MOVF        R0, 0 
	MOVWF       R4 
	MOVF        R1, 0 
	MOVWF       R5 
	MOVF        R2, 0 
	MOVWF       R6 
	MOVF        R3, 0 
	MOVWF       R7 
	MOVF        _Y+0, 0 
	MOVWF       R0 
	MOVF        _Y+1, 0 
	MOVWF       R1 
	MOVF        _Y+2, 0 
	MOVWF       R2 
	MOVF        _Y+3, 0 
	MOVWF       R3 
	CALL        _Sub_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       R4 
	MOVF        R1, 0 
	MOVWF       R5 
	MOVF        R2, 0 
	MOVWF       R6 
	MOVF        R3, 0 
	MOVWF       R7 
	MOVLW       0
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       0
	MOVWF       R2 
	MOVLW       126
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main46
	MOVF        _Y+0, 0 
	MOVWF       FARG_ceil_x+0 
	MOVF        _Y+1, 0 
	MOVWF       FARG_ceil_x+1 
	MOVF        _Y+2, 0 
	MOVWF       FARG_ceil_x+2 
	MOVF        _Y+3, 0 
	MOVWF       FARG_ceil_x+3 
	CALL        _ceil+0, 0
	MOVF        R0, 0 
	MOVWF       _Y+0 
	MOVF        R1, 0 
	MOVWF       _Y+1 
	MOVF        R2, 0 
	MOVWF       _Y+2 
	MOVF        R3, 0 
	MOVWF       _Y+3 
	GOTO        L_main47
L_main46:
	MOVF        _Y+0, 0 
	MOVWF       FARG_floor_x+0 
	MOVF        _Y+1, 0 
	MOVWF       FARG_floor_x+1 
	MOVF        _Y+2, 0 
	MOVWF       FARG_floor_x+2 
	MOVF        _Y+3, 0 
	MOVWF       FARG_floor_x+3 
	CALL        _floor+0, 0
	MOVF        R0, 0 
	MOVWF       _Y+0 
	MOVF        R1, 0 
	MOVWF       _Y+1 
	MOVF        R2, 0 
	MOVWF       _Y+2 
	MOVF        R3, 0 
	MOVWF       _Y+3 
L_main47:
;Projekat.c,305 :: 		intToStr(Vy, temp);
	MOVF        _Vy+0, 0 
	MOVWF       R0 
	MOVF        _Vy+1, 0 
	MOVWF       R1 
	MOVF        _Vy+2, 0 
	MOVWF       R2 
	MOVF        _Vy+3, 0 
	MOVWF       R3 
	CALL        _double2int+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        R1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       _temp+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(_temp+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;Projekat.c,306 :: 		UART1_Write_Text(temp);
	MOVLW       _temp+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_temp+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;Projekat.c,309 :: 		if (XPr!=0 && ((directionX==right && X/Xpr<1) || (directionX==left && X/Xpr>1))) {
	MOVF        _XPr+0, 0 
	MOVWF       R0 
	MOVF        _XPr+1, 0 
	MOVWF       R1 
	MOVF        _XPr+2, 0 
	MOVWF       R2 
	MOVF        _XPr+3, 0 
	MOVWF       R3 
	CLRF        R4 
	CLRF        R5 
	CLRF        R6 
	CLRF        R7 
	CALL        _Equals_Double+0, 0
	MOVLW       0
	BTFSS       STATUS+0, 2 
	MOVLW       1
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main56
	MOVF        _directionX+0, 0 
	XORLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L__main143
	MOVF        _XPr+0, 0 
	MOVWF       R4 
	MOVF        _XPr+1, 0 
	MOVWF       R5 
	MOVF        _XPr+2, 0 
	MOVWF       R6 
	MOVF        _XPr+3, 0 
	MOVWF       R7 
	MOVF        _X+0, 0 
	MOVWF       R0 
	MOVF        _X+1, 0 
	MOVWF       R1 
	MOVF        _X+2, 0 
	MOVWF       R2 
	MOVF        _X+3, 0 
	MOVWF       R3 
	CALL        _Div_32x32_FP+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       0
	MOVWF       R6 
	MOVLW       127
	MOVWF       R7 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L__main143
	GOTO        L__main141
L__main143:
	MOVF        _directionX+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L__main142
	MOVF        _XPr+0, 0 
	MOVWF       R4 
	MOVF        _XPr+1, 0 
	MOVWF       R5 
	MOVF        _XPr+2, 0 
	MOVWF       R6 
	MOVF        _XPr+3, 0 
	MOVWF       R7 
	MOVF        _X+0, 0 
	MOVWF       R0 
	MOVF        _X+1, 0 
	MOVWF       R1 
	MOVF        _X+2, 0 
	MOVWF       R2 
	MOVF        _X+3, 0 
	MOVWF       R3 
	CALL        _Div_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       R4 
	MOVF        R1, 0 
	MOVWF       R5 
	MOVF        R2, 0 
	MOVWF       R6 
	MOVF        R3, 0 
	MOVWF       R7 
	MOVLW       0
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       0
	MOVWF       R2 
	MOVLW       127
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L__main142
	GOTO        L__main141
L__main142:
	GOTO        L_main56
L__main141:
L__main140:
;Projekat.c,310 :: 		if (wallHit == noHit){
	MOVF        _wallHit+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_main57
;Projekat.c,311 :: 		if(netContact==2){
	MOVF        _netContact+0, 0 
	XORLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L_main58
;Projekat.c,312 :: 		Ax=0;
	CLRF        _Ax+0 
	CLRF        _Ax+1 
	CLRF        _Ax+2 
	CLRF        _Ax+3 
;Projekat.c,313 :: 		Vx=0;
	CLRF        _Vx+0 
	CLRF        _Vx+1 
	CLRF        _Vx+2 
	CLRF        _Vx+3 
;Projekat.c,314 :: 		Cvx=0;
	CLRF        _Cvx+0 
	CLRF        _Cvx+1 
	CLRF        _Cvx+2 
	CLRF        _Cvx+3 
;Projekat.c,315 :: 		X=Cx;
	MOVF        _Cx+0, 0 
	MOVWF       _X+0 
	MOVF        _Cx+1, 0 
	MOVWF       _X+1 
	MOVF        _Cx+2, 0 
	MOVWF       _X+2 
	MOVF        _Cx+3, 0 
	MOVWF       _X+3 
;Projekat.c,316 :: 		Cx=0;
	CLRF        _Cx+0 
	CLRF        _Cx+1 
	CLRF        _Cx+2 
	CLRF        _Cx+3 
;Projekat.c,317 :: 		}
L_main58:
;Projekat.c,318 :: 		X=XPr;
	MOVF        _XPr+0, 0 
	MOVWF       _X+0 
	MOVF        _XPr+1, 0 
	MOVWF       _X+1 
	MOVF        _XPr+2, 0 
	MOVWF       _X+2 
	MOVF        _XPr+3, 0 
	MOVWF       _X+3 
;Projekat.c,319 :: 		Cx=X;
	MOVF        _XPr+0, 0 
	MOVWF       _Cx+0 
	MOVF        _XPr+1, 0 
	MOVWF       _Cx+1 
	MOVF        _XPr+2, 0 
	MOVWF       _Cx+2 
	MOVF        _XPr+3, 0 
	MOVWF       _Cx+3 
;Projekat.c,320 :: 		Vx=0;
	CLRF        _Vx+0 
	CLRF        _Vx+1 
	CLRF        _Vx+2 
	CLRF        _Vx+3 
;Projekat.c,321 :: 		Cvx=0;
	CLRF        _Cvx+0 
	CLRF        _Cvx+1 
	CLRF        _Cvx+2 
	CLRF        _Cvx+3 
;Projekat.c,322 :: 		tx=0;
	CLRF        _tx+0 
	CLRF        _tx+1 
	CLRF        _tx+2 
	CLRF        _tx+3 
;Projekat.c,323 :: 		if(Ax>0) directionX=right;
	MOVF        _Ax+0, 0 
	MOVWF       R4 
	MOVF        _Ax+1, 0 
	MOVWF       R5 
	MOVF        _Ax+2, 0 
	MOVWF       R6 
	MOVF        _Ax+3, 0 
	MOVWF       R7 
	CLRF        R0 
	CLRF        R1 
	CLRF        R2 
	CLRF        R3 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main59
	MOVLW       2
	MOVWF       _directionX+0 
L_main59:
;Projekat.c,324 :: 		if(Ax<0) directionX=left;
	CLRF        R4 
	CLRF        R5 
	CLRF        R6 
	CLRF        R7 
	MOVF        _Ax+0, 0 
	MOVWF       R0 
	MOVF        _Ax+1, 0 
	MOVWF       R1 
	MOVF        _Ax+2, 0 
	MOVWF       R2 
	MOVF        _Ax+3, 0 
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main60
	MOVLW       1
	MOVWF       _directionX+0 
L_main60:
;Projekat.c,326 :: 		}
L_main57:
;Projekat.c,328 :: 		}
L_main56:
;Projekat.c,330 :: 		if (YPr!=0 && ((directionY==up && Y/Ypr<1) || (directionY==down && Y/Ypr>1))) {
	MOVF        _YPr+0, 0 
	MOVWF       R0 
	MOVF        _YPr+1, 0 
	MOVWF       R1 
	MOVF        _YPr+2, 0 
	MOVWF       R2 
	MOVF        _YPr+3, 0 
	MOVWF       R3 
	CLRF        R4 
	CLRF        R5 
	CLRF        R6 
	CLRF        R7 
	CALL        _Equals_Double+0, 0
	MOVLW       0
	BTFSS       STATUS+0, 2 
	MOVLW       1
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main69
	MOVF        _directionY+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L__main139
	MOVF        _YPr+0, 0 
	MOVWF       R4 
	MOVF        _YPr+1, 0 
	MOVWF       R5 
	MOVF        _YPr+2, 0 
	MOVWF       R6 
	MOVF        _YPr+3, 0 
	MOVWF       R7 
	MOVF        _Y+0, 0 
	MOVWF       R0 
	MOVF        _Y+1, 0 
	MOVWF       R1 
	MOVF        _Y+2, 0 
	MOVWF       R2 
	MOVF        _Y+3, 0 
	MOVWF       R3 
	CALL        _Div_32x32_FP+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       0
	MOVWF       R6 
	MOVLW       127
	MOVWF       R7 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L__main139
	GOTO        L__main137
L__main139:
	MOVF        _directionY+0, 0 
	XORLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L__main138
	MOVF        _YPr+0, 0 
	MOVWF       R4 
	MOVF        _YPr+1, 0 
	MOVWF       R5 
	MOVF        _YPr+2, 0 
	MOVWF       R6 
	MOVF        _YPr+3, 0 
	MOVWF       R7 
	MOVF        _Y+0, 0 
	MOVWF       R0 
	MOVF        _Y+1, 0 
	MOVWF       R1 
	MOVF        _Y+2, 0 
	MOVWF       R2 
	MOVF        _Y+3, 0 
	MOVWF       R3 
	CALL        _Div_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       R4 
	MOVF        R1, 0 
	MOVWF       R5 
	MOVF        R2, 0 
	MOVWF       R6 
	MOVF        R3, 0 
	MOVWF       R7 
	MOVLW       0
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       0
	MOVWF       R2 
	MOVLW       127
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L__main138
	GOTO        L__main137
L__main138:
	GOTO        L_main69
L__main137:
L__main136:
;Projekat.c,331 :: 		if(wallHit==noHit){
	MOVF        _wallHit+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_main70
;Projekat.c,332 :: 		if(netContact==2){
	MOVF        _netContact+0, 0 
	XORLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L_main71
;Projekat.c,333 :: 		Ay=0;
	CLRF        _Ay+0 
	CLRF        _Ay+1 
	CLRF        _Ay+2 
	CLRF        _Ay+3 
;Projekat.c,334 :: 		Vy=0;
	CLRF        _Vy+0 
	CLRF        _Vy+1 
	CLRF        _Vy+2 
	CLRF        _Vy+3 
;Projekat.c,335 :: 		Cvy=0;
	CLRF        _Cvy+0 
	CLRF        _Cvy+1 
	CLRF        _Cvy+2 
	CLRF        _Cvy+3 
;Projekat.c,336 :: 		Y=Cx;
	MOVF        _Cx+0, 0 
	MOVWF       _Y+0 
	MOVF        _Cx+1, 0 
	MOVWF       _Y+1 
	MOVF        _Cx+2, 0 
	MOVWF       _Y+2 
	MOVF        _Cx+3, 0 
	MOVWF       _Y+3 
;Projekat.c,337 :: 		Cy=0;
	CLRF        _Cy+0 
	CLRF        _Cy+1 
	CLRF        _Cy+2 
	CLRF        _Cy+3 
;Projekat.c,338 :: 		}
L_main71:
;Projekat.c,339 :: 		Y=YPr;
	MOVF        _YPr+0, 0 
	MOVWF       _Y+0 
	MOVF        _YPr+1, 0 
	MOVWF       _Y+1 
	MOVF        _YPr+2, 0 
	MOVWF       _Y+2 
	MOVF        _YPr+3, 0 
	MOVWF       _Y+3 
;Projekat.c,340 :: 		Cy=Y;
	MOVF        _YPr+0, 0 
	MOVWF       _Cy+0 
	MOVF        _YPr+1, 0 
	MOVWF       _Cy+1 
	MOVF        _YPr+2, 0 
	MOVWF       _Cy+2 
	MOVF        _YPr+3, 0 
	MOVWF       _Cy+3 
;Projekat.c,341 :: 		Vy=0;
	CLRF        _Vy+0 
	CLRF        _Vy+1 
	CLRF        _Vy+2 
	CLRF        _Vy+3 
;Projekat.c,342 :: 		Cvy=0;
	CLRF        _Cvy+0 
	CLRF        _Cvy+1 
	CLRF        _Cvy+2 
	CLRF        _Cvy+3 
;Projekat.c,343 :: 		ty=0;
	CLRF        _ty+0 
	CLRF        _ty+1 
	CLRF        _ty+2 
	CLRF        _ty+3 
;Projekat.c,344 :: 		if(Ay>0) directionY=up;
	MOVF        _Ay+0, 0 
	MOVWF       R4 
	MOVF        _Ay+1, 0 
	MOVWF       R5 
	MOVF        _Ay+2, 0 
	MOVWF       R6 
	MOVF        _Ay+3, 0 
	MOVWF       R7 
	CLRF        R0 
	CLRF        R1 
	CLRF        R2 
	CLRF        R3 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main72
	MOVLW       1
	MOVWF       _directionY+0 
L_main72:
;Projekat.c,345 :: 		if(Ay<0) directionY=down;
	CLRF        R4 
	CLRF        R5 
	CLRF        R6 
	CLRF        R7 
	MOVF        _Ay+0, 0 
	MOVWF       R0 
	MOVF        _Ay+1, 0 
	MOVWF       R1 
	MOVF        _Ay+2, 0 
	MOVWF       R2 
	MOVF        _Ay+3, 0 
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main73
	MOVLW       2
	MOVWF       _directionY+0 
L_main73:
;Projekat.c,346 :: 		}
L_main70:
;Projekat.c,347 :: 		}
L_main69:
;Projekat.c,350 :: 		if (wallHit == hit) {
	MOVF        _wallHit+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main74
;Projekat.c,351 :: 		wallHit = noHit;
	CLRF        _wallHit+0 
;Projekat.c,352 :: 		}
L_main74:
;Projekat.c,354 :: 		Xtemp=Xpr+(X-Xpr)/2;
	MOVF        _XPr+0, 0 
	MOVWF       R4 
	MOVF        _XPr+1, 0 
	MOVWF       R5 
	MOVF        _XPr+2, 0 
	MOVWF       R6 
	MOVF        _XPr+3, 0 
	MOVWF       R7 
	MOVF        _X+0, 0 
	MOVWF       R0 
	MOVF        _X+1, 0 
	MOVWF       R1 
	MOVF        _X+2, 0 
	MOVWF       R2 
	MOVF        _X+3, 0 
	MOVWF       R3 
	CALL        _Sub_32x32_FP+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       0
	MOVWF       R6 
	MOVLW       128
	MOVWF       R7 
	CALL        _Div_32x32_FP+0, 0
	MOVF        _XPr+0, 0 
	MOVWF       R4 
	MOVF        _XPr+1, 0 
	MOVWF       R5 
	MOVF        _XPr+2, 0 
	MOVWF       R6 
	MOVF        _XPr+3, 0 
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _Xtemp+0 
	MOVF        R1, 0 
	MOVWF       _Xtemp+1 
	MOVF        R2, 0 
	MOVWF       _Xtemp+2 
	MOVF        R3, 0 
	MOVWF       _Xtemp+3 
;Projekat.c,355 :: 		Ytemp=Ypr+(Y-Ypr)/2;
	MOVF        _YPr+0, 0 
	MOVWF       R4 
	MOVF        _YPr+1, 0 
	MOVWF       R5 
	MOVF        _YPr+2, 0 
	MOVWF       R6 
	MOVF        _YPr+3, 0 
	MOVWF       R7 
	MOVF        _Y+0, 0 
	MOVWF       R0 
	MOVF        _Y+1, 0 
	MOVWF       R1 
	MOVF        _Y+2, 0 
	MOVWF       R2 
	MOVF        _Y+3, 0 
	MOVWF       R3 
	CALL        _Sub_32x32_FP+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       0
	MOVWF       R6 
	MOVLW       128
	MOVWF       R7 
	CALL        _Div_32x32_FP+0, 0
	MOVF        _YPr+0, 0 
	MOVWF       R4 
	MOVF        _YPr+1, 0 
	MOVWF       R5 
	MOVF        _YPr+2, 0 
	MOVWF       R6 
	MOVF        _YPr+3, 0 
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _Ytemp+0 
	MOVF        R1, 0 
	MOVWF       _Ytemp+1 
	MOVF        R2, 0 
	MOVWF       _Ytemp+2 
	MOVF        R3, 0 
	MOVWF       _Ytemp+3 
;Projekat.c,357 :: 		if (X>122) {
	MOVF        _X+0, 0 
	MOVWF       R4 
	MOVF        _X+1, 0 
	MOVWF       R5 
	MOVF        _X+2, 0 
	MOVWF       R6 
	MOVF        _X+3, 0 
	MOVWF       R7 
	MOVLW       0
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       116
	MOVWF       R2 
	MOVLW       133
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main75
;Projekat.c,358 :: 		if(netPosition==1) netPosition=0;
	MOVLW       0
	XORWF       _netPosition+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main161
	MOVLW       1
	XORWF       _netPosition+0, 0 
L__main161:
	BTFSS       STATUS+0, 2 
	GOTO        L_main76
	CLRF        _netPosition+0 
	CLRF        _netPosition+1 
	GOTO        L_main77
L_main76:
;Projekat.c,360 :: 		X=wallColision(122, 'X');
	MOVLW       122
	MOVWF       FARG_Projekat_wallColision_value+0 
	MOVLW       0
	MOVWF       FARG_Projekat_wallColision_value+1 
	MOVLW       88
	MOVWF       FARG_Projekat_wallColision_wall+0 
	CALL        Projekat_wallColision+0, 0
	CALL        _int2double+0, 0
	MOVF        R0, 0 
	MOVWF       _X+0 
	MOVF        R1, 0 
	MOVWF       _X+1 
	MOVF        R2, 0 
	MOVWF       _X+2 
	MOVF        R3, 0 
	MOVWF       _X+3 
;Projekat.c,361 :: 		Xtemp=122;
	MOVLW       0
	MOVWF       _Xtemp+0 
	MOVLW       0
	MOVWF       _Xtemp+1 
	MOVLW       116
	MOVWF       _Xtemp+2 
	MOVLW       133
	MOVWF       _Xtemp+3 
;Projekat.c,362 :: 		}
L_main77:
;Projekat.c,365 :: 		}
L_main75:
;Projekat.c,367 :: 		if (X<5) {
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       32
	MOVWF       R6 
	MOVLW       129
	MOVWF       R7 
	MOVF        _X+0, 0 
	MOVWF       R0 
	MOVF        _X+1, 0 
	MOVWF       R1 
	MOVF        _X+2, 0 
	MOVWF       R2 
	MOVF        _X+3, 0 
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main78
;Projekat.c,368 :: 		if(netPosition==2) netPosition=0;
	MOVLW       0
	XORWF       _netPosition+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main162
	MOVLW       2
	XORWF       _netPosition+0, 0 
L__main162:
	BTFSS       STATUS+0, 2 
	GOTO        L_main79
	CLRF        _netPosition+0 
	CLRF        _netPosition+1 
	GOTO        L_main80
L_main79:
;Projekat.c,370 :: 		X=wallColision(5, 'X');
	MOVLW       5
	MOVWF       FARG_Projekat_wallColision_value+0 
	MOVLW       0
	MOVWF       FARG_Projekat_wallColision_value+1 
	MOVLW       88
	MOVWF       FARG_Projekat_wallColision_wall+0 
	CALL        Projekat_wallColision+0, 0
	CALL        _int2double+0, 0
	MOVF        R0, 0 
	MOVWF       _X+0 
	MOVF        R1, 0 
	MOVWF       _X+1 
	MOVF        R2, 0 
	MOVWF       _X+2 
	MOVF        R3, 0 
	MOVWF       _X+3 
;Projekat.c,371 :: 		Xtemp=5;
	MOVLW       0
	MOVWF       _Xtemp+0 
	MOVLW       0
	MOVWF       _Xtemp+1 
	MOVLW       32
	MOVWF       _Xtemp+2 
	MOVLW       129
	MOVWF       _Xtemp+3 
;Projekat.c,372 :: 		}
L_main80:
;Projekat.c,373 :: 		}
L_main78:
;Projekat.c,375 :: 		if (Y<5) {
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       32
	MOVWF       R6 
	MOVLW       129
	MOVWF       R7 
	MOVF        _Y+0, 0 
	MOVWF       R0 
	MOVF        _Y+1, 0 
	MOVWF       R1 
	MOVF        _Y+2, 0 
	MOVWF       R2 
	MOVF        _Y+3, 0 
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main81
;Projekat.c,376 :: 		if(netPosition==3) netPosition=0;
	MOVLW       0
	XORWF       _netPosition+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main163
	MOVLW       3
	XORWF       _netPosition+0, 0 
L__main163:
	BTFSS       STATUS+0, 2 
	GOTO        L_main82
	CLRF        _netPosition+0 
	CLRF        _netPosition+1 
	GOTO        L_main83
L_main82:
;Projekat.c,378 :: 		Y=wallColision(5, 'Y');
	MOVLW       5
	MOVWF       FARG_Projekat_wallColision_value+0 
	MOVLW       0
	MOVWF       FARG_Projekat_wallColision_value+1 
	MOVLW       89
	MOVWF       FARG_Projekat_wallColision_wall+0 
	CALL        Projekat_wallColision+0, 0
	CALL        _int2double+0, 0
	MOVF        R0, 0 
	MOVWF       _Y+0 
	MOVF        R1, 0 
	MOVWF       _Y+1 
	MOVF        R2, 0 
	MOVWF       _Y+2 
	MOVF        R3, 0 
	MOVWF       _Y+3 
;Projekat.c,379 :: 		Ytemp=5;
	MOVLW       0
	MOVWF       _Ytemp+0 
	MOVLW       0
	MOVWF       _Ytemp+1 
	MOVLW       32
	MOVWF       _Ytemp+2 
	MOVLW       129
	MOVWF       _Ytemp+3 
;Projekat.c,380 :: 		}
L_main83:
;Projekat.c,381 :: 		}
L_main81:
;Projekat.c,383 :: 		if (Y>58){
	MOVF        _Y+0, 0 
	MOVWF       R4 
	MOVF        _Y+1, 0 
	MOVWF       R5 
	MOVF        _Y+2, 0 
	MOVWF       R6 
	MOVF        _Y+3, 0 
	MOVWF       R7 
	MOVLW       0
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       104
	MOVWF       R2 
	MOVLW       132
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main84
;Projekat.c,384 :: 		if(netPosition==4) netPosition=0;
	MOVLW       0
	XORWF       _netPosition+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main164
	MOVLW       4
	XORWF       _netPosition+0, 0 
L__main164:
	BTFSS       STATUS+0, 2 
	GOTO        L_main85
	CLRF        _netPosition+0 
	CLRF        _netPosition+1 
	GOTO        L_main86
L_main85:
;Projekat.c,386 :: 		Y=wallColision(58, 'Y');
	MOVLW       58
	MOVWF       FARG_Projekat_wallColision_value+0 
	MOVLW       0
	MOVWF       FARG_Projekat_wallColision_value+1 
	MOVLW       89
	MOVWF       FARG_Projekat_wallColision_wall+0 
	CALL        Projekat_wallColision+0, 0
	CALL        _int2double+0, 0
	MOVF        R0, 0 
	MOVWF       _Y+0 
	MOVF        R1, 0 
	MOVWF       _Y+1 
	MOVF        R2, 0 
	MOVWF       _Y+2 
	MOVF        R3, 0 
	MOVWF       _Y+3 
;Projekat.c,387 :: 		Ytemp=58;
	MOVLW       0
	MOVWF       _Ytemp+0 
	MOVLW       0
	MOVWF       _Ytemp+1 
	MOVLW       104
	MOVWF       _Ytemp+2 
	MOVLW       132
	MOVWF       _Ytemp+3 
;Projekat.c,388 :: 		}
L_main86:
;Projekat.c,389 :: 		}
L_main84:
;Projekat.c,390 :: 		if(wallHit==1) {
	MOVF        _wallHit+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main87
;Projekat.c,391 :: 		Glcd_Circle_Fill(Xtemp, Ytemp, 4, 1);
	MOVF        _Xtemp+0, 0 
	MOVWF       R0 
	MOVF        _Xtemp+1, 0 
	MOVWF       R1 
	MOVF        _Xtemp+2, 0 
	MOVWF       R2 
	MOVF        _Xtemp+3, 0 
	MOVWF       R3 
	CALL        _double2int+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_Glcd_Circle_Fill_x_center+0 
	MOVF        R1, 0 
	MOVWF       FARG_Glcd_Circle_Fill_x_center+1 
	MOVF        _Ytemp+0, 0 
	MOVWF       R0 
	MOVF        _Ytemp+1, 0 
	MOVWF       R1 
	MOVF        _Ytemp+2, 0 
	MOVWF       R2 
	MOVF        _Ytemp+3, 0 
	MOVWF       R3 
	CALL        _double2int+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_Glcd_Circle_Fill_y_center+0 
	MOVF        R1, 0 
	MOVWF       FARG_Glcd_Circle_Fill_y_center+1 
	MOVLW       4
	MOVWF       FARG_Glcd_Circle_Fill_radius+0 
	MOVLW       0
	MOVWF       FARG_Glcd_Circle_Fill_radius+1 
	MOVLW       1
	MOVWF       FARG_Glcd_Circle_Fill_color+0 
	CALL        _Glcd_Circle_Fill+0, 0
;Projekat.c,392 :: 		delay_ms(60);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       56
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_main88:
	DECFSZ      R13, 1, 1
	BRA         L_main88
	DECFSZ      R12, 1, 1
	BRA         L_main88
	DECFSZ      R11, 1, 1
	BRA         L_main88
;Projekat.c,393 :: 		Glcd_Circle_Fill(Xtemp, Ytemp, 4, 0);
	MOVF        _Xtemp+0, 0 
	MOVWF       R0 
	MOVF        _Xtemp+1, 0 
	MOVWF       R1 
	MOVF        _Xtemp+2, 0 
	MOVWF       R2 
	MOVF        _Xtemp+3, 0 
	MOVWF       R3 
	CALL        _double2int+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_Glcd_Circle_Fill_x_center+0 
	MOVF        R1, 0 
	MOVWF       FARG_Glcd_Circle_Fill_x_center+1 
	MOVF        _Ytemp+0, 0 
	MOVWF       R0 
	MOVF        _Ytemp+1, 0 
	MOVWF       R1 
	MOVF        _Ytemp+2, 0 
	MOVWF       R2 
	MOVF        _Ytemp+3, 0 
	MOVWF       R3 
	CALL        _double2int+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_Glcd_Circle_Fill_y_center+0 
	MOVF        R1, 0 
	MOVWF       FARG_Glcd_Circle_Fill_y_center+1 
	MOVLW       4
	MOVWF       FARG_Glcd_Circle_Fill_radius+0 
	MOVLW       0
	MOVWF       FARG_Glcd_Circle_Fill_radius+1 
	CLRF        FARG_Glcd_Circle_Fill_color+0 
	CALL        _Glcd_Circle_Fill+0, 0
;Projekat.c,394 :: 		}
L_main87:
;Projekat.c,397 :: 		if (netContact==1 && X==Xpr && Y==Ypr) netContact=2;
	MOVF        _netContact+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main91
	MOVF        _XPr+0, 0 
	MOVWF       R4 
	MOVF        _XPr+1, 0 
	MOVWF       R5 
	MOVF        _XPr+2, 0 
	MOVWF       R6 
	MOVF        _XPr+3, 0 
	MOVWF       R7 
	MOVF        _X+0, 0 
	MOVWF       R0 
	MOVF        _X+1, 0 
	MOVWF       R1 
	MOVF        _X+2, 0 
	MOVWF       R2 
	MOVF        _X+3, 0 
	MOVWF       R3 
	CALL        _Equals_Double+0, 0
	MOVLW       1
	BTFSS       STATUS+0, 2 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main91
	MOVF        _YPr+0, 0 
	MOVWF       R4 
	MOVF        _YPr+1, 0 
	MOVWF       R5 
	MOVF        _YPr+2, 0 
	MOVWF       R6 
	MOVF        _YPr+3, 0 
	MOVWF       R7 
	MOVF        _Y+0, 0 
	MOVWF       R0 
	MOVF        _Y+1, 0 
	MOVWF       R1 
	MOVF        _Y+2, 0 
	MOVWF       R2 
	MOVF        _Y+3, 0 
	MOVWF       R3 
	CALL        _Equals_Double+0, 0
	MOVLW       1
	BTFSS       STATUS+0, 2 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main91
L__main135:
	MOVLW       2
	MOVWF       _netContact+0 
L_main91:
;Projekat.c,398 :: 		if (RH1_bit==1) {gameMode++; netContact=2; score--; delay_ms(300); };
	BTFSS       RH1_bit+0, BitPos(RH1_bit+0) 
	GOTO        L_main92
	INFSNZ      _gameMode+0, 1 
	INCF        _gameMode+1, 1 
	MOVLW       2
	MOVWF       _netContact+0 
	MOVLW       1
	SUBWF       _score+0, 1 
	MOVLW       0
	SUBWFB      _score+1, 1 
	MOVLW       7
	MOVWF       R11, 0
	MOVLW       23
	MOVWF       R12, 0
	MOVLW       106
	MOVWF       R13, 0
L_main93:
	DECFSZ      R13, 1, 1
	BRA         L_main93
	DECFSZ      R12, 1, 1
	BRA         L_main93
	DECFSZ      R11, 1, 1
	BRA         L_main93
	NOP
L_main92:
;Projekat.c,400 :: 		Glcd_Circle_Fill(Xpr, Ypr, 4, 0);
	MOVF        _XPr+0, 0 
	MOVWF       R0 
	MOVF        _XPr+1, 0 
	MOVWF       R1 
	MOVF        _XPr+2, 0 
	MOVWF       R2 
	MOVF        _XPr+3, 0 
	MOVWF       R3 
	CALL        _double2int+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_Glcd_Circle_Fill_x_center+0 
	MOVF        R1, 0 
	MOVWF       FARG_Glcd_Circle_Fill_x_center+1 
	MOVF        _YPr+0, 0 
	MOVWF       R0 
	MOVF        _YPr+1, 0 
	MOVWF       R1 
	MOVF        _YPr+2, 0 
	MOVWF       R2 
	MOVF        _YPr+3, 0 
	MOVWF       R3 
	CALL        _double2int+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_Glcd_Circle_Fill_y_center+0 
	MOVF        R1, 0 
	MOVWF       FARG_Glcd_Circle_Fill_y_center+1 
	MOVLW       4
	MOVWF       FARG_Glcd_Circle_Fill_radius+0 
	MOVLW       0
	MOVWF       FARG_Glcd_Circle_Fill_radius+1 
	CLRF        FARG_Glcd_Circle_Fill_color+0 
	CALL        _Glcd_Circle_Fill+0, 0
;Projekat.c,401 :: 		Glcd_Circle_Fill(X, Y, 4, 1);
	MOVF        _X+0, 0 
	MOVWF       R0 
	MOVF        _X+1, 0 
	MOVWF       R1 
	MOVF        _X+2, 0 
	MOVWF       R2 
	MOVF        _X+3, 0 
	MOVWF       R3 
	CALL        _double2int+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_Glcd_Circle_Fill_x_center+0 
	MOVF        R1, 0 
	MOVWF       FARG_Glcd_Circle_Fill_x_center+1 
	MOVF        _Y+0, 0 
	MOVWF       R0 
	MOVF        _Y+1, 0 
	MOVWF       R1 
	MOVF        _Y+2, 0 
	MOVWF       R2 
	MOVF        _Y+3, 0 
	MOVWF       R3 
	CALL        _double2int+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_Glcd_Circle_Fill_y_center+0 
	MOVF        R1, 0 
	MOVWF       FARG_Glcd_Circle_Fill_y_center+1 
	MOVLW       4
	MOVWF       FARG_Glcd_Circle_Fill_radius+0 
	MOVLW       0
	MOVWF       FARG_Glcd_Circle_Fill_radius+1 
	MOVLW       1
	MOVWF       FARG_Glcd_Circle_Fill_color+0 
	CALL        _Glcd_Circle_Fill+0, 0
;Projekat.c,402 :: 		delay_ms(150);
	MOVLW       4
	MOVWF       R11, 0
	MOVLW       12
	MOVWF       R12, 0
	MOVLW       51
	MOVWF       R13, 0
L_main94:
	DECFSZ      R13, 1, 1
	BRA         L_main94
	DECFSZ      R12, 1, 1
	BRA         L_main94
	DECFSZ      R11, 1, 1
	BRA         L_main94
	NOP
	NOP
;Projekat.c,403 :: 		}
	GOTO        L_main95
L_main22:
;Projekat.c,406 :: 		netContact=clear;
	CLRF        _netContact+0 
;Projekat.c,407 :: 		Ax=0;
	CLRF        _Ax+0 
	CLRF        _Ax+1 
	CLRF        _Ax+2 
	CLRF        _Ax+3 
;Projekat.c,408 :: 		Ay=0;
	CLRF        _Ay+0 
	CLRF        _Ay+1 
	CLRF        _Ay+2 
	CLRF        _Ay+3 
;Projekat.c,409 :: 		Vx=0;
	CLRF        _Vx+0 
	CLRF        _Vx+1 
	CLRF        _Vx+2 
	CLRF        _Vx+3 
;Projekat.c,410 :: 		Cvx=0;
	CLRF        _Cvx+0 
	CLRF        _Cvx+1 
	CLRF        _Cvx+2 
	CLRF        _Cvx+3 
;Projekat.c,411 :: 		Vy=0;
	CLRF        _Vy+0 
	CLRF        _Vy+1 
	CLRF        _Vy+2 
	CLRF        _Vy+3 
;Projekat.c,412 :: 		Cvy=0;
	CLRF        _Cvy+0 
	CLRF        _Cvy+1 
	CLRF        _Cvy+2 
	CLRF        _Cvy+3 
;Projekat.c,413 :: 		if(netPosition!=0){
	MOVLW       0
	XORWF       _netPosition+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main165
	MOVLW       0
	XORWF       _netPosition+0, 0 
L__main165:
	BTFSC       STATUS+0, 2 
	GOTO        L_main96
;Projekat.c,414 :: 		switch(clearCondition) {
	GOTO        L_main97
;Projekat.c,415 :: 		case 1: {
L_main99:
;Projekat.c,416 :: 		if(X>90 && X<122) gameMode++;
	MOVF        _X+0, 0 
	MOVWF       R4 
	MOVF        _X+1, 0 
	MOVWF       R5 
	MOVF        _X+2, 0 
	MOVWF       R6 
	MOVF        _X+3, 0 
	MOVWF       R7 
	MOVLW       0
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       52
	MOVWF       R2 
	MOVLW       133
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main102
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       116
	MOVWF       R6 
	MOVLW       133
	MOVWF       R7 
	MOVF        _X+0, 0 
	MOVWF       R0 
	MOVF        _X+1, 0 
	MOVWF       R1 
	MOVF        _X+2, 0 
	MOVWF       R2 
	MOVF        _X+3, 0 
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main102
L__main134:
	INFSNZ      _gameMode+0, 1 
	INCF        _gameMode+1, 1 
L_main102:
;Projekat.c,417 :: 		break;
	GOTO        L_main98
;Projekat.c,419 :: 		case 2: {
L_main103:
;Projekat.c,420 :: 		if(X>5 && X<25) gameMode++;
	MOVF        _X+0, 0 
	MOVWF       R4 
	MOVF        _X+1, 0 
	MOVWF       R5 
	MOVF        _X+2, 0 
	MOVWF       R6 
	MOVF        _X+3, 0 
	MOVWF       R7 
	MOVLW       0
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       32
	MOVWF       R2 
	MOVLW       129
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main106
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       72
	MOVWF       R6 
	MOVLW       131
	MOVWF       R7 
	MOVF        _X+0, 0 
	MOVWF       R0 
	MOVF        _X+1, 0 
	MOVWF       R1 
	MOVF        _X+2, 0 
	MOVWF       R2 
	MOVF        _X+3, 0 
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main106
L__main133:
	INFSNZ      _gameMode+0, 1 
	INCF        _gameMode+1, 1 
L_main106:
;Projekat.c,421 :: 		break;
	GOTO        L_main98
;Projekat.c,423 :: 		case 3: {
L_main107:
;Projekat.c,424 :: 		if(Y>5 && Y<16) gameMode++;
	MOVF        _Y+0, 0 
	MOVWF       R4 
	MOVF        _Y+1, 0 
	MOVWF       R5 
	MOVF        _Y+2, 0 
	MOVWF       R6 
	MOVF        _Y+3, 0 
	MOVWF       R7 
	MOVLW       0
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       32
	MOVWF       R2 
	MOVLW       129
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main110
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       0
	MOVWF       R6 
	MOVLW       131
	MOVWF       R7 
	MOVF        _Y+0, 0 
	MOVWF       R0 
	MOVF        _Y+1, 0 
	MOVWF       R1 
	MOVF        _Y+2, 0 
	MOVWF       R2 
	MOVF        _Y+3, 0 
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main110
L__main132:
	INFSNZ      _gameMode+0, 1 
	INCF        _gameMode+1, 1 
L_main110:
;Projekat.c,425 :: 		break;
	GOTO        L_main98
;Projekat.c,427 :: 		case 4: {
L_main111:
;Projekat.c,428 :: 		if(Y>44 && Y<58) gameMode++;
	MOVF        _Y+0, 0 
	MOVWF       R4 
	MOVF        _Y+1, 0 
	MOVWF       R5 
	MOVF        _Y+2, 0 
	MOVWF       R6 
	MOVF        _Y+3, 0 
	MOVWF       R7 
	MOVLW       0
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       48
	MOVWF       R2 
	MOVLW       132
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main114
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       104
	MOVWF       R6 
	MOVLW       132
	MOVWF       R7 
	MOVF        _Y+0, 0 
	MOVWF       R0 
	MOVF        _Y+1, 0 
	MOVWF       R1 
	MOVF        _Y+2, 0 
	MOVWF       R2 
	MOVF        _Y+3, 0 
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main114
L__main131:
	INFSNZ      _gameMode+0, 1 
	INCF        _gameMode+1, 1 
L_main114:
;Projekat.c,429 :: 		break;
	GOTO        L_main98
;Projekat.c,431 :: 		default: {break;}
L_main115:
	GOTO        L_main98
;Projekat.c,432 :: 		}
L_main97:
	MOVLW       0
	XORWF       _clearCondition+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main166
	MOVLW       1
	XORWF       _clearCondition+0, 0 
L__main166:
	BTFSC       STATUS+0, 2 
	GOTO        L_main99
	MOVLW       0
	XORWF       _clearCondition+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main167
	MOVLW       2
	XORWF       _clearCondition+0, 0 
L__main167:
	BTFSC       STATUS+0, 2 
	GOTO        L_main103
	MOVLW       0
	XORWF       _clearCondition+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main168
	MOVLW       3
	XORWF       _clearCondition+0, 0 
L__main168:
	BTFSC       STATUS+0, 2 
	GOTO        L_main107
	MOVLW       0
	XORWF       _clearCondition+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main169
	MOVLW       4
	XORWF       _clearCondition+0, 0 
L__main169:
	BTFSC       STATUS+0, 2 
	GOTO        L_main111
	GOTO        L_main115
L_main98:
;Projekat.c,433 :: 		}
L_main96:
;Projekat.c,434 :: 		switch(gameMode) {
	GOTO        L_main116
;Projekat.c,435 :: 		case 0: {
L_main118:
;Projekat.c,436 :: 		setNet(60, 0, 30, 64, 'X', 5, 28);
	MOVLW       60
	MOVWF       FARG_setNet_n1+0 
	MOVLW       0
	MOVWF       FARG_setNet_n1+1 
	CLRF        FARG_setNet_n2+0 
	CLRF        FARG_setNet_n2+1 
	MOVLW       30
	MOVWF       FARG_setNet_n3+0 
	MOVLW       0
	MOVWF       FARG_setNet_n3+1 
	MOVLW       64
	MOVWF       FARG_setNet_n4+0 
	MOVLW       0
	MOVWF       FARG_setNet_n4+1 
	MOVLW       88
	MOVWF       FARG_setNet_c1+0 
	MOVLW       0
	MOVWF       FARG_setNet_d1+0 
	MOVLW       0
	MOVWF       FARG_setNet_d1+1 
	MOVLW       32
	MOVWF       FARG_setNet_d1+2 
	MOVLW       129
	MOVWF       FARG_setNet_d1+3 
	MOVLW       0
	MOVWF       FARG_setNet_d2+0 
	MOVLW       0
	MOVWF       FARG_setNet_d2+1 
	MOVLW       96
	MOVWF       FARG_setNet_d2+2 
	MOVLW       131
	MOVWF       FARG_setNet_d2+3 
	CALL        _setNet+0, 0
;Projekat.c,437 :: 		break;
	GOTO        L_main117
;Projekat.c,439 :: 		case 1: {
L_main119:
;Projekat.c,440 :: 		setNet(60, 0, 30, 64, 'X', 40, 28);
	MOVLW       60
	MOVWF       FARG_setNet_n1+0 
	MOVLW       0
	MOVWF       FARG_setNet_n1+1 
	CLRF        FARG_setNet_n2+0 
	CLRF        FARG_setNet_n2+1 
	MOVLW       30
	MOVWF       FARG_setNet_n3+0 
	MOVLW       0
	MOVWF       FARG_setNet_n3+1 
	MOVLW       64
	MOVWF       FARG_setNet_n4+0 
	MOVLW       0
	MOVWF       FARG_setNet_n4+1 
	MOVLW       88
	MOVWF       FARG_setNet_c1+0 
	MOVLW       0
	MOVWF       FARG_setNet_d1+0 
	MOVLW       0
	MOVWF       FARG_setNet_d1+1 
	MOVLW       32
	MOVWF       FARG_setNet_d1+2 
	MOVLW       132
	MOVWF       FARG_setNet_d1+3 
	MOVLW       0
	MOVWF       FARG_setNet_d2+0 
	MOVLW       0
	MOVWF       FARG_setNet_d2+1 
	MOVLW       96
	MOVWF       FARG_setNet_d2+2 
	MOVLW       131
	MOVWF       FARG_setNet_d2+3 
	CALL        _setNet+0, 0
;Projekat.c,441 :: 		break;
	GOTO        L_main117
;Projekat.c,443 :: 		case 2: {
L_main120:
;Projekat.c,444 :: 		setNet(30, 0, 30, 64, 'X', 115, 28);
	MOVLW       30
	MOVWF       FARG_setNet_n1+0 
	MOVLW       0
	MOVWF       FARG_setNet_n1+1 
	CLRF        FARG_setNet_n2+0 
	CLRF        FARG_setNet_n2+1 
	MOVLW       30
	MOVWF       FARG_setNet_n3+0 
	MOVLW       0
	MOVWF       FARG_setNet_n3+1 
	MOVLW       64
	MOVWF       FARG_setNet_n4+0 
	MOVLW       0
	MOVWF       FARG_setNet_n4+1 
	MOVLW       88
	MOVWF       FARG_setNet_c1+0 
	MOVLW       0
	MOVWF       FARG_setNet_d1+0 
	MOVLW       0
	MOVWF       FARG_setNet_d1+1 
	MOVLW       102
	MOVWF       FARG_setNet_d1+2 
	MOVLW       133
	MOVWF       FARG_setNet_d1+3 
	MOVLW       0
	MOVWF       FARG_setNet_d2+0 
	MOVLW       0
	MOVWF       FARG_setNet_d2+1 
	MOVLW       96
	MOVWF       FARG_setNet_d2+2 
	MOVLW       131
	MOVWF       FARG_setNet_d2+3 
	CALL        _setNet+0, 0
;Projekat.c,445 :: 		break;
	GOTO        L_main117
;Projekat.c,447 :: 		case 3: {
L_main121:
;Projekat.c,448 :: 		setNet(30, 0, 30, 64, 'X', 70, 28);
	MOVLW       30
	MOVWF       FARG_setNet_n1+0 
	MOVLW       0
	MOVWF       FARG_setNet_n1+1 
	CLRF        FARG_setNet_n2+0 
	CLRF        FARG_setNet_n2+1 
	MOVLW       30
	MOVWF       FARG_setNet_n3+0 
	MOVLW       0
	MOVWF       FARG_setNet_n3+1 
	MOVLW       64
	MOVWF       FARG_setNet_n4+0 
	MOVLW       0
	MOVWF       FARG_setNet_n4+1 
	MOVLW       88
	MOVWF       FARG_setNet_c1+0 
	MOVLW       0
	MOVWF       FARG_setNet_d1+0 
	MOVLW       0
	MOVWF       FARG_setNet_d1+1 
	MOVLW       12
	MOVWF       FARG_setNet_d1+2 
	MOVLW       133
	MOVWF       FARG_setNet_d1+3 
	MOVLW       0
	MOVWF       FARG_setNet_d2+0 
	MOVLW       0
	MOVWF       FARG_setNet_d2+1 
	MOVLW       96
	MOVWF       FARG_setNet_d2+2 
	MOVLW       131
	MOVWF       FARG_setNet_d2+3 
	CALL        _setNet+0, 0
;Projekat.c,449 :: 		break;
	GOTO        L_main117
;Projekat.c,451 :: 		case 4: {
L_main122:
;Projekat.c,452 :: 		setNet(0, 20, 128, 14, 'Y', 57, 50);
	CLRF        FARG_setNet_n1+0 
	CLRF        FARG_setNet_n1+1 
	MOVLW       20
	MOVWF       FARG_setNet_n2+0 
	MOVLW       0
	MOVWF       FARG_setNet_n2+1 
	MOVLW       128
	MOVWF       FARG_setNet_n3+0 
	MOVLW       0
	MOVWF       FARG_setNet_n3+1 
	MOVLW       14
	MOVWF       FARG_setNet_n4+0 
	MOVLW       0
	MOVWF       FARG_setNet_n4+1 
	MOVLW       89
	MOVWF       FARG_setNet_c1+0 
	MOVLW       0
	MOVWF       FARG_setNet_d1+0 
	MOVLW       0
	MOVWF       FARG_setNet_d1+1 
	MOVLW       100
	MOVWF       FARG_setNet_d1+2 
	MOVLW       132
	MOVWF       FARG_setNet_d1+3 
	MOVLW       0
	MOVWF       FARG_setNet_d2+0 
	MOVLW       0
	MOVWF       FARG_setNet_d2+1 
	MOVLW       72
	MOVWF       FARG_setNet_d2+2 
	MOVLW       132
	MOVWF       FARG_setNet_d2+3 
	CALL        _setNet+0, 0
;Projekat.c,453 :: 		break;
	GOTO        L_main117
;Projekat.c,455 :: 		case 5: {
L_main123:
;Projekat.c,456 :: 		setNet(0, 20, 128, 14, 'Y', 56,40);
	CLRF        FARG_setNet_n1+0 
	CLRF        FARG_setNet_n1+1 
	MOVLW       20
	MOVWF       FARG_setNet_n2+0 
	MOVLW       0
	MOVWF       FARG_setNet_n2+1 
	MOVLW       128
	MOVWF       FARG_setNet_n3+0 
	MOVLW       0
	MOVWF       FARG_setNet_n3+1 
	MOVLW       14
	MOVWF       FARG_setNet_n4+0 
	MOVLW       0
	MOVWF       FARG_setNet_n4+1 
	MOVLW       89
	MOVWF       FARG_setNet_c1+0 
	MOVLW       0
	MOVWF       FARG_setNet_d1+0 
	MOVLW       0
	MOVWF       FARG_setNet_d1+1 
	MOVLW       96
	MOVWF       FARG_setNet_d1+2 
	MOVLW       132
	MOVWF       FARG_setNet_d1+3 
	MOVLW       0
	MOVWF       FARG_setNet_d2+0 
	MOVLW       0
	MOVWF       FARG_setNet_d2+1 
	MOVLW       32
	MOVWF       FARG_setNet_d2+2 
	MOVLW       132
	MOVWF       FARG_setNet_d2+3 
	CALL        _setNet+0, 0
;Projekat.c,457 :: 		break;
	GOTO        L_main117
;Projekat.c,459 :: 		case 6: {
L_main124:
;Projekat.c,460 :: 		setNet(0, 30, 128, 14, 'Y', 56, 5);
	CLRF        FARG_setNet_n1+0 
	CLRF        FARG_setNet_n1+1 
	MOVLW       30
	MOVWF       FARG_setNet_n2+0 
	MOVLW       0
	MOVWF       FARG_setNet_n2+1 
	MOVLW       128
	MOVWF       FARG_setNet_n3+0 
	MOVLW       0
	MOVWF       FARG_setNet_n3+1 
	MOVLW       14
	MOVWF       FARG_setNet_n4+0 
	MOVLW       0
	MOVWF       FARG_setNet_n4+1 
	MOVLW       89
	MOVWF       FARG_setNet_c1+0 
	MOVLW       0
	MOVWF       FARG_setNet_d1+0 
	MOVLW       0
	MOVWF       FARG_setNet_d1+1 
	MOVLW       96
	MOVWF       FARG_setNet_d1+2 
	MOVLW       132
	MOVWF       FARG_setNet_d1+3 
	MOVLW       0
	MOVWF       FARG_setNet_d2+0 
	MOVLW       0
	MOVWF       FARG_setNet_d2+1 
	MOVLW       32
	MOVWF       FARG_setNet_d2+2 
	MOVLW       129
	MOVWF       FARG_setNet_d2+3 
	CALL        _setNet+0, 0
;Projekat.c,461 :: 		break;
	GOTO        L_main117
;Projekat.c,463 :: 		case 7: {
L_main125:
;Projekat.c,464 :: 		setNet(0, 30, 128, 14, 'Y', 56, 22);
	CLRF        FARG_setNet_n1+0 
	CLRF        FARG_setNet_n1+1 
	MOVLW       30
	MOVWF       FARG_setNet_n2+0 
	MOVLW       0
	MOVWF       FARG_setNet_n2+1 
	MOVLW       128
	MOVWF       FARG_setNet_n3+0 
	MOVLW       0
	MOVWF       FARG_setNet_n3+1 
	MOVLW       14
	MOVWF       FARG_setNet_n4+0 
	MOVLW       0
	MOVWF       FARG_setNet_n4+1 
	MOVLW       89
	MOVWF       FARG_setNet_c1+0 
	MOVLW       0
	MOVWF       FARG_setNet_d1+0 
	MOVLW       0
	MOVWF       FARG_setNet_d1+1 
	MOVLW       96
	MOVWF       FARG_setNet_d1+2 
	MOVLW       132
	MOVWF       FARG_setNet_d1+3 
	MOVLW       0
	MOVWF       FARG_setNet_d2+0 
	MOVLW       0
	MOVWF       FARG_setNet_d2+1 
	MOVLW       48
	MOVWF       FARG_setNet_d2+2 
	MOVLW       131
	MOVWF       FARG_setNet_d2+3 
	CALL        _setNet+0, 0
;Projekat.c,465 :: 		break;
	GOTO        L_main117
;Projekat.c,467 :: 		default: {
L_main126:
;Projekat.c,468 :: 		game = off;
	MOVLW       2
	MOVWF       _game+0 
;Projekat.c,470 :: 		}
	GOTO        L_main117
L_main116:
	MOVLW       0
	XORWF       _gameMode+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main170
	MOVLW       0
	XORWF       _gameMode+0, 0 
L__main170:
	BTFSC       STATUS+0, 2 
	GOTO        L_main118
	MOVLW       0
	XORWF       _gameMode+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main171
	MOVLW       1
	XORWF       _gameMode+0, 0 
L__main171:
	BTFSC       STATUS+0, 2 
	GOTO        L_main119
	MOVLW       0
	XORWF       _gameMode+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main172
	MOVLW       2
	XORWF       _gameMode+0, 0 
L__main172:
	BTFSC       STATUS+0, 2 
	GOTO        L_main120
	MOVLW       0
	XORWF       _gameMode+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main173
	MOVLW       3
	XORWF       _gameMode+0, 0 
L__main173:
	BTFSC       STATUS+0, 2 
	GOTO        L_main121
	MOVLW       0
	XORWF       _gameMode+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main174
	MOVLW       4
	XORWF       _gameMode+0, 0 
L__main174:
	BTFSC       STATUS+0, 2 
	GOTO        L_main122
	MOVLW       0
	XORWF       _gameMode+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main175
	MOVLW       5
	XORWF       _gameMode+0, 0 
L__main175:
	BTFSC       STATUS+0, 2 
	GOTO        L_main123
	MOVLW       0
	XORWF       _gameMode+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main176
	MOVLW       6
	XORWF       _gameMode+0, 0 
L__main176:
	BTFSC       STATUS+0, 2 
	GOTO        L_main124
	MOVLW       0
	XORWF       _gameMode+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main177
	MOVLW       7
	XORWF       _gameMode+0, 0 
L__main177:
	BTFSC       STATUS+0, 2 
	GOTO        L_main125
	GOTO        L_main126
L_main117:
;Projekat.c,472 :: 		screenInit();
	CALL        _screenInit+0, 0
;Projekat.c,474 :: 		}
L_main95:
;Projekat.c,475 :: 		}
	GOTO        L_main20
L_main21:
;Projekat.c,477 :: 		case 2: {
L_main127:
;Projekat.c,478 :: 		intToStr(score, temp);
	MOVF        _score+0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        _score+1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       _temp+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(_temp+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;Projekat.c,479 :: 		glcd_fill(0x00);
	CLRF        FARG_Glcd_Fill_pattern+0 
	CALL        _Glcd_Fill+0, 0
;Projekat.c,480 :: 		Glcd_Write_Text("Finish", 0, 0, 1);
	MOVLW       ?lstr7_Projekat+0
	MOVWF       FARG_Glcd_Write_Text_text+0 
	MOVLW       hi_addr(?lstr7_Projekat+0)
	MOVWF       FARG_Glcd_Write_Text_text+1 
	CLRF        FARG_Glcd_Write_Text_x_pos+0 
	CLRF        FARG_Glcd_Write_Text_page_num+0 
	MOVLW       1
	MOVWF       FARG_Glcd_Write_Text_color+0 
	CALL        _Glcd_Write_Text+0, 0
;Projekat.c,481 :: 		Glcd_Write_Text("Score", 0, 2, 1);
	MOVLW       ?lstr8_Projekat+0
	MOVWF       FARG_Glcd_Write_Text_text+0 
	MOVLW       hi_addr(?lstr8_Projekat+0)
	MOVWF       FARG_Glcd_Write_Text_text+1 
	CLRF        FARG_Glcd_Write_Text_x_pos+0 
	MOVLW       2
	MOVWF       FARG_Glcd_Write_Text_page_num+0 
	MOVLW       1
	MOVWF       FARG_Glcd_Write_Text_color+0 
	CALL        _Glcd_Write_Text+0, 0
;Projekat.c,482 :: 		Glcd_Write_Text(temp, 30, 2, 1);
	MOVLW       _temp+0
	MOVWF       FARG_Glcd_Write_Text_text+0 
	MOVLW       hi_addr(_temp+0)
	MOVWF       FARG_Glcd_Write_Text_text+1 
	MOVLW       30
	MOVWF       FARG_Glcd_Write_Text_x_pos+0 
	MOVLW       2
	MOVWF       FARG_Glcd_Write_Text_page_num+0 
	MOVLW       1
	MOVWF       FARG_Glcd_Write_Text_color+0 
	CALL        _Glcd_Write_Text+0, 0
;Projekat.c,483 :: 		Glcd_Write_Text("Restart ->RH0", 0, 4, 1);
	MOVLW       ?lstr9_Projekat+0
	MOVWF       FARG_Glcd_Write_Text_text+0 
	MOVLW       hi_addr(?lstr9_Projekat+0)
	MOVWF       FARG_Glcd_Write_Text_text+1 
	CLRF        FARG_Glcd_Write_Text_x_pos+0 
	MOVLW       4
	MOVWF       FARG_Glcd_Write_Text_page_num+0 
	MOVLW       1
	MOVWF       FARG_Glcd_Write_Text_color+0 
	CALL        _Glcd_Write_Text+0, 0
;Projekat.c,484 :: 		while(1){
L_main128:
;Projekat.c,485 :: 		if(RH0_bit==1) {
	BTFSS       RH0_bit+0, BitPos(RH0_bit+0) 
	GOTO        L_main130
;Projekat.c,486 :: 		gameInit();
	CALL        _gameInit+0, 0
;Projekat.c,487 :: 		break;
	GOTO        L_main129
;Projekat.c,488 :: 		}
L_main130:
;Projekat.c,489 :: 		}
	GOTO        L_main128
L_main129:
;Projekat.c,491 :: 		}
	GOTO        L_main12
L_main11:
	MOVF        _game+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_main13
	MOVF        _game+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_main19
	MOVF        _game+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_main127
L_main12:
;Projekat.c,492 :: 		}
	GOTO        L_main9
;Projekat.c,494 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
