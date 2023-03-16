String[] flights2k;
ArrayList<DataPoint> datapointlist;

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
   datapointlist= new ArrayList<>();
   for(int i = 1; i<= 10; i++) {
     datapointlist.add(new DataPoint(flights2k[i]));
   }

  for(DataPoint dp : datapointlist) {
    println(dp.toString());
  }
  
}

void draw() {
  fill(0);
  for(int i = 0; i<datapointlist.size(); i++) {
    text(datapointlist.get(i).toString(), 10, 25+i*(SCREENY/datapointlist.size()));
  }
  
}
