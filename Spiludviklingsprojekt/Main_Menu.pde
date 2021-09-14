///////////////////Variabel///////////////////
//Background
float bgColor = 190;
boolean bgChange = true;
//Knapper
int bWidth = width*3;
int bHeight = height;


void drawMenu(){
  updateBackground();
  scene=1;
  //Knapper
  rectMode(CENTER);
  noStroke();
  pushMatrix();
  translate(width/2,height/2);
  
  //Play
  if (mouseX>bWidth/2 && mouseX<-bWidth/2 && mouseY>bHeight/2 && mouseY<-bHeight/2){
    println("col");
    fill(0, 0, 0, 70);
    rect(0, 0, bWidth, bHeight, 10, 10, 10, 10);
  }else{
    println("no col");
    fill(0, 0, 0, 40);
    rect(0, 0, bWidth, bHeight, 10, 10, 10, 10);
  }
  //Options
  rect(0, bHeight*1.2, bWidth, bHeight, 10, 10, 10, 10);
  //Quit game
  rect(0, bHeight*2*1.2, bWidth, bHeight, 10, 10, 10, 10);
  
  
  popMatrix();
}

void updateBackground() {
  // Vores betingelser tjekker, om farven skal blive lysere eller mørkere ved hjælp af vores boolean variabel; bgT
  if (scene==0 || scene==2) {
    background(bgColor, bgColor, bgColor);
    if (bgChange == true) { 
      if (bgColor>140) {
        bgColor = bgColor-0.5;
      } else {
        bgChange = false;
      }
    } else {
      if (bgColor<190) {
        bgColor = bgColor+0.5;
      } else {
        bgChange = true;
      }
    }
  }
}
