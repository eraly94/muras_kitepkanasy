import 'package:flutter/material.dart';
import 'package:muras_kitepkanasy/pages/sign_in_page/sign_up_page.dart';
import 'package:muras_kitepkanasy/widgets/text_from_field.dart';

import '../../widgets/elevated_button.dart';

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
        builder: (context) => const SignUpPage(),
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
        child: Form(
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 100,
                ),
                const Icon(
                  Icons.email,
                  color: Colors.black,
                  size: 100,
                ),
                const SizedBox(
                  height: 70,
                ),
                TextFormFieldwidget(
                  controller: _emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Почта не может быть пустой';
                    } else if (value != _emailController) {
                      return 'Неправильная почта';
                    }
                    return null;
                  },
                  obscureText: false,
                  hintText: 'Введите почту',
                ),
                const SizedBox(
                  height: 70,
                ),
                TextFormFieldwidget(
                  controller: _passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Пароль не может быть пустой';
                    } else if (value != _emailController) {
                      return 'Неправильный пароль';
                    }
                    return null;
                  },
                  obscureText: false,
                  hintText: 'Введите пароль',
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButtonWidget(
                  onPressed: _goToHomePage,
                  text: 'Войти',
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'У вас еще нет учетной записи?',
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: _goToSignUp,
                      child: const Text(
                        'Зарегистрироваться',
                        style: TextStyle(color: Colors.redAccent, fontSize: 18),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
