import java.util.*;

ArrayList<Gate> gates = new ArrayList();
ArrayList<Agent> cars = new ArrayList();
ArrayList<Node> nodes = new ArrayList();

int tileSize = 40;
int cols, rows;

ArrayList<Street> roads = new ArrayList();
ArrayList<Node> outsideNodes = new ArrayList();

ArrayList<Boolean> grid = new ArrayList();

void setup()
{
  size(800, 800);
  cols = width/tileSize;
  rows = height/tileSize;
  
  roads.add(new Street(5, true, 0));
  roads.add(new Street(6, true, 2));
  
  roads.add(new Street(5, false, 1));
  roads.add(new Street(6, false, 3));
  
  roads.add(new Street(13, true, 0));
  roads.add(new Street(14, true, 2));
  
  roads.add(new Street(13, false, 1));
  roads.add(new Street(14, false, 3));
  //roads.add(new Street(9, true));
  
  placeNodes();
  
  //nodes.add(new Node(width/2, height/2));
  //nodes.add(new Node(width/2 + 200, height/2));
  //nodes.add(new Node(width/2 + 200, height/2 + 200));
  //nodes.add(new Node(width/2, height/2 + 200));
  
  //Node n = nodes.get(0);
  //nodes.get(0).child = nodes.get(1);
  //nodes.get(1).child = nodes.get(2);
  //nodes.get(2).child = nodes.get(3);
  //nodes.get(3).child = nodes.get(0);
  
  for(Node n : nodes)
  {
    if(n.outer)
      outsideNodes.add(n);
  }
  
  for(Street s : roads)
  {
  
  }
  //cars.add(new Agent(outsideNodes.get((int)random(outsideNodes.size()))));
  //cars.add(new Agent(width/2 - 150, height/2,n));
  //gates.add(new Gate(new PVector(width/2 + 100, height/2), false));
  //gates.add(new Gate(new PVector(width/2 + 300, height/2), false));
  //gates.add(new Gate(new PVector(width/2 - 100, height/2), false));
  
}

void draw()
{
  background(151);
  
  for(int i = 0; i < cols; i++)
  {
    for(int j = 0; j < rows; j++)
    {
      stroke(255, 50);
      fill(151);
      rect(i * tileSize, j * tileSize, tileSize, tileSize);
    }
  }
  
  for(Street r : roads)
    r.show();
  
  for(Agent a : cars){
    a.show();
    a.detect();
    a.update();
    if(!a.stopCar && !a.stopGate)
      a.seek(a.target);
  }
  
  for(Gate g : gates)
  {
    g.show();
  }
  
  for(Node n : nodes)
    n.show();
  
  fill(255);
  stroke(0);
  strokeWeight(2);
}

void mouseClicked()
{
  for(Gate g : gates)
  {
    if(abs(mouseX - g.pos.x) < g.wid && abs(mouseY - g.pos.y) < g.hei)
      g.open = !g.open;
  }
}

//void placeNodes()
//{
//  for(Street s1 : roads)
//  {
//    for(Tile t1 : s1.tiles)
//    {
//      if(!t1.hasNode)
//      {
//        for(Street s2 : roads)
//        {
//          if(s1.id != s2.id)
//          {
//            for(Tile t2 : s2.tiles)
//            {
//              if(t1.pos.x == t2.pos.x && t1.pos.y == t2.pos.y && (!t2.hasNode)){
//                t1.hasNode = true;
//                t1.col = color(193, 112, 247);
//                t2.col = color(193, 112, 247);
//                Node n = new Node((int)t1.pos.x + tileSize/2, (int)t1.pos.y + tileSize/2, false);
//                //println("Node initialized at (" + n.pos.x/tileSize + "," + n.pos.y/tileSize + ")");
//                if(s1.isHorz)
//                {
//                  if(t1.index == s1.index)
//                    n.dir[2] = 1; //top half, move left
//                  else
//                    n.dir[0] = 1; //bottom move right
                  
//                  if(t2.index == s2.index)
//                    n.dir[1] = 1; //left move down
//                  else
//                    n.dir[3] = 1; //right move up
//                }
//                else
//                {
//                  if(t1.index == s1.index)
//                    n.dir[1] = 1;
//                  else
//                    n.dir[3] = 1;
                  
//                  if(t1.index == s2.index)
//                    n.dir[2] = 1;
//                  else
//                    n.dir[0] = 1;
//                }
                  
//                nodes.add(n);
//                println("S1.index = " + s1.index + " | S2.index = " + s2.index + " | t1.index = " + t1.index + " | t2.index = " + t2.index);
//                for(int i = 0; i < 4; i++)
//                  print(n.dir[i]);
//                println();
//              }
//            }
//          }
//        }
//      }
//    }
//  }
//}

void placeNodes()
{
  
  for(Street s : roads)
  {
    for(Tile t : s.tiles)
    {
        
    }
  }
}
