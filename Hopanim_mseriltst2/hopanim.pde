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
      images[i].resize(images[i].width/2,images[i].height/2);
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




