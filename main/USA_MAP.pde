public class USA_MAP {
  int originalx;
  int originaly;
  DataList thedate;
  PImage map;
  PImage cross;
  ArrayList<A_Widget> buttonlist;
  A_Widget crossWidget;
  DataList stateflight;
  PFont usafont;
  ArrayList<String> r;
  int textwidth;
  boolean expand, first;
  boolean show;
  int indexButton;
  int sizex;
  int sizey;
  int dowedexpand= 1;
  int crossevent=2000;
  int crossid;
  int offset;
  int[] offsets;
  float mouse;



  public USA_MAP() {
    sizex=20;
    sizey=20;
    r = new ArrayList<String>();
    offset = 0;
    first = true;
    map = loadImage("map.png");
    cross= loadImage("CROSS.png");
    buttonlist = new ArrayList<A_Widget>();
    usafont = loadFont("AcademyEngravedLetPlain-15.vlw");
    crossWidget = new A_Widget(1, crossid, crossevent, 1143, 130, 30, 30, "X", usafont, dim_grey, white, white, cross);
    thedate = data;
    mouse = 0;
    for (int i = 0; i < 48; i++) {
      buttonlist.add(new A_Widget(1, i, i, int(XPOSITION[i]), int(YPOSITION[i]), sizex, sizey, "", usafont, dim_grey, white, white, map) );
      println(i);
      background(255);
      originalx= int(XPOSITION[i]);
      originaly= int(YPOSITION[i]);
    }
    expand = false;
  }


  void draw() {
    image(map, 100, 100, SCREENX/2+200, SCREENY/2+200);
    fill(255, 0, 0, 100);

    for (int i = 0; i < 48; i++) {
      buttonlist.get(i).draw();
    }
    buttonlist.get(indexButton).draw();
    if (expand) {
      expandButton();
    } else if (dowedexpand==2)
    {
      dexpandButton();
    } else {
      if (r != null && r.size() != 0 && show) {
        crossWidget.draw();
        int textwidth = 150;
        int offset = 60;
        int i = 0;
        for (DataPoint flight : stateflight.datapointlist) {\
          text("FL_DATE", 30, 120);
          text("DEST", 912, 120);
          text("DEST(ABR)", 711, 120);
          text("ORIGIN", 282, 120);
          text("ORIGIN(ABR)", 519, 120);
          mouse -= mouseWheel(mouseEvent)/5;

          if (first) {
            offset += 30;
            offsets[i] = offset;
          }
          if (110+offsets[i]+mouse > 120) {
            text(flight.getData(0), 30, 110+offsets[i]+mouse);
            text(flight.getData(4), 282, 110+offsets[i]+mouse);
            text(flight.getData(5), 912, 110+offsets[i]+mouse);
            text(flight.getData(8), 711, 110+offsets[i]+mouse);
            text(flight.getData(9), 519, 110+offsets[i]+mouse);
          }
          i++;
        }
        first = false;
      } else if (show) {
        crossWidget.draw();
        text("NO FLIGHTS FROM THIS STATE SORRY", 400, 400);
      }
    }
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
      show = true;
      expand = true;
      stateflight = thedate.getFlightByState(Stateabb[event]);
      offsets = new int[stateflight.datapointlist.size()];
      if (stateflight.getSize() != 0) {
        r = stateflight.displayAll();
      } else {
        //println("no data for " + Stateabb[event]);
      }
    }

    int event2 = crossWidget.getEvent(mouseX, mouseY);
    if (event2 == crossevent) {
      show = false;
      dowedexpand=2;
    }
  }
  float mouseWheel(MouseEvent event) {
    return event.getCount();
  }



  void expandButton() {
    sizex = int(buttonlist.get(indexButton).width);
    sizey = int(buttonlist.get(indexButton).height);
    if (buttonlist.get(indexButton).x > 0) buttonlist.get(indexButton).x -= 10;
    if (buttonlist.get(indexButton).x+sizex < SCREENX) buttonlist.get(indexButton).width += 20;
    if (buttonlist.get(indexButton).y > 90) buttonlist.get(indexButton).y -= 10;
    if (buttonlist.get(indexButton).y+sizey < SCREENY) buttonlist.get(indexButton).height += 20;
    if (!(buttonlist.get(indexButton).x > 0) && !(buttonlist.get(indexButton).x+sizex < SCREENX) && !(buttonlist.get(indexButton).y > 90) && !(buttonlist.get(indexButton).y+sizey < SCREENY)) {
      expand = false;
      dowedexpand=0;
      show= true;
    }
  }
  void dexpandButton() {
    int targetSizex = 20;
    int targetSizey = 20;

    if (buttonlist.get(indexButton).x < int(XPOSITION[indexButton])) {
      buttonlist.get(indexButton).x += min(20, int(XPOSITION[indexButton]) - buttonlist.get(indexButton).x);
    }

    if (buttonlist.get(indexButton).width > targetSizex) {
      buttonlist.get(indexButton).width -= 20;
    }

    if (buttonlist.get(indexButton).y < int(YPOSITION[indexButton])) {
      buttonlist.get(indexButton).y += min(10, int(YPOSITION[indexButton]) - buttonlist.get(indexButton).y);
    }

    if (buttonlist.get(indexButton).height > targetSizey) {
      buttonlist.get(indexButton).height -= 20;
    }

    if (buttonlist.get(indexButton).width <= targetSizex && buttonlist.get(indexButton).height <= targetSizey) {
      expand = false;
      show = false;
      dowedexpand = 1;
    }
  }
}
