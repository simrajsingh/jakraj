class Street
{
  int id;
  int index;
  boolean isHorz;
  ArrayList<Tile> tiles = new ArrayList();
  int dir;
  
  Street(int index, boolean isHorz, int dir)
  {
    this.index = index;
    this.isHorz = isHorz;
    this.id = (int)random(5000) + (int)random(5000);
    this.dir = dir;
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
      
    for(int i = 0; i < stLen; i++)
    { 
      if(isHorz)
      {
        tiles.add(new Tile(tiles.size(), index, dir));
      }
      else
      {
        tiles.add(new Tile(index, tiles.size(), dir));
      }
      
    }
  }
  
}

class Tile
{
  int i,j;
  int size = tileSize;
  color col = color(255);
  
  Tile(int i, int j, int dir)
  {
    this.i = i;
    this.j = j;
    if(dir == 1 || dir == 2)
      col = color(0, 0, 255);
    else
      col = color(255, 0, 0);
      
    
  }
  
  void show()
  {
    fill(col);
    rect(i * size, j * size, size, size);
  }
  
}
