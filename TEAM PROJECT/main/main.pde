final static int SCREENX = 400;
final static int SCREENY = 400;


void settings() {
   size(SCREENX, SCREENY);
}

void setup() {
   String[] flightsFull = loadStrings("flights_full.csv");
   String[] flights100k = loadStrings("flights100k.csv");
   String[] flights10k = loadStrings("flights10k.csv");
   String[] flights2k = loadStrings("flights2k.csv");
  ArrayList<String> datapointlist= new ArrayList<>();
  
}

void draw() {


}
/*
FL_DATE,
MKT_CARRIER, (MKT = MARKET)
MKT_CARRIER_FL_NUM,
ORIGIN,
ORIGIN_CITY_NAME,
ORIGIN_STATE_ABR, (ABR = abreviation)
ORIGIN_WAC, (WAC = World Area Code)
DEST,
DEST_CITY_NAME,
DEST_STATE_ABR,
DEST_WAC,
CRS_DEP_TIME, (CRS = Common reporting standard / actual)
DEP_TIME,
CRS_ARR_TIME,
ARR_TIME,
CANCELLED,
DIVERTED, (other arrival airport than scheduled)
DISTANCE
*/
