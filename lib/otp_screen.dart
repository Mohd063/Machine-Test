import 'package:cs_flutter_task_app/home.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final List<FocusNode> _focusNodes = List.generate(4, (_) => FocusNode());
  final List<TextEditingController> _controllers =
      List.generate(4, (_) => TextEditingController());

  int secondsRemaining = 120; // 2 minutes = 120 seconds
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (secondsRemaining > 0) {
        setState(() => secondsRemaining--);
      } else {
        _timer?.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String _formatTime(int seconds) {
    final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    final secs = (seconds % 60).toString().padLeft(2, '0');
    return '$minutes:$secs';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔙 Back Button
            Padding(
              padding: const EdgeInsets.only(top: 40, left: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.keyboard_arrow_left,
                        size: 40, color: Colors.black),
                    onPressed: () => Navigator.pop(context),
                  ),
                   IconButton(
                    icon: const Icon(Icons.keyboard_arrow_right,
                        size: 40, color: Colors.black),
                    onPressed: () => Navigator.pushReplacement(context 
                        , MaterialPageRoute(builder: (_) => HomeScreen()),
                  ),)
                ],
              ),
            ),

            const SizedBox(height: 20),

            // 🖼️ Image
            Padding(
              padding: const EdgeInsets.only(right: 200),
              child: Center(
                child: Image.asset(
                  'assets/a3.png', // replace with your image path
                  height: 150,
                  fit: BoxFit.contain,
                ),
              ),
            ),

            const SizedBox(height: 40),

            // 🧾 "OTP Verification" Heading
            const Padding(
              padding: EdgeInsets.only(left: 30),
              child: Text(
                'OTP Verification',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // 📩 Subtext
            const Padding(
              padding: EdgeInsets.only(left: 30),
              child: Text(
                'We have sent a unique OTP number\nto your mobile +91-2222222222',
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.grey,
                ),
              ),
            ),

            const SizedBox(height: 30),

            // 🔢 OTP Boxes (4)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(4, (index) {
                  return SizedBox(
                    width: 60,
                    child: TextField(
                      controller: _controllers[index],
                      focusNode: _focusNodes[index],
                      keyboardType: TextInputType.number,
                      maxLength: 1,
                      style: const TextStyle(fontSize: 24),
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        counterText: '',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                      onChanged: (value) {
                        if (value.isNotEmpty && index < 3) {
                          FocusScope.of(context)
                              .requestFocus(_focusNodes[index + 1]);
                        }
                      },
                    ),
                  );
                }),
              ),
            ),

            const SizedBox(height: 20),

            // ⏳ Timer + Send Again
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _formatTime(secondsRemaining),
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: secondsRemaining == 0
                        ? () {
                            setState(() {
                              secondsRemaining = 120;
                              _startTimer();
                            });
                          }
                        : null,
                    child: const Text(
                      'Send Again',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
