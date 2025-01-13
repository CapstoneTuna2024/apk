import 'package:flutter/material.dart';
import 'package:ta_project/dashboard.dart';
import 'package:ta_project/grading.dart';
import 'editprofile.dart';

// Import the EditProfilePage

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFF003f5c), // Background color matching the design
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
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            // Full Name Input
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  const Icon(Icons.person, color: Colors.blue, size: 30),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Nama Lengkap',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Email Input
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  const Icon(Icons.email, color: Colors.blue, size: 30),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Email',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            // Edit Profile Button
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EditProfile()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2f668b), // Button color
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text(
                'EDIT PROFILE',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white, // Change the text color here
                ),
              ),
            ),
            const Spacer(),
            // Bottom Navigation Bar
            // Container(
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
            //             MaterialPageRoute(
            //                 builder: (context) => DashboardPage()),
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
          ],
        ),
      ),
    );
  }
}
