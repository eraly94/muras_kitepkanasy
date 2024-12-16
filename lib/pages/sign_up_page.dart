import 'package:flutter/material.dart';
import 'package:muras_kitepkanasy/constants/app_text_styles.dart';
import 'package:muras_kitepkanasy/pages/book_list_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  Future<void> _userRegister() async{
    final String name= _nameController.text;
    final String email = _emailController.text;
    final String phone = _phoneController.text;
    final String password = _passwordController.text;
    final String confirmPassword  =_confirmPasswordController.text;


    if (name.isEmpty || email.isEmpty || phone.isEmpty|| password.isEmpty|| confirmPassword.isEmpty) {
      _showSnackBar('Please fill in all fields');
      return;}


     if (password!=confirmPassword) {
       _showSnackBar('Password dont match');
       return;
     } 

     try { SharedPreferences prefs = await SharedPreferences.getInstance();
     await prefs.setString('name', name);
     await prefs.setString('email', email);
     await prefs.setString('phone', phone);
     await prefs.setString('password', password);

      _showSnackBar('Registration is successful!!!');

       Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => BookListPage()));
       
     } catch (e) {
       _showSnackBar('Error saving data $e');
     }
    
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
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
                   _userRegister();
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
                                                          // SignInPage();
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
