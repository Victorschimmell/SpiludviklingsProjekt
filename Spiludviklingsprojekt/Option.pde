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
  
  //Ball-option
  // - Draw button (10, 15, 20, 30)
  noStroke();
  textSize(30);
  text("Change ball size",-width/3, -height/6);
  text("Change player size",width/3, -height/6);
  if (mouseX>width/2-width/3-width/10 && mouseX<width/2-width/3+width/10 && mouseY>height/2-height/16-height/16 && mouseY<height/2-height/16+height/16){
    fill(0, 0, 0, 70);
    text("Size: "+ball.r,-width/3,-height/16);
    rect(-width/3, -height/16, width/5, height/8, 10, 10, 10, 10);
  }else{
    fill(0, 0, 0, 40);
    text("Size: "+ball.r,-width/3,-height/16);
    rect(-width/3, -height/16, width/5, height/8, 10, 10, 10, 10);
  }
  if (mouseX>width/2+width/3-width/10 && mouseX<width/2+width/3+width/10 && mouseY>height/2-height/16-height/16 && mouseY<height/2-height/16+height/16){
    fill(0, 0, 0, 70);
    text("Size: "+player1.r,width/3,-height/16);
    rect(width/3, -height/16, width/5, height/8, 10, 10, 10, 10);
  }else{
    fill(0, 0, 0, 40);
    text("Size: "+player1.r,width/3,-height/16);
    rect(width/3, -height/16, width/5, height/8, 10, 10, 10, 10);
  }
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
