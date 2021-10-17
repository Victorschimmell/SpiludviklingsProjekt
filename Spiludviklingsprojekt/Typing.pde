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
    if (signup && detect) {


      db.query("INSERT INTO Users(Username, Password) VALUES ('" + typing[5] + "', '" + testkode(typing[6]) + "'); ");
    }
  }
  void PDetect() {

    if (signup) {

      if (typing[6].equals(typing[7]) && typing[6].length()>0 && typing[7].length()>0) {
        detect = true;
      } else {
        detect = false;
        println("No password or Password are not identical");
      }
    }
  }  
  void Log(int nr) {

    if (db.connect()) {
      if (nr == 1) {
        db.query("SELECT Username FROM Users WHERE Username='" + typing[1] + "' AND Password='" + testkode(typing[2]) + "'");

        if (db.next()) {
          println("Working login 1");
          loginP1 = true;
        } else {
          loginP1 = false;
        }
      }

      if (nr == 2) {
        db.query("SELECT Username FROM Users WHERE Username='" + typing[3] + "' AND Password='" + testkode(typing[4]) + "'");

        if (db.next()) {
          println("Working login 2");
          loginP2 = true;
        } else {

          loginP2 = false;
        }
      }
    }
  }
}

String testkode(String inputTekst){
  try {
    //Vha. MessageDigest kan vi anvende en hashing algoritme.... her SHA-256 ...
    //prøv f.eks. MD5 og se om du kan bryde den ved at søge på nettet!
    MessageDigest md = MessageDigest.getInstance("SHA-256"); 

    //MassageDigest objektet "fodres" med teksten, der skal "hashes"
    md.update(inputTekst.getBytes());    

    //digest funktionen giver "hash-værdien", men i hexadecimale bytes 
    byte[] byteList = md.digest();

    //Her anvendes processings hex funktion, der kan konvertere hexadecimale bytes til Strings
    //så det er muligt at læse "hash-værdien"
    StringBuffer hashedValueBuffer = new StringBuffer();
    for (byte b : byteList)hashedValueBuffer.append(hex(b)); 

    //Her udskrives den oprindelige tekst
    println("Den orindelige tekst: "+ inputTekst);
    //Her udskrives "hash-værdien" af teksten
    
    println("SHA-256 værdien af teksten: " +hashedValueBuffer.toString());
    
    
    return hashedValueBuffer.toString();
  }

  catch (Exception e) {
    System.out.println("Exception: "+e);
    return "";
  }
}
