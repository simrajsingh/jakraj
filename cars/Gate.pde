class Gate
{
  PVector pos;
  boolean open;
  int wid, hei;
  
  Gate(PVector pos, boolean dir)
  {
    this.pos = pos;
    open = false;
    if(dir)//horz
    {
      wid = 30;
      hei = 10;
    }
    else //vert
    {
      wid = 10;
      hei = 30;
    }
  }
  
  void show()
  {
    strokeWeight(2);
    if(open){
      stroke(0, 255, 0);
      fill(0, 255, 0);
    }
    else{
      fill(255, 0, 0);
      stroke(255, 0, 0);
    }
    
    rect(pos.x, pos.y, wid, hei);
  }
}
