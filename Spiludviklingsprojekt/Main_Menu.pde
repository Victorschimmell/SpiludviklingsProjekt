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
  textSize(32);
  textAlign(CENTER, CENTER);
  textFont(mono);
  //Play
  if (mouseX>width/2-width/10 && mouseX<width/2+width/10 && mouseY>height/2-height/16 && mouseY<height/2+height/16){
    fill(0, 0, 0, 70);
    if(!loginReady){
      text("Login to play",0,0);
    }else{
      text("Play Game",0,0);
    }
    rect(0, 0, width/5, height/8, 10, 10, 10, 10);
  }else{
    fill(0,0,0,60);
    if(!loginReady){
      text("Login to play",0,0);
    }else{
      text("Play Game",0,0);
    }
    fill(0, 0, 0, 40);
    rect(0, 0, width/5, height/8, 10, 10, 10, 10);
  }
  //Options
  if (mouseX>width/2-width/10 && mouseX<width/2+width/10 && mouseY>height/2-height/16+height/8*1.2 && mouseY<height/2+height/16+height/8*1.2){
    fill(0, 0, 0, 70);
    text("Options",0,height/8*1.2);
    rect(0, height/8*1.2, width/5, height/8, 10, 10, 10, 10);
  }else{
    fill(0,0,0,60);
    text("Options",0,height/8*1.2);
    fill(0, 0, 0, 40);
    rect(0, height/8*1.2, width/5, height/8, 10, 10, 10, 10);
  }
  //Quit game
  if (mouseX>width/2-width/10 && mouseX<width/2+width/10 && mouseY>height/2-height/16+height/8*1.2*2 && mouseY<height/2+height/16+height/8*1.2*2){
    fill(0, 0, 0, 70);
    text("Exit Game",0,height/8*1.2*2);
    rect(0, height/8*1.2*2, width/5, height/8, 10, 10, 10, 10);
  }else{
    fill(0,0,0,60);
    text("Exit Game",0,height/8*1.2*2);
    fill(0, 0, 0, 40);
    rect(0, height/8*1.2*2, width/5, height/8, 10, 10, 10, 10);
  }
  textSize(70);
  textFont(mono2);
  fill(0, 0, 0, 70);
  text("Evals Soccer",0,-(height/4));
  if(lastWinner=="Player 1" || lastWinner=="Player 2"){
    textSize(35);
    text("Last winner: "+lastWinner,0,-(height/8));
  }
  
  ///////////////////Login//////////////////
  fill(0, 0, 0, 70);
  textSize(32);
  text("Player 1 login",-(width/4+width/10-width/20),-height/15);
  text("Player 2 login",width/4+width/10-width/20,-height/15);
  textSize(24);
  //Player 1
  //------ Username player 1
  if (mouseX>(width/2-(width/4+width/10-width/20))-width/10 && mouseX<(width/2-(width/4+width/10-width/20))+width/10 && mouseY>height/2-height/40 && mouseY<height/2+height/40 && scene == 0){
    fill(255, 0, 0, 70);
    rect(-(width/4+width/10-width/20),0,width/5,height/20,10,10,10,10);
  }else{
    fill(0, 0, 0, 40);
    rect(-(width/4+width/10-width/20),0,width/5,height/20,10,10,10,10);
  }
  //------ Password player 1
  if (mouseX>(width/2-(width/4+width/10-width/20))-width/10 && mouseX<(width/2-(width/4+width/10-width/20))+width/10 && mouseY>height/2+height/15-height/40 && mouseY<height/2+height/15+height/40 && scene == 0){
    fill(0, 255, 0, 40);
    rect(-(width/4+width/10-width/20),height/15,width/5,height/20,10,10,10,10);
  }else{
    fill(0, 0, 0, 40);
    rect(-(width/4+width/10-width/20),height/15,width/5,height/20,10,10,10,10);
  }
  //------ Login button
  if (mouseX>width/2-(width/4+width/10-width/20)-width/30 && mouseX<width/2-(width/4+width/10-width/20)+width/30 && mouseY>height/2+height/15*2-height/40 && mouseY<height/2+height/15*2+height/40 && scene == 0){
    fill(0, 0, 0, 70);
    text("Login",-(width/4+width/10-width/20),height/15*2);
    rect(-(width/4+width/10-width/20),height/15*2,width/15,height/20,10,10,10,10);
  }else{
    fill(0, 0, 0, 40);
    text("Login",-(width/4+width/10-width/20),height/15*2);
    rect(-(width/4+width/10-width/20),height/15*2,width/15,height/20,10,10,10,10);
  }
  
  
  //Player 2
  //------ Username player 2
  if (mouseX>(width/2+width/4+width/10-width/20)-width/10 && mouseX<(width/2+width/4+width/10-width/20)+width/10 && mouseY>height/2-height/40 && mouseY<height/2+height/40 && scene == 0){
    fill(255, 0, 0, 70);
    rect(width/4+width/10-width/20,0,width/5,height/20,10,10,10,10);
  }else{
    fill(0, 0, 0, 40);
    rect(width/4+width/10-width/20,0,width/5,height/20,10,10,10,10);
  }
  //------ Password player 2
  if (mouseX>(width/2+width/4+width/10-width/20)-width/10 && mouseX<(width/2+width/4+width/10-width/20)+width/10 && mouseY>height/2+height/15-height/40 && mouseY<height/2+height/15+height/40 && scene == 0){
    fill(0, 255, 0, 70);
    rect(width/4+width/10-width/20,height/15,width/5,height/20,10,10,10,10);
  }else{
    fill(0, 0, 0, 40);
    rect(width/4+width/10-width/20,height/15,width/5,height/20,10,10,10,10);
  }
  //------ Login button
  if (mouseX>width/2+(width/4+width/10-width/20)-width/30 && mouseX<width/2+(width/4+width/10-width/20)+width/30 && mouseY>height/2+height/15*2-height/40 && mouseY<height/2+height/15*2+height/40 && scene == 0){
    fill(0, 0, 0, 70);
    text("Login",width/4+width/10-width/20,height/15*2);
    rect(width/4+width/10-width/20,height/15*2,width/15,height/20,10,10,10,10);
  }else{
    fill(0, 0, 0, 40);
    text("Login",width/4+width/10-width/20,height/15*2);
    rect(width/4+width/10-width/20,height/15*2,width/15,height/20,10,10,10,10);
  }
  popMatrix();
}

