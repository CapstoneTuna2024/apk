import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  bool _obscurePassword = true; // For password field
  bool _obscureConfirmPassword = true; // For confirm password field

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFF003f5c), // Background color
        child: Column(
          children: [
            // Top Circle with "User" text
            Container(
              height: 200,
              decoration: const BoxDecoration(
                color: Color(0xFF2f668b), // Blue circle background color
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(100),
                ),
              ),
              child: const Center(
                child: Text(
                  'USER',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            // Input fields for "Nama Lengkap", "Email", "Password", and "Masukkan Ulang Password"
            _buildInputField(
              icon: Icons.person,
              hintText: 'Nama Lengkap',
            ),
            const SizedBox(height: 20),
            _buildInputField(
              icon: Icons.email,
              hintText: 'Email',
            ),
            const SizedBox(height: 20),
            _buildInputField(
              icon: Icons.lock,
              hintText: 'Password',
              obscureText: _obscurePassword,
              toggleVisibility: () {
                setState(() {
                  _obscurePassword = !_obscurePassword;
                });
              },
            ),
            const SizedBox(height: 20),
            _buildInputField(
              icon: Icons.lock,
              hintText: 'Masukkan Ulang Password',
              obscureText: _obscureConfirmPassword,
              toggleVisibility: () {
                setState(() {
                  _obscureConfirmPassword = !_obscureConfirmPassword;
                });
              },
            ),
            const SizedBox(height: 30),
            // Cancel and Submit buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Go back to the profile page
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        const Color(0xFF2f668b), // Cancel button color
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'CANCEL',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white, // Change the text color here
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    // Handle submit action
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        const Color(0xFF2f668b), // Submit button color
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'SUBMIT',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white, // Change the text color here
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            // Bottom Navigation Bar
            // Container(
            //   height: 60,
            //   decoration: const BoxDecoration(
            //     color: Colors.blue,
            //     borderRadius: BorderRadius.vertical(
            //       top: Radius.circular(20),
            //     ),
            //   ),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //     children: [
            //       IconButton(
            //         icon: const Icon(Icons.home, color: Colors.white),
            //         onPressed: () {
            //           _showPopupDialog(context);
            //         },
            //       ),
            //       IconButton(
            //         icon: const Icon(Icons.camera_alt_outlined,
            //             color: Colors.white),
            //         onPressed: () {
            //           _showPopupDialog(context);
            //         },
            //       ),
            //       IconButton(
            //         icon: const Icon(Icons.person, color: Colors.white),
            //         onPressed: () {
            //           _showPopupDialog(context);
            //         },
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  // Helper method to create an input field
  Widget _buildInputField({
    required IconData icon,
    required String hintText,
    bool obscureText = false,
    VoidCallback? toggleVisibility,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Icon(icon, color: Colors.blue, size: 30),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              obscureText: obscureText,
              decoration: InputDecoration(
                hintText: hintText,
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                suffixIcon: toggleVisibility != null
                    ? IconButton(
                        icon: Icon(
                          obscureText ? Icons.visibility_off : Icons.visibility,
                        ),
                        onPressed: toggleVisibility,
                      )
                    : null,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Function to show a pop-up dialog
  void _showPopupDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: const Text('Warning'),
          content: const Text('Fill the data or cancel'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
