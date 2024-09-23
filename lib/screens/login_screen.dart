import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskaty/screens/register_screen.dart';
import 'package:taskaty/service/navigation/navigation.dart';
import 'package:taskaty/shared/themes/custom_button.dart';

import '../provider/auth_provider.dart';
import '../shared/themes/input_decoration.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const SizedBox(height: 100),
              ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(
                    'assets/images/educ.png',
                    width: 150,
                    height: 150,
                  )),
              const SizedBox(height: 20),
                Text("Login and join Educatly",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15,color: Theme.of(context).cardColor)),
              const SizedBox(height: 20),
              TextFormField(
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'Empty email';
                    }
                    return null;
                  },
                  controller: emailController,
                  decoration:
                      customInputDecoration(
                          prefixIcon: Icon(Icons.email),

                          hintText: 'Enter your email')),
              const SizedBox(height: 20),
              TextFormField(
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'Empty password';
                    }
                    return null;
                  },
                  controller: passwordController,
                  obscureText: true,
                  decoration:
                      customInputDecoration(
                          prefixIcon: Icon(Icons.remove_red_eye),

                          hintText: 'Enter your password')),
              const SizedBox(height: 20),
              Consumer<AuthintcationProvider>(
                  builder: (context, widget, child) {
                if (Provider.of<AuthintcationProvider>(context).isLoadingLogin)
                  return const LoadingElevatedButton();
                return CustomElevatedButton(
                    onTap: () {
                      if(formKey.currentState!.validate())
                        {
                          Provider.of<AuthintcationProvider>(context, listen: false)
                              .login(emailController.text, passwordController.text);

                        }
                    },
                    buttonText: 'Login');
              }),
              const SizedBox(height: 5),
              GestureDetector(
                onTap: () {
                  AppNavigation.navigate(const RegisterScreen());
                },
                child:   Text("Don't have an account? register now",style: TextStyle(
                    color: Theme.of(context).cardColor
                ),),
              )
            ],
          ),
        ),
      ),
    );
  }
}
