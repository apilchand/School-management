import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';

FirebaseFirestore db = FirebaseFirestore.instance;
final CollectionReference studentsCollection = db.collection('Student');
final CollectionReference userCollection = db.collection('User');
final CollectionReference parentCollection = db.collection('Parent');

Future<void> addStudent(String documentId, Map<String, dynamic> formData) {
  return studentsCollection
      .doc(documentId)
      .set(formData)
      .then((value) => print("Student added"))
      .catchError((error) => print("Failed to add student: $error"));
}

Future<void> addParent(String documentID, Map<String, dynamic> parentData) {
  return parentCollection
      .doc(documentID)
      .set(parentData)
      .then((value) => print("Parent added"))
      .catchError((error) => print("Failed to add parent: $error"));
}

Future<void> addUserStudent(String documentId, Map<String, dynamic> userStudentData) {
  return userCollection
      .doc(documentId)
      .set(userStudentData)
      .then((value) => print("Student user added"))
      .catchError((error) => print("Failed to add user student: $error"));
}

Future<void> addUserParent(String documentID,Map<String, dynamic> userParentData) {
  return userCollection
      .doc(documentID)
      .set(userParentData)
      .then((value) => print("User added"))
      .catchError((error) => print("Failed to add parent user: $error"));
}

final _formKey = GlobalKey<FormState>();

class StudentRegistration extends StatefulWidget {
  const StudentRegistration({super.key});

  @override
  _StudentRegistrationState createState() => _StudentRegistrationState();
}

