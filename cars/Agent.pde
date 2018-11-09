class Agent
{
  PVector pos, vel, acc;
  int size = 20;
  int maxSpeed = 5;
  
  PVector rayPos;
  int rayLength = 20;
  
  boolean stopGate = false;
  boolean stopCar = false;
  
  int dir = 0;
  
  ArrayList<Node> path = new ArrayList();
  
  PVector appAcc = new PVector();
  
  Node target;
  
  Agent(Node spawnNode)
  {
    pos = new PVector(spawnNode.pos.x, spawnNode.pos.y);
    vel = new PVector();
    acc = new PVector();
    
    findPath();
    
    rayPos = new PVector(this.pos.x + rayLength, this.pos.y);
    
    this.target = target;
  }
  
  void show()
  {
    fill(0);
    strokeWeight(2);
    stroke(0);
    rectMode(CENTER);
    rect(pos.x, pos.y, size, size);
    
    line(pos.x, pos.y, rayPos.x, rayPos.y);
    strokeWeight(7);
    point(rayPos.x, rayPos.y);
  }
  
  void update()
  {
    pos.add(vel);
    rayPos.add(vel);
    vel.add(acc);
    vel.limit(maxSpeed);
    acc.mult(0); 
  }
  
  void changeDir()
  {
  }
  
  void detect()
  {
    inGates:
    for(Gate g : gates)
    {
      if(abs(rayPos.x - g.pos.x) < g.wid/2 && abs(rayPos.y - g.pos.y) < g.hei/2 && !g.open)
      {
        stopGate = true;
        maxSpeed = 0;
        break inGates;
      }
      else{
        stopGate = false;
        if(!stopCar)
          maxSpeed = 5;
      }
    }
    
    inCars:
    for(Agent a : cars)
    {
      if(abs(rayPos.x - a.pos.x) < a.size/2 && abs(rayPos.y - a.pos.y) < a.size/2)
      {
        //println("car found");
        stopCar = true;
        maxSpeed = 0;
        break inCars;
      }
      else{
        stopCar = false;
        if(!stopGate)
          maxSpeed = 5;
      }
    }
    
    if(dist(this.pos.x, this.pos.y, target.pos.x, target.pos.y) < 2)
    {
      this.target = this.target.child;
    }
  }
  
  void seek(Node target)
  {
    PVector desired = PVector.sub(target.pos, pos);
    desired.setMag(maxSpeed/2);
    PVector steer = PVector.sub(desired, vel);
    steer.limit(1);
    applyForce(steer);
  }
  
  void applyForce(PVector f)
  {
     acc.add(f);
  }
  
  void brake()
  {
    PVector brakes = new PVector(-.14, 0);
    applyForce(brakes);
  }
  
  void findPath()
  {
    
  }
  
  void findNode()
  {
    for(Node n : nodes)
    {
      if(PVector.dist(this.pos, n.pos) <= n.nodeSize/2)
      {
        this.appAcc = n.intAcc;
      }
    }
  }

}
  
