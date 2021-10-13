void drawButton(){
  if (mouseX>15 && mouseY>15 && mouseX<85 && mouseY<85) {
    drawHome(80);
  } else {
    drawHome(40);
  }
}

void drawHome(int c){
  //Home button
  pushMatrix();
  translate(50, 50);
  noFill();
  stroke(255, 255, 255, c);
  strokeWeight(5);
  ellipse(0, 0, 100*0.7, 100*0.7);
  //Hus
  noStroke();
  fill(255, 255, 255, c);
  rectMode(CORNER);
  rect(-(49*0.7)/2, 15*0.7-1.5, 15*0.7, 20*0.7);
  rect((49*0.7)/2-15*0.7, 15*0.7-1.5, 15*0.7, 20*0.7);
  rectMode(CENTER);
  rect(0, 2, 49*0.7, 20*0.7);
  triangle(-35*0.7, -5, 35*0.7, -5, 0, -30*0.7);
  popMatrix();
}
