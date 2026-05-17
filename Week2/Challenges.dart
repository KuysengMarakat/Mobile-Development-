// //Challenge1

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

// Challenge2
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

// Challenge3
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

// Challenge5
enum TravelClass {
  firstClass,
  businessClass,
  premiumEconomyClass,
  economyClass,
}

class Passenger {
  String fullname;
  int age;
  String contact;

  Passenger({required this.fullname, required this.age, required this.contact});

  String toString() {
    return "$fullname";
  }
}

class TravelTicket {
  Passenger information;
  String destination;
  String? discountCode;
  TravelClass trip;

  TravelTicket({
    required this.information,
    required this.destination,
    this.discountCode,
    required this.trip,
  });

  String toString() {
    return "Passenger: $information, Destination: $destination, TravelClass: ${trip.name}";
  }
}

void main() {
  Passenger p1 = Passenger(
    fullname: "Kuyseng Markat",
    age: 19,
    contact: "+855 77650350",
  );
  TravelTicket t1 = TravelTicket(
    information: p1,
    destination: "China",
    trip: TravelClass.firstClass,
  );
  print(t1);
}

// Challenge6
class Distance {
  final double _meters;

  Distance._(this._meters);

  Distance.meter(double meters) : _meters = meters;
  Distance.kms(double kms): _meters = kms * 1000;
  Distance.cms(double cms): _meters = cms / 100;

  double get meters => _meters;
  double get kms => _meters / 1000;
  double get cms => _meters *100;

  Distance operator +(Distance other) {
    return Distance._(_meters + other._meters);
  }
}

void main() {
  Distance d1 = Distance.kms(3.4);
  Distance d2 = Distance.cms(1000);

  var result = d1 + d2;
  print(result.kms);
}
