class Goal {

  private int posx = width-width+100;
  private int posx2 = width-100;
  private int posy = height/5;
  private int posy2 = height/5;
  
  //Constructor
  //Initialize en constructor
public Goal(int posx, int posy, int posx2, int posy2){

  //"this." definere disse values til den parameter som vi satte ovenfor
  this.posx = posx;
  this.posy = posy;
  this.posx2 = posx2;
  this.posy2 = posy2;
} 
  //Tegn mål1
void display() {
  
   stroke(255);
    strokeWeight(3);
    fill(196,202,206);
    goal1.display();
    rect(posx, posy, 10, 100);

  //Tegn mål2
  stroke(255);
    strokeWeight(3);
    fill(196,202,206);
    goal2.display();
    rect(posx2, posy2, 10, 100);
}
  
  }
