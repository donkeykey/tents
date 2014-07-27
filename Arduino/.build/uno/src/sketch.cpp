#include <Arduino.h>

void setup();
void loop();
void setRed();
void setGreen();
void setBlue();
void setYellow();
void setPink();
void setSky();
void setWhite();
void lightSolid();
void lightFlush();
void lightFade();
void lightRotation();
void lighting(char c);
#line 1 "src/sketch.ino"
int red1 = 7;
int green1 = 9;
int blue1 = 8;

int red2 = 18;
int green2 = 19;
int blue2 = 10;

int red3 = 12;
int green3 = 13;
int blue3 = 11;

int red4 = 3;
int green4 = 4;
int blue4 = 2;

int lightPattern = 0;
int colorPattern = 0;

boolean flag = false;

boolean red = false;
boolean green = false;
boolean blue = false;

void setup(){
	Serial.begin(9600);
	pinMode(red1,OUTPUT);
	pinMode(green1,OUTPUT);
	pinMode(blue1,OUTPUT);
	pinMode(red2,OUTPUT);
	pinMode(green2,OUTPUT);
	pinMode(blue2,OUTPUT);
	pinMode(red3,OUTPUT);
	pinMode(green3,OUTPUT);
	pinMode(blue3,OUTPUT);
	pinMode(red4,OUTPUT);
	pinMode(green4,OUTPUT);
	pinMode(blue4,OUTPUT);
	setWhite();
	lightPattern = 0;
	colorPattern = 0;
}

void loop(){
	if (Serial.available() > 0)	{
		char c = Serial.read();
		lighting(c);
	}
	switch(colorPattern){
		case 0:
			setWhite();
			break;
		case 1:
			setRed();
			break;
		case 2:
			setGreen();
			break;
		case 3:
			setBlue();
			break;
		case 4:
			setYellow();
			break;
		case 5:
			setPink();
			break;
		case 6:
			setSky();
			break;
		default:
			setWhite();
	}
	switch(lightPattern){
		case 0:
			lightSolid();
			break;
		case 1:
			lightFlush();
			break;
		case 2:
			lightFade();
			break;
		case 3:
			lightRotation();
			break;
		default :
			lightSolid();
	}
}

void setRed(){
	red = false;
	green = true;
	blue = true;
}
void setGreen(){
	red = true;
	green = false;
	blue = true;
}
void setBlue(){
	red = true;
	green = true;
	blue = false;
}
void setYellow(){
	red = false;
	green = false;
	blue = true;
}
void setPink(){
	red = false;
	green = true;
	blue = false;
}
void setSky(){
	red = true;
	green = false;
	blue = false;
}
void setWhite(){
	red = false;
	green = false;
	blue = false;
}

void lightSolid(){
	digitalWrite(red1,  red);
	digitalWrite(green1,green);
	digitalWrite(blue1, blue);
	digitalWrite(red2,  red);
	digitalWrite(green2,green);
	digitalWrite(blue2, blue);
	digitalWrite(red3,  red);
	digitalWrite(green3,green);
	digitalWrite(blue3, blue);
	digitalWrite(red4,  red);
	digitalWrite(green4,green);
	digitalWrite(blue4 ,blue);
}
void lightFlush(){
	digitalWrite(red1,  red);
	digitalWrite(green1,green);
	digitalWrite(blue1, blue);
	digitalWrite(red2,  red);
	digitalWrite(green2,green);
	digitalWrite(blue2, blue);
	digitalWrite(red3,  red);
	digitalWrite(green3,green);
	digitalWrite(blue3, blue);
	digitalWrite(red4,  red);
	digitalWrite(green4,green);
	digitalWrite(blue4 ,blue);
	delay(100);
	digitalWrite(red1,  true);
	digitalWrite(green1,true);
	digitalWrite(blue1, true);
	digitalWrite(red2,  true);
	digitalWrite(green2,true);
	digitalWrite(blue2, true);
	digitalWrite(red3,  true);
	digitalWrite(green3,true);
	digitalWrite(blue3, true);
	digitalWrite(red4,  true);
	digitalWrite(green4,true);
	digitalWrite(blue4 ,true);
	delay(100);
}
void lightFade(){
	for(int a = 0;a<=15;a++){
		digitalWrite(red1,  red);
		digitalWrite(green1,green);
		digitalWrite(blue1, blue);
		digitalWrite(red2,  red);
		digitalWrite(green2,green);
		digitalWrite(blue2, blue);
		digitalWrite(red3,  red);
		digitalWrite(green3,green);
		digitalWrite(blue3, blue);
		digitalWrite(red4,  red);
		digitalWrite(green4,green);
		digitalWrite(blue4 ,blue);
		delay(a);
		digitalWrite(red1,  true);
		digitalWrite(green1,true);
		digitalWrite(blue1, true);
		digitalWrite(red2,  true);
		digitalWrite(green2,true);
		digitalWrite(blue2, true);
		digitalWrite(red3,  true);
		digitalWrite(green3,true);
		digitalWrite(blue3, true);
		digitalWrite(red4,  true);
		digitalWrite(green4,true);
		digitalWrite(blue4 ,true);
		delay(15 - a);
	}
	for(int a = 15;a>=0;a--){
		digitalWrite(red1,  red);
		digitalWrite(green1,green);
		digitalWrite(blue1, blue);
		digitalWrite(red2,  red);
		digitalWrite(green2,green);
		digitalWrite(blue2, blue);
		digitalWrite(red3,  red);
		digitalWrite(green3,green);
		digitalWrite(blue3, blue);
		digitalWrite(red4,  red);
		digitalWrite(green4,green);
		digitalWrite(blue4 ,blue);
		delay(a);
		digitalWrite(red1,  true);
		digitalWrite(green1,true);
		digitalWrite(blue1, true);
		digitalWrite(red2,  true);
		digitalWrite(green2,true);
		digitalWrite(blue2, true);
		digitalWrite(red3,  true);
		digitalWrite(green3,true);
		digitalWrite(blue3, true);
		digitalWrite(red4,  true);
		digitalWrite(green4,true);
		digitalWrite(blue4 ,true);
		delay(15 - a);
	}
}
void lightRotation(){
	digitalWrite(red1,  red  );
	digitalWrite(green1,green);
	digitalWrite(blue1, blue );
	digitalWrite(red2,  true );
	digitalWrite(green2,true );
	digitalWrite(blue2, true );
	digitalWrite(red3,  true );
	digitalWrite(green3,true );
	digitalWrite(blue3, true );
	digitalWrite(red4,  true );
	digitalWrite(green4,true );
	digitalWrite(blue4, true );
	delay(90);
	digitalWrite(red1,  true );
	digitalWrite(green1,true );
	digitalWrite(blue1, true );
	digitalWrite(red2,  red  );
	digitalWrite(green2,green);
	digitalWrite(blue2, blue );
	digitalWrite(red3,  true );
	digitalWrite(green3,true );
	digitalWrite(blue3, true );
	digitalWrite(red4,  true );
	digitalWrite(green4,true );
	digitalWrite(blue4, true );
	delay(90);
	digitalWrite(red1,  true);
	digitalWrite(green1,true);
	digitalWrite(blue1, true);
	digitalWrite(red2,  true );
	digitalWrite(green2,true );
	digitalWrite(blue2, true );
	digitalWrite(red3,  true );
	digitalWrite(green3,true );
	digitalWrite(blue3, true );
	digitalWrite(red4,  red );
	digitalWrite(green4,green );
	digitalWrite(blue4, blue);
	delay(90);
	digitalWrite(red1,  true );
	digitalWrite(green1,true );
	digitalWrite(blue1, true );
	digitalWrite(red2,  true );
	digitalWrite(green2,true );
	digitalWrite(blue2, true );
	digitalWrite(red3,  red  );
	digitalWrite(green3,green);
	digitalWrite(blue3, blue );
	digitalWrite(red4,  true );
	digitalWrite(green4,true );
	digitalWrite(blue4, true );
	delay(90);
}

