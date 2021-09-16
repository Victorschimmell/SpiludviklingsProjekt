class Goal {

  PVector pos; 
  PVector pos2;
  int Goalnr;

  //Constructor
  //Initialize en constructor ved definering med arguments
  public Goal(int goalnr) {

    Goalnr = goalnr;

    if (Goalnr == 1) {

   //Position af stolperne ≈ målenes startpunkt
      pos = new PVector(width-width+50, height-425);
    } else if (Goalnr == 2) {

      pos2 = new PVector(width-60, height-425);
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
      
      rect(pos2.x, pos2.y, 10, 240+25);
      
    }
    
    //Tegn overlægger til målene
    
        if ( Goalnr == 1) {
      
      rect(pos.x+10, pos.y, -60, 10);
      
    } else if (Goalnr == 2) {
      
      rect(pos2.x, pos2.y, 60, 10);
      
    }
    
    //Tegn net til målene
    fill(255);
            if ( Goalnr == 1) {
      
      rect(pos.x-12.5, pos.y+10, 2, 240+15);
      rect(pos.x-27.5, pos.y+10, 2, 240+15);
      rect(pos.x-42.5, pos.y+10, 2, 240+15);
      
    } else if (Goalnr == 2) {
      
      rect(7.5+pos2.x+12.5, pos2.y+10, 2, 240+15);
      rect(7.5+pos2.x+27.5, pos2.y+10, 2, 240+15);
      rect(7.5+pos2.x+42.5, pos2.y+10, 2, 240+15);
  }
 
  //Lodret net til målene
if ( Goalnr == 1) {
      
      rect(pos.x, pos.y+55, -50, 2);
      rect(pos.x, pos.y+110, -50, 2);
      rect(pos.x, pos.y+165, -50, 2);
      rect(pos.x, pos.y+220, -50, 2);
      
    } else if (Goalnr == 2) {
      
      rect(pos2.x+60, pos2.y+55, -50, 2);
      rect(pos2.x+60, pos2.y+110, -50, 2);
      rect(pos2.x+60, pos2.y+165, -50, 2);
      rect(pos2.x+60, pos2.y+220, -50, 2);
    }
      
  
}
}
