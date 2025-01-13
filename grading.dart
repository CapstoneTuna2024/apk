import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ta_project/dashboard.dart';
import 'package:ta_project/profile.dart';

class GradingPage extends StatefulWidget {
  @override
  _GradingPageState createState() => _GradingPageState();
}

class _GradingPageState extends State<GradingPage> {
  final _scoreController = TextEditingController();
  String _grade = '';
  String _message = '';
  File? _selectedImage; // Holds the picked image

  Color buttonBackgroundColor = Colors.blue; // Default button background color
  Color buttonTextColor = Colors.white; // Default button text color
  Color appBarColor = Colors.blue; // Default AppBar color
  Color appBarTextColor = Colors.white; // Default AppBar text color

  final ImagePicker _picker = ImagePicker(); // Initialize ImagePicker

  int _selectedIndex = 0;

  // Method to calculate grade
  void _calculateGrade() {
    setState(() {
      double score = double.tryParse(_scoreController.text) ?? 0;
      if (score >= 90) {
        _grade = 'A';
        _message = 'Excellent';
      } else if (score >= 80) {
        _grade = 'B';
        _message = 'Good';
      } else if (score >= 70) {
        _grade = 'C';
        _message = 'Satisfactory';
      } else if (score >= 60) {
        _grade = 'D';
        _message = 'Needs Improvement';
      } else {
        _grade = '-';
        _message = 'No image detected';
      }
    });
  }

  // Method to pick image from gallery or camera
  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Grading Page',
        ),
        automaticallyImplyLeading: false, // Removes the back arrow
        backgroundColor: appBarColor,
        foregroundColor: appBarTextColor,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  _showImageSourceSelector();
                },
                child: Container(
                  width: 300,
                  height: 200,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 2),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: _selectedImage == null
                      ? Center(
                          child: Text(
                            "Upload a picture",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 18,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        )
                      : Image.file(_selectedImage!, fit: BoxFit.cover),
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: 300,
                child: ElevatedButton(
                  onPressed: _calculateGrade,
                  child: Text('Grading'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: buttonBackgroundColor,
                    foregroundColor: buttonTextColor,
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              if (_grade.isNotEmpty)
                Text(
                  'Grade: $_grade\n$_message',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: Container(
      //   height: 60,
      //   decoration: BoxDecoration(
      //     color: Color(0xff2196f3),
      //     borderRadius: BorderRadius.vertical(
      //       top: Radius.circular(20),
      //     ),
      //   ),
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //     children: [
      //       IconButton(
      //         icon: Icon(Icons.home, color: Colors.white),
      //         onPressed: () {
      //           Navigator.push(
      //             context,
      //             MaterialPageRoute(builder: (context) => DashboardPage()),
      //           );
      //         },
      //       ),
      //       IconButton(
      //         icon: Icon(Icons.camera_alt_outlined, color: Colors.white),
      //         onPressed: () {
      //           Navigator.push(
      //             context,
      //             MaterialPageRoute(builder: (context) => GradingPage()),
      //           );
      //         },
      //       ),
      //       IconButton(
      //         icon: Icon(Icons.person, color: Colors.white),
      //         onPressed: () {
      //           Navigator.push(
      //             context,
      //             MaterialPageRoute(builder: (context) => ProfilePage()),
      //           );
      //         },
      //       ),
      //     ],
      //   ),
      // ),
    );
  }

  // Display dialog to select image source
  void _showImageSourceSelector() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog.adaptive(
        title: Text("Select Image Source"),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.camera_alt_outlined,
                      size: 50, color: Colors.black),
                  onPressed: () {
                    Navigator.pop(context);
                    _pickImage(ImageSource.camera);
                  },
                ),
                Text("Camera"),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.image, size: 50, color: Colors.black),
                  onPressed: () {
                    Navigator.pop(context);
                    _pickImage(ImageSource.gallery);
                  },
                ),
                Text("Gallery"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
