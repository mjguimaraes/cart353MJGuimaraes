class DayRate {

  //variables to store info about bad/good day
  XML yourDayRate;
  int yourRate;
  String yourDay;

  DayRate() {
  }

  void rateEntry(XML[] fileXML) {
    //calling and getting responses from day rate response column
    for (int i = 0; i < fileXML.length; i++) {
      yourDayRate = fileXML[i].getChild("gsx:howwouldyourateyourdaytoday");
      //responses from spreadsheet return an integer
      yourRate = yourDayRate.getIntContent(); 

      //associate to a string
      if (yourRate == 1) {
        yourDay = "Bad day";
      } else if (yourRate == 2) {
        yourDay = "Regular day";
      } else if (yourRate == 3) {
        yourDay = "Good day";
      } else {
        yourDay = "n.a."; //checking for blank responses
      }

      println(yourDay);
    }
  }
}