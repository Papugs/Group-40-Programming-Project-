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
    for (DataPoint dp : datapointlist) {
      println(dp.toString());
    }
  }

  void draw() {
    fill(0);
    for (int i = 0; i<10; i++) {
      text(datapointlist.get(i).toString(), 10, 25+i*(SCREENY/10));
    }
  }
  public DataList getFlightByDateRange(String startD, String endD) {
    String[] startDate = startD.split("/");
    String[] endDate = endD.split("/");
    String time = " 00:00";
    int year=2, month=0, day=1, dateListIndex = 0;
    ArrayList<DataPoint> datesWithinRange = new ArrayList<>();
    String[] date;
    for (int i = 1; i<data.datapointlist.size(); i++) {
      date = (data.datapointlist.get(i).getData(dateListIndex)).split("/");
      date[year] = date[year].replace(time, "");
      if (int(date[year]) >= int(startDate[year])   &&
        int(date[year]) <= int(endDate[year])       &&
        int(date[month]) >= int(startDate[month])   &&
        int(date[month]) <= int(endDate[month])     &&
        int(date[day]) >= int(startDate[day])       &&
        int(date[day]) <= int(endDate[day]))
      {
        datesWithinRange.add(data.datapointlist.get(i));
      }
    }
    String [] datesList = new String[datesWithinRange.size()];
    for (int i=0; i<datesWithinRange.size(); i++) {
      datesList[i] = datesWithinRange.get(i).toString();
    }
    DataList datalist = new DataList();
    datalist.populateList(datesList);
    return datalist;
  }


  public DataList getFlightByAirport(String airportName) {
    ArrayList<DataPoint> airportFlights = new ArrayList<DataPoint>();
    for(DataPoint dp : datapointlist) {
      if(dp.getData(3).compareTo(airportName) == 0){
        airportFlights.add(dp);
      }  
    }
    return new DataList(airportFlights);
  }

  
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
  
  public DataList getFlightByDestination(String airportName) {
    ArrayList<DataPoint> airportFlights = new ArrayList<DataPoint>();
    for(DataPoint dp : datapointlist) {
      if(dp.getData(7).compareTo(airportName) == 0){
        airportFlights.add(dp);
      }  
    }
    return new DataList(airportFlights);
  }
  
  public DataList getFlightByMarketCarrier(String marketCarrier) {
    ArrayList<DataPoint> carrierFlights = new ArrayList<DataPoint>();
    for(DataPoint dp : datapointlist) {
      if(dp.getData(1).compareTo(marketCarrier) == 0){
        carrierFlights.add(dp);
      }  
    }
    return new DataList(carrierFlights);
  }
   public DataList getFlightByState(String Stateabb) {
    ArrayList<DataPoint> StateFlights = new ArrayList<DataPoint>(); //<>//
    for(DataPoint dp : datapointlist) {
      if(dp.getData(5).compareTo(Stateabb) == 0){
        StateFlights.add(dp);
      }  
    }
    return new DataList(StateFlights);
  }
  
  public int getSize() {
    return datapointlist.size();
  }
  
  
  
}
