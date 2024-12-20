// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:muras_kitepkanasy/constants/app_text_styles.dart';
import 'package:muras_kitepkanasy/pages/sign_in_page.dart';
import 'package:muras_kitepkanasy/widgets/text_from_field.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  Future<void> _userRegister() async {
    final String name = _nameController.text;
    final String email = _emailController.text;
    final String phone = _phoneController.text;
    final String password = _passwordController.text;
    final String confirmPassword = _confirmPasswordController.text;

    if (name.isNotEmpty ||
        email.isNotEmpty ||
        phone.isNotEmpty ||
        password.isNotEmpty ||
        confirmPassword.isNotEmpty) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('registeredName', name);
      await prefs.setString('registeredEmail', email);
      await prefs.setString('registeredPhone', phone);
      await prefs.setString('registeredPassword', password);

      _showSnackBar(
        'Катто  ийгиликтүү!!!',
      );

      Navigator.pushReplacement(
          // ignore: use_build_context_synchronously
          context,
          MaterialPageRoute(builder: (context) => const SignInPage()));
    } else {
      _showSnackBar('Баардык талаа толтурулушу зарыл!');
    }
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: AppTextStyles.f18w700.copyWith(color: Colors.redAccent),
        ),
        backgroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 100),
              const Text(
                'Катталуу',
                style: AppTextStyles.f18w700,
              ),
              MyTextField(
                controller: _nameController,
                labelText: 'Толук аты жөнүңөр',
                icon: const Icon(Icons.person),
              ),
              MyTextField(
                controller: _emailController,
                labelText: 'Email почтаңыз',
                icon: const Icon(Icons.email),
              ),
              MyTextField(
                controller: _phoneController,
                labelText: 'Телефон номерииз',
                icon: const Icon(Icons.phone),
              ),
              MyTextField(
                controller: _passwordController,
                labelText: 'Сыр сөзүңүз',
                icon: const Icon(Icons.lock),
              ),
              MyTextField(
                controller: _confirmPasswordController,
                labelText: 'Сыр сөз тастыктоо',
                icon: const Icon(Icons.lock),
              ),
              const SizedBox(height: 70),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    _userRegister();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Катталуу',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Аккаунтыңыз барбы?',
                    style: AppTextStyles.f16,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignInPage()));
                    },
                    child: Text(
                      'Кирүү',
                      style: AppTextStyles.f16.copyWith(color: Colors.blue),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
