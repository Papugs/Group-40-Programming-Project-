class DataPoint {
  String[] data;

  DataPoint(String flight) {
    data = flight.split(",");

  }
  
  String toString() {
    String s = " ";
    
    for(String ds : data) {
      s = s + ds + ", ";
      
    }
    return s;
  }  
  
  String getData(int index) {
    return data[index];
  }
}
/*
 FL_DATE, 0
 MKT_CARRIER, (MKT = MARKET) 1
 MKT_CARRIER_FL_NUM, 2
 ORIGIN, 3 
 ORIGIN_CITY_NAME, 4
 ORIGIN_STATE_ABR, (ABR = abreviation) 5
 ORIGIN_WAC, (WAC = World Area Code) 6 
 DEST, 7
 DEST_CITY_NAME, 8
 DEST_STATE_ABR, 9
 DEST_WAC, 10
 CRS_DEP_TIME, (CRS = Common reporting standard / actual) 11
 DEP_TIME,   12
 CRS_ARR_TIME, 13
 ARR_TIME,      14
 CANCELLED,     15
 DIVERTED, (other arrival airport than scheduled)    16
 DISTANCE    17 
 */
