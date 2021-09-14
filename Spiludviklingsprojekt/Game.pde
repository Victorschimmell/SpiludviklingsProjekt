

///////////////////Spillet///////////////////
void drawGame() {

  background(1);
  drawGrid(gridCount);


ball.update();
ball.display();


  fill(252, 15, 192); // angiv farve før brug
  P_antal = 5; // angiv mængde af particles
  systems.add(new ParticleSystem(mouseX, mouseY));
  
   for (ParticleSystem ps : systems)
  {
    ps.update();
    ps.display();
  }
}
