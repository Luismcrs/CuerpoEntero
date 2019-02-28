// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Seek_Arrive

// The "Vehicle" class

class Bug {

  PVector position;
  PVector velocity;
  PVector acceleration;
  float maxforce;    // Maximum steering force
  float maxspeed;    // Maximum speed
  PImage bug1;
  PImage bug2;
  PImage bug3;
  boolean parate = false;
  float r;
  PVector ruido = new PVector(random(-0.2, 0.2), random(-0.2, 0.2));
  
  PImage [] cucarachacolor= new PImage[12];
  PImage [] tarantulacolor= new PImage[9];

  Bug(float x, float y) {
    acceleration = new PVector(0, 0);
    velocity = new PVector(0, -2);
    position = new PVector(x, y);
    maxspeed = 5;
    maxforce = 0.04;
    bug1 = loadImage("bug1.png");
    bug2 = loadImage("bug2.png");
    bug3 = loadImage("bug3.png");
    r = 6;
    cucarachacolor [0]= loadImage("cucarachaANIMACION_00000.png");
    cucarachacolor [1]= loadImage("cucarachaANIMACION_00001.png");
    cucarachacolor [2]= loadImage("cucarachaANIMACION_00002.png");
    cucarachacolor [3]= loadImage("cucarachaANIMACION_00003.png");
    cucarachacolor [4]= loadImage("cucarachaANIMACION_00004.png");
    cucarachacolor [5]= loadImage("cucarachaANIMACION_00005.png");
    cucarachacolor [6]= loadImage("cucarachaANIMACION_00006.png");
    cucarachacolor [7]= loadImage("cucarachaANIMACION_00007.png");
    cucarachacolor [8]= loadImage("cucarachaANIMACION_00008.png");
    cucarachacolor [9]= loadImage("cucarachaANIMACION_00009.png");
    cucarachacolor [10]= loadImage("cucarachaANIMACION_00010.png");
    cucarachacolor [11]= loadImage("cucarachaANIMACION_00011.png");

    tarantulacolor [0]= loadImage("tarantulaANIMACION_1_00000.png");
    tarantulacolor [1]= loadImage("tarantulaANIMACION_1_00001.png");
    tarantulacolor [2]= loadImage("tarantulaANIMACION_1_00002.png");
    tarantulacolor [3]= loadImage("tarantulaANIMACION_1_00003.png");
    tarantulacolor [4]= loadImage("tarantulaANIMACION_1_00004.png");
    tarantulacolor [5]= loadImage("tarantulaANIMACION_1_00005.png");
    tarantulacolor [6]= loadImage("tarantulaANIMACION_1_00006.png");
    tarantulacolor [7]= loadImage("tarantulaANIMACION_1_00007.png");
    tarantulacolor [8]= loadImage("tarantulaANIMACION_1_00008.png");
  }

  // Method to update position
  void update(PVector n, PVector m, int l) {
    // Update velocity
    if (n.mag()<2) {

      velocity.add(acceleration);
       velocity.limit(0.4);
    } else {
    
      velocity.sub(acceleration);
       velocity.limit(5);
    }
    // Limit speed
   
    //position.add(ruido);

    position.add(velocity);



    // Reset accelerationelertion to 0 each cycle
    acceleration.mult(0);





    position.x= constrain(position.x, random(-1000), width+random(1000));
    position.y= constrain(position.y, random(-1000), height+random(1000));
  }

  void applyForce(PVector force) {
    // We could add mass here if we want A = F / M
    acceleration.add(force);
  }

  // A method that calculates a steering force towards a target
  // STEER = DESIRED MINUS VELOCITY
  void seek(PVector target) {
    PVector desired = PVector.sub(target, position);  // A vector pointing from the position to the target

    //if (desired.mag()<2) {
    //  parate=true;
    //}
    // Scale to maximum speed
    desired.setMag(maxspeed);

    // Steering = Desired minus velocity
    PVector steer = PVector.sub(desired, velocity);
    steer.limit(maxforce);  // Limit to maximum steering force

    applyForce(steer);
  }

 void display_N1() {
    // Draw a triangle rotated in the direction of velocity
    velocity.mult(100);
    float theta = velocity.heading2D() + PI/2;
    
    pushMatrix();
    translate(position.x, position.y);

    if (parate) {
      parate= false;
      rotate(radians(r));
    } else {
      rotate(theta);
    }
    imageMode(CENTER);
    image(bug1, 0, 0, 50, 50);
    popMatrix();
    velocity.mult(0.01);
  }

 void display_N2() {
    // Draw a triangle rotated in the direction of velocity
    float theta = velocity.heading2D() + PI/2;
    
    pushMatrix();
    translate(position.x, position.y);

    if (parate) {
      parate= false;
      rotate(radians(r));
    } else {
      rotate(theta);
    }
    imageMode(CENTER);
    image(bug2, 0, 0, 50, 50);
    popMatrix();
  }

  void display_N3() {
    // Draw a triangle rotated in the direction of velocity
    float theta = velocity.heading2D() + PI/2;
    
    pushMatrix();
    translate(position.x, position.y);

    if (parate) {
      parate= false;
      rotate(radians(r));
    } else {
      rotate(theta);
    }
    imageMode(CENTER);
    image(bug3, 0, 0, 50, 50);
    popMatrix();
  }
  
  void display_N4() {
    // Draw a triangle rotated in the direction of velocity
    float theta = velocity.heading2D() + PI/2;

    pushMatrix();
    translate(position.x, position.y);

    if (parate) {
      parate= false;
      rotate(radians(r));
    } else {
      rotate(theta);
    }
    imageMode(CENTER);
    image(cucarachacolor[frameCount%12], 0, 0, 50, 50);
    popMatrix();
  }

  void display_N5() {
    // Draw a triangle rotated in the direction of velocity
    float theta = velocity.heading2D() + PI/2;

    pushMatrix();
    translate(position.x, position.y);

    if (parate) {
      parate= false;
      rotate(radians(r));
    } else {
      rotate(theta);
    }
    imageMode(CENTER);
    image(tarantulacolor[frameCount%9], 0, 0, 50, 50);
    popMatrix();
  }
  
  void displayBola() {
    // Draw a triangle rotated in the direction of velocity
    fill(255,100);
    noStroke();
    ellipse(position.x, position.y,5,5);
    
  }
}
