

///////////////////Spillet///////////////////
void drawGame() {

  background(1);
  drawGrid(gridCount);
  line(0, height-height/5, width, height-height/5);
  rectMode(CORNER);
  rect(0, height-height/5, width, height/5);

  ///////////////////TEGNER GOAL///////////////////
  Goal();
  
  ///////////////////TEGNER PLAYER1, PLAYER 2///////////////////


  ///////////////////TEGNER BOLDEN///////////////////
  ball.update();
  ball.display();

  ///////////////////TEGNER PARTICLES///////////////////
  for (ParticleSystem ps : systems)
  {
    ps.update();
    ps.display();
  }
}
