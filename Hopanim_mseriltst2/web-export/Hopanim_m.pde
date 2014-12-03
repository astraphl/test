


Hopanim hop1, hop2;

float xpos;
float ypos;
float drag = 30.0;

void setup() {
  size(1920, 1080);
  
  frameRate(30);
 hop1 = new Hopanim("image_hop", 23);
 hop2 = new Hopanim("image_hop", 23);
  ypos = height * 0.5;
  xpos = width *  0.5;
}

void draw() { 
  float dx = mouseX - xpos;
  xpos = xpos + dx/drag;
   float ux = mouseY - xpos;
  ypos = ypos + ux/drag;


  // Display the sprite at the position xpos, ypos
  if (mousePressed) {
    background(0, 0, 250);
    hop1.display(xpos-hop1.getWidth()/12, ypos);
    hop1.display(xpos-hop1.getHeight()*12, ypos);
  } else {
    background(255,100, 255);
   hop2.display(xpos-hop1.getWidth()/12, ypos);
   hop2.display(xpos-hop1.getHeight()*12, ypos);
  }
}
class Hopanim {

  //int numFrames = 23;
  //int frame = 0;
  int x1;
  int y1;
  int w;
  int h;
  int dist;
  PImage[] images; //= new PImage[numFrames];
  int i = 0;
   int imageCount;
     int frame;
  
  Hopanim(String imagePrefix, int count) {
    imageCount = count;
    images = new PImage[imageCount];



    //imageMode(CORNER);
    for (int i = 0; i< imageCount; i++) {
      String imageName = "image_hop" + nf(i, 4) + ".jpg";
      images[i] = loadImage(imageName);
    }
    
  }
    void display(float xpos, float ypos) {
      frame = (frame+1) % imageCount;
      image(images[frame], xpos, ypos);
    }

    int getWidth() {
      return images[0].width;
    }
    int getHeight() {
      return images[0].height;
    }
  }





