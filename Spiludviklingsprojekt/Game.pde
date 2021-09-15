

///////////////////Spillet///////////////////
void drawGame() {

  background(1);
  drawGrid(gridCount);
  rectMode(CORNER);
  rect(0, height-height/5, width, height/5);
  strokeWeight(5);
  stroke(252, 15, 192); 
  line(width/2, height-height/5-4, width/2, height);
  strokeWeight(1);


  ///////////////////TEGNER PLAYER1, PLAYER 2///////////////////
  player1.display();
  player2.display();
  player1.update();
  player2.update();

  ///////////////////TEGNER BOLDEN///////////////////
  ball.update();
  ball.display();
  
  ///////////////////TEGNER GOAL///////////////////




  ///////////////////TEGNER PARTICLES///////////////////
  for (ParticleSystem ps : systems)
  {
    ps.update();
    ps.display();
  }
}
