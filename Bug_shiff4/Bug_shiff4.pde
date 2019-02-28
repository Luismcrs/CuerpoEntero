// -------------OSC-----------------------------
import oscP5.*;
import netP5.*;



// ---------------------------------------------------







import processing.sound.*;

import org.openkinect.freenect.*;
import org.openkinect.processing.*;

// The kinect stuff is happening in another class
KinectTracker tracker;
Kinect kinect;

SoundFile soundfile1;
SoundFile soundfile2;

OscP5 oscP5;
NetAddress myRemoteLocation;

float valorSonido;
int vel;
int valorCantidad;
int valorRealismo;


int cual;
int cual_sonido;
int cuantas = 100;

Bug[] b = new Bug[cuantas];

int resX = 1024;
int resY = 768;

void setup() {
  //size(640, 480);
  size(1024, 768, P2D);

  //-------OSC----------
  oscP5 = new OscP5(this, 12500);
  myRemoteLocation = new NetAddress("127.0.0.1", 12500);

  //------------

  //size(1920, 1080, P2D);
  for (int i = 0; i<cuantas; i++) {
    b[i] = new Bug(random(width), random(height));
  }

  kinect = new Kinect(this);
  tracker = new KinectTracker();

  soundfile1 = new SoundFile(this, "data/InsectosNivel1.wav");
soundfile2 = new SoundFile(this, "data/Heidi.mp3");

  soundfile1.loop();
  soundfile2.loop();
}

void draw() {
  background(0);

  tracker.track();
  tracker.display();
  PVector v1 = tracker.getPos();
  PVector v2 = tracker.getLerpedPos();

  println(v1.x);
  PVector mouse = new PVector(v2.x, v2.y);
  PVector pmouse = new PVector(v1.x, v1.y);

  PVector nervios;



  nervios= pmouse.sub(mouse);
  mouse.x= map(mouse.x, 0, 640, 0, resX);
  mouse.y= map(mouse.y, 0, 480, 0, resY);

  // Draw an ellipse at the mouse position
  fill(200);
  stroke(0);
  strokeWeight(2);
  ellipse(mouse.x, mouse.y, 48, 48);
 soundfile2.amp(0);
  // Call the appropriate steering behaviors for our agents
  for (int i = 0; i<valorCantidad; i++) {
    b[i].seek(mouse);
    b[i].update(nervios, mouse, vel);

    switch (cual) {
    case 0:
      b[i].displayBola();
      break;
    case 1:
      b[i].display_N1();
      break;
    case 2:
      b[i].display_N2();
      break;
    case 3:
      b[i].display_N3();
      break;
    case 4:
      b[i].display_N4();
       soundfile2.amp(1);
      break;
    case 5:
      b[i].display_N5();
      break;
    }
  }

  //float amplitude = map(constrain(nervios.mag(), 0, 5), 0, 5, 1.0, 0.1);
  soundfile1.amp(valorSonido*0.1);
}

void keyPressed() {

  int t = tracker.getThreshold();
  if (key == CODED) {
    if (keyCode == UP) {
      t+=5;
      tracker.setThreshold(t);
    } else if (keyCode == DOWN) {
      t-=5;
      tracker.setThreshold(t);
    }
  }
}





void oscEvent(OscMessage theOscMessage) {

  if (theOscMessage.checkAddrPattern("/test")==true) {
    valorSonido= theOscMessage.get(0).intValue();
    vel= theOscMessage.get(1).intValue();
    valorCantidad= theOscMessage.get(2).intValue();
    cual= theOscMessage.get(3).intValue();
  }
}
