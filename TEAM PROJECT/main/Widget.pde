class Widget {
  public int x, y, width, height, event;
  public String label;
  public color widgetColor, labelColor;
  public PFont widgetFont;
  public boolean openCalendar;
  boolean highlight;

  Widget(int x, int y, int width, int height, String label, color widgetColor, PFont widgetFont, int event) {
    this.x=x;
    this.y=y;
    this.width = width;
    this.height= height;
    this.label=label;
    this.event=event;
    this.widgetColor=widgetColor;
    this.widgetFont=widgetFont;
    labelColor= color(0);
  }

  void draw() {
    fill(widgetColor);
    rect(x, y, width, height, 5);
    fill(labelColor);
    textSize(20);
    pushMatrix();
    translate(x, y);
    text(label, width/2, height-10);
    popMatrix();
  }
  int getEvent(int mX, int mY) {
    if (mX>=x && mX <= x+width + 40 && mY >= y && mY <= y+height) {
      return event;
    }
    return EVENT_NULL;
  }
  void openCalendar() {
    if (openCalendar) openCalendar = false;
    else openCalendar = true;
  }
  void highlight() {
    highlight = true;
  }
}

class DatePicker extends Widget {
  String startDate;
  String endDate;
  int month;
  int year;
  PImage arrowLeft;
  PImage arrowRight;
  PImage calendarIcon;
  PImage januaryCal;
  ArrayList<Day> daysArray;

  DatePicker(int x, int y, int width, int height, String label, color widgetColor, PFont widgetFont, int event) {
    super(x, y, width, height, label, widgetColor, widgetFont, event);
    startDate = "01/01/2022";
    endDate = "01/01/2022";
    openCalendar = false;

    String[] startD = startDate.split("/");
    month = int(startD[1]);
    year = int(startD[2].replace(" 00:00", ""));

    calendarIcon = loadImage("calendar.png");
    calendarIcon.resize(height, height);
    arrowLeft = loadImage("arrowLeft.png");
    arrowRight = loadImage("arrowRight.png");
    januaryCal = loadImage("january2022.png");
    januaryCal.resize(200, 150);
    arrowLeft.resize(10, 10);
    arrowRight.resize(10, 10);
    daysArray = new ArrayList<Day>();
    int xD = ;
    int xY = y;
    int i = 1;
    while (i <= 31) {
      daysArray.add(new Day(xD, xY, i, width, height, label, widgetColor, widgetFont, i+3));
      xD += 20;
      if (xD >= x + 40) {
        xD = x -100 ;
        xY += 20;
      }
      i++;
    }
  }
  void draw () {
    pushMatrix();
    pushStyle();
    fill(0);
    textSize(20);
    text(label, x-textWidth(label)*0.7, y+height/2+5);
    fill(255);
    rect(x, y, width, height, 5);
    // separation lines
    stroke(3);
    translate(x, y);
    line(width/4, height-5, (width/4)+10, 5);
    line(width/2, height-5, (width/2)+10, 5);
    popStyle();
    // calendar icon button
    image(calendarIcon, width+5, 0);
    if (super.openCalendar) {
      for (int i=0; i<daysArray.size(); i++) {
        daysArray.get(i).draw();
      }
    }
    popMatrix();
  }
}

class Day extends Widget {
  int ellipseRadius = 20;
  int day;

  Day(int x, int y, int day, int width, int height, String label, color widgetColor, PFont widgetFont, int event) {
    super(x, y, width, height, label, widgetColor, widgetFont, event);
    this.day = day;
  }

  void draw() {
    pushMatrix();
    pushStyle();
    fill (0, 30, 180);
    if (super.highlight) {
      fill (200);
    }
    ellipse(x, y, ellipseRadius, ellipseRadius);
    fill(0);
    textSize(10);
    text(day, x+3, y+3);
    popStyle();
    popMatrix();
  }
}
