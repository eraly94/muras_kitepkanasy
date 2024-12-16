import 'package:flutter/material.dart';
import 'package:muras_kitepkanasy/constants/app_text_styles.dart';
import 'package:muras_kitepkanasy/pages/book_list_page.dart';
import 'package:muras_kitepkanasy/pages/sign_up_page.dart';
import 'package:muras_kitepkanasy/widgets/text_from_field.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/elevated_button.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: AppTextStyles.f18w700.copyWith(color: Colors.redAccent),
        ),
        backgroundColor: Colors.grey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
 void _signIn() async {
  String email = _emailController.text;
  String password = _passwordController.text;

  // Retrieve registered credentials from SharedPreferences
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? registeredEmail = prefs.getString('registeredEmail');
  String? registeredPassword = prefs.getString('registeredPassword');

  if (email.isEmpty || password.isEmpty) {
    _showSnackBar('Please fill in all fields');
  } else if (registeredEmail == null || registeredPassword == null) {
    _showSnackBar('No registered account found. Please sign up first.');
  } else if (email != registeredEmail) {
    _showSnackBar('Email does not match our records');
  } else if (password != registeredPassword) {
    _showSnackBar('Incorrect password');
  } else {
    // Successful sign-in logic
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => BookListPage()),
    );
  }
}

 
  // final _formKey = GlobalKey<FormState>();

  void _goToHomePage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BookListPage(),
      ),
    );
  }

  void _goToSignUp() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SignUpPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            child: Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  const Text(
                    'Кирүү',
                    style: AppTextStyles.f16w700,
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  MyTextField(
                    controller: _emailController,
                    labelText: 'Email почтаңыз',
                    icon: const Icon(Icons.email),
                    hintText: '',
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  MyTextField(
                    controller: _passwordController,
                    labelText: 'Сыр сөзүңүз',
                    icon: const Icon(Icons.lock),
                    hintText: 'Введите пароль',
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  ElevatedButtonWidget(
                    onPressed: _signIn,
                    text: 'Кирүү',
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Каттала элексизби?',
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: _goToSignUp,
                        child: const Text(
                          'Катталуу',
                          style: TextStyle(color: Colors.blue, fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