void lighting(char c){
	Serial.print("char : ");
	Serial.println(c);
	//set color
	if(c == 'A' || c == 'H' || c == 'O' || c == 'W'){
		colorPattern = 1;
	}else if(c == 'B' || c == 'I' || c == 'P' || c == 'X'){
		colorPattern = 2;
	}else if(c == 'C' || c == 'J' || c == 'Q' || c == 'Y'){
		colorPattern = 3;
	}else if(c == 'D' || c == 'K' || c == 'R' || c == 'Z'){
		colorPattern = 4;
	}else if(c == 'E' || c == 'L' || c == 'S' || c == '!'){
		colorPattern = 5;
	}else if(c == 'F' || c == 'M' || c == 'T' || c == '#'){
		colorPattern = 6;
	}else if(c == 'G' || c == 'N' || c == 'U' || c == '$'){
		colorPattern = 0;
	}
	//set pattern
	if(c == 'A' || c == 'B' || c == 'C' || c == 'D' || c == 'E' || c == 'F' || c == 'G'){
		lightPattern = 0;
	}else if(c == 'H' || c == 'I' || c == 'J' || c == 'K' || c == 'L' || c == 'M' || c == 'N'){
		lightPattern = 1;
	}else if(c == 'O' || c == 'P' || c == 'Q' || c == 'R' || c == 'S' || c == 'T' || c == 'U'){
		lightPattern = 2;
	}else if(c == 'W' || c == 'X' || c == 'Y' || c == 'Z' || c == '!' || c == '#' || c == '$'){
		lightPattern = 3;
	}

	//emergency color
	if(c == 'a' || c == 'h' || c == 'o' || c == 'w'){
		setRed();
	}else if(c == 'b' || c == 'i' || c == 'p' || c == 'x'){
		setGreen();
	}else if(c == 'c' || c == 'j' || c == 'q' || c == 'y'){
		setBlue();
	}else if(c == 'd' || c == 'k' || c == 'r' || c == 'z'){
		setYellow();
	}else if(c == 'e' || c == 'l' || c == 's' || c == '%'){
		setPink();
	}else if(c == 'f' || c == 'm' || c == 't' || c == '&'){
		setSky();
	}else if(c == 'g' || c == 'n' || c == 'u' || c == '@'){
		setWhite();
	}
	//emergency pattern
	if(c == 'a' || c == 'b' || c == 'c' || c == 'd' || c == 'e' || c == 'f' || c == 'g'){
		lightSolid();
	}else if(c == 'h' || c == 'i' || c == 'j' || c == 'k' || c == 'l' || c == 'm' || c == 'n'){
		for(int i=0;i<15;i++){
			lightFlush();
		} 
	}else if(c == 'o' || c == 'p' || c == 'q' || c == 'r' || c == 's' || c == 't' || c == 'u'){
		for(int i=0;i<5;i++){
			lightFade();
		} 
	}else if(c == 'w' || c == 'x' || c == 'y' || c == 'z' || c == '%' || c == '&' || c == '@'){
		for(int i=0;i<10;i++){
			lightRotation();
		}
	}
	if(c == 'x'){
		setRed();
	}
}
