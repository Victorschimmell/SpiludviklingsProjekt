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

  ///////////////////TEGNER BOLD///////////////////
  void display() { 
    stroke(255);
    strokeWeight(3);
    fill(1);
    ellipse(pos.x, pos.y, r*2, r*2);
    strokeWeight(1);
    
     while(pos.x >= width-r){
    pos.x = pos.x-1;
    }
    while(pos.x <= width-width+r){
    pos.x = pos.x+1;
    }
    
  }


  ///////////////////UPDATE BOLD VÆRDIER///////////////////
  void update() { // opdaterer position på bold fordi den skal kunne bevæge sig.

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
void ballCollisionP1 () {
  //Finder (x,Y) koordinater til player2 og player2, og trækker derefter player1's værdier fra player2, hvilket beskriver distancen mellem de to cirkler//
    PVector distVectB1 = PVector.sub(ball.pos, player1.pos);
    //Tager de to vektorkoordinater for hver player og finder derefter afstanden mellem de to cirkler//
    float distVectMagB1 = distVectB1.mag();
    //Beskriver den mindste værdi som playerne må være indenfor hinandens radius, hvilket er den enes radius + den andens//
    float minDistB1 = player1.r + ball.r;

    //Hvis afstanden mellem de to cirkler er mindre end den mindst tilladte afstand, så gør dette//
    if (distVectMagB1 < minDistB1) {
      float distCorrectionB1 = (minDistB1-distVectMagB1)/2.0;

      PVector dB1 = distVectB1.copy();
      PVector correctionVectB1 = dB1.normalize().mult(distCorrectionB1);
      ball.pos.add(correctionVectB1);
      player1.pos.sub(correctionVectB1);

      ball.vel = ball.vel.normalize().mult(distCorrectionB1);

      println("CollidingPLAYER1");
    }
  }

void ballCollisionP2 () {
 //Finder (x,Y) koordinater til player2 og player2, og trækker derefter player1's værdier fra player2, hvilket beskriver distancen mellem de to cirkler//
    PVector distVectB2 = PVector.sub(player2.pos, ball.pos);
    //Tager de to vektorkoordinater for hver player og finder derefter afstanden mellem de to cirkler//
    float distVectMagB2 = distVectB2.mag();
    //Beskriver den mindste værdi som playerne må være indenfor hinandens radius, hvilket er den enes radius + den andens//
    float minDistB2 = ball.r + player2.r;

    //Hvis afstanden mellem de to cirkler er mindre end den mindst tilladte afstand, så gør dette//
    if (distVectMagB2 < minDistB2) {
      float distCorrectionB2 = (minDistB2-distVectMagB2)/2.0;
      PVector dB2 = distVectB2.copy();
      PVector correctionVectB2 = dB2.normalize().mult(distCorrectionB2);
      player2.pos.add(correctionVectB2);
      ball.pos.sub(correctionVectB2);
      
      
      ball.vel = ball.vel.normalize().mult(distCorrectionB2);

      

      println("CollidingPLAYER2");
    }
  }
