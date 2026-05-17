// //Exercise1
enum Skill { FLUTTER, DART, OTHER }

class Address {
  final String street;
  final String city;
  final String zipCode;

  Address(this.street, this.city, this.zipCode);
  @override
  String toString() {
    return "$street, $city, $zipCode";
  }
}

class Employee {
  String _name;
  double _baseSalary;
  List<Skill> _skills;
  Address _address;
  int _yearsOfExperience;

  Employee(
    this._name,
    this._baseSalary,
    this._skills,
    this._address,
    this._yearsOfExperience,
  );

  Employee.mobileDeveloper(String name, Address address, int years): this(name, 40000, [Skill.FLUTTER, Skill.DART], address, years);

  Employee.backendDeveloper(String name, Address address, int years) : this(name, 40000, [Skill.DART], address, years);

  String get name => _name;
  double get baseSalary => _baseSalary;
  List<Skill> get skills => List.unmodifiable(_skills);
  Address get address => _address;
  int get yearsOfExperience => _yearsOfExperience;

  double computeSalary() {
    double salary = _baseSalary;

    salary += _yearsOfExperience * 2000;
    for (var skill in _skills) {
      switch (skill) {
        case Skill.FLUTTER:
          salary += 5000;
          break;
        case Skill.DART:
          salary += 3000;
          break;
        case Skill.OTHER:
          salary += 1000;
          break;
      }
    }

    return salary;
  }

  @override
  String toString() {
    return "Name: $_name\n"
        "Address: $_address\n"
        "Experience: $_yearsOfExperience\n"
        "Skills: ${_skills.join(", ")}\n"
        "Salary: \$${computeSalary()}";
  }
}

void main() {
  var add1 = Address("Str 117", "Phnom penh", "12123");

  var e1 = Employee.mobileDeveloper("Marakat", add1, 2);
  var e2 = Employee.backendDeveloper("Simu", add1, 1);

  print(e1);
  print(e2);
}
