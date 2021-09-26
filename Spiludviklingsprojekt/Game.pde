

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
  collision(player1.pos, player2.pos, player1.r, player2.r);
  collision(player2.pos, player1.pos, player2.r, player1.r);
  player1.leg();
  player2.leg();

  ///////////////////TEGNER BOLDEN///////////////////
  ball.update();
  ball.display();
  collision(player1.pos, ball.pos, player1.r,ball.r);
  collision(player2.pos, ball.pos, player2.r,ball.r);

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
