class Player {
  //Bestemmer om det er player 1 eller 2
  int retning;

  //VECTORS
  PVector pos; //position
  PVector vel; //hastighed
  PVector gra; //gravity
  PVector dir; //retning af tilført kraft
  PVector acc; //tilført kraft // f.eks. fra et spark af modstander

  int r = 40; // radius
  int fart = 2;
  boolean inAir = false;
  boolean inAir2 = false;



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


    fill(255);
    textSize(42);
    if (retning == 1) {
      text(":)", pos.x, pos.y-5);
    } else if (retning ==2) {
      text(";)", pos.x, pos.y-5);
    }

    strokeWeight(1);
  }
  ///////////////////BEVÆGER SPILLERE///////////////////

  void update() {

    vel.add(gra);

    
    if (retning == 1) {
      if (pressed[65]) { /* A */
        pos.x-=fart;
      }

      if (pressed[68]) { /* D */
        pos.x+=fart;
      }
      
      pos.y+=vel.y;
      
      
      if( pos.y > height-height/5-(r)){
      
      pos.y = height-height/5-(r);
      
      vel.y = 0;
      inAir = false;
      }
      
      if (pressed[87] && !inAir) { /* W */
        vel.y=-fart*3;
        inAir= true;
      
      } 
      
      
    } else if ( retning == 2) {

      if (pressed[37]) { /* VENSTRE PIL */
        pos.x-=fart;
      }

      if (pressed[39]) { /* HØJRE PIL */
        pos.x+=fart;
      }
    }
  }
}
