class Player {
  //Bestemmer om det er player 1 eller 2
  int retning;

  //VECTORS
  PVector pos; //position
  PVector vel; //hastighed
  PVector gra; //gravity
  PVector dir; //retning af tilført kraft
  PVector acc; //tilført kraft // f.eks. fra eet spark af modstander
  
  int r = 40; // radius
  
  
  
  ///////////////////CONSTRUCTOR///////////////////
  Player(int Retning) { // retning = 1 = player 1, retning = 2 = player 2
    retning = Retning;

    if (retning ==1) {

      pos = new PVector( width/6, height-height/5-(r+4));
    } else if (retning == 2) {

      pos = new PVector( width-width/6, height-height/5-(r+4));
    }
  }
  
  
    ///////////////////TEGNER SPILLERE///////////////////
  void display(){
    
    stroke(255);
    strokeWeight(3);
    fill(1);
    ellipse(pos.x, pos.y, r*2, r*2);
    strokeWeight(1);
    
    
  }
  
  
  
}
