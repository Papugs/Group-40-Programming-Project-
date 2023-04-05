String[] flights2k;
PFont stdFont;
PFont titleFont;

A_Widget widget1,widget2,widget3,widget4,widget5,widget6;
Screen screen1, screen2;

DataList data;
DateRange dateRange;
int screen;
Bargraph bg;
BarChart bc;
color black = color (0,0,0);
color white = color (255,255,255);
color peach = color (255,218,185);
color med_blue = color (135,206,235);
color soft_blue = color (201,233,246);
color silver = color(192,192,192);
color dim_grey = color(105,105,105);

void settings() {
  size(SCREENX, SCREENY);
}

void setup() {
  titleFont = loadFont("BookmanOldStyle-50.vlw");
  stdFont = loadFont("ArialRoundedMTBold-9.vlw");
  textFont(stdFont);
  
  screen1 = new Screen(1, white, new ArrayList<A_Widget>()); // home screen
  screen2 = new Screen(2, white, new ArrayList<A_Widget>()); // boardingpass 
  
  PImage homeButton = loadImage("icons8-home-page-24.png");
 /*
  widget defination in widget class
  Widget(int widgetType, int widgetID, int event, int x, int y, int width, int height, String label, PFont widgetFont, color widgetColor, color labelColor, color strokeColor, PImage img)
 */
 widget1 = new A_Widget(2, 001, EVENT_BUTTON1, 20, 20, 40 , 40, " - ", stdFont,med_blue,white, white, homeButton); //home button defi
 screen1.addWidget(widget1);
 screen2.addWidget(widget1);
 
 widget2 = new A_Widget(1, 002, EVENT_BUTTON2, 80, 30, 90, 25, "   MAIN DATA", stdFont,dim_grey,white, white,homeButton);//main data button defi
 screen1.addWidget(widget2);
 screen2.addWidget(widget1);
 
 widget3 = new A_Widget(1, 003, EVENT_BUTTON3, 190, 30, 90, 25, "   BAR GRAPH", stdFont,dim_grey,white, white,homeButton);//bar graph button defi
 screen1.addWidget(widget3);
 screen2.addWidget(widget1);
 
 widget6 = new A_Widget(1, 006, EVENT_BUTTON6, 120, 490, 90, 25, " GET STARTED", stdFont,dim_grey,white, white,homeButton);//bar graph button defi
 screen1.addWidget(widget6);
 
 screen =1;
 
  
  
  //String[] flightsFull = loadStrings("flights_full.csv");
  //String[] flights100k = loadStrings("flights100k.csv");
  //String[] flights10k = loadStrings("flights10k.csv");
  flights2k = loadStrings("flights2k.csv");

  data = new DataList();
  data.populateList(flights2k);
  dateRange = new DateRange(90);
  screen = 1;
  
  
  String[] f = {"JFK", "MDW", "LAX", "DCA"};
  int[] ff = new int[f.length];
  
  for(int i = 0; i<f.length;i++) {
    ff[i] = data.getFlightByAirport(f[i]).getFlightByLateness(5).getSize();
  }
  
  bc = new BarChart(50, 50, 200, 150, f, ff, "Late flights by airport");
  bg = new Bargraph(this);
}

void draw() {
  background(100,100,100);
  if(screen == 1){
    screen1.draw();
  }
  else if(screen == 2){
    fill(201,233,246);
    noStroke();
    rect(-10,-10,1265,100,24);
    dateRange.draw();
  }
}

void mousePressed() {
  dateRange.mousePressed();
  int event;
  if(screen == 1){
    event = screen1.getEvent(mouseX,mouseY);
    switch(event){
      case EVENT_BUTTON1:
        screen = 1;
        println("Home Button is pressed.");
        break;
      case EVENT_BUTTON2:
        screen = 2;
        println("Button2 is pressed.");
        break;
      
      case EVENT_BUTTON3:
        println("Button3 is pressed.");
        break;
        
      case EVENT_BUTTON6:
        println("Button6 is pressed.");
        break;  
      
    }
  }
}
void mouseMoved() {
  dateRange.mouseMoved();
  int event; 
 if(screen == 1){
   event = screen1.getEvent(mouseX,mouseY);
   switch(event){
     case EVENT_BUTTON1:
       widget1.strokeColor = color(0);
       break;
     case EVENT_BUTTON2:
       widget2.widgetColor = silver;
       widget2.strokeColor = color(0);
       break;
      
     case EVENT_BUTTON3:
       widget3.widgetColor = silver;
       widget3.strokeColor = color(0);
       break;
       
     case EVENT_BUTTON6:
       widget6.widgetColor = silver;
       widget6.strokeColor = color(0);
       break;
       
     case EVENT_NULL:
       widget1.strokeColor = color(255);
       
       widget2.widgetColor = dim_grey;
       widget2.strokeColor = color(255);
       
       widget3.widgetColor = dim_grey;
       widget3.strokeColor = color(255);
       
       widget6.widgetColor = dim_grey;
       widget6.strokeColor = color(255);
       
       break;  
    }
 }
}
