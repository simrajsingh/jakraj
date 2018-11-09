class Node
{
  PVector pos;
  Node child;
  int nodeSize = tileSize/2;
  boolean outer;
  
  int[] dir = {0,0,0,0}; //right, down, left, up
  
  Node(int x, int y, boolean outer)
  {
    pos = new PVector(x, y);
    this.outer = outer;
    //println("Node initialized at (" + x/tileSize + "," + y/tileSize + ")");
  }
  
  void show()
  {
    ellipseMode(CENTER);
    fill(255);
    ellipse(pos.x, pos.y, nodeSize, nodeSize);
  }
  

}