void mousePressed(){
  int tri=width/30;
  if(scene==0){
    if (mouseX>width/2-width/10 && mouseX<width/2+width/10 && mouseY>height/2-height/16 && mouseY<height/2+height/16 && scene == 0){
      scene=1;
    }else if(mouseX>width/2-width/10 && mouseX<width/2+width/10 && mouseY>height/2-height/16+height/8*1.2 && mouseY<height/2+height/16+height/8*1.2){
      scene=2;
    }else if(mouseX>width/2-width/10 && mouseX<width/2+width/10 && mouseY>height/2-height/16+height/8*1.2*2 && mouseY<height/2+height/16+height/8*1.2*2){
      exit();
    }
  }else if(scene==1){
    if (mouseX>15 && mouseY>15 && mouseX<85 && mouseY<85) {
      scene=0;
      resetGame();
    }
  }else if(scene==2){
    if (mouseX>15 && mouseY>15 && mouseX<85 && mouseY<85) {
      scene=0;
    }else if (mouseX>width/2-width/3-width/10 && mouseX<width/2-width/3+width/10 && mouseY>height/2-height/16-height/16 && mouseY<height/2-height/16+height/16){
      sizeBall();
    }else if (mouseX>width/2+width/3-width/10 && mouseX<width/2+width/3+width/10 && mouseY>height/2-height/16-height/16 && mouseY<height/2-height/16+height/16){
      sizePlayer();
    }else if (mouseX>width/2-tri*2 && mouseX<width/2-tri && mouseY>height/2+width/5-tri/2 && mouseY<height/2+width/5+tri/2){
      mpButton(2);
    }else if (mouseX<width/2+tri*2 && mouseX>width/2+tri && mouseY>height/2+width/5-tri/2 && mouseY<height/2+width/5+tri/2){
      mpButton(1);
    }
  }
}

//Login Userinterface
void mouseClicked(){
  if(scene==0){
    if (mouseX>(width/2-(width/4+width/10-width/20))-width/10 && mouseX<(width/2-(width/4+width/10-width/20))+width/10 && mouseY>height/2-height/40 && mouseY<height/2+height/40 && scene == 0){
      toggleWrite=1;
    }else if (mouseX>(width/2-(width/4+width/10-width/20))-width/10 && mouseX<(width/2-(width/4+width/10-width/20))+width/10 && mouseY>height/2+height/15-height/40 && mouseY<height/2+height/15+height/40 && scene == 0){
      toggleWrite=2;
    }else if (mouseX>(width/2+width/4+width/10-width/20)-width/10 && mouseX<(width/2+width/4+width/10-width/20)+width/10 && mouseY>height/2-height/40 && mouseY<height/2+height/40 && scene == 0){
      toggleWrite=3;
    }else if (mouseX>(width/2+width/4+width/10-width/20)-width/10 && mouseX<(width/2+width/4+width/10-width/20)+width/10 && mouseY>height/2+height/15-height/40 && mouseY<height/2+height/15+height/40 && scene == 0){
      toggleWrite=4;
    }else{
      if(toggleWrite!=1){
        toggleWrite=0;
      }
    }
    println(toggleWrite);
  }
}

void updateBackground() {
  // Vores betingelser tjekker, om farven skal blive lysere eller mørkere ved hjælp af vores boolean variabel; bgT
  if (scene==0 || scene==2) {
    background(bgColor, bgColor, bgColor);
    if (bgChange == true) { 
      if (bgColor>140) {
        bgColor = bgColor-0.25;
      } else {
        bgChange = false;
      }
    } else {
      if (bgColor<190) {
        bgColor = bgColor+0.25;
      } else {
        bgChange = true;
      }
    }
  }
}
