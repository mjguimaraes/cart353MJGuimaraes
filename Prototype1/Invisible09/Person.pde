class Person {

  Person() {
  }

  void displayPerson(XML[] fileXML) {

    for (int i = 0; i < fileXML.length; i++) {
      int dotSize = ageEntries.allAges[i];
      fill(0, 0, random(160, 255));
      ellipse(random(20, 880), random(20, 580), dotSize, dotSize);
    }
  }
}