

///////////////////Spillet///////////////////
void drawGame() {

  background(1);
  drawGrid(gridCount);
  rectMode(CORNER);
  rect(0, height-height/5, width, height/5);

  ///////////////////TEGNER GOAL///////////////////


  ///////////////////TEGNER PLAYER1, PLAYER 2///////////////////
  player1.display();
  player2.display();
  player1.update();
  player2.update();

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
