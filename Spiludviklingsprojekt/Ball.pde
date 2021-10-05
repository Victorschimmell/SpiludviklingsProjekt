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
        println("Player 1 scored!");
      }
      if (pos.x <= width-width+r+0.2) {
        scoreP2 ++;
        systems.add(new ParticleSystem(pos.x, pos.y, color(252, 15, 192)));
        pos.x = width/2;
        pos.y = height/5;
        ball.vel.sub(ball.vel);
        ball.acc.sub(ball.acc);
        println("Player 2 scored!");
      }
    }
    if(scoreP1==endScore){
      scene=0;
      resetGame();
      lastWinner="Player 1";
      println("Player 1 won the game");
    }else if(scoreP2==endScore){
      scene=0;
      resetGame();
      lastWinner="Player 2";  
      println("Player 2 won the game");
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
