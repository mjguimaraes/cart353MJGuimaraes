class Condition {

  XML[] fileXML, temp;
  XML yourCondition;
  String condition;
  String [] allConditions;

  Condition(XML[] temp) {
    fileXML = temp;
  }

  void conditionEntry() {
    //calling and getting responses from condition response column
    allConditions = new String[fileXML.length];
    for (int i = 0; i < fileXML.length; i++) {
      yourCondition = fileXML[i].getChild("gsx:whichisyourconditioninthecaseyouhavemultiplepleaseselecttheonethatwasfirstidentifieddiagnosed.");
      condition = yourCondition.getContent();

      //checking for blank responses
      if (condition == "") {
        condition = "[not mentionned]";
      }

      //associate all responses to an array
      allConditions[i] = condition;
    }
  }
}