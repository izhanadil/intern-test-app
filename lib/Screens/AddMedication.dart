import 'package:flutter/material.dart';
import 'package:interntask/Colors.dart';

import '../Models/Medication.dart';
import '../Models/PrescriptionMedication.dart';

class AddMedicationScreen extends StatelessWidget {
  final Function(Medication) onAddMedication;// functiion to update the UI of home class

  AddMedicationScreen({super.key, required this.onAddMedication});

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _doseController = TextEditingController();
  final TextEditingController _prescribedByController = TextEditingController();
  final DateTime _selectedTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Medication',
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
            TextField(
              controller: _prescribedByController,
              decoration: InputDecoration(
                labelText: 'Prescribed By (optional)',
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
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String name = _nameController.text;
                double dose = double.tryParse(_doseController.text) ?? 0.0;
                String prescribedBy = _prescribedByController.text;

// Validating empty name field
                if (name.isEmpty) {
                  _showDialog(context, 'Please enter a medication name.');
                  return;
                }
// validating empty Dose field
                if (_doseController.text.isEmpty || dose <= 0) {
                  _showDialog(context, 'Please enter a valid dose.');
                  return;
                }

                int id = DateTime.now().millisecondsSinceEpoch;
                // Handling Medication and Prescribed Medication base on the Prescribed By field

                if (prescribedBy.isNotEmpty) {
                    
                  onAddMedication(PrescriptionMedication(id, name, _selectedTime, dose, prescribedBy, 0));
                } else {
                    
                  onAddMedication(Medication(id, name, _selectedTime, dose));
                }

                  
                _nameController.clear();
                _doseController.clear();
                _prescribedByController.clear();
              },
              child: const Text('Add Medication'),
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
          title: const Text('Error',style: TextStyle(color:AppColors.red),),
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
