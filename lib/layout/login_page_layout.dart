import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../shared/components/components.dart';
// Import the register screen file

class LoginScreenLayout extends StatefulWidget {
  const LoginScreenLayout({super.key});

  @override
  State<LoginScreenLayout> createState() => _LoginScreenLayoutState();
}

class _LoginScreenLayoutState extends State<LoginScreenLayout> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool isPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blue[400] ?? Colors.white,
              Colors.blue[200] ?? Colors.white,
              Colors.blue[100] ?? Colors.white,
              Colors.blue[100] ?? Colors.white,
              Colors.blue[50] ?? Colors.white,
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.all(21.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Sign in',
                      style: TextStyle(
                        fontSize: 50,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Welcome to Volami ✈︎ ',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white.withOpacity(0.8),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60),
                  ),
                ),
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(top: 60, left: 40, right: 40),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        defaultFormField(
                          controller: emailController,
                          textInputType: TextInputType.emailAddress,
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return "Email Address is required";
                            }
                            return null;
                          },
                          prefixIcon: const Icon(Icons.email),
                          label: "Email Address",
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        defaultFormField(
                          controller: passwordController,
                          textInputType: TextInputType.text,
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return "Password is required";
                            }
                            return null;
                          },
                          prefixIcon: const Icon(Icons.lock),
                          label: "Password",
                          suffixIconButton: IconButton(
                            onPressed: () {
                              setState(() {
                                isPassword = !isPassword;
                              });
                            },
                            icon: Icon(
                              isPassword
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                          ),
                          isPassword: isPassword,
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        // login button
                        defaultButton(
                          function: () async {
                            try {
                              final credential = await FirebaseAuth.instance
                                  .signInWithEmailAndPassword(
                                      email: emailController.text,
                                      password: passwordController.text);
                              Navigator.of(context)
                                  .pushReplacementNamed('/home_page');
                            } on FirebaseAuthException catch (e) {
                              if (e.code == 'user-not-found') {
                                print('No user found for that email.');
                              } else if (e.code == 'wrong-password') {
                                print('Wrong password provided for that user.');
                              }
                            }
                          },
                          text: 'LOGIN',
                          radius: 15,
                          textSize: 20,
                        ),
                        // register now
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Don\'t have an account?'),
                            TextButton(
                              onPressed: () {
                                // Navigate to the register screen
                                Navigator.of(context)
                                    .pushReplacementNamed('/register_page');
                              },
                              child: const Text(
                                'Register Now',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                          ],
                        ),
                        // forgot password
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Forgot your password?'),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .pushReplacementNamed('/reset_password');
                              },
                              child: const Text(
                                'Reset Password',
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
