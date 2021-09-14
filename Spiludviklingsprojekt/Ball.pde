///////////////////Bold///////////////////

class Ball {
  PVector pos; //position
  PVector vel; //hastighed
  PVector acc; //krafter som påvirker
  PVector dir; //direction
  PVector gra; // gravity

  int r; // radius

  Ball() {
    pos = new PVector(width/2, height/5);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    gra = new PVector (0,0.1);

    r = 40;
  }

  void display() {
    stroke(255);
    strokeWeight(3);
    fill(1);
    ellipse(pos.x, pos.y, r, r);
    strokeWeight(1);
  }

  void update() {
    
    acc.add(gra);
    vel.add(acc);
    vel.limit(10);
    pos.add(vel);
    
    
  }
}
