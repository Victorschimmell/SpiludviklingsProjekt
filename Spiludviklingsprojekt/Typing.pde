class typing {

  String[] typing = { "","","","",""};
  boolean isTyping = false;
  PVector pos;

  typing( float x, float y) {
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
      text(typing[toggleWrite], pos.x,pos.y);      
    
  }
}
