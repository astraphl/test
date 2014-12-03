
import processing.serial.*;
Serial myPort;
Hopanim hop1, hop2;
//int frameRate = random (5,20);
//int frameRate = (30);
float xpos;
float ypos;
float drag = 30.0;
int Zpos;
int val;
void setup() {

  size(720,480);
  // Open whatever port is the one you're using.
String portName = "/dev/tty.usbmodem1411"; //change the 0 to a 1 or 2 etc. to match your port
myPort = new Serial(this, portName, 9600); 

 
// Zpos = frameRate(random(10,30));
 hop1 = new Hopanim("image_hop", 23);
 hop2 = new Hopanim("image_hop", 23);
  ypos = height * 0.5;
  xpos = width *  0.5;
//Zpos = frameRate(10); 
 
}

void draw() { 

 
  float dx = mouseX - xpos;
  xpos = xpos + dx/drag;
   float ux = mouseY - xpos;
  ypos = ypos + ux/drag;


  // Display the sprite at the position xpos, ypos
  if (mousePressed) {
    //frameRate(Zpos);
    background(0, 0, 250);
    hop1.display(xpos-hop1.getWidth()/12, ypos);
    hop1.display(xpos-hop1.getHeight()*12, ypos);
  } else {
    //frameRate(30);
    background(255,100, 255);
   hop2.display(xpos-hop1.getWidth()/12, ypos);
   hop2.display(xpos-hop1.getHeight()*12, ypos);
  }
   if ( myPort.available() > 0) {  // If data is available,
    val = myPort.read();         // read it and store it in val
  }
  
  if (val >= 50) {              // If the serial value is less than 2
   frameRate(60);                   // set framerate to 60
  } 
  else {                       // If the serial value is not 0,
    frameRate(10);                  // set fill to light gray
  }
  
 

 } 
  void serialEvent(Serial myPort){
    // get the ASCII string:
 String inString = myPort.readStringUntil('\n');
  val = myPort.read();
    //Zpos = frameRate(10);
    println(val);
    
  }
    
