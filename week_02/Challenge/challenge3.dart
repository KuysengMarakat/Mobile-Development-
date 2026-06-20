class Person {
  String firstName;
  String LastName;

  Person(this.firstName, this.LastName);

  String fullname() {
    return firstName + " " + LastName;
  }
}

void main() {
  Person p1 = Person("Kuyseng", "Marakat");
  String fullname = p1.fullname();
  print(fullname);
}

//challenge4
class Point {
  final int _x;
  final int _y;

  Point(this._x, this._y);
  String toString() {
    return "x:$_x, y:$_y";
  }

  Point translate(int dx, int dy) {
    int x1 = dx + _x;
    int y1 = dy + _y;
    return Point(x1, y1);
  }
}

void main() {
  Point p1 = Point(5, 10);
  print(p1);
  print(p1.translate(1, 2));
}