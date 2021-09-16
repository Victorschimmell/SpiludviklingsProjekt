class Goal {

  PVector pos; 
  int Goalnr;

  //Constructor
  //Initialize en constructor ved definering med arguments
  public Goal(int goalnr) {

    Goalnr = goalnr;

    if (Goalnr == 1) {

   //Position af stolperne ≈ målenes startpunkt
      pos = new PVector(width-width+50, height-425);
    } else if (Goalnr == 2) {

      pos = new PVector(width-60, height-425);
    }
  }

  //Tegn Stolper til målene
  void display() {
    stroke(255);
    strokeWeight(1);
    fill(196, 202, 206);

    if ( Goalnr == 1) {
      
      rect(pos.x, pos.y, 10, 240+25);
      
    } else if (Goalnr == 2) {
      
      rect(pos.x, pos.y, 10, 240+25);
      
    }
  }
}
