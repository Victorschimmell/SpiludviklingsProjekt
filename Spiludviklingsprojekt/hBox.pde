//Helper boxes

class hBox {

  PVector pos;

  String indhold;

  float gradiant;


  hBox(String input) {

    indhold = input;

    pos = new PVector(0, height-(15+(textAscent())-textDescent()));

    gradiant = 100;
  }

  void display() {
    textSize(42);
    textAlign(CORNER, RIGHT);
    rectMode(CORNER);
    gradiant-=0.1;
    pos.y+=0.1;
    fill(255, gradiant);
    rect(pos.x, pos.y+5+textDescent(), textWidth(indhold)+5, -(10+(textAscent())));
    fill(1, gradiant);
    text(indhold, pos.x, pos.y);
    }
    
  }
