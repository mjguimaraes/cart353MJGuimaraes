class Age {

  String ageRange;
  int ageVariation;
  XML[] fileXML;
  
  
  Age() {
  }

  void ageEntry(XML[] fileXML) {
    //calling and getting responses from age response column
    for (int i = 0; i < fileXML.length; i++) {
      ageGroup = fileXML[i].getChild("gsx:whichisyouragegroup");
      
      ageRange = ageGroup.getContent();
      
      //associate period range to a float variable to represent the period
      if (ageRange.equals("20 and less")) {
        ageVariation = int(random(5, 20));
      } else if (ageRange.equals("21-30")) {
        ageVariation = int(random(21, 30));
      } else if (ageRange.equals("31-40")) {
        ageVariation = int(random(31, 40));
      } else if (ageRange.equals("41-50")) {
        ageVariation = int(random(41, 50));
      } else if (ageRange.equals("51-60")) {
        ageVariation = int(random(51, 60));
      } else if (ageRange.equals("61-70")) {
        ageVariation = int(random(61, 70));
      } else if (ageRange.equals("71-80")) {
        ageVariation = int(random(71, 80));
      } else if (ageRange.equals("81 and more")) {
        ageVariation = int(random(81, 100));
      }
      fill(255, 0, 0);
      ellipse(random(20, 880), random(20, 580), ageEntries.ageVariation, ageEntries.ageVariation);
      println(ageVariation + " (" + ageRange + ")"); //print a float # to represent period and the actual response in brackets
    }
  }
  
  
}