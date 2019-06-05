class Point{
  //
  int x, y, size;
  double angle;

  //
  public Point(int x_input, int y_input, int size_input){
    x = x_input;
    y = y_input;
    size = size_input;
  }
  //
  
  void drawSelf(){
    ellipse(x,y,size,size);
    
  }

    
    

}
