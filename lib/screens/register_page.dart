import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intentofirebase/components/my_button.dart';
import 'package:intentofirebase/components/my_text_field.dart';
import 'package:intentofirebase/services/auth/auth_services.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key, required this.onTap});
  final void Function() onTap;

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();

  void signUp() {
    final authservice = Provider.of<AuthService>(context, listen: false);
    if (passwordController.text == confirmPasswordController.text) {
      authservice.signUpWithEmailandPassword(
          emailController.text, passwordController.text);
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('no coinciden')));
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
                    "Let´s create an accoount for you!",
                    style: TextStyle(fontSize: 16),
                  ),

                  const SizedBox(
                    height: 50,
                  ),

                  // email textfield
                  MyTextField(
                      controller: emailController,
                      hint: 'email',
                      obsecureText: false),

                  const SizedBox(
                    height: 10,
                  ),

                  // password textfield
                  MyTextField(
                      controller: passwordController,
                      hint: 'Passwrod',
                      obsecureText: true),

                  const SizedBox(
                    height: 10,
                  ),

                  //confirm password
                  MyTextField(
                      controller: confirmPasswordController,
                      hint: 'Confirm Password',
                      obsecureText: true),

                  const SizedBox(
                    height: 25,
                  ),

                  //sign in
                  MyButton(onTap: signUp, text: 'Sign up'),
                  const SizedBox(
                    height: 25,
                  ),

                  //register
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Already a member?'),
                      const SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: const Text(
                          'Login now',
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
