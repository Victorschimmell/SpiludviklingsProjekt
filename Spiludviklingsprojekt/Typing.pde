class typing {

  String[] typing = { "", "", "", "", ""};
  String[] tPassword = {"", "", "", "", ""};
  boolean isTyping = false;
  PVector pos;
  int current;

  typing( float x, float y, int nr) {
    current = nr;
    pos = new PVector(x, y);
  }

  void typeText() {
    if (isTyping) {
      if (typing[toggleWrite].length() < 15 && key != CODED && key != '\n' && key != BACKSPACE && !pressed[32]) {
        typing[toggleWrite] = typing[toggleWrite] + key;
        tPassword[toggleWrite]+= "*";

        
      } else if (key == BACKSPACE && typing[toggleWrite].length() > 0) {
        typing[toggleWrite] = typing[toggleWrite].substring(0, typing[toggleWrite].length()-1);
        tPassword[toggleWrite] = tPassword[toggleWrite].substring(0, tPassword[toggleWrite].length()-1);
      }
    }
    println(typing[current]);
  }

  void drawText() {
    if (current ==2 || current == 4) {
      text(tPassword[current], pos.x, pos.y);
    } else {
      text(typing[current], pos.x, pos.y);
    }
  }
}
