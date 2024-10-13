import 'package:flutter/material.dart';

import '../Colors.dart';
import '../Models/Medication.dart';
import '../Models/MedicationManager.dart';
import '../Models/PrescriptionMedication.dart';
import 'AddMedication.dart';
import 'EditingMedicationScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final MedicationManager _medicationManager = MedicationManager();// to handle the list  of medication

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        backgroundColor: AppColors.purpleDark,
        title: const Text(
          'Medications',
          style: TextStyle(color: AppColors.white, fontSize: 28),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: _medicationManager.getAllMedications().length,
        itemBuilder: (context, index) {
          Medication medication = _medicationManager.getAllMedications()[index];
          String day=medication.time.toString().substring(8,10);
          String month=medication.time.toString().substring(5,7);
          return Card(

            margin: const EdgeInsets.symmetric(vertical: 8.0),
            elevation: 4,
            child: ListTile(
              contentPadding:const  EdgeInsets.only(left: 5),
              leading:  CircleAvatar(
                radius: 25,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      month,
                      style:const  TextStyle(
                          color: AppColors.purpleLight,
                          fontWeight: FontWeight.bold,

                      ),
                    ),
                    Text(
                      day,
                      style:const  TextStyle(
                        color : AppColors.purpleLight,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              title: Text(
                medication.name,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: AppColors.purpleDark),
              ),
              subtitle: Text(
                // different display for the medication and PrescrptionMedication
                (medication is PrescriptionMedication)
                    ? 'Dosage: ${medication.dose} mg\nPrescribed by: ${medication.prescribedBy}'
                    : 'Dosage: ${medication.dose} mg',
                style: const TextStyle(color: AppColors.grey),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,   
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit, color: AppColors.purpleDark),
                    onPressed: () {
                        // Navigating to edit page
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => EditMedicationScreen(
                            medication: medication,
                              medicationManager: _medicationManager,
                            onUpdateMedication: () {
                              setState(() {
                              });
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      );
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete, color: AppColors.red),
                    onPressed: () {
                        // Confirmation Dialog to delete the medication
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Delete Medication',style: TextStyle(color: AppColors.red),),
                          content: const Text('Are you sure you want to delete this medication?'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),   
                              child: const Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () {
                                // deleting the medication and updating the UI
                                setState(() {
                                  _medicationManager.removeMedication(medication.id);
                                });
                                Navigator.pop(context);   
                              },
                              child: const Text('Delete', style: TextStyle(color: AppColors.red)),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AddMedicationScreen(
                onAddMedication: (medication) {
                  setState(() {
                    _medicationManager.addMedication(medication);
                  });
                  Navigator.pop(context);
                },
              ),
            ),
          );
        },
        backgroundColor: AppColors.purpleDark,
        child: const Icon(Icons.add, color: AppColors.white),
      ),
    );
  }
}
