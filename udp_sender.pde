

import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

import hypermedia.net.*;    // import udp knihovny
 
UDP udp;  // udp objekt

Minim minim1;
Minim minim2;
AudioPlayer vystrel;

String s_Destination_IP_addres = "127.0.0.1";
String s_Source_IP_addres = "127.0.0.1";
int i_Destination_port = 58618;
int i_Source_port = 56789;


void setup()
{
  size(160,120);
  background (255);
  smooth();
  udp = new UDP( this, i_Source_port, s_Source_IP_addres );
  minim1 = new Minim(this);
  rectMode(CENTER);
  rect(80, 60, 100, 100);
  rect(80, 60, 80, 80);
  rect(80, 60, 60, 60);
  rect(80, 60, 40, 40);
 rect(80, 60, 20, 20);
}
  
void draw()
{

  ;
}   
 
void mousePressed()
{
  vystrel = minim1.loadFile("vystrel.wav"); 
  vystrel.play();
  String message  = str( key );    // zpráva k odeslání
     
    message = pmouseX + "&" + pmouseY;
    // odeslání zprávy
    udp.send( message, s_Destination_IP_addres, i_Destination_port );

}
