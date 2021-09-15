class Goal {

//Denne heltal variabel vælger hvilket mål det er, om det er goal1 eller goal2
 int retning;
  
  //Vektor for deres position
  PVector pos; //position
 
  
  
//Constructor som gør vores nye objekter klar til brug
  Goal(int Retning) { // retning = 1 = goal 1, retning = 2 = goal 2
    retning = Retning;

    if (retning ==1) {

      pos = new PVector( width/7, height-height/5);
    } else if (retning == 2) {

      pos = new PVector( width-width/7, height-height/5);
    }
  }
  

  void display(){
  //Tegn mål1
    
//Tegn mål2
  
  }
  
  
}
