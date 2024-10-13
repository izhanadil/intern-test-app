import 'Medication.dart';
// child class of Medication object
class PrescriptionMedication extends Medication {
  String _prescribedBy;
  int _refills;

  PrescriptionMedication(super.id, super.name, super.time, super.dose,
      this._prescribedBy, this._refills);

  String get prescribedBy => _prescribedBy;
  set prescribedBy(String value) {
    _prescribedBy = value;
  }

  int get refills => _refills;
  set refills(int value) {
    _refills = value;
  }


  @override
  String toString() {
    return 'PrescriptionMedication : (id: $id, name: $name, time: ${time.toString()}, dose: $dose mg, prescribed by: $prescribedBy, refills: $refills)';
  }
}
