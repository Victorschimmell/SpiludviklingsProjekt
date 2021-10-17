///////////////////Variabel///////////////////
//Background
float bgColor = 190;
boolean bgChange = true;
boolean signup = false;
boolean detect = false;

void drawMenu() {
  loginReady();
  updateBackground();
  signup = false;
  //Knapper
  rectMode(CENTER);
  noStroke();
  pushMatrix();
  translate(width/2, height/2);
  textSize(32);
  textAlign(CENTER, CENTER);
  textFont(mono);
  //Play
  if (mouseX>width/2-width/10 && mouseX<width/2+width/10 && mouseY>height/2-height/16 && mouseY<height/2+height/16) {
    fill(0, 0, 0, 70);
    if (!loginReady) {
      text("Login to play", 0, 0);
    } else {
      text("Play Game", 0, 0);
    }
    rect(0, 0, width/5, height/8, 10, 10, 10, 10);
  } else {
    fill(0, 0, 0, 60);
    if (!loginReady) {
      text("Login to play", 0, 0);
    } else {
      text("Play Game", 0, 0);
    }
    fill(0, 0, 0, 40);
    rect(0, 0, width/5, height/8, 10, 10, 10, 10);
  }
  //Options
  if (mouseX>width/2-width/10 && mouseX<width/2+width/10 && mouseY>height/2-height/16+height/8*1.2 && mouseY<height/2+height/16+height/8*1.2) {
    fill(0, 0, 0, 70);
    text("Options", 0, height/8*1.2);
    rect(0, height/8*1.2, width/5, height/8, 10, 10, 10, 10);
  } else {
    fill(0, 0, 0, 60);
    text("Options", 0, height/8*1.2);
    fill(0, 0, 0, 40);
    rect(0, height/8*1.2, width/5, height/8, 10, 10, 10, 10);
  }
  //Quit game
  if (mouseX>width/2-width/10 && mouseX<width/2+width/10 && mouseY>height/2-height/16+height/8*1.2*2 && mouseY<height/2+height/16+height/8*1.2*2) {
    fill(0, 0, 0, 70);
    text("Exit Game", 0, height/8*1.2*2);
    rect(0, height/8*1.2*2, width/5, height/8, 10, 10, 10, 10);
  } else {
    fill(0, 0, 0, 60);
    text("Exit Game", 0, height/8*1.2*2);
    fill(0, 0, 0, 40);
    rect(0, height/8*1.2*2, width/5, height/8, 10, 10, 10, 10);
  }
  textSize(70);
  textFont(mono2);
  fill(0, 0, 0, 70);
  text("Evals Soccer", 0, -(height/4));
  if (lastWinner=="Player 1" || lastWinner=="Player 2") {
    textSize(35);
    text("Last winner: "+lastWinner, 0, -(height/8));
  }

  ///////////////////Login//////////////////
  fill(0, 0, 0, 70);
  textSize(32);
  text("Player 1 login", -(width/4+width/10-width/20), -height/15);
  text("Player 2 login", width/4+width/10-width/20, -height/15);
  textSize(24);
  //Player 1
  //------ Username player 1
  if (mouseX>(width/2-(width/4+width/10-width/20))-width/10 && mouseX<(width/2-(width/4+width/10-width/20))+width/10 && mouseY>height/2-height/40 && mouseY<height/2+height/40 && scene == 0) {
    fill(255, 0, 0, 70);
    rect(-(width/4+width/10-width/20), 0, width/5, height/20, 10, 10, 10, 10);
    if (Username1.typing[1] == "") {
      text("Username", -(width/4+width/10-width/20), 0);
    }
  } else {
    fill(0, 0, 0, 40);
    rect(-(width/4+width/10-width/20), 0, width/5, height/20, 10, 10, 10, 10);
    if (Username1.typing[1] == "") {
      text("Username", -(width/4+width/10-width/20), 0);
    }
  }
  //------ Password player 1
  if (mouseX>(width/2-(width/4+width/10-width/20))-width/10 && mouseX<(width/2-(width/4+width/10-width/20))+width/10 && mouseY>height/2+height/15-height/40 && mouseY<height/2+height/15+height/40 && scene == 0) {
    fill(0, 255, 0, 40);
    rect(-(width/4+width/10-width/20), height/15, width/5, height/20, 10, 10, 10, 10);
    if (Password1.typing[2] == "") {
      text("Password", -(width/4+width/10-width/20), height/15);
    }
  } else {
    fill(0, 0, 0, 40);
    rect(-(width/4+width/10-width/20), height/15, width/5, height/20, 10, 10, 10, 10);
    if (Password1.typing[2] == "") {
      text("Password", -(width/4+width/10-width/20), height/15);
    }
  }
  //------ Login button 1
  if (mouseX>width/2-(width/4+width/10-width/20)-width/30 && mouseX<width/2-(width/4+width/10-width/20)+width/30 && mouseY>height/2+height/15*2-height/40 && mouseY<height/2+height/15*2+height/40 && scene == 0) {
    fill(0, 0, 0, 70);
    text("Login", -(width/4+width/10-width/20), height/15*2);
    rect(-(width/4+width/10-width/20), height/15*2, width/15, height/20, 10, 10, 10, 10);
  } else {
    fill(0, 0, 0, 40);
    text("Login", -(width/4+width/10-width/20), height/15*2);
    rect(-(width/4+width/10-width/20), height/15*2, width/15, height/20, 10, 10, 10, 10);
  }


  //Player 2
  //------ Username player 2
  if (mouseX>(width/2+width/4+width/10-width/20)-width/10 && mouseX<(width/2+width/4+width/10-width/20)+width/10 && mouseY>height/2-height/40 && mouseY<height/2+height/40 && scene == 0) {
    fill(255, 0, 0, 70);
    rect(width/4+width/10-width/20, 0, width/5, height/20, 10, 10, 10, 10);
    if (Username2.typing[3] == "") {
      text("Username", (width/4+width/10-width/20), 0);
    }
  } else {
    fill(0, 0, 0, 40);
    rect(width/4+width/10-width/20, 0, width/5, height/20, 10, 10, 10, 10);
    if (Username2.typing[3] == "") {
      text("Username", (width/4+width/10-width/20), 0);
    }
  }
  //------ Password player 2
  if (mouseX>(width/2+width/4+width/10-width/20)-width/10 && mouseX<(width/2+width/4+width/10-width/20)+width/10 && mouseY>height/2+height/15-height/40 && mouseY<height/2+height/15+height/40 && scene == 0) {
    fill(0, 255, 0, 70);
    rect(width/4+width/10-width/20, height/15, width/5, height/20, 10, 10, 10, 10);
    if (Password2.typing[4] == "") {
      text("Password", (width/4+width/10-width/20), height/15);
    }
  } else {
    fill(0, 0, 0, 40);
    rect(width/4+width/10-width/20, height/15, width/5, height/20, 10, 10, 10, 10);
    if (Password2.typing[4] == "") {
      text("Password", (width/4+width/10-width/20), height/15);
    }
  }
  //------ Login button 2
  if (mouseX>width/2+(width/4+width/10-width/20)-width/30 && mouseX<width/2+(width/4+width/10-width/20)+width/30 && mouseY>height/2+height/15*2-height/40 && mouseY<height/2+height/15*2+height/40 && scene == 0) {
    fill(0, 0, 0, 70);
    text("Login", width/4+width/10-width/20, height/15*2);
    rect(width/4+width/10-width/20, height/15*2, width/15, height/20, 10, 10, 10, 10);
  } else {
    fill(0, 0, 0, 40);
    text("Login", width/4+width/10-width/20, height/15*2);
    rect(width/4+width/10-width/20, height/15*2, width/15, height/20, 10, 10, 10, 10);
  }


  Username1.drawText();
  Password1.drawText();
  Username2.drawText();
  Password2.drawText();


  //SIGNUP-BUTTON
  if (mouseX>width/16-width/26 && mouseX<width/16+width/26 && mouseY>height/14-height/40 && mouseY<height/14+height/40 && scene == 0) {
    fill(0, 0, 0, 70);
    text("Sign up", -width/2+width/16, -height/2+height/14);
    rect(-width/2+width/16, -height/2+height/14, width/13, height/20, 10, 10, 10, 10);
  } else {
    fill(0, 0, 0, 40);
    text("Sign up", -width/2+width/16, -height/2+height/14);
    rect(-width/2+width/16, -height/2+height/14, width/13, height/20, 10, 10, 10, 10);
  }



  popMatrix();
}

