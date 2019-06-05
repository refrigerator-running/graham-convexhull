class Graham {
  //
  Point[] PointsArr;


  //
  Graham(Point[] p_i) {
    Points = p_i;
  }

  //
  //finds the point with highest y vakye
  public int FindLowest(Point[] PointsArr){
    Point Lowest = PointsArr[0];
    int arraySpot = 0;
    
    for(int i = 0; i < PointsArr.length ; i++){
      if(PointsArr[i].y > Lowest.y){
        Lowest = PointsArr[i];
        arraySpot = i;
      }
    }
    return arraySpot;
  }
 //gets angles between vectors
 public void GetAngle(Point[] PointsArr){
   
   float angle = 1; 
   int lowestNum = FindLowest(PointsArr);
   //hull variable
   Point Lowest = PointsArr[lowestNum];
  //xaxis vector
   Vector xAxisVector = new Vector(1,0);
   
   Vector[] pAsVectors = new Vector[PointsArr.length];
   
   //makes vectors
   for(int i =0 ; i < PointsArr.length ; i++){
     if( i != lowestNum){
     pAsVectors[i] = new Vector(PointsArr[i].x-Lowest.x, PointsArr[i].y-Lowest.y);
     }
   }
   
   //gets angle in respect to lowest vector 
   for(int i = 0; i < PointsArr.length; i++){
     if(i != lowestNum){
       angle = xAxisVector.getAngle(pAsVectors[i]);
       PointsArr[i].angle = angle;
     }
     else{
       continue;
     }
   }
   
 }
 //checks whether clockwise, countercw, or colinear between 3 points
 int orientation(Point p1, Point p2, Point p3){
   // http://stackoverflow.com/questions/27635188/algorithm-to-detect-left-or-right-turn-from-x-y-co-ordinates
   int val = (p2.y - p1.y) * (p3.x - p2.x) - 
             (p2.x - p1.x) * (p3.y - p2.y);
             
   if(val == 0){
     return 0; //colinear
   }

    return (val > 0)? 1: 2; // clock = 1 or counterclock wise = 2
   
 }
 //deletes any clockwise turns
 ArrayList<Point> getConvex(Point[] PointsArr){
   ArrayList<Point> convexPoints = new ArrayList<Point>();
   convexPoints.add(PointsArr[0]);
   convexPoints.add(PointsArr[1]);
   convexPoints.add(PointsArr[2]);
   for(int i = 3;i<PointsArr.length;i++){
     while(convexPoints.size()>1 && orientation(convexPoints.get(convexPoints.size()-2),convexPoints.get(convexPoints.size()-1),
           PointsArr[i]) == 2){
             convexPoints.remove(convexPoints.size()-1);
           }
     convexPoints.add(PointsArr[i]);
   }
   
   return convexPoints;
   
 }
 //finds farthest distance
 Point[] findFarthest(ArrayList<Point> Points){ // O(n^2) run time :(
   Point[] farthestPair = new Point[2];
   double maxDistance = 0;
   double distance = 0;
   for(int i = 0; i < Points.size(); i++){
     for(int j = 0; j < Points.size();j++){
       //https://docs.oracle.com/javase/7/docs/api/java/lang/Math.html#hypot%28double,%20double%29
       distance = Math.hypot(Points.get(i).x-Points.get(j).x, 
                                 Points.get(i).y-Points.get(j).y);
       if(distance > maxDistance){
         maxDistance = distance;
         farthestPair[0] = Points.get(i);
         farthestPair[1] = Points.get(j);      
       }
     }
   }
   return farthestPair;
 }
}
