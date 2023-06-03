// TODO Implement this library.

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  dynamic selectedOption;
  dynamic complaintText;
  // Add necessary variables for file upload
  String? selectedFile;

  final List<String> dropdownOptions = ['Food', 'Gender', 'Staff', 'Exam'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      appBar: AppBar(
        
        title: Text('Submit Complaint'),
        backgroundColor: Colors.red,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
      ),),
      body:SingleChildScrollView(child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 20.0),
              child: DropdownButtonFormField<String>(
                value: selectedOption,
                items: dropdownOptions.map((option) {
                  return DropdownMenuItem<String>(
                    value: option,
                    child: Text(option),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedOption = value;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Issue related with?',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 20.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      complaintText = value;
                    });
                  },
                  maxLines: null, // Allow multiple lines for essay-type input
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: 'What is your complaint?',
                  ),
                ),
              ),
            ),
            selectedFile != null
                ? Column(
                    children: [
                      Text(
                        'Selected File:',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(selectedFile!),
                    ],
                  )
                : SizedBox(),
            ElevatedButton(
              onPressed: () {
                _selectFile(); // Function to handle file selection
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: Text(
                'Browse File',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Add functionality for submitting the form
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: Text(
                'Submit',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }

  void _selectFile() {
    void _selectFile() async {
  try {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        selectedFile = result.files.single.name;
      });
    } else {
      print('cancelled  to upload the file:');
    }
  } on PlatformException catch (e) {
    print('Error while picking the file: $e');
    
  }
}
  }
}
