class Point {
  int x;
  int y;
  Point(this.x, this.y);

  String toString() {
    return "x:$x, y:$y";
  }

  void translate(int dx, int dy) {
    x += dx;
    y += dy;
  }
}

void main() {
  Point p1 = Point(10, 20);
  p1.translate(1, 2);
  print(p1);
}