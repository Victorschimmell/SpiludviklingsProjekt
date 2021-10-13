class typing {

  String typing = "";
  boolean isTyping = false;
  PVector pos;

  typing( float x, float y) {
    pos = new PVector(x, y);
  }

  void typeText() {
   if(isTyping){
    if (typing.length() < 15 && key != CODED && key != '\n' && key != BACKSPACE) {
      typing = typing + key;
      println(typing);
    } else if (key == BACKSPACE && typing.length() > 0) {
      typing = typing.substring(0, typing.length()-1);
    }
  }
  }

  void drawText() {
      text(typing, pos.x,pos.y);      
    
  }
}
