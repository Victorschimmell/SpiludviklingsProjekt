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

    //Betingelser for Ball

    if ((pos.x > width) || (pos.x < 0)) {
      vel.x = vel.x * -1;
    }

    //Når bolden rammer ind i målet, begrænses den, og spawner bolden i midten igen
    if (pos.y >= height-425) {
      if (pos.x >= width-r-0.2) {
        scoreP1 ++;
        systems.add(new ParticleSystem(pos.x, pos.y, color(252, 15, 192)));
        pos.x = width/2;
        pos.y = height/5;
        ball.vel.sub(ball.vel);
        ball.acc.sub(ball.acc);
      }
      if (pos.x <= width-width+r+0.2) {
        scoreP2 ++;
        systems.add(new ParticleSystem(pos.x, pos.y, color(252, 15, 192)));
        pos.x = width/2;
        pos.y = height/5;
        ball.vel.sub(ball.vel);
        ball.acc.sub(ball.acc);
      }
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
    }


    if (doOnce) {
      if(vel.y<-2){
        systems.add(new ParticleSystem(pos.x, pos.y+r, color(252, 15, 192)));
      }
    }
  }
}
void ballCollisionP1 () {
  //Finder (x,Y) koordinater til player2 og player2, og trækker derefter player1's værdier fra player2, hvilket beskriver distancen mellem de to cirkler//
  PVector distVectB1 = PVector.sub(player1.pos, ball.pos);
  //Tager de to vektorkoordinater for hver player og finder derefter afstanden mellem de to cirkler//
  float distVectMagB1 = distVectB1.mag();
  //Beskriver den mindste værdi som playerne må være indenfor hinandens radius, hvilket er den enes radius + den andens//
  float minDistB1 = player1.r+4 + ball.r;

  //Hvis afstanden mellem de to cirkler er mindre end den mindst tilladte afstand, så gør dette//
  if (distVectMagB1 < minDistB1) {
    float distCorrectionB1 = (minDistB1-distVectMagB1)/2.0;
    PVector dB1 = distVectB1.copy();
    PVector correctionVectB1 = dB1.normalize().mult(distCorrectionB1*PI);
    player1.pos.add(correctionVectB1);
    ball.pos.sub(correctionVectB1);


    ball.vel = ball.vel.normalize().mult(distCorrectionB1);
    ball.vel.sub(correctionVectB1);      


    println("CollidingPLAYER1");
  }
}

void ballCollisionP2 () {
  //Finder (x,Y) koordinater til player2 og player2, og trækker derefter player1's værdier fra player2, hvilket beskriver distancen mellem de to cirkler//
  PVector distVectB2 = PVector.sub(player2.pos, ball.pos);
  //Tager de to vektorkoordinater for hver player og finder derefter afstanden mellem de to cirkler//
  float distVectMagB2 = distVectB2.mag();
  //Beskriver den mindste værdi som playerne må være indenfor hinandens radius, hvilket er den enes radius + den andens//
  float minDistB2 = player2.r+4 + ball.r ;

  //Hvis afstanden mellem de to cirkler er mindre end den mindst tilladte afstand, så gør dette//
  if (distVectMagB2 < minDistB2) {
    float distCorrectionB2 = (minDistB2-distVectMagB2)/2.0;
    PVector dB2 = distVectB2.copy();
    PVector correctionVectB2 = dB2.normalize().mult(distCorrectionB2*PI);
    player2.pos.add(correctionVectB2);
    ball.pos.sub(correctionVectB2);

    ball.vel = ball.vel.normalize().mult(distCorrectionB2);
    ball.vel.sub(correctionVectB2);


    println("CollidingPLAYER2");
  }
}
