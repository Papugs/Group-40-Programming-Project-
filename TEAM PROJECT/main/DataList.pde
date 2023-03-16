class DataList {
  ArrayList<DataPoint> datapointlist;
  
  public DataList() {
    datapointlist= new ArrayList<>();
  }
  
  public void populateList(String[] CSVData) {
     for(String s : CSVData) {
       datapointlist.add(new DataPoint(s));
     }
  }
  
  public void printAll() {
    for(DataPoint dp : datapointlist) {
      println(dp.toString());
    }
  }
  
  void draw() {
    fill(0);
    for(int i = 0; i<10; i++) {
      text(datapointlist.get(i).toString(), 10, 25+i*(SCREENY/10));
    }
  }
  
  public DataList getFlightByAirport() {
  
  }
  
  
  public DataList getFlightByDateRange() {
  
  }
  
  public DataList getFlightByLateness() {
  
  }
  
  
  
}
