import 'package:bracu_chat/services/auth/auth_service.dart';
import 'package:bracu_chat/components/button.dart';
import 'package:bracu_chat/components/text_field.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // change state
  final void Function()? onTap;

  LoginPage({super.key, this.onTap});

  //login method
  void login(BuildContext context) async {
    final authService = AuthService();
    try {
      await authService.signInWithEmailPassword(
        _emailController.text,
        _passwordController.text,
      );
    } catch (e) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text(e.toString()),
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
                "Greetings!",
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
              const SizedBox(height: 50),

              EnhancedButton(
                text: "Login",
                onTap: () => login(context),
              ),
              const SizedBox(height: 50),

              //register
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Not a member?",
                    style:
                        TextStyle(color: Theme.of(context).colorScheme.primary),
                  ),
                  GestureDetector(
                    onTap: onTap,
                    child: Text(
                      "Register",
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
