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
 CRS_ARR_TIME, 13
 ARR_TIME,      14
 CANCELLED,
 DIVERTED, (other arrival airport than scheduled)
 DISTANCE
 */
