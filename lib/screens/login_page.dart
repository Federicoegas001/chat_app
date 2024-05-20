import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intentofirebase/components/my_button.dart';
import 'package:intentofirebase/components/my_text_field.dart';
import 'package:intentofirebase/services/auth/auth_services.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.onTap});
  final void Function() onTap;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var _emailController = TextEditingController();
  var _passwordController = TextEditingController();

  void signIn() async {
    final authService = Provider.of<AuthService>(context, listen: false);

    try {
      await authService.signInWithEmailandPassword(
          _emailController.text, _passwordController.text);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            e.toString(),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  //login
                  const Center(
                    child: Icon(
                      Icons.message,
                      size: 100,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  //welcome back message
                  const Text(
                    "Welcome back you've been missed",
                    style: TextStyle(fontSize: 16),
                  ),

                  const SizedBox(
                    height: 50,
                  ),

                  // email textfield
                  MyTextField(
                      controller: _emailController,
                      hint: 'email',
                      obsecureText: false),

                  const SizedBox(
                    height: 10,
                  ),

                  // password textfield
                  MyTextField(
                      controller: _passwordController,
                      hint: 'Passwrod',
                      obsecureText: true),

                  const SizedBox(
                    height: 25,
                  ),
                  //sign in
                  MyButton(onTap: signIn, text: 'Sign in'),
                  const SizedBox(
                    height: 25,
                  ),

                  //register
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Not a member?'),
                      const SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: const Text(
                          'Register',
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
