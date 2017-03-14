class Date {

  XML timestamp;
  int day, month, year;
  String monthName;

  Date() {
  }

  void dateEntry(XML[] fileXML) {
    //calling and getting responses from timestamp response column
    for (int i = 0; i < fileXML.length; i++) {
      timestamp = fileXML[i].getChild("gsx:timestamp");

      year = int(timestamp.getContent().substring(0, 4)); //retrieves year

      month = int(timestamp.getContent().substring(5, 7)); //retrieves month
      //associate to month name
      if (month == 1) {
        monthName = "Jan";
      } else if (month == 2) {
        monthName = "Feb";
      } else if (month == 3) {
        monthName = "Mar";
      } else if (month == 4) {
        monthName = "Apr";
      } else if (month == 5) {
        monthName = "May";
      } else if (month == 6) {
        monthName = "Jun";
      } else if (month == 7) {
        monthName = "Jul";
      } else if (month == 8) {
        monthName = "Aug";
      } else if (month == 9) {
        monthName = "Sep";
      } else if (month == 10) {
        monthName = "Oct";
      } else if (month == 11) {
        monthName = "Nov";
      } else if (month == 12) {
        monthName = "Dec";
      }

      day = int(timestamp.getContent().substring(8, 10)); //retrieves day

      println(monthName + " " + day +", " + year); //prints in mmm dd, yyyy format
    }
  }
}