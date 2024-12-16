import 'package:flutter/material.dart';
import 'package:muras_kitepkanasy/constants/app_text_styles.dart';
import 'package:muras_kitepkanasy/pages/book_list_page.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Register',
          style: AppTextStyles.f28w700.copyWith(color: Colors.white),
        ),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Register',
                style: AppTextStyles.f16w700.copyWith(color: Colors.grey),
              ),
              _TextField(
                  controller: _nameController,
                  text: 'Full name',
                  icon: const Icon(Icons.person)),
              _TextField(
                controller: _emailController,
                text: 'Email',
                icon: const Icon(Icons.email),
              ),
              _TextField(
                  controller: _phoneController,
                  text: 'Phone number',
                  icon: const Icon(Icons.phone)),
              _TextField(
                  controller: _passwordController,
                  text: 'Password',
                  icon: const Icon(Icons.lock)),
              _TextField(
                  controller: _confirmPasswordController,
                  text: 'Confirm password',
                  icon: const Icon(Icons.lock)),
              const SizedBox(height: 70),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    //  Navigator.push(context, MaterialPageRoute(builder: (context)=> SignInPage(),));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already have an account?',
                    style: AppTextStyles.f16,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  TextButton(
                    onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> BookListPage(),));

                    },
                    child:  Text(
                      ' Sign In',
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

class _TextField extends StatelessWidget {
  final TextEditingController controller;
  final String text;
  final Widget icon;

  const _TextField(
      {required this.controller, required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        TextField(
          controller: controller,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: text,
            prefixIcon: icon,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ],
    );
  }
}