void drawSignup() {
  updateBackground();
  rectMode(CENTER);
  textSize(24);
  //USERNAME
  pushMatrix();
  translate(width/2, height/2);
  if (mouseX>width/2-width/10 && mouseX<width/2+width/10 && mouseY>height/2-height/40 && mouseY<height/2+height/40 && scene == 3) {
    fill(0, 0, 0, 70);
    rect(0, 0, width/5, height/20, 10, 10, 10, 10);
    if (Username3.typing[5] == "") {
      text("Username", 0, 0);
    }
  } else {
    fill(0, 0, 0, 40);
    rect(0, 0, width/5, height/20, 10, 10, 10, 10);
    if (Username3.typing[5] == "") {
      text("Username", 0, 0);
    }
  }

  //PASSWORD_1
  if (mouseX>width/2-width/10 && mouseX<width/2+width/10 && mouseY>height/2-height/40+height/15 && mouseY<height/2+height/40+height/15 && scene == 3) {
    fill(0, 0, 0, 70);
    rect(0, height/15, width/5, height/20, 10, 10, 10, 10);
    if (Password3.typing[6] == "") {
      text("Password", 0, height/15);
    }
  } else {
    fill(0, 0, 0, 40);
    rect(0, height/15, width/5, height/20, 10, 10, 10, 10);
    if (Password3.typing[6] == "") {
      text("Password", 0, height/15);
    }
  }

  //PASSWORD_2
  if (mouseX>width/2-width/10 && mouseX<width/2+width/10 && mouseY>height/2-height/40+height/15*2 && mouseY<height/2+height/40+height/15*2 && scene == 3) {
    fill(0, 0, 0, 70);
    rect(0, height/15*2, width/5, height/20, 10, 10, 10, 10);
    if (Password4.typing[7] == "") {
      text("Repeat password", 0, height/15*2);
    }
  } else {
    fill(0, 0, 0, 40);
    rect(0, height/15*2, width/5, height/20, 10, 10, 10, 10);
    if (Password4.typing[7] == "") {
      text("Repeat password", 0, height/15*2);
    }
  }
  //SIGNUP
  if (mouseX>width/2-width/24 && mouseX<width/2+width/24 && mouseY>height/2+height/15*2+height/15-height/40 && mouseY<height/2+height/15*2+height/15+height/40 && scene == 3) {
    fill(0, 0, 0, 70);
    text("Sign up", 0, height/15*2+height/15);
    rect(0, height/15*2+height/15, width/12, height/20, 10, 10, 10, 10);
  } else {
    fill(0, 0, 0, 40);
    text("Sign up", 0, height/15*2+height/15);
    rect(0, height/15*2+height/15, width/12, height/20, 10, 10, 10, 10);
  }

  Username3.drawText();
  Password3.drawText();
  Password4.drawText();


  textSize(70);
  textFont(mono2);
  fill(0, 0, 0, 70);
  text("Sign Up", 0, -(height/4));
  textSize(35);
  text("Fill in the boxes down below", 0, -(height/8));
  popMatrix();
}

