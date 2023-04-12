public class USA_MAP {
  DataList thedate;
  PImage map;
  ArrayList<A_Widget> buttonlist;
  PFont usafont;
  String r;
  boolean expand;
  int indexButton;
  int sizex;
  int sizey;
  public USA_MAP() {
    sizex=20;
    sizey=20;
    map = loadImage("map.png");
    buttonlist = new ArrayList<A_Widget>();
    usafont = loadFont("AcademyEngravedLetPlain-48.vlw");
    thedate = data;
    r=" ";
    for (int i = 0; i < 48; i++) {
      buttonlist.add(new A_Widget(1, i, i, int(XPOSITION[i]), int(YPOSITION[i]), sizex, sizey, "", usafont, dim_grey, white, white, map) );
      println(i);
      background(255);
    }
    expand = false;
  }


  void draw() {
    image(map, 100, 100, SCREENX/2+200, SCREENY/2+200);
    fill(255, 0, 0, 100);
    text(r, 100, 100);
    for (int i = 0; i < 48; i++) {
      buttonlist.get(i).draw();
    }
    buttonlist.get(indexButton).draw();
    if (expand) expandButton();
  }

  void mousePressed() {
    println(mouseX, mouseY);
    int event = 0;
    for (int i = 0; i < 48; i++) {
      event = buttonlist.get(i).getEvent(mouseX, mouseY);
      if (event != 0) {
        break;
      }
    }

    if (event != 0) {
      indexButton = event;
      expand = true;
      DataList stateflight = thedate.getFlightByState(Stateabb[event]);
      if (stateflight.getSize() != 0) {
        stateflight.printAll();
        r = stateflight.displayAll();
      } else {
        r= " ";
        println("no data for " + Stateabb[event]);
      }
    }
  }

  void expandButton() {
    if (sizex < SCREENX) {
      sizex+=10;
      if (buttonlist.get(indexButton).x > 0) buttonlist.get(indexButton).x-=10;
      buttonlist.get(indexButton).width = sizex;
    }
    if (sizey<SCREENY) {
      sizey+=10;
      if (buttonlist.get(indexButton).y > 100) buttonlist.get(indexButton).y-=10;
      buttonlist.get(indexButton).height = sizey;
    } else expand = false;
  }
}
