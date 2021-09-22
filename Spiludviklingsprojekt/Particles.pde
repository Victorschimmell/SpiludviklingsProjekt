

class ParticleSystem 
{
  ArrayList<Particle> particleArr;
  int parts; //dele af partiklerne

  color c;
  ParticleSystem(color C_)
  {
    c = C_;

    particleArr = new ArrayList<Particle>();
    parts = 0;
    for (int z = 0; z < P_antal; z++)
    {
      Particle p = new Particle(c); //giver dem et sted at spawne
      p.x = 0; 
      p.y = 0;
      particleArr.add(p);
      parts++;
    }
  }
  ParticleSystem(float x, float y, color C_)
  {
    c = C_;
    particleArr = new ArrayList<Particle>(); //gør at der kan tilføjes flere eksplosioner
    parts = 0;
    for (int z = 0; z < P_antal; z++)
    {
      Particle p = new Particle(c);
      p.x = x;
      p.y = y;
      particleArr.add(p);
      parts++;
    }
  }

  void update() //opdaterer particlerne (får dem til at forsvinde og fremstå)
  {

    for (int i = 0; i < parts; i++) {
      particleArr.get(i).update();

      if (!particleArr.get(i).visible) {
        particleArr.remove(particleArr.get(i));
        parts--;
      } else {
        particleArr.get(i).update();
      }
    }
  }
  void display()
  {

    for (int i = 0; i < parts; i++)
    {
      particleArr.get(i).render();
    }
  }
}

//vores partikel

class Particle { //tegner particler
  float x, y, dx, dy, r, dr;//posistion, hastighed, radius, redigerbar radius

  boolean visible; //om particles kan ses eller ej

  color c;
  Particle(color C_) {
    reset();
    c = C_;
  }

  void reset() {
    dx = random(-2.0, 2.0);   // Disse værdier kan ændres for at få forskellige former for eksplosioner
    dy = random(-2.0, 2.0);   
    r = random(4.0, 7);   
    dr = random(-0.5, 0.0);   
    visible = true;
  }

  //tegner ellipserne der en del af vores particle
  void render() {
    if (visible) {

      fill(c); // angiv farve før brug
      noStroke();
      ellipse(x, y, 2 * r, 2 * r);
    }
  }

  void update() { //bevæger partiklerne i givne retninger

    x += dx;
    y += dy;
    r += dr;

    if (r < 1) {   //fjerne en particle når den bliver for lille
      visible=false;
    }
  }
}
