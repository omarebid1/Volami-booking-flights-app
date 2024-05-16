import 'package:flutter/material.dart';
import '../shared/components/components.dart';

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
                      'Sign In',
                      style: TextStyle(
                        fontSize: 50,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Welcome to Volami... ',
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
                        defaultButton(
                          function: () {
                            /*if (formKey.currentState!.validate()) {
                              if (checkLogin(emailController.text,
                                  passwordController.text)) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const HomeScreenLayout(),
                                  ),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content:
                                        Text('Incorrect email or password'),
                                    backgroundColor: Colors
                                        .red, // Optional: Change snack-bar color
                                  ),
                                );
                              }
                            }*/
                            Navigator.of(context)
                                .pushReplacementNamed("/homePage");
                          },
                          text: 'LOGIN',
                          radius: 15,
                          textSize: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Don\'t have an account?'),
                            TextButton(
                              onPressed: () {
                                // Navigate to the register screen
                                Navigator.of(context)
                                    .pushReplacementNamed("/signUp");
                              },
                              child: const Text(
                                'Register Now',
                                style: TextStyle(color: Colors.grey),
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
