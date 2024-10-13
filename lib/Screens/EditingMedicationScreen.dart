import 'package:flutter/material.dart';
import 'package:interntask/Models/MedicationManager.dart';
import '../Models/Medication.dart';
import '../Models/PrescriptionMedication.dart';
import '../Colors.dart';

class EditMedicationScreen extends StatefulWidget {
  final Medication medication;// Object to be updated
  final Function() onUpdateMedication;// function to update the UI
  final medicationManager; // Manager to handle the meicationlist

  const EditMedicationScreen({
    super.key,
    required this.medication,
    required this.medicationManager,
    required this.onUpdateMedication,
  });

  @override
  _EditMedicationScreenState createState() => _EditMedicationScreenState();
}

class _EditMedicationScreenState extends State<EditMedicationScreen> {
  late TextEditingController _nameController; // to handle the name changes
  late TextEditingController _doseController; // to handle the email changes
  late TextEditingController _prescribedByController; // to handle the prescribed By input changes
  late final MedicationManager _medicationManager; // to handle the edit function

  @override
  void initState() {
    super.initState();
_medicationManager=widget.medicationManager;
    _nameController = TextEditingController(text: widget.medication.name);
    _doseController = TextEditingController(text: widget.medication.dose.toString());

      // Handling the prescribed By text  controller base on object
    if (widget.medication is PrescriptionMedication) {
      _prescribedByController = TextEditingController(
          text: (widget.medication as PrescriptionMedication).prescribedBy);
    } else
      {
        _prescribedByController = TextEditingController();
      }

  }
// Dispose the text editing controllers
  @override
  void dispose() {
    _nameController.dispose();
    _doseController.dispose();
    _prescribedByController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Edit Medication',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        backgroundColor: AppColors.purpleDark,
        foregroundColor: AppColors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Medication Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(color: AppColors.purpleLight, width: 1.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(color: AppColors.purpleDark, width: 2.0),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _doseController,
              decoration: InputDecoration(
                labelText: 'Dose (mg)',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(color: AppColors.purpleLight, width: 1.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(color: AppColors.purpleDark, width: 2.0),
                ),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16.0),
            //Showing the Prescribed By field base on Prescribed medication Object
            if (widget.medication is PrescriptionMedication)
              TextField(
                controller: _prescribedByController,
                decoration: InputDecoration(
                  labelText: 'Prescribed By',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(color: AppColors.purpleLight, width: 1.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(color: AppColors.purpleDark, width: 2.0),
                  ),
                ),
              ),
            const SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () {
                String name = _nameController.text;
                double dose = double.tryParse(_doseController.text) ?? 0.0;
                String prescribedBy = _prescribedByController.text;
// validation of empty fields
                if (name.isEmpty || dose <= 0) {
                  _showDialog(context, 'Please enter valid details for medication.');
                  return;
                }
                // updating the prescribed Medication Object editing
                if (widget.medication is PrescriptionMedication && _prescribedByController.text.isNotEmpty) {
                  _medicationManager.updateMedication(widget.medication.id,name:  name,dose:
                    dose,
                    prescribedBy:prescribedBy,
                    time: DateTime.now(),
                  );
// handling the Medication Object editing
                } else {
                  _medicationManager.updateMedication(widget.medication.id,name:  name,dose:
                  dose,
                      time: DateTime.now(),
                  );
                }
                widget.onUpdateMedication();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.white,
                padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 12.0),
              ),
              child: const Text(
                'Save Changes',
                style: TextStyle(fontSize: 18.0, color: AppColors.purpleLight),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error',style: TextStyle(color: AppColors.red),),
          content: Text(message),
          actions: [
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
