///////////////////Bold///////////////////

class Ball {
  PVector pos; //position
  PVector vel; //hastighed
  PVector acc; //krafter som påvirker
  PVector dir; //direction
  PVector gra; // gravity

  int r; // radius

  boolean doOnce = false;

  ///////////////////CONSTRUCTOR///////////////////
  Ball() {
    pos = new PVector(width/2, height/5);
    vel = new PVector(0, 2);
    acc = new PVector(0, 0);
    gra = new PVector (0, 0.1);

    r = 20;
  }

  ///////////////////DISPLAY BOLD///////////////////
  void display() { // tegner bold
    stroke(255);
    strokeWeight(3);
    fill(1);
    ellipse(pos.x, pos.y, r*2, r*2);
    strokeWeight(1);
  }

  ///////////////////UPDATE BOLD VÆRDIER///////////////////
  void update() { // opdaterer position på bold

    pos.add(vel);

    vel.add(gra);
    vel.add(acc);

    vel.limit(10);

    doOnce = false;
    if (pos.y+r > height-height/5) {

      doOnce= true;

      vel.y = vel.y* -0.95;
      pos.y = height-height/5-r;

      println("bounce");
    }


    if (doOnce) {
      systems.add(new ParticleSystem(pos.x, pos.y+r));
    }
  }
}
