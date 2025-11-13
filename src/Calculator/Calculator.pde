// Joshua Mak | 25 Sept 2025 | Calculator
Button[] buttons = new Button[13];
Button[] numButtons = new Button[10];
int num = 0;
float l, r, result;
boolean left;
String dVal;
String op;


void setup() {
  size(155, 200);
  background(#CCCCCE);
  left = true;
  l = 0.0;
  r = 0.0;
  result = 0;
  dVal = "0";
  op = "";
  buttons[0] = new Button(15, 50, 20, 20, 'C', #C01EE5, #C01EE5);
  numButtons[0] = new Button(60, 170, 40, 20, '0', #40DBDA, #B771AA);
  buttons[1] = new Button(15, 80, 20, 20, '√', #C01EE5, #B771AA);
  buttons[7] = new Button(45, 50, 20, 20, '±', #C01EE5, #C01EE5);
  buttons[8] = new Button(75, 50, 20, 20, 'π', #C01EE5, #C01EE5);
  buttons[9] = new Button(105, 50, 20, 20, '^', #C01EE5, #C01EE5);
  buttons[2] = new Button(135, 50, 20, 20, '÷', #C01EE5, #C01EE5);
  numButtons[1] = new Button(45, 80, 20, 20, '1', #40DBDA, #B77127);
  numButtons[2] = new Button(75, 80, 20, 20, '2', #40DBDA, #B771AA);
  numButtons[3] = new Button(105, 80, 20, 20, '3', #40DBDA, #B771AA);
  buttons[3] = new Button(135, 80, 20, 20, 'x', #C01EE5, #B771AA);
  buttons[4] = new Button(15, 110, 20, 20, '%', #C01EE5, #B771AA);
  numButtons[4] = new Button(45, 110, 20, 20, '4', #40DBDA, #B771AA);
  numButtons[5] = new Button(75, 110, 20, 20, '5', #40DBDA, #B771AA);
  numButtons[6] = new Button(105, 110, 20, 20, '6', #40DBDA, #B771AA);
  buttons[5] = new Button(135, 110, 20, 20, '-', #C01EE5, #B771AA);
  buttons[6] = new Button(15, 140, 20, 20, ' ', #C01EE5, #B771AA);
  numButtons[7] = new Button(45, 140, 20, 20, '7', #40DBDA, #B771AA);
  numButtons[8] = new Button(75, 140, 20, 20, '8', #40DBDA, #B771AA);
  numButtons[9] = new Button(105, 140, 20, 20, '9', #40DBDA, #B771AA);
  buttons[10] = new Button(135, 155, 20, 50, '+', #C01EE5, #B771AA);
  buttons[11] = new Button(15, 170, 20, 20, '.', #C01EE5, #B771AA);
  buttons[12] = new Button(105, 170, 20, 20, '=', #C01EE5, #B771AA);
}

void draw() {
  background(#CCCCCE);
  for (int i=0; i<buttons.length; i++) {
    buttons[i].display();
    buttons[i].hover(mouseX, mouseY);
  }
  for (int i=0; i<numButtons.length; i++) {
    numButtons[i].display();
    numButtons[i].hover(mouseX, mouseY);
  }
  updateDisplay();
  //b.display();
  //bc.hover(mouseX,mouseY);
  //b0.display();
  //b0.hover(mouseX,mouseY);
  //b±.display();
  //b±.hover(mouseX,mouseY);
}
void keyPressed() {
  println("Key:" + key);
  println("KeyCode:" + keyCode);
  if (keyCode == 61 || keyCode == 107) {
    dVal = "0.0";
    left = false;
    op = "+";
  } else if (keyCode == 67) {
    left = true;
    l = 0.0;
    r = 0.0;
    result = 0.0;
    dVal = "0.0";
    op = " ";
  } else if (keyCode == 46 || keyCode == 110) {
    if (dVal.contains(".") == false) {
      dVal += ".";
    }
  } else if (keyCode == 49 || keyCode == 97) {
    if (dVal.length()<14) {
      if (left == true) {
        if (dVal.equals("0.0")) {
          dVal = "1";
          l = float(dVal);
        } else {
          dVal += "1";
          l = float(dVal);
        }
      } else if (!left) {
        if (dVal.equals("0.0")) {
          dVal = "1";
          r = float(dVal);
        } else {
          dVal += "1";
          r = float(dVal);
        }
      }
    }
  } else if (keyCode == 45 || keyCode == 109) {
    dVal = "0.0";
    left = false;
    op = "-";
  } else if (keyCode == 88) {
    dVal = "0.0";
    left = false;
    op = "*";
  } else if (keyCode == 111) {
    dVal = "0.0";
    left = false;
    op = "/";
  } else if (keyCode == 10 || keyCode == 10) {
    performCalculation();
  } else if ( keyCode == 96 || keyCode == 48) {
    if (dVal.length()<14) {
      if (left == true) {
        if (dVal.equals("0")) {
          dVal = "0";
          l = float(dVal);
        } else {
          dVal += "0";
          l = float(dVal);
        }
      } else if (numButtons[0].over && !left) {
        if (dVal.equals("0")) {
          dVal = "0";
          r = float(dVal);
        } else {
          dVal += "0";
          r = float(dVal);
        }
      }
    }
  } else if (keyCode == 99 || keyCode == 51) {
    if (dVal.length()<14) {
      if (left == true) {
        if (dVal.equals("0.0")) {
          dVal = "3";
          l = float(dVal);
        } else {
          dVal += "3";
          l = float(dVal);
        }
      } else if (!left) {
        if (dVal.equals("0.0")) {
          dVal = "3";
          r = float(dVal);
        } else {
          dVal += "3";
          r = float(dVal);
        }
      }
    }
  } else if (keyCode == 98 || keyCode == 50) {
    if (dVal.length()<14) {
      if (left == true) {
        if (dVal.equals("0.0")) {
          dVal = "2";
          l = float(dVal);
        } else {
          dVal += "2";
          l = float(dVal);
        }
      } else if (!left) {
        if (dVal.equals("0.0")) {
          dVal = "2";
          r = float(dVal);
        } else {
          dVal += "2";
          r = float(dVal);
        }
      }
    }
  } else if (keyCode == 52 || keyCode == 100) {
    if (dVal.length()<14) {
      if (left == true) {
        if (dVal.equals("0.0")) {
          dVal = "4";
          l = float(dVal);
        } else {
          dVal += "4";
          l = float(dVal);
        }
      } else if (!left) {
        if (dVal.equals("0.0")) {
          dVal = "4";
          r = float(dVal);
        } else {
          dVal += "4";
          r = float(dVal);
        }
      }
    }
  } else if (keyCode == 53 || keyCode == 101) {
    if (dVal.length()<14) {
      if (left == true) {
        if (dVal.equals("0.0")) {
          dVal = "5";
          l = float(dVal);
        } else {
          dVal += "5";
          l = float(dVal);
        }
      } else if (!left) {
        if (dVal.equals("0.0")) {
          dVal = "5";
          r = float(dVal);
        } else {
          dVal += "5";
          r = float(dVal);
        }
      }
    }
  } else if (keyCode == 54 || keyCode == 102) {
    if (dVal.length()<14) {
      if (left == true) {
        if (dVal.equals("0.0")) {
          dVal = "6";
          l = float(dVal);
        } else {
          dVal += "6";
          l = float(dVal);
        }
      } else if (!left) {
        if (dVal.equals("0.0")) {
          dVal = "6";
          r = float(dVal);
        } else {
          dVal += "6";
          r = float(dVal);
        }
      }
    }
  } else if (keyCode == 55 || keyCode == 103) {
    if (dVal.length()<14) {
      if (left == true) {
        if (dVal.equals("0.0")) {
          dVal = "7";
          l = float(dVal);
        } else {
          dVal += "7";
          l = float(dVal);
        }
      } else if (!left) {
        if (dVal.equals("0.0")) {
          dVal = "7";
          r = float(dVal);
        } else {
          dVal += "7";
          r = float(dVal);
        }
      }
    }
  } else if (keyCode == 56 || keyCode == 104) {
    if (dVal.length()<14) {
      if (left == true) {
        if (dVal.equals("0.0")) {
          dVal = "8";
          l = float(dVal);
        } else {
          dVal += "8";
          l = float(dVal);
        }
      } else if (!left) {
        if (dVal.equals("0.0")) {
          dVal = "8";
          r = float(dVal);
        } else {
          dVal += "8";
          r = float(dVal);
        }
      }
    }
  } else if (keyCode == 57 || keyCode == 105) {
    if (dVal.length()<14) {
      if (left == true) {
        if (dVal.equals("0.0")) {
          dVal = "9";
          l = float(dVal);
        } else {
          dVal += "9";
          l = float(dVal);
        }
      } else if (!left) {
        if (dVal.equals("0.0")) {
          dVal = "9";
          r = float(dVal);
        } else {
          dVal += "9";
          r = float(dVal);
        }
      }
    }
  }
}

void mousePressed() {
  //Not number buttons
  for (int i = 0; i<buttons.length; i++) {
    if (buttons[i].over && buttons[i].val == '+') {
      dVal="0";
      left = false;
      op = "+";
    } else if (buttons[i].over && buttons[i].val == '.') {
      if (dVal.contains(".") == false) {
        dVal += ".";
      }
    } else if (buttons[i].over && buttons[i].val == '=') {
      performCalculation();
    } else if (buttons[i].over && buttons[i].val == 's') {
      if (left) {
        l = sq(l);
        dVal = str(l);
      } else {
        r = sq(r);
        dVal = str(r);
      }
    } else if (buttons[i].over && buttons[i].val == '±') {
      if (left) {
        l*=-1;
        dVal = str(l);
      } else {
        r*=-1;
        dVal = str(r);
      }
    } else if (buttons[i].over && buttons[i].val == '√') {
      if (left) {
        l = sqrt(l);
        ;
        dVal = str(l);
      } else {
        r = sqrt(r);
        dVal = str(r);
      }
    } else if (buttons[i].over && buttons[i].val == 'π') {
      if (left) {
        l = PI;
        dVal = str(l);
      } else {
        r = PI;
        dVal = str(r);
      }
    } else if (buttons[i].over && buttons[i].val == '^') {
      dVal="0";
      left = false;
      op = "^";
    } else if (buttons[i].over && buttons[i].val == '-') {
      dVal="0";
      left = false;
      op = "-";
    } else if (buttons[i].over && buttons[i].val == 'x') {
      dVal="0";
      left = false;
      op = "*";
    } else if (buttons[i].over && buttons[i].val == '÷') {
      dVal="0";
      left = false;
      op = "/";
    } else if (buttons[i].over && buttons[i].val == '%') {
      if (left) {
        l = l*=0.01;
        dVal = str(l);
      } else {
        r= r*=0.01;
        dVal = str(r);
      }
    } else if (buttons[i].over && buttons[i].val == 'C') {
      //all actions to clear calc
      left = true;
      l = 0;
      r = 0;
      result = 0;
      dVal = "0";
      op = "";
    }
  }


  //All Number Buttons
  for (int i = 0; i<numButtons.length; i++) {
    if (dVal.length()<14) {
      if (numButtons[i].over && left) {
        if (dVal.equals("0")) {
          dVal = str(numButtons[i].val);
          l = float(dVal);
        } else {
          dVal += str(numButtons[i].val);
          l = float(dVal);
        }
      } else if (numButtons[i].over && !left) {
        if (dVal.equals("0")) {
          dVal = str(numButtons[i].val);
          r = float(dVal);
        } else {
          dVal += str(numButtons[i].val);
          r = float(dVal);
        }
      }
      textSize(25);
    }
  }
  println("L:" + l);
  println("R:" + r);
  println("Result:" + result);
  println("Op:" + op);
  println("Left:" + left);
}


void updateDisplay() {
  rectMode(CENTER);
  fill(255);
  rect(82, 21, 145, 30, 4);
  fill(0);
  textSize(35);
  textAlign(RIGHT);
  if (dVal.length()>8) {
    textSize(25);
  } else if (dVal.length()>9) {
    textSize(23);
  }
  text(dVal, width-10, 35.5);
}

void performCalculation() {
  if (op.equals("+")) {
    result = l + r;
  } else if (op.equals("-")) {
    result = l - r;
  } else if (op.equals("*")) {
    result = l * r;
  } else if (op.equals("/")) {
    result = l / r;
  } else if (op.equals("^")) {
    result = pow(l, r);
  }
  dVal = str(result);
}
