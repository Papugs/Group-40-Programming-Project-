public class USA_MAP {
  DataList thedate;
  PImage map;
  ArrayList<A_Widget> buttonlist;
  PFont usafont;
  
  public USA_MAP() {
    map = loadImage("map.png");
    buttonlist = new ArrayList<A_Widget>();
    usafont = loadFont("AcademyEngravedLetPlain-48.vlw");
    
    for (int i = 0; i < 47; i++) {
      buttonlist.add(new A_Widget(1, i, i, int(XPOSITION[i]), int(YPOSITION[i]), 10, 10, Stateabb[i], usafont, dim_grey, white, white, map) ); 
      println(i);
    }
  }
  
  void draw() {
    background(255);
    image(map, 100, 100, SCREENX/2+200, SCREENY/2+200);
    
    for (int i = 0; i < 47; i++) {
      buttonlist.get(i).draw();
    }
  }
  
  void mousePressed() {
    println(mouseX, mouseY);
    int event = 0;
    for (int i = 0; i < 47; i++) {
      event = buttonlist.get(i).getEvent(mouseX, mouseY);
      
      if (event != 0) {
        break;
      }
    }
    
    switch (event) {
      case 1:
       println((thedate.getFlightByState(Stateabb[0])));
        break;
      case 2:
        println(thedate.getFlightByState(Stateabb[1]));
        break;
      case 3:
        println(thedate.getFlightByState(Stateabb[2]));
        break;
      case 4:
        println(thedate.getFlightByState(Stateabb[3]));
        break;
      case 5:
        println(thedate.getFlightByState(Stateabb[4]));
        break;
      case 6:
        println(thedate.getFlightByState(Stateabb[5])); 
        break;
      case 7:
        println(thedate.getFlightByState(Stateabb[6]));  
        break;
      case 8:
        println(thedate.getFlightByState(Stateabb[7])); 
        break;
      case 9:
        println(thedate.getFlightByState(Stateabb[8] )); 
        break;
      case 10:
        println(thedate.getFlightByState(Stateabb[9] )); 
        break;
      case 11:
        println(thedate.getFlightByState(Stateabb[10] )); 
        break;
      case 12:
        println(thedate.getFlightByState(Stateabb[11] )); 
        break;
      case 13:
        println(thedate.getFlightByState(Stateabb[12] )); 
        break;
      case 14:
        println(thedate.getFlightByState(Stateabb[13] )); 
        break;
      case 15:
        println(thedate.getFlightByState(Stateabb[14] )); 
        break;
      case 16:
        println(thedate.getFlightByState(Stateabb[15] )); 
        break;
      case 17:
        println(thedate.getFlightByState(Stateabb[16] )); 
        break;
      case 18:
        println(thedate.getFlightByState(Stateabb[18] )); 
        break;
      case 19:
        println(thedate.getFlightByState(Stateabb[19] )); 
        break;
      case 20:
        println(thedate.getFlightByState(Stateabb[20] )); 
        break;
      case 21:
        println(thedate.getFlightByState(Stateabb[21] )); 
        break;
      case 22:
        println(thedate.getFlightByState(Stateabb[22] )); 
        break;
         case 23:
        println(thedate.getFlightByState(Stateabb[23] )); 
        break;
      case 24:
        println(thedate.getFlightByState(Stateabb[24] )); 
        break;
      case 25:
        println(thedate.getFlightByState(Stateabb[25] )); 
        break;
      case 26:
        println(thedate.getFlightByState(Stateabb[26] )); 
        break;
      case 27:
        println(thedate.getFlightByState(Stateabb[27] )); 
        break;
      case 28:
        println(thedate.getFlightByState(Stateabb[28] )); 
        break;
      case 29:
        println(thedate.getFlightByState(Stateabb[29] )); 
        break;
      case 30:
        println(thedate.getFlightByState(Stateabb[30] )); 
        break;
      case 31:
        println(thedate.getFlightByState(Stateabb[31] )); 
        break;
      case 32:
        println(thedate.getFlightByState(Stateabb[32] )); 
        break;
      case 33:
        println(thedate.getFlightByState(Stateabb[33] )); 
        break;
      case 34:
        println(thedate.getFlightByState(Stateabb[34])); 
        break;
      case 35:
        println(thedate.getFlightByState(Stateabb[35])); 
        break;
      case 36:
        println(thedate.getFlightByState(Stateabb[36])); 
        break;
      case 37:
        println(thedate.getFlightByState(Stateabb[37])); 
        break;
      case 38:
        println(thedate.getFlightByState(Stateabb[38] )); 
        break;
      case 39:
        println(thedate.getFlightByState(Stateabb[39] )); 
        break;
      case 40:
        println(thedate.getFlightByState(Stateabb[40] )); 
        break;
      case 41:
        println(thedate.getFlightByState(Stateabb[41] )); 
        break;
      case 42:
        println(thedate.getFlightByState(Stateabb[42] )); 
        break;
     case 43:
        println(thedate.getFlightByState(Stateabb[43] )); 
        break;
      case 44:
        println(thedate.getFlightByState(Stateabb[44] )); 
        break;
      case 45:
        println(thedate.getFlightByState(Stateabb[45] )); 
        break;
      case 46:
        println(thedate.getFlightByState(Stateabb[46] )); 
        break;
      case 47:
        println(thedate.getFlightByState(Stateabb[47] )); 
        break;
        default:

    // code to execute if event does not equal any of the previous cases
    break;
    }

  }
  }
