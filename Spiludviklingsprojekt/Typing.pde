class typing {

  String[] typing = { "", "", "", "", "", "", "", ""};
  String[] tPassword = {"", "", "", "", "", "", "", ""};
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
    if (current ==2 || current == 4 || current == 6 || current == 7) {
      text(tPassword[current], pos.x, pos.y);
    } else {
      text(typing[current], pos.x, pos.y);
    }
  }
  void DB() {
    if (signup);
    if (db.connect()) {
      db.query("SELECT * FROM Users WHERE Username='" + typing[5] + "'");
      while (db.next())
        signup = false;
    } 
    if (signup) {
      db.query("INSERT INTO Users(Username, Password) VALUES ('" + typing[5] + "', \"Hunde\"); ");
    }


/*
 
 if(db.query("SELECT * FROM Users WHERE Username = '" + typing[5] + "'"){
 signup = false;
 } else {
 db.query("INSERT INTO Users(Username, Password) VALUES ('" + typing[5] + "', \"Hale\"); ");
 }
 }
 }
 }
 */
 

//////////////Hashing//////////////
import java.security.*;

try {
  //Vha. MessageDigest kan vi anvende en hashing algoritme.... her SHA-256 ...
  //prøv f.eks. MD5 og se om du kan bryde den ved at søge på nettet!
  MessageDigest md = MessageDigest.getInstance("SHA-256"); 
  
  //Input er en tekst der skal "hashes"
  String inputTekst = tPassword[1];
  String inputTekst2 = tPassword[2];
    
  //MassageDigest objektet "fodres" med teksten, der skal "hashes"
    md.update(inputTekst.getBytes());   
    md.update(inputTekst2.getBytes()); 

  //digest funktionen giver "hash-værdien", men i hexadecimale bytes 
  byte[] byteList = md.digest();
  
  //Her anvendes processings hex funktion, der kan konvertere hexadecimale bytes til Strings
  //så det er muligt at læse "hash-værdien"
  StringBuffer hashedValueBuffer = new StringBuffer();
  for (byte b : byteList)hashedValueBuffer.append(hex(b)); 
  
 StringBuffer hashedValueBuffer2 = new StringBuffer();
  for (byte b : byteList)hashedValueBuffer2.append(hex(b)); 
  
  //Her udskrives den oprindelige tekst
  println("Den orindelige tekst: "+ inputTekst);
  println("Den orindelige tekst: "+ inputTekst2);
  //Her udskrives "hash-værdien" af teksten
  println("SHA-256 værdien af teksten: " +hashedValueBuffer.toString());
    println("SHA-256 værdien af teksten: " +hashedValueBuffer2.toString());
  
}
catch (Exception e) {
  System.out.println("Exception: "+e);
}
}
}
  
