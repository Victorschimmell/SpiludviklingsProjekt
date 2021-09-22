class Player {
  //Bestemmer om det er player 1 eller 2
  int retning;

  //VECTORS
  PVector pos; //position
  PVector vel; //hastighed
  PVector gra; //gravity

  int r = 50; // radius
  int fart = 2; // fart
  boolean inAir = false; // 
  boolean inAir2 = false;

int count = 0;
int last;

  ///////////////////CONSTRUCTOR///////////////////
  Player(int Retning) { // retning = 1 = player 1, retning = 2 = player 2
    retning = Retning;

    if (retning ==1) {

      pos = new PVector( width/6, height-height/5-(r+4));
      
    } else if (retning == 2) {

      pos = new PVector( width-width/6, height-height/5-(r+4));
    }

    vel = new PVector(0, 2);
    gra = new PVector(0, 0.1);
  }


  ///////////////////TEGNER SPILLERE///////////////////
  void display() {

    stroke(255);
    strokeWeight(3);
    fill(1);
    ellipse(pos.x, pos.y, r*2, r*2);
   
    
    //DASH! - spillerne kan fremskynde sig eller endda skyde ved at 'dash'.
    if (retning == 1){
      if(pressed[32]){
      pos.x = pos.x+2.5;
    }  
      } 
      
      if (retning == 2) {
      if(pressed[75]){
      pos.x = pos.x-2.5;
      }
    }

if(retning == 1) {
  stroke(200,200,195);
line(pos.x-50, pos.y, goal1.pos.x+5,goal1.pos.y+215);
}
if(retning == 2) {
  stroke(200,200,195);
line(pos.x+50, pos.y, goal2.pos2.x+5, goal2.pos2.y+215);
}


    fill(255);
    textSize(42);
    if (retning == 1) {
      text("L", pos.x, pos.y-5);
    } else if (retning ==2) {
      text("R", pos.x, pos.y-5);
    }

    strokeWeight(1);

    //Borders på playernes pos.x, så de ikke kan gå ud fra banen på x
    while (pos.x >= width-r) {
      pos.x = pos.x-1;
    }
    while (pos.x <= r) {
      pos.x = pos.x+1;
    }
  }

  ///////////////////BEVÆGER SPILLERE///////////////////

  void update() {

    vel.add(gra);


    if (retning == 1) {  ///////////////////PLAYER 1///////////////////
      if (pressed[65]) { /* A */
      
        pos.x-=fart;
      }

      if (pressed[68]) { /* D */
        pos.x+=fart;
      
    
      } 
      

      ///////////////////JUMP funktionalitet///////////////////
      pos.y+=vel.y;


      if ( pos.y > height-height/5-(r)) {

        pos.y = height-height/5-(r);

        vel.y = 0;
        inAir = false;
      }

      if (pressed[87] && !inAir) { /* W */
        vel.y=-fart*3;
        inAir= true;
      }
    } else if ( retning == 2) {  ///////////////////PLAYER 2///////////////////

      if (pressed[37]) { /* VENSTRE PIL */
        pos.x-=fart;
      }

      if (pressed[39]) { /* HØJRE PIL */
        pos.x+=fart;
      }

      ///////////////////JUMP funktionalitet///////////////////
      pos.y+=vel.y;


      if ( pos.y > height-height/5-(r)) {

        pos.y = height-height/5-(r);

        vel.y = 0;
        inAir2 = false;
      }

      if (pressed[38] && !inAir2) { /* W */
        vel.y=-fart*3;
        inAir2= true;
      }
    }
  }
  void collision () {
    PVector distVect = PVector.sub(player2.pos, player1.pos);

    float distVectMag = distVect.mag();

    float minDist = player1.r + player2.r;

    if (distVectMag < minDist) {
      float distCorrection = (minDist-distVectMag)/2.0;
      PVector d = distVect.copy();
      PVector correctionVect = d.normalize().mult(distCorrection);
      player2.pos.add(correctionVect);
      player1.pos.sub(correctionVect);

      println("Colliding");
    }
  }
}
