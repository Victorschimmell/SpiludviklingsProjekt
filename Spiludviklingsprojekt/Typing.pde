class typing {

  String[] typing = { "","","","",""};
  boolean isTyping = false;
  PVector pos;
  int current;

  typing( float x, float y, int nr) {
    current = nr;
    pos = new PVector(x, y);
  }

  void typeText() {
   if(isTyping){
    if (typing[toggleWrite].length() < 15 && key != CODED && key != '\n' && key != BACKSPACE && !pressed[32]) {
      typing[toggleWrite] = typing[toggleWrite] + key;
      println(typing);
    } else if (key == BACKSPACE && typing[toggleWrite].length() > 0) {
      typing[toggleWrite] = typing[toggleWrite].substring(0, typing[toggleWrite].length()-1);
    }
  }
  }

  void drawText() {
      text(typing[current], pos.x,pos.y);      
    
  }
}
