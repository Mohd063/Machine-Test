import 'package:cs_flutter_task_app/phone_email.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController referralController = TextEditingController();
 bool _obscurePassword = true;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // ✅ Stack: Back icon (fixed) + Image (customizable)
              Stack(
                children: [
                  // 🖼️ Image – You can adjust height freely
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(top: 60),
                    child: Image.asset(
                      'assets/a2.png',
                      height: 130, // 👈 You can change this anytime
                      fit: BoxFit.contain,
                    ),
                  ),

                  // 🔙 Back icon (top-left fixed)
                  Positioned(
                    top: 20,
                    left: 0,
                    child: IconButton(
                      icon: const Icon(Icons.keyboard_arrow_left,
                          size: 40, color: Colors.black),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

Padding(
  padding: const EdgeInsets.symmetric(horizontal: 5), // 👈 left + right 5px
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start, // 👈 left align within column
    children: const [
      SizedBox(height: 20),

      // 📝 Title
      Text(
        'Let\'s Begin!',
        style: TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(184, 0, 0, 0),
        ),
      ),

      SizedBox(height: 10),

      // 📝 Subtitle
      Text(
        'Please enter your credentials to proceed',
        style: TextStyle(
          fontSize: 18,
          color: Colors.grey,
        ),
      ),
      
    ],
  ),
),
              const SizedBox(height: 30),

              // 📧 Email (without icon)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: 'Your Email',
                    labelStyle: TextStyle(color: Colors.grey),
                    
                  ),
                  validator: (value) {
                    if (value == null || !value.contains('@')) {
                      return 'Enter valid email';
                    }
                    return null;
                  },
                ),
              ),

              const SizedBox(height: 15),

              // 🔒 Password with eye icon
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextFormField(
                  controller: passwordController,
                  obscureText: _obscurePassword,
                  decoration: InputDecoration(
                    labelText: 'Create Password',
                    labelStyle: TextStyle(color: Colors.grey),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                            color: Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                ),
              ),

              const SizedBox(height: 15),

              // 🎁 Referral Code
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextFormField(
                  controller: referralController,
                  decoration: const InputDecoration(
                    labelText: 'Referral Code (Optional)',
                    labelStyle: TextStyle(color: Colors.grey),
                  ),
                ),
              ),

              ],
          ),
        ),
      ),

      // 🔴 FAB
      floatingActionButton: SizedBox(
        height: 70,
        width: 80,
        child: FloatingActionButton(
          backgroundColor: const Color.fromARGB(255, 186, 52, 42),
          child: const Icon(Icons.arrow_forward, color: Colors.white, size: 30),
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) =>
                      const EnterPhoneOrEmailScreen(),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
