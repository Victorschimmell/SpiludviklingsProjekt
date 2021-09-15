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

Ball ball = new Ball();


void setup() {

  ///////////////////Basic///////////////////
  size(1400,800,P3D);
  frameRate(240);
  smooth();
  textAlign(CENTER, CENTER);
  ///////////////////Andet///////////////////
  systems = new ArrayList<ParticleSystem>();
  ball = new Ball();
  
  
  
}


void draw() {
  ///////////////////Scene selection///////////////////

  if ( scene == 0) {
    drawMenu();
  } else if ( scene == 1) {
    drawGame();
  } else if ( scene == 2) {
    drawOption();
  } else {

    println("Din kode er i stykker brormand");
  }
  fill(255);
  //FPS, så du kan se hvor dårlig din computer er.
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
  translate(0, height-height/5, where);
  stroke(255);
  float size = (count -1) * grid*4; //bestemmer størrelse

  for (int i = 0; i < count; i++) { // tegner lines for i
    float pos = map(i, 0, count-1, -0.5 * size, 0.5 * size);
    line(pos, 0, -size/2, pos, 0, size/2);
    line(-size/2, 0, pos, size/2, 0, pos);
  }
  popMatrix();
}
