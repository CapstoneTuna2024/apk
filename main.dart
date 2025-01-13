import 'package:flutter/material.dart';
import 'dart:async'; // For timer functionality
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dashboard.dart';
import 'register.dart';
import 'firebase.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<Offset> _slideAnimation; // Added for sliding animation
  List<Animation<double>> _fadeAnimations = [];

  @override
  void initState() {
    super.initState();

    // Animation Controller
    _controller = AnimationController(
      duration: Duration(seconds: 2), // Total duration
      vsync: this,
    );

    // Scale animation for the logo
    _scaleAnimation = Tween<double>(
      begin: 4.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOutBack),
    );

    // Slide animation for moving logo and text up
    _slideAnimation = Tween<Offset>(
      begin: Offset(0.0, 0.0), // Start at current position
      end: Offset(0.0, -0.2), // Move up
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    // Individual fade animations for each word
    final List<double> wordIntervals = [0.4, 0.6, 0.8];
    for (var i = 0; i < wordIntervals.length; i++) {
      _fadeAnimations.add(
        Tween<double>(begin: 0.0, end: 8.0).animate(
          CurvedAnimation(
            parent: _controller,
            curve: Interval(wordIntervals[i], 1.0, curve: Curves.easeIn),
          ),
        ),
      );
    }

    _controller.forward();

    // Navigate to LoginPage after the animation completes
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SlideTransition(
          position: _slideAnimation, // Apply slide animation
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo Animation
              ScaleTransition(
                scale: _scaleAnimation,
                child: Image.asset(
                  'lib/images/tuna.png',
                  width: 200, // Default width
                  height: 200, // Default height
                ),
              ),
              SizedBox(height: 20),
              // Text Pop-Up Animation
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FadeTransition(
                    opacity: _fadeAnimations[0],
                    child: Text(
                      'Tuna',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff2196f3),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  FadeTransition(
                    opacity: _fadeAnimations[1],
                    child: Text(
                      'Grading',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff2196f3),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  FadeTransition(
                    opacity: _fadeAnimations[2],
                    child: Text(
                      'Application',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff2196f3),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false; // State to manage password visibility

  Future<void> _loginUser() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    try {
      // Authenticate the user with Firebase
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Navigate to the DashboardPage upon successful login
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => DashboardPage()),
      );
    } catch (e) {
      // Show error message for failed login
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Login failed: ${e.toString()}'),
        ),
      );
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'lib/images/tuna.png',
              width: 200, // Set a fixed width
              height: 200, // Set a fixed height
              fit: BoxFit.cover, // To maintain the aspect ratio
            ),
            SizedBox(height: 20),
            Text(
              'Tuna Grading Application',
              style: TextStyle(
                fontSize: 24,
                color: Color(0xff2196f3),
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _passwordController,
              obscureText: !_isPasswordVisible, // Toggle password visibility
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(
                    _isPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _loginUser,
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff2196f3),
                minimumSize: Size(double.infinity, 50), // Full-width button
              ),
              child: Text(
                'Login',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account? "), // Non-clickable text
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterPage()),
                    );
                  },
                  child: Text("Register here"), // Clickable text
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MaterialApp(
    home: SplashScreen(),
    debugShowCheckedModeBanner: false,
  ));
}
