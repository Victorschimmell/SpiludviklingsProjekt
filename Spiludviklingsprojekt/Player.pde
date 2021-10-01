class Player {
  //Bestemmer om det er player 1 eller 2
  int retning;

  //VECTORS
  PVector pos; //position
  PVector vel; //hastighed
  PVector gra; //gravity
  PVector legPos; //position of legggg
  PVector newLeg; //position of legggg

  int r = 50; // radius
  int legr;
  int fart = 2; // fart
  boolean inAir = false; // 
  boolean inAir2 = false;

  int last;
  float angle = 0;
  float easing = 0.05;

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
    fart = 2;

    legr = r/2;
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
      text("P1", pos.x, pos.y-5);
    } else if (retning ==2) {
      text("P2", pos.x, pos.y-5);
    }
    strokeWeight(1);


    //Borders på playernes pos.x, så de ikke kan gå ud fra banen på x
    while (pos.x >= width-r) {
      pos.x = pos.x-1;
    }
    while (pos.x <= r) {
      pos.x = pos.x+1;
    }



    //Kæder til spillere:
    stroke(#c8c8c3);
    strokeWeight(2.5);
    if (retning == 1) {
      line(60, goal1.pos.y+60, pos.x-r, pos.y);
    } else if (retning == 2) {
      line(width-60, goal2.pos2.y+60, pos.x+r, pos.y);
    }

    //Kædebegrænsning!
    if (retning == 1) {
      while (pos.x >= width/2+200+ball.r) {
        pos.x = pos.x-1;
      }
    }
    if (retning == 2) {
      while (pos.x <= width-width/2-200-ball.r) {
        pos.x = pos.x+1;
      }
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

      ///////////////////JUMP funktionalitet 1///////////////////
      pos.y+=vel.y;


      if ( pos.y > height-height/5-(r)) {

        pos.y = height-height/5-(r);

        vel.y = 0;
        inAir = false;
      }

      if (pressed[87] && !inAir) { /* W */
        vel.y-=6;
        inAir= true;
      }
      ///////////////////DASH 1///////////////////
      if (pressed[32]) {
        fart = 5;
      } else {
        fart = 2;
      }
    } else if ( retning == 2) {  ///////////////////PLAYER 2///////////////////

      if (pressed[37]) { /* VENSTRE PIL */
        pos.x-=fart;
      }

      if (pressed[39]) { /* HØJRE PIL */
        pos.x+=fart;
      }

      ///////////////////JUMP funktionalitet 2///////////////////
      pos.y+=vel.y;


      if ( pos.y > height-height/5-(r)) {

        pos.y = height-height/5-(r);

        vel.y = 0;
        inAir2 = false;
      }

      if (pressed[38] && !inAir2) { /* OP PIL */
        vel.y-=6;
        inAir2= true;
      }
      ///////////////////DASH 2///////////////////
      if (pressed[75]) {

        fart = 5;
      } else {
        fart = 2;
      }
    }
  }


  ///////////////////BEVÆGER LEGGGG///////////////////
  void leg() {

    noStroke();
    fill(1);
    legPos = new PVector(pos.x, pos.y+r+legr);
    newLeg = new PVector(pos.x, pos.y);

    if (retning == 1) {  ///////////////////PLAYER 1///////////////////
      if (pressed[70]) { // F
        stroke(255);
        angle+=1*easing;
        newLeg = new PVector((legPos.x-pos.x)*cos(angle)+(legPos.y-pos.y)*sin(angle)+pos.x, (legPos.y-pos.y)*cos(angle)+(legPos.x-pos.x)*sin(angle)+pos.y);
        if (angle >= 40*easing) angle= 0;
      } else {
        angle = 0;
      }
    } else if ( retning == 2) {  ///////////////////PLAYER 2///////////////////
      if (pressed[74]) { //K 
        stroke(255);

        angle-=1*easing;
        newLeg = new PVector((legPos.x-pos.x)*cos(angle)+(legPos.y-pos.y)*sin(angle)+pos.x, (legPos.y-pos.y)*cos(angle)+(legPos.x-pos.x)*sin(angle)+pos.y);
        if (angle <= -40*easing) angle= 0;
      } else {
        angle = 0;
      }
    }
    ///////////////////Position på leggggggg///////////////////

    ellipse(newLeg.x, newLeg.y, legr*2, legr*2);
  }
}
