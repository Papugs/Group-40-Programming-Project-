class Widget {
  int x, y, width, height, event;
  String label;
  color widgetColor, labelColor;
  PFont widgetFont, calendarFont;
  boolean openCalendar;
  boolean highlight, extended;
  ArrayList<Widget> daysArray;
  int day;

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
    if (highlight) fill (200);
    rect(x, y, width, height, 5);
    fill(labelColor);
    textSize(20);
    pushMatrix();
    translate(x, y);
    text(label, width/2, height-10);
    popMatrix();
  }
  int getEvent(int mX, int mY) {
    if (mX>x && mX < x+width + 40 && mY > y && mY < y+height) {
      return event;
    }
    return EVENT_NULL;
  }
  int getEventDay(int mX, int mY) {
    if (mX>x-width/2 && mX < x-width+5 + 40 && mY > y-height/2 && mY < y+height/2) {
      return event;
    }
    return EVENT_NULL;
  }

  void openCalendar() {
    if (openCalendar) openCalendar = false;
    else openCalendar = true;
  }
  void highlight (color widgetColor) {
    this.widgetColor = widgetColor;
    highlight = true;
  }
  void extend() {
    extended = true;
  }
}

class DatePicker extends Widget {
  String startDate;
  String endDate;
  String[] startD;
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
    endDate = "31/01/2022";
    openCalendar = false;

    startD = startDate.split("/");
    day = int(startD[0]);
    if (event == 2) day = 31;
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
      daysArray.add(new Day(xD, yD, ellipseRadius, ellipseRadius, str(i), widgetColor, widgetFont, i+103));
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
    stroke(0);
    strokeWeight(1);
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
    fill(0);
    textSize(20);
    String dayS = (day < 10) ? "0" + str(day): str(day);
    text(dayS, width/4-textDescent()*3, height-10);
    String monS = (month < 10) ? "0" + str(month): str(month);
    text(monS, width/2-textDescent()*3, height-10);
    text(year, width-width/4, height-10);
    popStyle();
    // calendar icon button
    image(calendarIcon, width+5, 0);
    popMatrix();
    if (super.openCalendar) {
      pushStyle();
      noStroke();
      fill(220);
      rect(x+width+5, y+height+10, 270, 250, 10);
      fill(0);
      String[] weekDays = {"M", "T", "W", "T", "F", "S", "S"};
      int offset = 0;
      for (String day : weekDays) {
        textSize(20);
        text(day, x+width+35+offset*35, y+height+35);
        offset++;
      }
      popStyle();
      for (int i=0; i<daysArray.size(); i++) {
        daysArray.get(i).draw();
      }
    }
  }
}

class Day extends Widget {
  PFont calendarFont;

  Day(int x, int y, int width, int height, String label, color widgetColor, PFont widgetFont, int event) {
    super(x, y, width, height, label, widgetColor, widgetFont, event);
    calendarFont = loadFont("AcademyEngravedLetPlain-20.vlw");
  }

  void draw() {
    pushStyle();
    fill (255);
    if (super.highlight) {
      fill (widgetColor);
    }
    noStroke();
    ellipseMode(CORNER);
    ellipse(x-width/2, y-height/2, width, height);
    fill(0);
    textFont(calendarFont);
    textSize(20);
    text(label, x+1, y+7);
    popStyle();
  }
}

class SlidePage extends Widget {
  int down, bottom, top;

  SlidePage(int x, int y, int width, int height, String label, color widgetColor, PFont widgetFont, int event) {
    super(x, y, width, height, label, widgetColor, widgetFont, event);
    down = 5;
    bottom = y;
    top = 145;
  }

  void draw() {
    pushStyle();
    noStroke();
    fill(widgetColor);
    if (extended && down == 5) {
      if (y > top && down == 5) y-=down;
      else if (y==top) {
        down *= -1;
        super.extended = false;
      }
    }
    if (extended && down == -5) {
      if (y < bottom) y -= down;
      else if (y == bottom) {
        down *= -1;
        super.extended = false;
      }
    }
    rect(x, y, width, height, 20, 20, 0, 0);
    popStyle();
  }
}
class A_Widget  {
  
float x, y, width, height;
  String label;
  color widgetColor, labelColor, strokeColor;
  PFont widgetFont;
  int widgetType;
  int widgetID;
  int event;
  PImage img;
  
  A_Widget(int widgetType, int widgetID, int event, int x, int y, int width, int height, String label, PFont widgetFont, color widgetColor, color labelColor, color strokeColor, PImage img){
    this.x = x;
    this.y = y;
    this.width = width;
    this.height = height;
    this.label = label;
    this.widgetFont = widgetFont;
    this.widgetColor = widgetColor;
    this.labelColor = labelColor;
    this.strokeColor = strokeColor; 
    this.widgetType = widgetType;
    this.widgetID = widgetID;
    this.event = event;
    this.img = img;
}

void draw(){
 if (widgetType == 1){ //widgetType = 1 = Button
  textFont(widgetFont);
  fill(widgetColor);
  stroke(strokeColor);
  strokeWeight(2);
  rect(x,y,width,height,35); //35 is rounded corners radius
  fill(labelColor);
  
  //specific widget stuff
  if (widgetID == 7){
     text(label, x + GAP + 3, y+GAP+20); 
  }else if(widgetID == 6){
     text(label, x , y+GAP+20); 
  }else if(widgetID == 010){
     text( label, x+8 , y+14);
  }
  else{
    text(label, x + GAP + 3, y+GAP+6);
  }
  
  
 }
 if (widgetType == 2){
  textFont(widgetFont);
  fill(widgetColor);
  stroke(strokeColor);
  strokeWeight(2);
  rect(x,y,width,height,35); //35 is rounded corners radius
  image(img, x+GAP-1, y+GAP-3);
 }
}
 int getEvent(int mX, int mY){
  if(mX>x && mX < x+width && mY >y && mY <y+height){  
   return event; 
  }
  return EVENT_NULL;
 }

}