class _StudentRegistrationState extends State<StudentRegistration> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _contactController = TextEditingController();
  final _fatherNameController = TextEditingController();
  final _parentContact = TextEditingController();
  final _motherNameController = TextEditingController();

  DateTime? _selectedDate;
  String _selectedGender = 'Male';
  String _selectedClass = 'Class 1';
  File? _profilePicture;
 

  final List<String> _genderOptions = ['Male', 'Female', 'Other'];
  late final List<String> _classOptions = [
    'Class 1',
    'Class 2',
    'Class 3',
    'Class 4',
    'Class 5',
    'Class 6',
    'Class 7',
    'Class 8',
    'Class 9',
    'Class 10',
  ];

  void _selectDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Widget _buildTextField({
    TextEditingController? controller,
    required String labelText,
  }) {
    return TextField(
      key: Key(labelText),
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
      ),
    );
  }

  Widget _buildGender({
    required String title,
    required List<String> options,
    required String selectedOption,
    required Function(String) onOptionSelected,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: DropdownButtonFormField<String>(
            value: _selectedGender,
            onChanged: (value) {
              setState(() {
                _selectedGender = value!;
              });
            },
            items: _genderOptions
                .map((gender) => DropdownMenuItem<String>(
                      value: gender,
                      child: Text(gender),
                    ))
                .toList(),
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              isDense: true,
              contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _pickProfilePicture() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.image);
    if (result != null) {
      setState(() {
        _profilePicture = File(result.files.single.path!);
      });
    }
  }

  Future<void> _submitForm() async {
    if (  _profilePicture== null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a file')),
      );
      return;
    }

    const folderName = "profilePicture";
    // Get a reference to the Firebase Storage bucket
    final storage = FirebaseStorage.instance;
    final bucket = storage.ref().child(folderName);
    final filename =_firstNameController.text + _contactController.text;
    
    try {
      // Upload the selected file to Firebase Storage
      final task = bucket.child(filename).putFile(_profilePicture!);
      final snapshot = await task.whenComplete(() {});

      // Get the download URL for the uploaded file
      final _profileURL = await snapshot.ref.getDownloadURL();


    final userStudentData = {
      'role': 'student',
      'username': _emailController.text,
      'password': _contactController.text,
      'uid': _firstNameController.text + _contactController.text,
    };
    final userParentData = {
      'role': 'parent',
      'username': _parentContact.text,
      'password': _parentContact.text,
      'uid': _firstNameController.text + _parentContact.text,
    };
    final parentData = {
      'parent_id': _firstNameController.text + _parentContact.text,
      'parent_name': _fatherNameController.text,
      'Contact': _parentContact.text,
      'student_id': _firstNameController.text + _contactController.text,
    };
    String documentID = _firstNameController.text + _parentContact.text;
    String documentId = _firstNameController.text + _contactController.text;
    addUserParent(documentID, userParentData);
    addUserStudent(documentId, userStudentData);
    addParent(documentID, parentData);

    final formData = {
      'firstName': _firstNameController.text,
      'lastName': _lastNameController.text,
      'email': _emailController.text,
      'contact': _contactController.text,
      'fatherName': _fatherNameController.text,
      'motherName': _motherNameController.text,
      'dateOfBirth': _selectedDate,
      'gender': _selectedGender,
      'class': _selectedClass,
      'parentContact': _parentContact.text,
      'studentId': _firstNameController.text + _contactController.text,
      'profilePictureURL': _profileURL,
      'parentId': _firstNameController.text + _parentContact.text,
    };

    addStudent(documentId, formData).then((_) {
      _firstNameController.clear();
      _lastNameController.clear();
      _emailController.clear();
      _contactController.clear();
      _fatherNameController.clear();
      _motherNameController.clear();
      _parentContact.clear();
      
      setState(() {
        _selectedDate = null;
        _selectedGender = 'Male';
        _selectedClass = 'Class 1';
        _profilePicture = null;
       
      });
    });

     ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Content uploaded successfully')),
      );
    } on FirebaseException catch (e) {
      // Display an error message if the upload fails
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Upload failed: ${e.message}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Registration'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                _buildTextField(
                  controller: _firstNameController,
                  labelText: 'First Name',
                ),
                const SizedBox(height: 16),
                _buildTextField(
                  controller: _lastNameController,
                  labelText: 'Last Name',
                ),
                const SizedBox(height: 16),
                _buildTextField(
                  controller: _emailController,
                  labelText: 'Email',
                ),
                const SizedBox(height: 16),
                _buildTextField(
                  controller: _contactController,
                  labelText: 'Contact Number',
                ),
                const SizedBox(height: 16),
                _buildTextField(
                  controller: _parentContact,
                  labelText: "Parent's Contact Number",
                ),
                const SizedBox(height: 16),
                _buildTextField(
                  controller: _fatherNameController,
                  labelText: 'Father\'s Name',
                ),
                const SizedBox(height: 16),
                _buildTextField(
                  controller: _motherNameController,
                  labelText: 'Mother\'s Name',
                ),
                const SizedBox(height: 16),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Class'),
                    Expanded(
                      child: Container(
                        child: DropdownButtonFormField<String>(
                          value: _classOptions.first,
                          items: _classOptions.map((className) {
                            return DropdownMenuItem<String>(
                              value: className,
                              child: Text(className),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              _selectedClass = value!;
                            });
                          },
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 16.0),
                InkWell(
                  onTap: () => _selectDate(context),
                  child: AbsorbPointer(
                    child: TextField(
                      decoration: const InputDecoration(
                        labelText: 'Date of Birth',
                        suffixIcon: Icon(Icons.calendar_today_rounded),
                      ),
                      controller: TextEditingController(
                        text: _selectedDate == null
                            ? ''
                            : '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}',
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                _buildGender(
                  title: 'Gender',
                  options: _genderOptions,
                  selectedOption: _selectedGender,
                  onOptionSelected: (value) {
                    setState(() {
                      _selectedGender = value;
                    });
                  },
                ),
                const SizedBox(height: 16),
                Center(
                  child: ElevatedButton(
                    onPressed: _pickProfilePicture,
                    child: const Text('Pick Profile Picture'),
                  ),
                ),
                const SizedBox(height: 16),
                if (_profilePicture != null) ...[
                  const Center(
                    child: Text('Profile Picture Selected'),
                  ),
                  const SizedBox(height: 8),
                  Center(
                    child: Image.file(
                      _profilePicture! ,
                      width: 100,
                      height: 100,
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
                Center(
                  child: ElevatedButton(
                    onPressed: _submitForm,
                    child: const Text('Submit'),
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
