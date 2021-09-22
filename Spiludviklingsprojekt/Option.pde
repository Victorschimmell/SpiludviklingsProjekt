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
  ellipse(-(width/5+width*3/20),0,ball.r*2,ball.r*2);
  
  popMatrix();
}
