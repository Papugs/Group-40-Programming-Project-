class DataList {
  ArrayList<DataPoint> datapointlist;
  
  public DataList() {
    datapointlist= new ArrayList<>();
  }
  
  public DataList(ArrayList<DataPoint> list) {
    datapointlist = list;
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
    
    fill(int(random(1,255)), int(random(1,255)),int(random(1,255)));
    for(int i = 0; i<10; i++) {
      text(datapointlist.get(i).toString(), 10, 25+i*(SCREENY/10));
    }
  }
  
  public DataList getFlightByAirport(String airportName) {
    ArrayList<DataPoint> airportFlights = new ArrayList<DataPoint>();
    for(DataPoint dp : datapointlist) {
      if(dp.getData(3).compareTo(airportName) == 0){
        airportFlights.add(dp);
      }  
    }
    return new DataList(airportFlights);
  }/*
  
  
  public DataList getFlightByDateRange() {
  
  }
  */
  //returns flights that are later than the given number
  public DataList getFlightByLateness(int latenessMinutes) {
    ArrayList<DataPoint> lateflights = new ArrayList<DataPoint>();
    for(DataPoint dp : datapointlist) {
      String scheduledArrival = dp.getData(16);
      String actualArrival = dp.getData(15);
      
      if(!scheduledArrival.equals("")) {
        int sAInt = Integer.parseInt(scheduledArrival);
        sAInt = (sAInt % 100) + 60*(sAInt / 100);
        
        int aAInt = Integer.parseInt(actualArrival);
        aAInt = (aAInt % 100) + 60*(aAInt / 100);  
        
        if(aAInt >= 1080 && sAInt <= 360) sAInt += 1440;

        if(aAInt - sAInt >= latenessMinutes) {
          lateflights.add(dp);
        }
      }
    
     }
    
    return new DataList(lateflights);
  }
  
  
  
}
