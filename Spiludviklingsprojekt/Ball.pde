///////////////////Bold///////////////////

class Ball {
  PVector pos; //position
  PVector vel; //hastighed
  PVector acc; //krafter som påvirker
  PVector dir; //direction
  PVector gra; // gravity

  int r; // radius

  boolean hit = false;

  Ball() {
    pos = new PVector(width/2, height/5);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    gra = new PVector (0, 0.1);

    r = 20;
  }

  void display() { // tegner bold
    stroke(255);
    strokeWeight(3);
    fill(1);
    ellipse(pos.x, pos.y, r*2, r*2);
    strokeWeight(1);
  }

  void update() { // opdaterer position på bold

    if (pos.y+r+5 <= height-height/5) {
      acc.add(gra);
      vel.add(acc);
      vel.limit(10);
      pos.add(vel);
      hit= false;
    } else {

      acc.sub(gra);
      if (!hit) {
        systems.add(new ParticleSystem(pos.x, pos.y+r));
      }
      hit = true;

      println("bruh");
    }
  }
}
