import processing.video.*;

String[] flights2k;
PFont stdFont;
PFont titleFont;
PFont stdFont_20;
PFont bigStdFont;
Movie myMov;


A_Widget widget1, widget2, widget3, widget4, widget5, widget6, widget7;
Screen screen1, screen2, screen3;



DataList data;
DateRange dateRange;
int screen;
BarCharts bg;
color black = color (0, 0, 0);
color white = color (255, 255, 255);
color peach = color (255, 218, 185);
color med_blue = color (135, 206, 235);
color soft_blue = color (201, 233, 246);
color silver = color(192, 192, 192);
color dim_grey = color(105, 105, 105);



void settings() {
  size(SCREENX, SCREENY);
}

void setup() {
  

  myMov = new Movie(this, "planes.mp4");
  myMov.loop();

  
  
  titleFont = loadFont("BookmanOldStyle-50.vlw");
  stdFont = loadFont("ArialRoundedMTBold-9.vlw");
  stdFont_20 = loadFont("ArialRoundedMTBold-20.vlw");
  bigStdFont = loadFont("Verdana-24.vlw");

  textFont(stdFont);

  screen1 = new Screen(1, white, new ArrayList<A_Widget>()); // home screen
  screen2 = new Screen(2, white, new ArrayList<A_Widget>()); // boardingpass
  screen3 = new Screen(3, white, new ArrayList<A_Widget>()); // bar chart screen

  PImage homeButton = loadImage("icons8-home-page-24.png");
  /*
  widget defination in widget class
   Widget(int widgetType, int widgetID, int event, int x, int y, int width, int height, String label, PFont widgetFont, color widgetColor, color labelColor, color strokeColor, PImage img)
   */
  widget1 = new A_Widget(2, 001, EVENT_BUTTON1, 20, 20, 40, 40, " - ", stdFont, med_blue, white, white, homeButton); //home button defi
  screen1.addWidget(widget1);
  screen2.addWidget(widget1);
  screen3.addWidget(widget1);


  widget2 = new A_Widget(1, 002, EVENT_BUTTON2, 80, 30, 90, 25, "   MAIN DATA", stdFont, dim_grey, white, white, homeButton);//main data button defi (NOBERT SCREEN)
  screen1.addWidget(widget2);
  screen2.addWidget(widget2);
  screen3.addWidget(widget2);
  
  widget7 = new A_Widget(1, 007, EVENT_BUTTON7, 550, 125, 170, 50, " Clear Chart", bigStdFont, dim_grey, white, white, homeButton);
  screen3.addWidget(widget7);


  widget3 = new A_Widget(1, 003, EVENT_BUTTON3, 190, 30, 90, 25, "   BAR GRAPH", stdFont, dim_grey, white, white, homeButton);//bar graph button defi (PALAK SCREEN)
  screen1.addWidget(widget3);
  screen2.addWidget(widget3);
  screen3.addWidget(widget3);

  widget6 = new A_Widget(1, 006, EVENT_BUTTON6, 650, 250, 150, 50, " GET STARTED", stdFont_20, dim_grey, white, white, homeButton);//bar graph button defi (Nobert SCREEN)
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

  for (int i = 0; i<f.length; i++) {
    ff[i] = data.getFlightByAirport(f[i]).getFlightByLateness(5).getSize();
  }

  bg = new BarCharts(this);
  

}

void draw() {
  background(100, 100, 100);
  if (screen == 1) {
    if (myMov.available()) {
      myMov.read();
  }
    image(myMov, 0, 0);
    screen1.draw();
    
  } else if (screen == 2) {
    
    dateRange.draw();
    screen2.draw();
  } else if(screen == 3) {
    screen3.draw();
    bg.draw();
  }
  
  if(screen != 3) {
    bg.dropdown.setBarVisible(false);
  }

}

void mousePressed() {
  dateRange.mousePressed();
  int event;
  if (screen == 1) {
    event = screen1.getEvent(mouseX, mouseY);
    switch(event) {
    case EVENT_BUTTON1:
      screen = 1;
      println("Home Button is pressed.");
      break;
    case EVENT_BUTTON2:
      screen = 2;
      println("Button2 is pressed.");
      break;

    case EVENT_BUTTON3:
      screen = 3;
      println("Button3 is pressed.");
      break;

    case EVENT_BUTTON6:
      screen = 2;
      println("Button6 is pressed.");
      break;
    }
  } else if ( screen == 2) {
    event = screen2.getEvent(mouseX, mouseY);
    switch(event) {
    case EVENT_BUTTON1:
      screen = 1;
      println("Home Button is pressed.");
      break;
    case EVENT_BUTTON2:
      screen = 2;
      println("Button2 is pressed.");
      break;

    case EVENT_BUTTON3:
      screen = 3;
      println("Button3 is pressed.");
      break;

    case EVENT_BUTTON6:
      println("Button6 is pressed.");
      break;
    }
  }else if ( screen == 3) {
    bg.mousePressed();
    event = screen3.getEvent(mouseX, mouseY);
    switch(event) {
    case EVENT_BUTTON1:
      screen = 1;
      println("Home Button is pressed.");
      break;
    case EVENT_BUTTON2:
      screen = 2;
      println("Button2 is pressed.");
      break;

    case EVENT_BUTTON3:
      screen = 3;
      println("Button3 is pressed.");
      break;

    case EVENT_BUTTON6:
      println("Button6 is pressed.");
      break;
      
    case EVENT_BUTTON7:
      println("Button7 is pressed.");
      bg.resetBarChart();
      break;
    }
  }
}
  void mouseMoved() {
    dateRange.mouseMoved();
    int event;
    if (screen == 1) {
      event = screen1.getEvent(mouseX, mouseY);
    }else if(screen ==2){
       event = screen2.getEvent(mouseX, mouseY); 
    }else if (screen ==  3) {
       event = screen3.getEvent(mouseX, mouseY); 
    }else{
       event = screen1.getEvent(mouseX, mouseY);
    }
    switch(event) {
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
        
      case EVENT_BUTTON7:
        widget7.widgetColor = silver;
        widget7.strokeColor = color(0);
        break;

      case EVENT_NULL:
        widget1.strokeColor = color(255);

        widget2.widgetColor = dim_grey;
        widget2.strokeColor = color(255);

        widget3.widgetColor = dim_grey;
        widget3.strokeColor = color(255);

        widget6.widgetColor = dim_grey;
        widget6.strokeColor = color(255);
        
        widget7.widgetColor = dim_grey;
        widget7.strokeColor = color(255);

        break;
      }
  }
