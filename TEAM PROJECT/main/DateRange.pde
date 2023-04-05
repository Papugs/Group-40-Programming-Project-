class DateRange {
  PFont titleFont;
  PImage calendarIcon, arrows;
  int boxWidth;
  int boxHeight;
  int widgetSize;
  int transMouse;
  int offset;
  int heatMapSize;
  float mouse, transY;
  ArrayList<Widget> widgetList;
  ArrayList<DisplayFlight> displayFlight;
  DataList dataList;
  String[] startDate, endDate;
  color bannerColor, gradientBannerColor;
  DataPoint datapoint;
  PFont flightDetailsFont;
  PImage qr;
  boolean wheel, noFlights, heatMapCreated, firstHeatMap;
  int[][] timeHeatData;
  HeatMap heatMap;


  DateRange(float transY) {
    smooth();
    this.transY = transY;
    boxWidth = 170;
    boxHeight = 40;
    offset = 0;
    mouse = 0;
    widgetSize = 3;
    noFlights = false;
    heatMapSize = 400;
    firstHeatMap = true;
    titleFont = loadFont("NotoSerifMyanmar-Bold-40.vlw");
    calendarIcon = loadImage("calendar.png");
    arrows = loadImage("arrows.png");
    flightDetailsFont = loadFont("AvenirNext-UltraLightItalic-20.vlw");
    qr = loadImage("qrCode.png");
    qr.resize(90, 90);
    arrows.resize(boxHeight, boxHeight);
    bannerColor = color(87, 160, 210);
    gradientBannerColor = color(137, 207, 239);
    startDate = new String[3];
    endDate = new String[3];
    startDate[0] = "01";
    startDate[1] = "01";
    startDate[2] = "2022";
    endDate[0] = "01";
    endDate[1] = "31";
    endDate[2] = "2022";
    calendarIcon.resize(boxHeight, boxHeight);
    dataList = new DataList();
    widgetList = new ArrayList<Widget>();
    displayFlight = new ArrayList<DisplayFlight>();
    widgetList.add(new DatePicker(SCREENX/10+40, SCREENY/8, boxWidth, boxHeight,
      "From:", color(200), titleFont, 1));
    widgetList.add(new DatePicker(SCREENX/2+30, SCREENY/8, boxWidth, boxHeight,
      "To:", color(200), titleFont, 2));
    widgetList.add(new Widget(SCREENX-boxWidth-30, SCREENY/8, boxWidth, boxHeight,
      "Search", color(255), titleFont, 3));
    widgetList.add(new SlidePage(0, int(SCREENY-40-transY), SCREENX, SCREENY,
      "Search", color(200), titleFont, 4));
    widgetList.add(new SlidePage(0, int(SCREENY-60-transY), SCREENX, SCREENY,
      "Search", color(180), titleFont, 5));
  }

  void draw() {
    pushMatrix();
    translate(0, transY);
    pushStyle();
    background(255);
    if (wheel) mouse -= mouseWheel(mouseEvent);
    for (int widget=widgetList.size()-1; widget>=0; widget--) {
      widgetList.get(widget).draw();
      switch (widget) {
      case 3:
        if (heatMapCreated) heatMap.draw(widgetList.get(3).y+40);
        break;
      case 4:
        offset = 0;
        for (DisplayFlight flight : displayFlight) {
          float flightY = widgetList.get(4).y + 40+(offset*170) + mouse;
          flight.draw(flightY);
          offset++;
        }
        pushStyle();
        noStroke();
        fill(255);
        rect(0, widgetList.get(4).y-500, SCREENX, 500);
        popStyle();
        banner();
        break;
      }
    }
    if (noFlights) {
      noFlightsFound();
    }
    popStyle();
    popMatrix();
  }

  void mousePressed() {
    transMouse = int(mouseY - transY);
    int event = 0;
    int index = 0;
    int iCal = 0;
    for (int i=0; i<2; i++) {
      for (int iDay=0; iDay<widgetList.get(i).daysArray.size(); iDay++) {
        event = widgetList.get(i).daysArray.get(iDay).getEventDay(mouseX, transMouse);
        iCal = i;
        index = iDay;
        if (event != 0) break;
      }
      if (event != 0) break;
    }
    if (event == 0) {
      for (int i=0; i<widgetSize; i++) {
        event = widgetList.get(i).getEvent(mouseX, transMouse);
        index = i;
        if (event != 0) break;
      }
    }

    switch (event) {
    default:
      break;
    case 1:
    case 2:
      widgetList.get(index).openCalendar();
      break;
    case 3:
      timeHeatData = new int[int(endDate[1])+1][24];
      String startDateString = startDate[0] + "/" + startDate[1] + "/" + startDate[2];
      String endDateString = endDate[0] + "/" + endDate[1] + "/" + endDate[2];
      dataList = dataList.getFlightByDateRange(startDateString, endDateString);
      for (DataPoint datapoint : dataList.datapointlist) {
        int hour = int(datapoint.getData(13).replace(" ", ""))/100;
        String[] date = datapoint.getData(0).split("/");
        updateTimeHeatMapArray(int(date[1])-1, hour);
      }
      int[] y_values = new int[] {int(endDate[1]), int(startDate[1])};
      if (firstHeatMap) {
        heatMap = new HeatMap(20, 0, SCREENX-50, heatMapSize, Y_TIME_LABELS, timeHeatData, "HEATMAP OF FLIGHTS OVER TIME", y_values);
        firstHeatMap = false;
      } else heatMap.updateHeatMap(20, SCREENX-50, heatMapSize, Y_TIME_LABELS, timeHeatData, "HEATMAP OF FLIGHTS OVER TIME", y_values);
      heatMapCreated = true;
      if (dataList.datapointlist.size() != 0) {
        noFlights = false;
        for (int flights=0; flights<20; flights++) {
          datapoint = dataList.datapointlist.get(flights);
          int i = 0;
          String[] element = new String[] {datapoint.getData(2), datapoint.getData(4), datapoint.getData(8), datapoint.getData(0), datapoint.getData(12), datapoint.getData(14), datapoint.getData(9), datapoint.getData(1), datapoint.getData(15)};
          if (flights<20) {
            displayFlight.add(new DisplayFlight(20, element[i++], element[i++],
              element[i++], element[i++], element[i++], element[i++], element[i++],
              element[i++], element[i], flightDetailsFont, qr));
          }
        }

        widgetList.get(4).extend();
        wheel = true;
        widgetSize = 5;
      } else noFlights = true;
      break;
    case 4:
    case 5:
      widgetList.get(3).extend();
      widgetList.get(4).extend();
      break;
    }
    if (event >= 104 && event <= 135) {
      if (iCal == 1 || event-103 <= widgetList.get(1).day) {
        if (iCal == 0) startDate[1] = str(event-103);
        else if (iCal == 1) endDate[1] = str(event-103);

        widgetList.get(iCal).openCalendar=false;
        widgetList.get(iCal).day = event-103;
      }
    }
  }
  void mouseMoved() {
    transMouse = int(mouseY - transY);
    int event = 0;
    int index = 0;
    int iCal = 0;
    for (int i=0; i<2; i++) {
      for (int iDay=0; iDay<widgetList.get(i).daysArray.size(); iDay++) {
        event = widgetList.get(i).daysArray.get(iDay).getEventDay(mouseX, transMouse);
        iCal = i;
        index = iDay;
        if (event != 0) break;
      }
      if (event != 0) break;
    }
    if (event == 0) {
      for (int i=0; i<widgetList.size(); i++) {
        event = widgetList.get(i).getEvent(mouseX, transMouse);
        index = i;
        if (event != 0) break;
      }
    }
    if (event == 3) {
      widgetList.get(index).highlight(color(230));
    } else {
      widgetList.get(2).highlight = false;
    }
    if (event >= 104 && event <= 135) {
      widgetList.get(iCal).daysArray.get(index).highlight(color(230));
    } else {
      for (int i=0; i<2; i++) {
        for (Widget day : widgetList.get(i).daysArray) {
          day.highlight = false;

          if (i == 0 && int(day.label) > int(widgetList.get(1).day)) {
            day.highlight(color(230));
          }
        }
      }
    }
  }

  float mouseWheel(MouseEvent event) {
    return event.getCount();
  }
  // source: https://processing.org/examples/lineargradient.html
  void setGradient(int x, int y, float w, float h, color c1, color c2, int axis ) {

    noFill();

    if (axis == 1) {  // Top to bottom gradient
      for (int i = y; i <= y+h; i++) {
        float inter = map(i, y, y+h, 0, 1);
        color c = lerpColor(c1, c2, inter);
        stroke(c);
        line(x, i, x+w, i);
      }
    } else if (axis == 2) {  // Left to right gradient
      for (int i = x; i <= x+w; i++) {
        float inter = map(i, x, x+w, 0, 1);
        color c = lerpColor(c1, c2, inter);
        stroke(c);
        line(i, y, i, y+h);
      }
    }
  }
  void banner() {
    noStroke();
    fill(gradientBannerColor);
    ellipse(25, 150, 50, 50);
    ellipse(SCREENX-25, 150, 50, 50);
    rect(25, 150, SCREENX-50, 25);
    setGradient(0, 0, SCREENX, 150, bannerColor, gradientBannerColor, 1);
    fill(0);
    textAlign(CENTER);
    textFont(titleFont);
    textSize(35);
    text("Search Flights by Date Range", SCREENX/2, 40);
    strokeWeight(2);
  }
  void noFlightsFound() {
    fill(0);
    text("No flights found", SCREENX/2-textDescent(), SCREENY/2);
  }

  void updateTimeHeatMapArray(int day, int hour) {
    timeHeatData[day][hour]++;
  }
}
