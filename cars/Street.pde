class Street
{
  int id;
  int index;
  boolean isHorz;
  ArrayList<Tile> tiles = new ArrayList();
  
  Street(int index, boolean isHorz)
  {
    this.index = index;
    this.isHorz = isHorz;
    this.id = (int)random(5000) + (int)random(5000);
  
    layTiles();
  }
  
  void show()
  {
    for(Tile t : tiles)
      t.show();
  }
  
  void layTiles()
  {
    int stLen;
    if(isHorz)
      stLen = cols;
    else
      stLen = rows;
    boolean sndLoop = false;
    for(int i = 0; i < stLen; i++)
    {  
      //if(isHorz && (i == 0)){
      //  nodes.add(new Node(tileSize/2, (index) * tileSize + tileSize/2));
      //  nodes.add(new Node(tileSize/2, (index+1) * tileSize + tileSize/2));
      //}
      //else{
      //  nodes.add(new Node(index * tileSize + tileSize/2,tileSize/2));
      //  nodes.add(new Node((index+1) * tileSize + tileSize/2,tileSize/2));
      //}
      
      int ind = index;
      if(sndLoop)
        ind = index + 1;
      if(isHorz){
        tiles.add(new Tile(i * tileSize, ind * tileSize, ind));
        if(i == 0)
          nodes.add(new Node(i * tileSize + tileSize/2, ind * tileSize + tileSize/2, true));
        if(i == stLen - 1)
           nodes.add(new Node(i * tileSize + tileSize/2, ind * tileSize + tileSize/2, true));
      }
      else{
        tiles.add(new Tile(ind * tileSize, i * tileSize, ind));
        if(i == 0)
          nodes.add(new Node(ind * tileSize + tileSize/2, i * tileSize + tileSize/2, true));
        if(i == stLen - 1)
           nodes.add(new Node(ind * tileSize + tileSize/2, i * tileSize + tileSize/2, true));
      }
      if(i == stLen - 1 && !sndLoop)
       {
         sndLoop = true;
         i = -1;
       }
    }
  }
  
}

class Tile
{
  PVector pos;
  int size = tileSize;
  boolean hasNode;
  int index;
  
  Tile(int x, int y,int ind)
  {
    pos = new PVector(x, y);
    this.index = ind;
  }
  
  void show()
  {
    fill(0, 0, 255);
    rect(pos.x, pos.y, size, size);
  }
  
}
