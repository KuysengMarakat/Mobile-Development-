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
