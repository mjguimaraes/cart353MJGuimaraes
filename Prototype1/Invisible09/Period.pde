class Period {


  XML diagnosisPeriod;
  String periodRange;
  float periodVariation = 0.0;
  float [] allPeriods;

  Period() {
  }

  void periodEntry(XML[] fileXML) {
    allPeriods = new float[fileXML.length];
    //calling and getting responses from diagnosis period response column
    for (int i = 0; i < fileXML.length; i++) {
      diagnosisPeriod = fileXML[i].getChild("gsx:howlongagodidyouhavetheaboveconditionidentifieddiagnosed");
      periodRange = diagnosisPeriod.getContent();

      //associate period range to a float variable to represent the period
      if (periodRange.equals("less than 1 year")) {
        periodVariation = random(0, 1);
      } else if (periodRange.equals("1-3 years")) {
        periodVariation = random(1, 3);
      } else if (periodRange.equals("4-7 years")) {
        periodVariation = random(4, 7);
      } else if (periodRange.equals("8-10 years")) {
        periodVariation = random(8, 10);
      } else if (periodRange.equals("11-15 years")) {
        periodVariation = random(11, 15);
      } else if (periodRange.equals("16-20 years")) {
        periodVariation = random(16, 20);
      } else if (periodRange.equals("21 and more years")) {
        periodVariation = random(21, 50);
      }
      allPeriods[i] = periodVariation;
      println(periodVariation + " (" + periodRange + ")"); //print a float # to represent period and the actual response in brackets
    }
  }
}