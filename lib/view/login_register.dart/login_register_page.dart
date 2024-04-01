import 'package:desafio_flutter_ambisis/services/auth_service.dart';
import 'package:desafio_flutter_ambisis/utils/widgets/entry_text_field.dart';
import 'package:desafio_flutter_ambisis/view/login_register.dart/widgets/submit_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginRegisterPage extends StatefulWidget {
  const LoginRegisterPage({super.key});

  @override
  State<LoginRegisterPage> createState() => _LoginRegisterPageState();
}

class _LoginRegisterPageState extends State<LoginRegisterPage> {
  String? errorMessage = '';
  bool isLogin = true;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future signInWithEmailAndPassword() async {
    try {
      await AuthService().signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
    } on FirebaseException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Future createUserWithEmailAndPassword() async {
    try {
      await AuthService().createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
    } on FirebaseException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ambisis'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            EntryTextField(
              controller: _emailController,
              title: 'Email',
              isObscure: false,
            ),
            EntryTextField(
              controller: _passwordController,
              title: 'Password',
              isObscure: true,
            ),
            const SizedBox(height: 16),
            Text(errorMessage ?? ''),
            SubmitButton(
              title: isLogin ? 'Login' : 'Register',
              onPressed: isLogin
                  ? signInWithEmailAndPassword
                  : createUserWithEmailAndPassword,
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  isLogin = !isLogin;
                });
              },
              child: Text(
                isLogin ? 'Register here' : 'Login Here',
              ),
            )
          ],
        ),
      ),
    );
  }
}
