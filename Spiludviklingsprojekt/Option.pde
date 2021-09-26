void drawOption(){
  updateBackground();
  pushMatrix();
  translate(width/2,height/2);
  //Mid-display
  stroke(0,0,0,70);
  strokeWeight(10);
  rectMode(CENTER);
  fill(bgColor,bgColor,bgColor);
  rect(0,0,width*2/5,height*2/5);
  fill(0,0,0,70);
  textSize(50);
  text("DISPLAY",0,0);
  noStroke();
  //Display ball
  ellipse(0,height*2/10-ball.r/2-5,ball.r,ball.r);
  //Display players
  ellipse(width*2/5/3,height*2/10-player1.r/2-5,player1.r,player1.r);
  ellipse(-width*2/5/3,height*2/10-player1.r/2-5,player1.r,player1.r);
  //Ball-option
  // - Draw button (10, 15, 20, 30)
  textSize(30);
  text("Change ball size",-width/3, -height/6);
  text("Change player size",width/3, -height/6);
  //BALL SIZE BUTTON
  if (mouseX>width/2-width/3-width/10 && mouseX<width/2-width/3+width/10 && mouseY>height/2-height/16-height/16 && mouseY<height/2-height/16+height/16){
    fill(0, 0, 0, 70);
    text("Size: "+ball.r,-width/3,-height/16);
    rect(-width/3, -height/16, width/5, height/8, 10, 10, 10, 10);
  }else{
    fill(0, 0, 0, 40);
    text("Size: "+ball.r,-width/3,-height/16);
    rect(-width/3, -height/16, width/5, height/8, 10, 10, 10, 10);
  }
  //PLAYER SIZE BUTTON
  if (mouseX>width/2+width/3-width/10 && mouseX<width/2+width/3+width/10 && mouseY>height/2-height/16-height/16 && mouseY<height/2-height/16+height/16){
    fill(0, 0, 0, 70);
    text("Size: "+player1.r,width/3,-height/16);
    rect(width/3, -height/16, width/5, height/8, 10, 10, 10, 10);
  }else{
    fill(0, 0, 0, 40);
    text("Size: "+player1.r,width/3,-height/16);
    rect(width/3, -height/16, width/5, height/8, 10, 10, 10, 10);
  }
  //SCORE SETTING
  //rect(0,width/5,80,80);
  textSize(30);
  fill(0,0,0,70);
  text("Matchpoint",0,width/5-width/20);
  int tri=width/30;
  if (mouseX>width/2-tri*2 && mouseX<width/2-tri && mouseY>height/2+width/5-tri/2 && mouseY<height/2+width/5+tri/2){
    fill(0, 0, 0, 70);
    triangle(0-tri*2,width/5,0-tri,width/5-tri/2,0-tri,width/5+tri/2);
  }else{
    fill(0, 0, 0, 40);
    triangle(0-tri*2,width/5,0-tri,width/5-tri/2,0-tri,width/5+tri/2);
  }
  if (mouseX<width/2+tri*2 && mouseX>width/2+tri && mouseY>height/2+width/5-tri/2 && mouseY<height/2+width/5+tri/2){
    fill(0, 0, 0, 70);
    triangle(0+tri*2,width/5,0+tri,width/5-tri/2,0+tri,width/5+tri/2);
  }else{
    fill(0, 0, 0, 40);
    triangle(0+tri*2,width/5,0+tri,width/5-tri/2,0+tri,width/5+tri/2);
  }
  
  textSize(40);
  fill(0, 0, 0, 70);
  text(endScore,0,width/5-5);
  popMatrix();
}

void sizeBall(){
  if(ball.r==20){
    ball.r=30;
  }else if(ball.r==30){
    ball.r=40;
  }else if(ball.r==40){
    ball.r=50;
  }else if(ball.r==50){
    ball.r=20;
  }
}

void sizePlayer(){
  if(player1.r==30){
    player1.r=50;
    player2.r=50;
  }else if(player1.r==50){
    player1.r=75;
    player2.r=75;
  }else if(player1.r==75){
    player1.r=100;
    player2.r=100;
  }else if(player1.r==100){
    player1.r=30;
    player2.r=30;
  }
}

void mpButton(int c){
  if(c==1){
    endScore=endScore+1;
  }else if(c==2){
    if(endScore>1){
      endScore=endScore-1;
    }
  }
}
