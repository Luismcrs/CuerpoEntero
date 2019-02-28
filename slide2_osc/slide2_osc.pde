import controlP5.*;
import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress myRemoteLocation;

ControlP5 cp5;

int myColor = color(0, 0, 0);
int Realismo;
int Cantidad;
int Distancia;
int Sonido;
int valorSonido;


Slider abc;


void setup() {
  size(700, 400);
  noStroke();
  cp5 = new ControlP5(this);
  oscP5 = new OscP5(this, 12500);
  //elOtroPc = new NetAddress("127.0.0.1", 12001);
  myRemoteLocation = new NetAddress("127.0.0.1", 12500);

  //cuarto
  cp5.addSlider("Realismo")
    .setPosition(50, 325)
    .setWidth(400)
    .setHeight(50)

    .setRange(0, 5) // values can range from big to small as well
    //  .setValue(128)
    .setNumberOfTickMarks(6)
    .setSliderMode(Slider.FLEXIBLE);

  //tercero
  cp5.addSlider("Cantidad")
    .setPosition(50, 225)
    .setWidth(400)
    .setHeight(50)
    .setRange(0, 100) // values can range from big to small as well
    .setValue(50);


  //segundo

  cp5.addSlider("Velocidad")
    .setPosition(50, 125)
    .setWidth(400)
    .setHeight(50)

    .setRange(1, 5) // values can range from big to small as well
    .setValue(5)
    .setNumberOfTickMarks(5);



  //primero sound
  cp5.addSlider("Sonido")
    .setPosition(50, 25)
    .setWidth(400)
    .setHeight(50)

    .setRange(0, 10) // values can range from big to small as well
    .setValue(10);
    //.setNumberOfTickMarks(5)
    //.setSliderMode(Slider.FLEXIBLE);
}

void draw() {
  background(0);

  fill(#C4D3D2);
  rect(0, 300, width, 100);


  fill(#BFCBCB);
  rect(0, 200, width, 100);

  fill(#C4D3D2);
  rect(0, 100, width, 100);


  fill(#BFCBCB);
  rect(0, 0, width, 100);




  //OscMessage myMessage = new OscMessage("/test");
  //oscP5.send(new Object[] {"son", "dis,"can","real"}, myRemoteLocation);
  //delay(500);
}

public void controlEvent(ControlEvent theEvent) {


  OscMessage myMessage = new OscMessage("/test");
  myMessage.add(Sonido);
  myMessage.add(Distancia);
  myMessage.add(Cantidad);
  myMessage.add(Realismo);
  oscP5.send(myMessage, myRemoteLocation); 


}
//void oscEvent(OscMessage theOscMessage) {

//  print("### received an osc message.");
//  print(" addrpattern: "+theOscMessage.addrPattern());
//  println(" typetag: "+theOscMessage.typetag());
//  if (theOscMessage.checkAddrPattern("/test")==true) {
//    valorSonido= theOscMessage.get(0).intValue();
//  }
//}
