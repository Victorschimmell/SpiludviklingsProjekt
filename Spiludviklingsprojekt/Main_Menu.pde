///////////////////Variabel///////////////////
//Background
float bgColor = 190;
boolean bgChange = true;


void drawMenu(){
  updateBackground();
  //Knapper
  rectMode(CENTER);
  noStroke();
  pushMatrix();
  translate(width/2,height/2);
  ellipse(0,0,50,50);
  //Play
  if (mouseX>width/2-width/10 && mouseX<width/2+width/10 && mouseY>height/2-height/16 && mouseY<height/2+height/16){
    fill(0, 0, 0, 70);
    rect(0, 0, width/5, height/8, 10, 10, 10, 10);
  }else{
    fill(0, 0, 0, 40);
    rect(0, 0, width/5, height/8, 10, 10, 10, 10);
  }
  //Options
  if (mouseX>width/2-width/10 && mouseX<width/2+width/10 && mouseY>height/2-height/16+height/8*1.2 && mouseY<height/2+height/16+height/8*1.2){
    fill(0, 0, 0, 70);
    rect(0, height/8*1.2, width/5, height/8, 10, 10, 10, 10);
  }else{
    fill(0, 0, 0, 40);
    rect(0, height/8*1.2, width/5, height/8, 10, 10, 10, 10);
  }
  //Quit game
  if (mouseX>width/2-width/10 && mouseX<width/2+width/10 && mouseY>height/2-height/16+height/8*1.2*2 && mouseY<height/2+height/16+height/8*1.2*2){
    fill(0, 0, 0, 70);
    rect(0, height/8*1.2*2, width/5, height/8, 10, 10, 10, 10);
  }else{
    fill(0, 0, 0, 40);
    rect(0, height/8*1.2*2, width/5, height/8, 10, 10, 10, 10);
  }
  //rect(0, bHeight*2*1.2, bWidth, bHeight, 10, 10, 10, 10);
  
  
  popMatrix();
}

void mousePressed(){
  if (mouseX>width/2-width/10 && mouseX<width/2+width/10 && mouseY>height/2-height/16 && mouseY<height/2+height/16){
    scene=1;
  }
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
