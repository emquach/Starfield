Particle [] ogb = new Particle [1500];
void setup()
{
  size(500, 500);
  for(int i = 0; i < ogb.length; i++)
  {
    ogb[i] = new NormalParticle(250, 250);
  }
  ogb[1] = new OddballParticle(250, 250);
  ogb[2] = new JumboParticle(250, 250);
  }

void draw()
{
  background(0);

  for(int i = 0; i < ogb.length; i++)
  {
    ogb[i].move();
    ogb[i].show();
    ogb[i].reset();
  }

  fill(0);
ellipse(250,250,10,10);
}


class NormalParticle implements Particle
{
  double myX, myY, dSpeed, dAngle;
  int dColor;
  NormalParticle()
  {
  }
  NormalParticle(float x, float y)
  {
    myX = x;
    myY = y;
    dAngle = Math.random()*20*Math.PI;
    dSpeed = Math.random()*10; //inner
    dColor =color((int)(Math.random()*255), (int)(Math.random()*255), (int)(Math.random()*255));
  }

  public void move()
  {
    myX = myX + cos((float)dAngle) * dSpeed;
    myY = myY + tan((float)dAngle) * dSpeed;
  }
  public void show()
  {
    fill(255);
    ellipse((float) myX, (float) myY, 3, 3); //all
  }
  public void reset()
  {
    if (myX>500 || myX<0)
    {
      myX=250;
      myY=250;
    }
  }
}
interface Particle
{
  public void move();
  public void show();
  public void reset();
}

class OddballParticle implements Particle//uses an interface
{
  double myX, myY, dSpeed, dAngle;
  int dColor;
  OddballParticle()
{
}
  OddballParticle(float x, float y)
  {
    myX = x;
    myY = y;
    dAngle = Math.random()*20*Math.PI;
    dSpeed = Math.random()*5;
  }

  public void move()
  {
    myX = myX + cos((float)dAngle) * dSpeed;
    myY = myY + tan((float)dAngle) * dSpeed;
  }
  public void show()
  {
    fill((int)(Math.random()*255), (int)(Math.random()*255), (int)(Math.random()*255));
    stroke(0);
    rect((float) myX, (float) myY, 10, 10);
  }
  public void reset()
  {
    if (myX>500 || myX<0)
    {
      myX=250;
      myY=250;
    }
    if (myY>500 || myY<0)
    {
      myX=250;
      myY=250;
    }
}
}
class JumboParticle extends NormalParticle //uses inheritance
{
  JumboParticle(float x, float y)
  {
    myX = x;
    myY = y;
    dAngle = Math.random()*2*Math.PI;
    dSpeed = Math.random()*6+8;
  }
  public void show()
  {
    fill(#953030);
    ellipse((float) myX, (float) myY, 20, 20);
  }
  public void reset()
  {
    if (myX>500 || myX<0)
    {
      myX=250;
      myY=250;
      dAngle=(int)(Math.random()*6)-2;
      dSpeed=(int)(Math.random()*6+8);
    }
  }
}