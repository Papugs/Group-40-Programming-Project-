class DataList {
  ArrayList<DataPoint> datapointlist;

  public DataList() {
    datapointlist= new ArrayList<>();
  }

  public void populateList(String[] CSVData) {
    for (String s : CSVData) {
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
    int year=2, month=1, day=0, dateListIndex = 0;
    ArrayList<DataPoint> datesWithinRange = new ArrayList<>();
    String[] date;

    for (int i = 1; i<datapointlist.size(); i++) {
      date = (datapointlist.get(i).getData(dateListIndex)).split("/");
      date[year] = date[year].replace(time, "");
      if (int(date[year]) >= int(startDate[year])   &&
        int(date[year]) <= int(endDate[year])       &&
        int(date[month]) >= int(startDate[month])   &&
        int(date[month]) <= int(endDate[month])     &&
        int(date[day]) >= int(startDate[day])       &&
        int(date[day]) <= int(endDate[day]))
      {
        datesWithinRange.add(datapointlist.get(i));
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
}
