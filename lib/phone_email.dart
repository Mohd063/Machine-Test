import 'package:flutter/material.dart';
import 'otp_screen.dart'; // Make sure this file exists

class EnterPhoneOrEmailScreen extends StatefulWidget {
  const EnterPhoneOrEmailScreen({super.key});

  @override
  State<EnterPhoneOrEmailScreen> createState() => _EnterPhoneOrEmailScreenState();
}

class _EnterPhoneOrEmailScreenState extends State<EnterPhoneOrEmailScreen> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool isValid = false;
  bool isPhoneMode = true;

  @override
  void initState() {
    super.initState();
    phoneController.addListener(_checkValidation);
    emailController.addListener(_checkValidation);
  }

  void _checkValidation() {
    setState(() {
      if (isPhoneMode) {
        isValid = phoneController.text.length == 10;
      } else {
        isValid = emailController.text.contains('@') && emailController.text.contains('.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // 🖼️ Image + Back button
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(top: 60),
                    child: Image.asset(
                      'assets/a2.png',
                      height: 130,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Positioned(
                    top: 20,
                    left: 0,
                    child: IconButton(
                      icon: const Icon(Icons.keyboard_arrow_left, size: 40, color: Colors.black),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 40),

              // 🔘 Toggle Phone/Email
              Center(
                child: Container(
                  width: 250,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Row(
                    children: [
                      // 📱 Phone
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isPhoneMode = true;
                              _checkValidation();
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                              color: isPhoneMode
                                  ? const Color.fromARGB(255, 190, 50, 40)
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              'Phone',
                              style: TextStyle(
                                color: isPhoneMode ? Colors.white : Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),

                      // 📧 Email
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isPhoneMode = false;
                              _checkValidation();
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                              color: !isPhoneMode
                                  ? const Color.fromARGB(255, 184, 43, 33)
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              'Email',
                              style: TextStyle(
                                color: !isPhoneMode ? Colors.white : Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // 📍 Static Heading
              Padding(
            padding: EdgeInsets.only(
  left: 00,
  right: isPhoneMode ? 30 : 70.5,  // 👈 condition based on mode
),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Glad to see you!',
                      style: TextStyle(
                        fontSize: 38,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(184, 0, 0, 0),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      isPhoneMode
                          ? 'Please provide your phone number'
                          : 'Please provide your email',
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // 📱 OR 📧 Input Field
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextFormField(
                  controller: isPhoneMode ? phoneController : emailController,
                  keyboardType: isPhoneMode
                      ? TextInputType.number
                        : TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: isPhoneMode ? 'Phone' : 'Email',
                    labelStyle: const TextStyle(color: Colors.grey),
                  ),
                  validator: (value) {
                    if (isPhoneMode) {
                      if (value == null || value.length != 10) {
                        return 'Please enter a valid 10-digit phone number';
                      }
                    } else {
                      if (value == null ||
                          !value.contains('@') ||
                          !value.contains('.')) {
                        return 'Please enter a valid email';
                      }
                    }
                    return null;
                  },
                ),
              ),

              const SizedBox(height: 50),

              // 🔘 Send Code Button
              SizedBox(
                width: 350,
                height: 55,
                child: ElevatedButton(
                  onPressed: isValid
                      ? () {
                          if (_formKey.currentState!.validate()) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => const OtpScreen()),
                            );
                          }
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isValid
                        ? const Color.fromARGB(255, 186, 52, 42)
                        : Colors.red.shade100,
                    foregroundColor: Colors.white,
                    disabledBackgroundColor: Colors.red.shade100,
                    disabledForegroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Send Code',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
