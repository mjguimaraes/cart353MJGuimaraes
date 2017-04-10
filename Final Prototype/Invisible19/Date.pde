
class Date {

  XML[] fileXML, temp;
  XML timestamp;
  int day, month, year;
  String monthName;
  String [] allDates;

  Date(XML[] temp) {
    fileXML = temp;
  }

  void dateEntry() {
    allDates = new String[fileXML.length];
    //calling and getting responses from timestamp response column
    for (int i = 0; i < fileXML.length; i++) {
      timestamp = fileXML[i].getChild("gsx:timestamp");

      year = int(timestamp.getContent().substring(0, 4)); //retrieves year

      month = int(timestamp.getContent().substring(5, 7)); //retrieves month
      //associate to month name
      if (month == 1) {
        monthName = "January";
      } else if (month == 2) {
        monthName = "February";
      } else if (month == 3) {
        monthName = "March";
      } else if (month == 4) {
        monthName = "April";
      } else if (month == 5) {
        monthName = "May";
      } else if (month == 6) {
        monthName = "June";
      } else if (month == 7) {
        monthName = "July";
      } else if (month == 8) {
        monthName = "August";
      } else if (month == 9) {
        monthName = "September";
      } else if (month == 10) {
        monthName = "October";
      } else if (month == 11) {
        monthName = "November";
      } else if (month == 12) {
        monthName = "December";
      }

      day = int(timestamp.getContent().substring(8, 10)); //retrieves day

      //associate all responses to an array
      allDates[i] = monthName + " " + day +", " + year;
    }
  }
}