void mousePressed() {
  int tri=width/30;
  if (scene==0) {
    if (mouseX>width/2-width/10 && mouseX<width/2+width/10 && mouseY>height/2-height/16 && mouseY<height/2+height/16 && scene == 0) {
      if (loginP1 && loginP2) {
        scene=1;
      } else {
        println("Both users have to be logged in to start game");
      }
    } else if (mouseX>width/2-width/10 && mouseX<width/2+width/10 && mouseY>height/2-height/16+height/8*1.2 && mouseY<height/2+height/16+height/8*1.2) {
      scene=2;
    } else if (mouseX>width/2-width/10 && mouseX<width/2+width/10 && mouseY>height/2-height/16+height/8*1.2*2 && mouseY<height/2+height/16+height/8*1.2*2) {
      exit();
    } else if (mouseX>width/16-width/26 && mouseX<width/16+width/26 && mouseY>height/14-height/40 && mouseY<height/14+height/40 && scene == 0) {
      scene=3;
      Username1.typing[1] = "";
      Username2.typing[3] = "";
      Password1.typing[2] = "";
      Password2.typing[4] = "";
      Password1.tPassword[2] = "";
      Password2.tPassword[4] = "";
    }
  } else if (scene==1 || scene==3) {
    if (mouseX>15 && mouseY>15 && mouseX<85 && mouseY<85) {
      if (scene==1) {
        resetGame();
      } else if (scene==3) {
        Username3.typing[5] = "";
        Password3.typing[6] = ""; 
        Password4.typing[7] = "";
        Password3.tPassword[6] = "";
        Password4.tPassword[7] = "";
      }
      scene=0;
    }
  } else if (scene==2) {
    if (mouseX>15 && mouseY>15 && mouseX<85 && mouseY<85) {
      scene=0;
    } else if (mouseX>width/2-width/3-width/10 && mouseX<width/2-width/3+width/10 && mouseY>height/2-height/16-height/16 && mouseY<height/2-height/16+height/16) {
      sizeBall();
    } else if (mouseX>width/2+width/3-width/10 && mouseX<width/2+width/3+width/10 && mouseY>height/2-height/16-height/16 && mouseY<height/2-height/16+height/16) {
      sizePlayer();
    } else if (mouseX>width/2-tri*2 && mouseX<width/2-tri && mouseY>height/2+width/5-tri/2 && mouseY<height/2+width/5+tri/2) {
      mpButton(2);
    } else if (mouseX<width/2+tri*2 && mouseX>width/2+tri && mouseY>height/2+width/5-tri/2 && mouseY<height/2+width/5+tri/2) {
      mpButton(1);
    }
  }
}

