class Medication {
  final int _id;
  String _name;
  DateTime _time;
  double _dose;

  Medication(this._id, this._name, this._time, this._dose);
  int get id => _id;
  String get name => _name;

  set name(String value) {
    _name = value;
  }

  DateTime get time => _time;

  set time(DateTime value) {
    _time = value;
  }

  double get dose => _dose;

  set dose(double value) {
    _dose = value;
  }

  @override
  String toString() {
    return 'Medication is : (id: $id, name: $name, time: ${time.toString()}, dose: $dose mg)';
  }
}
