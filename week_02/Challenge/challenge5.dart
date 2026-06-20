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
