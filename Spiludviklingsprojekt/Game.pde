

///////////////////Spillet///////////////////
void drawGame() {
  rectMode(CORNER);
  background(1);
  drawGrid(gridCount);

  ///////////////////TEGNER PLAYER1, PLAYER 2///////////////////
  player1.leg();
  player2.leg();

  player1.display();
  player2.display();
  


  collision(player1.newLeg, player2.pos, player1.legr, player2.r);
  collision(player2.newLeg, player1.pos, player2.legr, player1.r);
  
  collision(player1.pos, player2.pos, player1.r, player2.r);
  collision(player2.pos, player1.pos, player2.r, player1.r);

  player1.update();
  player2.update();

  ///////////////////TEGNER BOLDEN///////////////////
  ball.update();
  ball.display();
  
  
  collision(player1.pos, ball.pos, player1.r, ball.r);
  collision(player2.pos, ball.pos, player2.r, ball.r);
  collision(player1.newLeg, ball.pos, player1.legr*2, ball.r);
  collision(player2.newLeg, ball.pos, player2.legr*2, ball.r);

  ///////////////////TEGNER GOAL///////////////////
  goal1.display();
  goal2.display();


  ///////////////////TEGNER PARTICLES///////////////////
  for (ParticleSystem ps : systems)
  {
    ps.update();
    ps.display();
  }

  ///////////////////TEGNER SCOREBOARD///////////////////
  drawScore();
}
