import 'dart:developer';
import 'Medication.dart';
import 'PrescriptionMedication.dart';

class MedicationManager {
  // polymorphism  for storing the medication and PrescriptionMedication Object
  final List<Medication> _medications = [];

// adding new object in medication list
  void addMedication(Medication medication) {
    _medications.add(medication);
    log('Medication added: ${medication.toString()}');
  }

// removing the item base on the id of item
  bool removeMedication(int id) {
    try {
      Medication medication = _medications.firstWhere((med) => med.id == id);
      _medications.remove(medication);
      log('Medication removed: ${medication.toString()}');
      return true;
    } catch (e) {
      log('Medication with id $id not found.');
      return false;
    }
  }

// editing function to edit already present object
  bool updateMedication(int id, {String? name, DateTime? time, double? dose,String? prescribedBy}) {
    try {
      Medication medication = _medications.firstWhere((med) => med.id == id);
      if (name != null) medication.name = name;
      if (time != null) medication.time = time;
      if (dose != null) medication.dose = dose;
      //updating the prescribedBy only if the object is PrescriptionMedication
      if (medication is PrescriptionMedication)
        {
          if (prescribedBy!=null) medication.prescribedBy=prescribedBy;
        }
      log('Medication updated: ${medication.toString()}');
      return true;
    } catch (e) {
      log('Medication with id $id not found.');
      return false;
    }
  }


  List<Medication> getAllMedications() {
    return _medications;
  }
}
