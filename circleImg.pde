import processing.video.*;
ArrayList<circle> c;
Capture cam;
void setup()
{
  //fullScreen();
  size(960,540);
  cam=new Capture(this,width,height);
  cam.start();
  c=new ArrayList<circle>();
  
}
void draw()
{
  if(cam.available()){
    background(255);
    cam.read();
   cam.loadPixels();
    tint(250,0);
    
    pushMatrix();
    translate(width,0);
    scale(-1,1);
    image(cam,0,0);
    popMatrix();
    
    for(int i=0;i<13000-c.size();i++)
    {
      float x=random(width);
      float y=random(height);
      c.add(new circle(x,y,cam.pixels[(int)map(x,0,width,width,0)+((int)y*width)]));
    }
    for(int i=c.size()-1;i>=0;i--)
      {
        c.get(i).show();
        c.get(i).update();
        if(c.get(i).life>=100||c.get(i).rad<=0)
        {
          c.remove(i);
        }
      }
  }
}
