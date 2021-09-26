///////////////////Variabel//////////////////
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

Goal  goal1 = new Goal(1);
Goal goal2 = new Goal(2);


void setup() {

  ///////////////////Basic///////////////////
  size(1400,800,P3D);
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

void drawScore() {
  textSize(35);
  textFont(font);
  fill(0, 0, 0);
  text(scoreP1, width*1/4, height*8/9);
  text(scoreP2, width*3/4, height*8/9);
}
