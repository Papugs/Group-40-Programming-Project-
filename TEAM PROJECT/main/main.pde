String[] flights2k;

DataList data;
DateRange dateRange;
int screen;
Bargraph bg;
BarChart bc;

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
  
  
  String[] f = {"JFK", "MDW", "LAX", "DCA", "SEA", "FLL"};
  int[] ff = new int[f.length];
  
  for(int i = 0; i<f.length;i++) {
    ff[i] = data.getFlightByAirport(f[i]).getFlightByLateness(5).getSize();
  }
  
  bc = new BarChart(100, 100, 1000, 400, f, ff, "Late flights by airport");
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