//Login Userinterface
void mouseClicked() {
  if (scene==0 || scene==3) {
    if (mouseX>(width/2-(width/4+width/10-width/20))-width/10 && mouseX<(width/2-(width/4+width/10-width/20))+width/10 && mouseY>height/2-height/40 && mouseY<height/2+height/40 && scene == 0) {
      toggleWrite =1;

      //LOGIN BUTTON 1//
    } else if (mouseX>width/2-(width/4+width/10-width/20)-width/30 && mouseX<width/2-(width/4+width/10-width/20)+width/30 && mouseY>height/2+height/15*2-height/40 && mouseY<height/2+height/15*2+height/40 && scene == 0) {


      println("Log1");
      Username1.Log(1);
      if (loginP1) {
        println("Player 1 logged in");
      } else {
        println("Username or Password is incorrect");
        println(loginP1);
      }
    } else if (mouseX>(width/2-(width/4+width/10-width/20))-width/10 && mouseX<(width/2-(width/4+width/10-width/20))+width/10 && mouseY>height/2+height/15-height/40 && mouseY<height/2+height/15+height/40 && scene == 0) {
      toggleWrite=2;
    } else if (mouseX>(width/2+width/4+width/10-width/20)-width/10 && mouseX<(width/2+width/4+width/10-width/20)+width/10 && mouseY>height/2-height/40 && mouseY<height/2+height/40 && scene == 0) {
      toggleWrite=3;
    } else if (mouseX>(width/2+width/4+width/10-width/20)-width/10 && mouseX<(width/2+width/4+width/10-width/20)+width/10 && mouseY>height/2+height/15-height/40 && mouseY<height/2+height/15+height/40 && scene == 0) {
      toggleWrite=4;

      //LOGIN BUTTON 2//
    } else if (mouseX>width/2+(width/4+width/10-width/20)-width/30 && mouseX<width/2+(width/4+width/10-width/20)+width/30 && mouseY>height/2+height/15*2-height/40 && mouseY<height/2+height/15*2+height/40 && scene == 0) {
      println("log2");

      Username2.Log(2);
      if (loginP2) {
        println("Player 2 logged in");
      } else {
        println("Username or Password is incorrect");
        println(loginP2);
      }
    } else if (mouseX>width/2-width/10 && mouseX<width/2+width/10 && mouseY>height/2-height/40 && mouseY<height/2+height/40 && scene == 3) {
      toggleWrite=5;
    } else if (mouseX>width/2-width/10 && mouseX<width/2+width/10 && mouseY>height/2-height/40+height/15 && mouseY<height/2+height/40+height/15 && scene == 3) {
      toggleWrite=6;
    } else if (mouseX>width/2-width/10 && mouseX<width/2+width/10 && mouseY>height/2-height/40+height/15*2 && mouseY<height/2+height/40+height/15*2 && scene == 3) {
      toggleWrite=7;

      //SIGNUP BUTTON//
    } else if (mouseX>width/2-width/20 && mouseX<width/2+width/20 && mouseY>height/2-height/40+height/15*3 && mouseY<height/2+height/40+height/15*3 && scene == 3) {
      signup = true;  
      Password3.PDetect();
      Username3.DB();
      if (signup) {
        scene = 3;
      } else {
        println("Username already exists");
      }

      if (signup && detect) {
        println("Account registered");
        scene = 0;
      } else {
        println("Unsuccessful registration");
      }
    }
  }


  println(toggleWrite);
  isTyping();
}


