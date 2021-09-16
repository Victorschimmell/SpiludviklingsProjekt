

///////////////////Spillet///////////////////
void drawGame() {

  background(1);
  drawGrid(gridCount);
  rectMode(CORNER);
  rect(0, height-height/5, width, height/5);
  strokeWeight(5);
  stroke(252, 15, 192); 
  line(width/2, height-height/5+1, width/2, height);
  strokeWeight(1);

  drawScore();


  ///////////////////TEGNER PLAYER1, PLAYER 2///////////////////
  player1.display();
  player2.display();
  player1.update();
  player2.update();
  player1.collision();
  player2.collision();

  ///////////////////TEGNER BOLDEN///////////////////
  ball.update();
  ball.display();

  ///////////////////TEGNER GOAL///////////////////
goal1.display();
goal2.display();


  ///////////////////TEGNER PARTICLES///////////////////
  for (ParticleSystem ps : systems)
  {
    ps.update();
    ps.display();
  }
}
