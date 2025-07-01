import 'package:cs_flutter_task_app/singup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _goToSignupScreen();
  }

  Future<void> _goToSignupScreen() async {
    await Future.delayed(const Duration(seconds: 4)); // 3 sec delay is enough

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => SignupScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // 🖼️ Background Image
          Image.asset(
            'assets/a1.png',
            fit: BoxFit.cover,
          ),

          // 🔴 Centered Dotted Loader
          Center(
            child: SpinKitFadingCircle(  // 💡 Dotted Loader
              color: const Color.fromARGB(255, 173, 44, 35),
              size: 65.0,
            ),
          ),
        ],
      ),
    );
  }
}
