class DisplayFlight {
  int x;
  String flightNumber, from, dest, date, depTime, arrTime, stateAbr, carier, cancelled;
  PFont flightDetailsFont;
  PImage qr;

  DisplayFlight (int x, String flightNumber, String from, String dest, String date, String depTime, String arrTime, String stateAbr, String carier, String cancelled, PFont flightDetailsFont, PImage qr) {
    this.x = x;
    this.flightNumber = flightNumber;
    this.from = from;
    this.dest = dest;
    this.date = date;
    this.depTime = depTime;
    this.arrTime = arrTime;
    this.stateAbr = stateAbr;
    this.carier = carier;
    this.cancelled = cancelled;
    this.flightDetailsFont = flightDetailsFont;
    this.qr = qr;
  }

  void draw(float y) {
    pushStyle();
    pushMatrix();
    translate(x, y);
    noStroke();
    fill(145, 231, 255);
    if (int(cancelled)==1) fill (200, 0, 0);
    rect(0, 0, SCREENX-x*2, 150, 20);
    fill(86, 210, 245);
    rect(0, 0, SCREENX-x*2, 40, 20, 20, 0, 0);
    fill(0);
    textAlign(LEFT);
    textFont(flightDetailsFont);
    text("Flight Number: " + flightNumber, 40, 28);
    image(qr, 65, 50);
    text("From: " + from, 230, 70);
    text("Destination: " + dest, 230, 130);
    text("Date: " + date.replace(" 00:00", ""), 600, 65);
    text("Departure: " + depTime, 600, 100);
    text("Arrival: " + arrTime, 600, 135);
    textAlign(CENTER);
    text(stateAbr, 1075, 100);
    text(carier, 1075, 30);
    int lineX=1000;
    for (int lineY=0; lineY<=150; lineY+=20) {
      fill(0);
      rect(lineX, lineY, 4, 10, 3);
    }
    popMatrix();
    popStyle();
  }
}
