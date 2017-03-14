class Condition {

  String condition;

  Condition() {
  }

  void conditionEntry(XML[] fileXML) {
    //calling and getting responses from condition response column
    for (int i = 0; i < fileXML.length; i++) {
      yourCondition = fileXML[i].getChild("gsx:whichisyourconditioninthecaseyouhavemultiplepleaseselecttheonethatwasfirstidentifieddiagnosed.");
      condition = yourCondition.getContent();
      
      //checking for blank responses
      if (condition == "") {
        condition = "n.a.";
      }

      println(condition); //prints condition, or "n.a." for blank responses
    }
  }
}