class Particle {
  double myX, myY, myAngle, mySpeed;
  int myColor;

  Particle() {
    myX = 340;
    myY = 240;
    myAngle = Math.random() * 2 * Math.PI;
    mySpeed = Math.random() * 10;
    myColor = color((int)(Math.random() * 256), (int)(Math.random() * 256), (int)(Math.random() * 256));
  } // end of Particle constructor

  void show() {
    fill(myColor);
    ellipse((int) myX + 70, (int) myY + 50, 5, 5);
  } // end of show

  void move() {
    myX = myX + Math.cos(myAngle) * mySpeed;
    myY = myY + Math.sin(myAngle) * mySpeed;
  } // end of move
} // end of Particle class

// Extend Particle class to create an OddParticle
class OddParticle extends Particle {

  OddParticle() {
    myX = 300;
    myY = 230;
    myAngle =  Math.random() * 3 * Math.PI;
     mySpeed = Math.random() * 7;
    myColor = color((int)(Math.random() * 256), (int)(Math.random() * 256), (int)(Math.random() * 256));
    super(); // call the parent constructor
  }


  void move() {
    super.move(); // inherit the basic movement behavior

    // Add a unique behavior: bounce off the screen edges
    if (myX < 0 || myX > width) {
      myAngle = Math.PI - myAngle; // reverse the x-direction
    }
    if (myY < 0 || myY > height) {
      myAngle = -myAngle; // reverse the y-direction
    }
  }

  
  void show() {
    // Make the OddParticle appear larger and change color frequently
    myColor = color((int)(Math.random() * 256), (int)(Math.random() * 256), (int)(Math.random() * 256));
    fill(myColor);
    ellipse((int) myX + 70, (int) myY + 50, 10, 10); // larger ellipse
  }
}

Particle[] bob = new Particle[1000];

void setup() {
  size(600, 600);
  // Initialize first two elements with OddParticle instances
  for (int i = 0; i < 2; i++) {
    bob[i] = new OddParticle();
  }
  // Initialize remaining elements with Particle instances
  for (int i = 2; i < bob.length; i++) {
    bob[i] = new Particle();
  }
}

void draw() {
  background(0, 0, 0);
  for (int i = 0; i < bob.length; i++) {
    bob[i].show();
    bob[i].move();
  }
}



