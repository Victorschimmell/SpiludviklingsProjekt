class Goal {

//Denne heltal variabel vælger hvilket mål det er, om det er goal1 eller goal2
 int option;
  
  //Vektor for deres position
  PVector pos; //position
  
//Constructor som gør vores nye objekter klar til brug
   Goal(int Option) { // option = 1 = goal 1, option = 2 = goal 2
    option = Option;

    if (option ==1) {

      pos = new PVector( width-width+100,height/5, height/5);
    } else if (option == 2) {

      pos = new PVector(width-100, height/5-200);
    }
  }
  
  
  //Tegn mål1
  void drawGoal() {
     stroke(1);
    strokeWeight(5);
    fill(196,202,206);
    rect(pos.x,pos.y, 20, 100);

//Tegn mål2
  
  
  }

}
