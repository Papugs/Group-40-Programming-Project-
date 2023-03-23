class Widget {
  public int x, y, width, height, event;
  public String label;
  public color widgetColor, labelColor;
  public PFont widgetFont;
  public boolean openCalendar;
  public boolean highlight;
  public ArrayList<Widget> daysArray;

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
  void highlight () {
    highlight = true;
  }
}

class DatePicker extends Widget {
  String startDate;
  String endDate;
  int month;
  int year;
  int ellipseRadius;
  int xD, yD;
  PImage arrowLeft;
  PImage arrowRight;
  PImage calendarIcon;
  PImage januaryCal;

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
    daysArray = new ArrayList<Widget>();
    ellipseRadius = 30;
    xD = x + width+(6*35);
    yD = y+height+60;
    for (int i=1; i<=31; i++) {
      daysArray.add(new Day(xD, yD, ellipseRadius, ellipseRadius, str(i), widgetColor, widgetFont, i+3));
      xD += 35;
      if (xD >= x +width + (35*8)) {
        xD = x+width+35;
        yD += 35;
      }
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
    popMatrix();
    if (super.openCalendar) {
      fill(220);
      rect(x+width+5, y+height+10, 270, 250, 10);
      for (int i=0; i<daysArray.size(); i++) {
        daysArray.get(i).draw();
      }
    }
  }
}

class Day extends Widget {

  Day(int x, int y, int width, int height, String label, color widgetColor, PFont widgetFont, int event) {
    super(x, y, width, height, label, widgetColor, widgetFont, event);
  }

  void draw() {
    pushStyle();
    fill (255);
    if (super.highlight) {
      fill (150);
    }
    ellipseMode(CORNER);
    ellipse(x-width/2, y-height/2, width, height);
    fill(0);
    textSize(10);
    text(label, x+textDescent(), y+3);
    popStyle();
  }
}
