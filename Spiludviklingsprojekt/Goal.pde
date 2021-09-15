class Goal {

//Denne heltal variabel vælger hvilket mål det er, om det er goal1 eller goal2
 int option;
  
  //Vektor for deres position
  PVector pos; //position
 
  
  
//Constructor som gør vores nye objekter klar til brug
  Goal(int Option) { // retning = 1 = goal 1, retning = 2 = goal 2
    option = Option;

    if (option ==1) {

      pos = new PVector( width/8, height-height/5);
    } else if (option == 2) {

      pos = new PVector( width-width/8, height-height/5);
    }
  }
  

  void display(){
  //Tegn mål1
    stroke(200);
    strokeWeight(100);
    fill(100);
    line(pos.x,pos.y, width/8, height/5+100);
    
//Tegn mål2
  
  
  }
  
  
}
