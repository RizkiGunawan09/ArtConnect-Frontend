import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;
  bool checkPrivacy = false;
  TextEditingController usernameController = TextEditingController();
  TextEditingController handphoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  void _showAlertDialog(String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _SignUp() {
    String username = usernameController.text.trim();
    String handphone = handphoneController.text.trim();
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();

    if (username.isEmpty ||
        handphone.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty) {
      _showAlertDialog('Error', 'All fields are required.');
      return;
    }

    if (password != confirmPassword) {
      _showAlertDialog('Error', 'Passwords do not match.');
      return;
    }

    if (!checkPrivacy) {
      _showAlertDialog('Error',
          'You must agree to the Privacy Policy and Terms of Use to continue.');
      return;
    }

    _showAlertDialog('Success', 'Registration successful.');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                "Let's create your account",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 20),
              TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                  filled: true,
                  fillColor: const Color.fromRGBO(240, 242, 245, 1),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7.5),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 15.0,
                    horizontal: 20.0,
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  labelStyle: const TextStyle(fontSize: 15),
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: handphoneController,
                decoration: InputDecoration(
                  labelText: 'No. Handphone',
                  filled: true,
                  fillColor: const Color.fromRGBO(240, 242, 245, 1),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7.5),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 15.0,
                    horizontal: 20.0,
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  labelStyle: const TextStyle(fontSize: 15),
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  filled: true,
                  fillColor: const Color.fromRGBO(240, 242, 245, 1),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7.5),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 15.0,
                    horizontal: 20.0,
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  labelStyle: const TextStyle(fontSize: 15),
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: passwordController,
                obscureText: !isPasswordVisible,
                decoration: InputDecoration(
                  labelText: 'Password',
                  suffixIcon: IconButton(
                    icon: Icon(isPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        isPasswordVisible = !isPasswordVisible;
                      });
                    },
                  ),
                  filled: true,
                  fillColor: const Color.fromRGBO(240, 242, 245, 1),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7.5),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 15.0,
                    horizontal: 20.0,
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  labelStyle: const TextStyle(fontSize: 15),
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: confirmPasswordController,
                obscureText: !isConfirmPasswordVisible,
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  suffixIcon: IconButton(
                    icon: Icon(isConfirmPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        isConfirmPasswordVisible = !isConfirmPasswordVisible;
                      });
                    },
                  ),
                  filled: true,
                  fillColor: const Color.fromRGBO(240, 242, 245, 1),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7.5),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 15.0,
                    horizontal: 20.0,
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  labelStyle: const TextStyle(fontSize: 15),
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Checkbox(
                    value: checkPrivacy,
                    onChanged: (value) {
                      setState(() {
                        checkPrivacy = value!;
                      });
                    },
                    checkColor: Colors.white, // Warna centang
                    fillColor:
                        MaterialStateProperty.resolveWith<Color>((states) {
                      if (states.contains(MaterialState.selected)) {
                        return Colors
                            .black; // Warna latar belakang saat checkbox terpilih
                      }
                      return Colors
                          .transparent; // Warna latar belakang saat checkbox tidak terpilih
                    }),
                  ),
                  const Text('I agree to Privacy Policy and Terms of Use',
                      style: TextStyle(color: Colors.black)),
                  const Spacer(),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _SignUp,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                child: const Text(
                  'Sign Up',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              const SizedBox(height: 20),
              const Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: Colors.black,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text('Or Sign Up With',
                        style: TextStyle(color: Colors.black)),
                  ),
                  Expanded(
                    child: Divider(
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/google.png',
                    height: 50,
                  ),
                  const SizedBox(width: 20),
                  Image.asset(
                    'assets/facebook.png',
                    height: 50,
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
