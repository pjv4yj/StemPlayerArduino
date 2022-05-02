import processing.serial.*;
import ddf.minim.*;
 
Serial myPort;
Minim minim;

AudioPlayer player1;
AudioPlayer player2;
AudioPlayer player3;
AudioPlayer player4;

byte arbitraryCode1 = 97;
byte arbitraryCode2 = 98;
byte arbitraryCode3 = 99;
byte arbitraryCode4 = 96;

int passedTime;
int savedTime;

int player1on;
int player2on;
int player3on;
int player4on;
 
void setup()
{
  // In the next line, you'll need to change this based on your USB port name
  myPort = new Serial(this, "/dev/cu.usbmodem145101", 9600);
  minim = new Minim(this);
 
  // Put in the name of your sound file below, and make sure it is in the same directory
  player1 = minim.loadFile("/Users/paulvann/Desktop/broken1.mp3");
  player2 = minim.loadFile("/Users/paulvann/Desktop/broken2.mp3");
  player3 = minim.loadFile("/Users/paulvann/Desktop/broken3.mp3");
  player4 = minim.loadFile("/Users/paulvann/Desktop/broken4.mp3");
  
  savedTime = millis();
}
 
void draw() {
  while (myPort.available() > 0) {
    int inByte = myPort.read();
    passedTime = millis() - savedTime;
    
    if (inByte == arbitraryCode1 && player1on == 0) {
      player1.cue(passedTime);
      player1.play();
      player1on = 1;
    } else if (inByte == arbitraryCode1) {
      player1.pause();
      player1on = 0;
    }
    
    if (inByte == arbitraryCode2 && player2on == 0) {
      player2.cue(passedTime);
      player2.play();
      player2on = 1;
    } else if (inByte == arbitraryCode2) {
      player2.pause();
      player2on = 0;
    }
    
    if (inByte == arbitraryCode3 && player3on == 0) {
      player3.cue(passedTime);
      player3.play();
      player3on = 1;
    } else if (inByte == arbitraryCode3) {
      player3.pause();
      player3on = 0;
    }
    
    if (inByte == arbitraryCode4 && player4on == 0) {
      player4.cue(passedTime);
      player4.play();
      player4on = 1;
    } else if (inByte == arbitraryCode4) {
      player4.pause();
      player4on = 0;
    }
    
  }
}
