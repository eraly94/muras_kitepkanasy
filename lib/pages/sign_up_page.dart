import 'package:flutter/material.dart';
import 'package:muras_kitepkanasy/constants/app_text_styles.dart';
import 'package:muras_kitepkanasy/pages/sign_in_page.dart';
import 'package:muras_kitepkanasy/widgets/text_from_field.dart';

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
              SizedBox(height: 100),
              Text(
                'Катталуу',
                style: AppTextStyles.f18w700,
              ),
              MyTextField(
                  controller: _nameController,
                  labelText: 'Толук аты жөнүңөр',
                  icon: const Icon(Icons.person)),
              MyTextField(
                controller: _emailController,
                labelText: 'Email почтаңыз',
                icon: const Icon(Icons.email),
              ),
              MyTextField(
                  controller: _phoneController,
                  labelText: 'Телефон номерииз',
                  icon: const Icon(Icons.phone)),
              MyTextField(
                  controller: _passwordController,
                  labelText: 'Сыр сөзүңүз',
                  icon: const Icon(Icons.lock)),
              MyTextField(
                  controller: _confirmPasswordController,
                  labelText: 'Сыр сөз тастыктоо',
                  icon: const Icon(Icons.lock)),
              const SizedBox(height: 70),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignInPage(),
                        ));
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
                            builder: (context) => const SignInPage(),
                          ));
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
