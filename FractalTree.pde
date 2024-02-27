private double fractionLength = .6;
private int smallestBranch = 70;
private double branchAngle = .8;
private int counter = 0;
public void setup()
{
  size(400, 300);
  noLoop();
}
public void draw()
{
  background(200,200,255);
  stroke(0, 0, 255);
  line(200, 300, 200, 200);
  smallestBranch = (int)(smallestBranch * Math.pow(0.7, counter));
  drawBranches(200, 200, 80,3*PI/2);  //will add later
}
public void mouseClicked() {
  if (counter < 4) {
    counter++;
    redraw();
  }
}
public void drawBranches(float x, float y, double branchLength, double angle)
{
  double a1 = angle + branchAngle;
  double a2 = angle - branchAngle;
  float x1 = (float)(x+branchLength*Math.cos(a1));
  float x2 = (float)(x+branchLength*Math.cos(a2));
  float y1 = (float)(y+branchLength*Math.sin(a1));
  float y2 = (float)(y+branchLength*Math.sin(a2));
  line(x, y, x1, y1);
  line(x, y, x2, y2);
  if (branchLength<=smallestBranch)
    return;
  drawBranches(x1, y1, branchLength*fractionLength, a1);
  drawBranches(x2, y2, branchLength*fractionLength, a2);
}
