import 'package:flutter/material.dart';
import 'package:muras_kitepkanasy/constants/app_text_styles.dart';
import 'package:muras_kitepkanasy/pages/book_list_page.dart';
import 'package:muras_kitepkanasy/pages/sign_up_page.dart';
import 'package:muras_kitepkanasy/widgets/text_from_field.dart';

import '../widgets/elevated_button.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
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

                    // validator: (value) {
                    //   if (value == null || value.isEmpty) {
                    //     return 'Почта не может быть пустой';
                    //   } else if (value != _emailController) {
                    //     return 'Неправильная почта';
                    //   }
                    //   return null;
                    // },
                    //obscureText: false,
                    hintText: '',
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  MyTextField(
                    controller: _passwordController,
                    labelText: 'Сыр сөзүңүз',
                    icon: const Icon(Icons.lock),
                    //   validator: (value) {
                    //     if (value == null || value.isEmpty) {
                    //       return 'Пароль не может быть пустой';
                    //     } else if (value != _emailController) {
                    //       return 'Неправильный пароль';
                    //     }
                    //     return null;
                    //   },
                    //   obscureText: false,
                    //   hintText: 'Введите пароль',
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  ElevatedButtonWidget(
                    onPressed: _goToHomePage,
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
