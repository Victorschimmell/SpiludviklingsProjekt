///////////////////Variabel///////////////////
//Screenstate
int scene = 0;

/*Gemmer "pressed keys" i en array, på grund af at processing "key" funktion er dårlig,
 og virker på basis af den sidste knap hvilket er trykket på. I stedet for bare at give
 hvilke knapper der bliver trykket på*/
boolean[] pressed = new boolean[256];

//Grid vars
int grid = 100, gridCount = 50;
int where = -1000;

//Particle
ArrayList<Particle> particles;
ArrayList<ParticleSystem> systems;
int P_antal = 100; // mængfde af particles

//Text
PFont font;
PFont mono;
PFont mono2;

int scoreP1 = 0;
int scoreP2 = 0;

Ball ball = new Ball();

Player player1 = new Player(1); //1 = retning = 1
Player player2 = new Player(2); // 2 = retning = 2

//Goal constructor arguments, vi laver to nye objekter

Goal goal1 = new Goal(1);
Goal goal2 = new Goal(2);


void setup() {

  ///////////////////Basic///////////////////
  size(1400, 800, P3D);
  font = createFont("SFTransRoboticsExtended.ttf", 72);
  mono = createFont("andalemo.ttf", 40);
  mono2 = createFont("andalemo.ttf", 70);

  frameRate(240);
  smooth();
  textAlign(CENTER, CENTER);
  ///////////////////Andet///////////////////
  systems = new ArrayList<ParticleSystem>();
  ball = new Ball();

  player1 = new Player(1);
  player2 = new Player(2);

  goal1 = new Goal(1);
  goal2 = new Goal(2);
}
void draw() {
  ///////////////////Scene selection///////////////////

  if ( scene == 0) {
    drawMenu();
  } else if ( scene == 1) {
    drawGame();
    drawButton();
  } else if ( scene == 2) {
    drawOption();
    drawButton();
  } else {

    println("Din kode er i stykker brormand");
  }
  fill(255);
  //FPS, så du kan se hvor dårlig din computer er.
  textSize(12);
  text(round(frameRate) + " FPS", width-50*displayDensity(), 50*displayDensity());
}


// Aflæse keycodes og herfra kunne bestemme hvilke kanpper der bliver trykket på
///////////////////KeyPressed///////////////////
void keyPressed() {
  pressed[keyCode] = true;
}

void keyReleased() {
  pressed[keyCode] = false;
}  


///////////////////Grid draw funktion///////////////////
void drawGrid(int count) {
  ///////////////////For den til at bevæge sig///////////////////
  where+=7;
  if (where>1000) {
    where = -1000;
  }
  ///////////////////tegner grid///////////////////
  pushMatrix();
  translate(0, 0, where);
  strokeWeight(1);
  stroke(40);
  float size = (count -1) * grid*4; //bestemmer størrelse

  for (int i = 0; i < count; i++) { // tegner lines for i
    float pos = map(i, 0, count-1, -0.5 * size, 0.5 * size);
    line(pos, 0, -size/2, pos, 0, size/2);
    line(-size/2, 0, pos, size/2, 0, pos);
  }
  popMatrix();
}
///////////////////tegner score///////////////////
void drawScore() {

  fill(255);
  rect(0, height-height/5, width, height/5);
  strokeWeight(5);
  stroke(252, 15, 192); 
  line(width/2, height-height/5+1, width/2, height);
  strokeWeight(1);
  textSize(35);
  textFont(font);
  fill(0, 0, 0);
  text(scoreP1, width*1/4, height*8/9);
  text(scoreP2, width*3/4, height*8/9);
}

///////////////////udregner collision mellem 2 obejkter///////////////////
void collision (PVector pos1, PVector pos2, int r1, int r2) {
  //Finder (x,Y) koordinater til ball og player2, og trækker derefter player1's værdier fra ball, hvilket beskriver distancen mellem de to cirkler//
  PVector distVectB1 = PVector.sub(pos1, pos2);
  //Tager de to vektorkoordinater for hver player og finder derefter afstanden mellem de to cirkler//
  float distVectMagB1 = distVectB1.mag();
  //Beskriver den mindste værdi som playerne må være indenfor hinandens radius, hvilket er den enes radius + den andens//
  float minDistB1 = r1 + r2;

  //Hvis afstanden mellem de to cirkler er mindre end den mindst tilladte afstand, så gør dette//
  if (distVectMagB1 < minDistB1) {
    float distCorrectionB1 = (minDistB1-distVectMagB1)/2.0;
    PVector dB1 = distVectB1.copy();
    PVector correctionVectB1 = dB1.normalize().mult(distCorrectionB1*PI);
    pos1.add(correctionVectB1);
    pos2.sub(correctionVectB1);

    //SPARK BOLDEN//
    if (pos2 == ball.pos) {
      ball.vel = ball.vel.normalize().mult(distCorrectionB1);
      ball.vel.sub(correctionVectB1);
    }

    //SPARK HINANDEN//
    if (pos1 == player1.newLeg  &&  pos2 == player2.pos) {

      player2.vel = player2.vel.normalize().mult(distCorrectionB1);
      player2.vel.sub(correctionVectB1);
      systems.add(new ParticleSystem(player2.pos.x, player2.pos.y, color(252, 0, 0)));
    } else if ( pos2 == player2.newLeg && pos2 == player1.pos) {
      player1.vel = player1.vel.normalize().mult(distCorrectionB1);
      player1.vel.sub(correctionVectB1);
      systems.add(new ParticleSystem(player2.pos.x, player2.pos.y, color(252, 0, 0)));
    }
  }
}
