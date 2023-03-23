class DateRange {
  PFont titleFont;
  PImage calendarIcon, arrows;
  int boxWidth;
  int boxHeight;
  ArrayList<Widget> widgetList;
  DataList dataList;

  DateRange() {
    boxWidth = 170;
    boxHeight = 40;
    titleFont = loadFont("NotoSerifMyanmar-Bold-40.vlw");
    calendarIcon = loadImage("calendar.png");
    arrows = loadImage("arrows.png");
    arrows.resize(boxHeight, boxHeight);
    calendarIcon.resize(boxHeight, boxHeight);
    dataList = new DataList();
    widgetList = new ArrayList<Widget>();
    widgetList.add(new DatePicker(SCREENX/10+40, SCREENY/8, boxWidth, boxHeight,
      "From:", color(200), titleFont, 1));
    widgetList.add(new DatePicker(SCREENX/2+30, SCREENY/8, boxWidth, boxHeight,
      "To:", color(200), titleFont, 2));
    widgetList.add(new Widget(SCREENX-boxWidth-30, SCREENY/8, boxWidth, boxHeight,
      "Search", color(255), titleFont, 3));
  }

  void draw() {
    pushStyle();
    background(255);
    noStroke();
    fill(110, 166, 255);

    // banner
    rect(0, 0, SCREENX, 150, 10);
    fill(0);
    textAlign(CENTER);
    textFont(titleFont);
    textSize(35);
    text("Search Flights by Date Range", SCREENX/2, 40);
    strokeWeight(2);

    // from box
    widgetList.get(0).draw();
    // to box
    widgetList.get(1).draw();
    // search box
    widgetList.get(2).draw();
  }

  void rectangle() {
  }

  void displayFlight() {
  }
  void mousePressed() {
    int event = 0;
    int index = 0;
    for (int i=0; i<widgetList.size(); i++) {
      event = widgetList.get(i).getEvent(mouseX, mouseY);
      index = i;
      if (event != 0) break;
    }
    println(event);
    switch (event) {
    default:
      break;
    case 1:
    case 2:
      widgetList.get(index).openCalendar();
      break;
    case 3:
      //dataList.getFlightByDateRange()
    }
  }
  void mouseMoved() {
    int event = 0;
    int index = 0;
    int iCal = 0;
    for (int i=0; i<widgetList.size(); i++) {
      event = widgetList.get(i).getEvent(mouseX, mouseY);
      index = i;
      if (event != 0) break;
      if (event == 0) {
        for (int ii=0; ii<widgetList.get(0).daysArray.size(); ii++) {
          event = widgetList.get(0).daysArray.get(ii).getEvent(mouseX, mouseY);
          index = ii; 
          iCal = 0;
          if (event == 0) widgetList.get(iCal).daysArray.get(index).highlight = false;
          else break;
        }
      }
      if (event == 0) {
        for (int ii=0; ii<widgetList.get(1).daysArray.size(); ii++) {
          event = widgetList.get(1).daysArray.get(ii).getEvent(mouseX, mouseY);
          index = ii;
          iCal = 1;
          if (event != 0) break;
        }
      }
    }
    if (event >= 4 && event <= 35) {
      widgetList.get(iCal).daysArray.get(index).highlight();
    }
  }
  void mouseWheel() {
  }
}
