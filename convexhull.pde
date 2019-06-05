int numPoints = 20;
int pSize = 15;
int pDia = pSize/2;

Point[] Points = new Point[numPoints];
Graham GPoints = new Graham(Points);
Merge MPoints = new Merge(Points);
Point[] arrangedPoints = new Point[numPoints];

ArrayList<Point> convexPoints = new ArrayList<Point>();
Point[] farthestPoints = new Point[2];

public void setup() {
  size(1000, 700);

  for (int i = 0; i < numPoints; i++) {
    Points[i] = new Point(int(random(pDia + 40, width - (pDia + 40))), int(random(pDia + 50, height -(pDia +50))), pSize);
  }
  //drawLines(Points);
  
  GPoints.GetAngle(Points);
  arrangedPoints = MPoints.mergeSort(Points,0,Points.length-1);
  convexPoints = GPoints.getConvex(arrangedPoints);
  farthestPoints = GPoints.findFarthest(convexPoints);
  
  
}

void draw() {
  stroke(#EA0E0E);
  line(farthestPoints[0].x,farthestPoints[0].y,farthestPoints[1].x,farthestPoints[1].y);
  stroke(0);
  for (int i = 0; i < numPoints; i++) {
    arrangedPoints[i].drawSelf();
    fill(255);
    text(i, arrangedPoints[i].x-6, arrangedPoints[i].y+6);
    fill(0);
  }
  for(int i = 0; i < convexPoints.size()-1; i++){
    line(convexPoints.get(i).x,convexPoints.get(i).y,convexPoints.get(i+1).x,convexPoints.get(i+1).y);
  }
  line(convexPoints.get(0).x,convexPoints.get(0).y,convexPoints.get(convexPoints.size()-1).x,convexPoints.get(convexPoints.size()-1).y);
}

void drawLines(Point[] PointsArr) {
  int lowestInArr = GPoints.FindLowest(Points);
  for (int i = 0; i < PointsArr.length; i++) {
    line(PointsArr[lowestInArr].x, PointsArr[lowestInArr].y, PointsArr[i].x, PointsArr[i].y);
  }
}
