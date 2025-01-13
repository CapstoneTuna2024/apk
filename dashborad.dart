import 'package:flutter/material.dart';
import 'package:ta_project/main.dart';
import 'grading.dart'; // Import the GradingPage
import 'profile.dart'; // Import the ProfilePage
import 'aboutus.dart'; // Import the AboutUsPage

void main() {
  runApp(MaterialApp(home: DashboardPage()));
}

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  final List<Widget> _pages = [
    BerandaPage(),
    GradingPage(),
    ProfilePage(),
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(
          parent: _controller, curve: Curves.easeInOutCubicEmphasized),
    );
    _controller.forward(); // Start the animation initially
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    if (_selectedIndex != index) {
      _controller.reverse().then((_) {
        setState(() {
          _selectedIndex = index;
        });
        _controller.forward();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScaleTransition(
        scale: _scaleAnimation,
        child: _pages[_selectedIndex],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.blue, // Pure blue color for the bar
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16), // Top left corner radius
            topRight: Radius.circular(16), // Top right corner radius
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
          child: BottomNavigationBar(
            showUnselectedLabels: true,
            selectedItemColor: Colors.black, // Active icon color
            unselectedItemColor: Colors.white, // Inactive icon color
            backgroundColor: Colors.blue, // Pure blue background
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Beranda',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.photo_camera_back_outlined),
                label: 'Grading',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }
}

class BerandaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue, // Blue background added here
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.logout_outlined,
            color: Colors.white, // Changed to white for better visibility
          ),
          onPressed: () {
            // Handle logout logic here, e.g., navigate to LoginPage
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => LoginPage()),
            );
          },
        ),
        title: Text(
          'Welcome USER', // Center text
          style: TextStyle(
            color: Colors.white, // Text color changed to white
            fontWeight: FontWeight.bold,
            fontSize: 18, // Font size
          ),
          textAlign: TextAlign.center, // Center align text
        ),
        centerTitle: true, // Centers the title within the AppBar
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(),
                  GestureDetector(
                    onTap: () {
                      // Navigate to AboutUsPage
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AboutUsPage()),
                      );
                    },
                    child: Text(
                      'About Us',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () =>
                          _showImageDialog(context, 'lib/images/tuna.jpg'),
                      child: _buildImageWithBorder('lib/images/tuna.jpg'),
                    ),
                    SizedBox(width: 10),
                    GestureDetector(
                      onTap: () =>
                          _showImageDialog(context, 'lib/images/tuna.png'),
                      child: _buildImageWithBorder('lib/images/tuna.png'),
                    ),
                    SizedBox(width: 10),
                    GestureDetector(
                      onTap: () =>
                          _showImageDialog(context, 'lib/images/tuna.jpg'),
                      child: _buildImageWithBorder('lib/images/tuna.jpg'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageWithBorder(String imagePath) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey, // Border color
          width: 2.0, // Border width
        ),
        borderRadius:
            BorderRadius.circular(8), // Rounded corners for the border
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8), // Same radius as border
        child: Image.asset(
          imagePath,
          width: 200,
          height: 200,
          fit: BoxFit.cover, // Ensures the image fills the area
        ),
      ),
    );
  }

  void _showImageDialog(BuildContext context, String imagePath) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(imagePath),
                  SizedBox(height: 8),
                  Text(
                    'Tap outside to close',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
