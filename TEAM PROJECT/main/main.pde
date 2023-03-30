String[] flights2k;

DataList data;
DateRange dateRange;
int screen;
Bargraph bg;
BarCharts bc;

void settings() {
  size(SCREENX, SCREENY);
}

void setup() {
  PFont stdFont = loadFont("Verdana-24.vlw");
  textFont(stdFont);
  background(255);
  //String[] flightsFull = loadStrings("flights_full.csv");
  //String[] flights100k = loadStrings("flights100k.csv");
  //String[] flights10k = loadStrings("flights10k.csv");
  flights2k = loadStrings("flights2k.csv");

  data = new DataList();
  data.populateList(flights2k);
  dateRange = new DateRange();
  screen = 3;
  
  bc = new BarCharts(this);

  bg = new Bargraph(this);
  

}

void draw() {
  switch (screen) {
  case 1:
    bg.draw();
    break;
  case 2:
    dateRange.draw();
    break;
  case 3:
    bc.draw();
    break;
  } 
}
void mousePressed() {
  dateRange.mousePressed();
}
void mouseMoved() {
  dateRange.mouseMoved();
}
