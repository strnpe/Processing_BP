import guru.ttslib.*;      // import text to speech knihovny

import hypermedia.net.*;    // import UDP knihovny
 
 
UDP udp;  // udp objekt
TTS tts10;  //tts objekt

String s_Destination_IP_addres = "127.0.0.1";
String s_Source_IP_addres = "127.0.0.1";
int i_Destination_port = 56789;
int i_Source_port = 58618;
int i_body = 0;
int i_pocet = 0;
String s_vysledek;

void setup()
{
 size(640,480);
 background(0);
 smooth();
 
udp = new UDP( this, i_Source_port, s_Source_IP_addres );
udp.log( true );        // vypisování udp logu do konzole
  
udp.listen( true );    // čekání na příchozí data
tts10 = new TTS();
rectMode(CENTER);
fill(255);
rect(320, 240, 400, 400);
rect(320, 240, 320, 320);
rect(320, 240, 240, 240);
rect(320, 240, 160, 160);
rect(320, 240, 80, 80);
  
textSize(25);
fill(0,0,0);
text("10",305,250);
text("9", 310,310);
text("8", 310,350);
text("7", 310,390);
text("6", 310,430);

text("9", 310,190);
text("8", 310,150);
text("7", 310,110);
text("6", 310,70);


text("9", 370,250);
text("8", 410,250);
text("7", 450,250);
text("6", 490,250);

text("9", 250,250);
text("8", 210,250);
text("7", 170,250);
text("6", 130,250);
  
}
 

void receive( byte[] data, String ip, int port )
{  
  String message = new String( data );
  String[] parts = split(message, "&");
  int sentX = int(parts[0]);
  int sentY = int(parts[1]);    //"24" -> 24
   
 sentX = sentX * 4;    //přepočet souřadnic
 sentY = sentY * 4; 
 
  i_pocet++;

  
if(i_pocet <=5){

  stroke(150); 
  fill(250,0,0);  
  
  ellipse(sentX, sentY, 5, 5);
 
  // výpis přijatých souřadnicí do konzole
  println( "receive: x = \""+sentX+"\" y = \""+sentY+"\"");
  // rozhodování o zásahu a bodech
  if((sentX<=320 + 40 && sentX>=320-40) &&(sentY>=160+40 && sentY<=240+40)){
    tts10.speak("ten");
    i_body = i_body + 10;
  }else if((sentX <= 320+80 && sentX >= 320-80) && (sentY>=240-80 && sentY <=240+80)){
       tts10.speak("nine");
    i_body = i_body + 9;
  
   }else if((sentX <= 320+120 && sentX >= 320-120) && (sentY>=240-120 && sentY <=240+120)){
       tts10.speak("eight");
    i_body = i_body + 8;
  
    }else if((sentX <= 320+160 && sentX >= 320-160) && (sentY>=240-160 && sentY <=240+160)){
       tts10.speak("seven");
    i_body = i_body + 7;
  
    }else if((sentX <= 320+200 && sentX >= 320-200) && (sentY>=240-200 && sentY <=240+200)){
       tts10.speak("six");
    i_body = i_body + 6;
  }else{
  tts10.speak("miss");
  }
  
  if(i_pocet == 5){
  s_vysledek = "" + i_body;
 
  textSize(15);
  fill(255,255,255);
  text("váš výsledek je:",5,50);
  textSize(30);
  text(s_vysledek,10,100);

  }
  
  // reset
}else{
     i_pocet = 0;
     i_body = 0;
     
      setup();

  }
  
}
  
void draw()
{

 ;
}
