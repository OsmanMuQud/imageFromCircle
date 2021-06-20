class circle
{
  PVector pos;
  PVector vel;
  float rad;
  float ret=random(0.6,1.2)*2;
  float maxrad;
  color col;
  float life=random(100);
  float death=random(0.4,0.6)*2;
  circle(float x,float y,color col_)
  {
    pos=new PVector(x,y);
    col=col_;
    vel=PVector.random2D().setMag(random(.5));
    maxrad=random(20,30);
    rad=0;
    if(random(1)>0.95)
    {
      maxrad=random(40,80);
    }
  }
  void show()
  {
    noStroke();
    fill(col,120-life);
    circle(pos.x,pos.y,rad);
  }
  void update()
  {
    pos.add(vel);
    if(maxrad==0)
    {
      life+=death;
      rad-=ret;
    }
    else
    {
      rad+=2*ret;
    }
    if(rad>=maxrad)
    {
      maxrad=0;
    }
    if(pos.x>width)
    {
      pos.x=width;
      vel.x*=-1;
    }
    if(pos.x<0)
    {
      pos.x=0;
      vel.x*=-1;
    }
    if(pos.y>height)
    {
      pos.y=height;
      vel.y*=-1;
    }
    if(pos.y<0)
    {
      pos.y=0;
      vel.y*=-1;
    }
  }
}
