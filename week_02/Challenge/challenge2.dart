class Point{
  int x;
  int y;
  Point(this.x, this.y);
}

class Rectangle {
  Point buttonRight;
  Point topLeft;

  Rectangle({required this.topLeft, required this.buttonRight});
  int width(){
    return buttonRight.x - topLeft.x;
  }
  int height(){
    return topLeft.y - buttonRight.y;
  }
  int get area{
    return width() * height();
  }
}

void main(){
  Rectangle r1 = Rectangle(topLeft: Point(10, 20), buttonRight: Point(5,10));
  int width = r1.width();
  int height = r1.height();
  int area = r1.area;
  print(width);
  print(height);
  print(area);
}