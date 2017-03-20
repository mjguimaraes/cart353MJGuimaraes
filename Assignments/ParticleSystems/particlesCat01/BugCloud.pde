class BugCloud {

  ArrayList<Bug> bugs;
  PVector origin;

  BugCloud(PVector temp) {
    //initiate the bug cloud
    origin = temp.get();
    bugs = new ArrayList<Bug>(); //initiate the array of bugs
  }

  //function to add new bug object with a new x,y vector position
  void addBug(float x, float y) {
    bugs.add(new Bug(new PVector(x, y)));
  }

  // function to clear the array from bugs that are dead and give room to others
  void run() {
    for (int i = bugs.size()-1; i >= 0; i--) {
      Bug bb = bugs.get(i);
      bb.run();
      if (bb.isDead()) {
        bugs.remove(i);
      }
    }
  }
}