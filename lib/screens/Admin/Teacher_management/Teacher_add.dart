import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

FirebaseFirestore db = FirebaseFirestore.instance;
final CollectionReference teachersCollection = db.collection('Teacher');
final CollectionReference userCollection = db.collection('User');

Future<void> addTeacher(String documentId, Map<String, dynamic> formData) {
  return teachersCollection
      .doc(documentId)
      .set(formData)
      .then((value) => print("Teacher added"))
      .catchError((error) => print("Failed to add Teacher: $error"));
}

Future<void> addUserTeacher(String documentId, Map<String, dynamic> userTeacherData) {
  return userCollection
      .doc(documentId)
      .set(userTeacherData)
      .then((value) => print("Teacher user added"))
      .catchError((error) => print("Failed to add user teacher: $error"));
}

class TeacherAdd extends StatefulWidget {
  const TeacherAdd({Key? key}) : super(key: key);

  @override
  _TeacherAddState createState() => _TeacherAddState();
}

class _TeacherAddState extends State<TeacherAdd> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _contactController = TextEditingController();

  DateTime? _selectedDate;
  String _selectedGender = 'Male';
  String? _profilePictureUrl;

  final List<String> _genderOptions = ['Male', 'Female', 'Other'];

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

  Future<void> _pickProfilePicture() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );

    if (result != null && result.files.isNotEmpty) {
      String? filePath = result.files.first.path;
      setState(() {
        _profilePictureUrl = filePath;
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
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please select a gender';
              }
              return null;
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

  void _submitForm() {
    String teacherId = _firstNameController.text + _contactController.text;
    final userTeacherData = {
      'role': 'teacher',
      'username': _emailController.text,
      'password': _contactController.text,
      'uid': _firstNameController.text + _contactController.text,
    };
    addUserTeacher(teacherId, userTeacherData);

    final formData = {
      'firstName': _firstNameController.text,
      'lastName': _lastNameController.text,
      'email': _emailController.text,
      'contact': _contactController.text,
      'teacherId': _firstNameController.text + _contactController.text,
      'dateOfBirth': _selectedDate.toString(),
      'gender': _selectedGender,
      'profilePictureUrl': _profilePictureUrl,
    };

    addTeacher(teacherId, formData).then((_) {
      _firstNameController.clear();
      _lastNameController.clear();
      _emailController.clear();
      _contactController.clear();
      setState(() {
        _selectedDate = null;
        _selectedGender = 'Male';
        _profilePictureUrl = null;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Teacher Add'),
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
                if (_profilePictureUrl != null)
                  Container(
                    alignment: Alignment.center,
                    child: Image.network(
                      _profilePictureUrl!,
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: _pickProfilePicture,
                  child: const Text('Upload Profile Picture'),
                ),
                const SizedBox(height: 32),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      _submitForm();
                    },
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
