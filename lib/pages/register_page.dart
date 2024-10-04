import 'package:bracu_chat/services/auth/auth_service.dart';
import 'package:bracu_chat/components/button.dart';
import 'package:bracu_chat/components/text_field.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmController =
      TextEditingController();

  // change state
  final void Function()? onTap;

  RegisterPage({super.key, this.onTap});

  //register method
  void register(BuildContext context) {
    final _auth = AuthService();
    if (_passwordController.text == _passwordConfirmController.text) {
      try {
        _auth.signUpWithEmailPassword(
            _emailController.text, _passwordController.text);
      } catch (e) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text(e.toString()),
                ));
      }
    } else {
      showDialog(
          context: context,
          builder: (context) => const AlertDialog(
                title: Text("Passwords do not match!"),
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // logo
              Icon(
                Icons.message,
                size: 60,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(height: 50),

              // Greeting
              Text(
                "Create an account",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 50),

              // Authentication
              EnhancedTextField(
                hintText: 'Email',
                controller: _emailController,
              ),
              const SizedBox(height: 15),

              EnhancedTextField(
                hintText: 'Password',
                hideText: true,
                controller: _passwordController,
              ),
              const SizedBox(height: 15),

              EnhancedTextField(
                hintText: 'Confirm password',
                hideText: true,
                controller: _passwordConfirmController,
              ),
              const SizedBox(height: 50),

              EnhancedButton(
                text: "Register",
                onTap: () => register(context),
              ),
              const SizedBox(height: 50),

              //register
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already a member?",
                    style:
                        TextStyle(color: Theme.of(context).colorScheme.primary),
                  ),
                  GestureDetector(
                    onTap: onTap,
                    child: Text(
                      "Login",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary),
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
