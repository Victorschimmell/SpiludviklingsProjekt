

///////////////////Spillet///////////////////
void drawGame() {

  background(1);
  drawGrid(gridCount);
  line(0,height-height/5, width, height-height/5);
  rectMode(CORNER);
  rect(0, height-height/5, width,height/5);


ball.update();
ball.display();

   
   for (ParticleSystem ps : systems)
  {
    ps.update();
    ps.display();
  }
}