void updateBackground() {
  // Vores betingelser tjekker, om farven skal blive lysere eller mørkere ved hjælp af vores boolean variabel; bgT
  if (scene==0 || scene==2 || scene==3) {
    background(bgColor, bgColor, bgColor);
    if (bgChange == true) { 
      if (bgColor>140) {
        bgColor = bgColor-0.25;
      } else {
        bgChange = false;
      }
    } else {
      if (bgColor<190) {
        bgColor = bgColor+0.25;
      } else {
        bgChange = true;
      }
    }
  }
}

void isTyping() {

  switch(toggleWrite) {

  case 0:
    Username1.isTyping = false;
    Username2.isTyping = false;
    break;

  case 1:
    if (toggleWrite == 1) {
      Username1.isTyping = true;
    } else { 
      Username1.isTyping = false;
    }
    break;

  case 2:
    if (toggleWrite == 2) {
      Password1.isTyping = true;
    } else { 
      Password1.isTyping = false;
    }
    break;

  case 3:
    if (toggleWrite ==3) {
      Username2.isTyping = true;
    } else { 
      Username2.isTyping = false;
    }
    break;

  case 4:
    if (toggleWrite ==4) {
      Password2.isTyping = true;
    } else { 
      Password2.isTyping = false;
    }
    break;

  case 5:
    if (toggleWrite ==5) {
      Username3.isTyping = true;
    } else { 
      Username3.isTyping = false;
    }
    break;

  case 6:
    if (toggleWrite ==6) {
      Password3.isTyping = true;
    } else { 
      Password3.isTyping = false;
    }
    break;

  case 7:
    if (toggleWrite ==7) {
      Password4.isTyping = true;
    } else { 
      Password4.isTyping = false;
    }
    break;


  default:
    toggleWrite = 0;
    break;
  }
}
