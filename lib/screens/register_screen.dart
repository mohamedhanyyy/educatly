import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskaty/screens/login_screen.dart';
import 'package:taskaty/shared/themes/custom_button.dart';

import '../provider/auth_provider.dart';
import '../service/navigation/navigation.dart';
import '../shared/themes/input_decoration.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
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
              Text("Register and join Educatly",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15,color: Theme.of(context).cardColor)),

              const SizedBox(height: 20),
              TextFormField(
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'Empty name';
                    }
                    return null;
                  },
                  controller: nameController,
                  decoration:
                      customInputDecoration(hintText: 'Enter your name',
                      prefixIcon: const Icon(Icons.person)
                      )),
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
                      customInputDecoration(hintText: 'Enter your email',  prefixIcon: const Icon(Icons.email))),
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
                          prefixIcon: const Icon(Icons.remove_red_eye),
                          hintText: 'Enter your password')),
              const SizedBox(height: 20),
              Consumer<AuthintcationProvider>(
                  builder: (context, widget, child) {
                if (Provider.of<AuthintcationProvider>(context)
                    .isLoadingRegister) return const LoadingElevatedButton();
                return CustomElevatedButton(
                    onTap: () {
                     if(formKey.currentState!.validate()){
                       Provider.of<AuthintcationProvider>(context, listen: false)
                           .register(
                           email: emailController.text,
                           password: passwordController.text,
                           name: nameController.text);
                     }
                    },
                    buttonText: 'Register');
              }),
              const SizedBox(height: 5),
              GestureDetector(
                onTap: () {
                  AppNavigation.navigate(const LoginScreen());
                },
                child:   Text("Have an account? login now",style: TextStyle(
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
