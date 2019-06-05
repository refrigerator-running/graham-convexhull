class Merge{
  
  Point[] Points;
  
  
  //
  
  Merge(Point[] p_i){
    Points = p_i;
  }
  
  //
  public Point[] mergeSort(Point[] a, int start, int end ) {
    
    if ( a[start].angle == a[end].angle ) {  
      Point[] arrayWithOneElement = { a[start] };
      return arrayWithOneElement;
    } 
    
    else {
      int middle = (end + start)/2;  //finds the middle index between start and end
  
      Point[] sortedLeftHalf  = mergeSort( a, start, middle );     // recursive function-call
      Point[] sortedRightHalf = mergeSort( a, middle + 1, end );   // recursive function-call
  
      return merge( sortedLeftHalf, sortedRightHalf );  // merges the two sorted halves
    }
  }
  
  
  public Point[] merge( Point[] a, Point[] b ) {
    Point[] c = new Point[a.length + b.length];
    int i = 0;
    int j = 0;
    int k = 0;
  
    while ( i < a.length && j < b.length ) {  //FOR AS LONG AS BOTH a AND b STILL HAVE ITEMS LEFT...
  
      if ( a[i].angle <= b[j].angle ) {  //if the current "top card" of a is less than the current "top card" of b...
        c[k] = a[i]; //...then add a[i] to c
        i++;         //...and then move a's pointer to the next item in a
      } 
      
      else {
        c[k] = b[j];  //...otherwise add b[i] to c
        j++;          //...and then move b's pointer to the next item in a
      }
  
      k++;  //increment c's index pointer, no matter what
    }
  
    //AS SOON AS a OR b IS EMPTY, TACK ON THE REMAINDER OF THE NON-EMPTY ARRAY ONTO c
    if ( i == a.length ) //if a was the array that emptied first...
      for ( int m = j; m < b.length; m++ ) {  //...then add all remaining items from b to c
        c[k] = b[m];
        k++;
      } 
      
    else 
      for (int m = i; m < a.length; m++) {  //...otherwise add all remaining items from a to c 
        c[k] = a[m];
        k++;
      }
  
    return c;  //Returns the final sorted array, c
  }
}
