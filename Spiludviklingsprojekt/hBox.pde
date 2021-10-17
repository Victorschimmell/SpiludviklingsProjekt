//Helper boxes

class hBox{
  
  PVector pos;
  String indhold;
  
  hBox(String input, float x, float y){
    
    indhold = input;
    
    pos = new PVector(x, y);
    
    
  }
  
  void display(){
    
    text(indhold, pos.x, pos.y);
    
  }
}
