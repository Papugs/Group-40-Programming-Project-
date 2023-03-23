String[] flights2k;

DataList data;


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
   
   DataList dl = data.getFlightByAirport("JFK");
   dl.getFlightByLateness(5).printAll();



  
}

void draw() {
  data.draw();
  
}
