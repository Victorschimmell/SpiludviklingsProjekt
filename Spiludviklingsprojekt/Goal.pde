class Goal {

  PVector pos; 

  int Goalnr;

  //Constructor
  //Initialize en constructor ved definering med arguments
  public Goal(int goalnr) {

    Goalnr = goalnr;

    if (Goalnr == 1) {

      pos = new PVector(width/6, 100);
    } else if (Goalnr == 2) {

      pos = new PVector(width-width/6, 100);
    }
  }

  //Tegn mål1
  void display() {
    stroke(255);
    strokeWeight(1);
    fill(196, 202, 206);


    if ( Goalnr == 1) {
      
      rect(pos.x, pos.y, 10, 100);
      
    } else if (Goalnr == 2) {
      
      rect(pos.x, pos.y, 10, 100);
      
    }
  }
}
