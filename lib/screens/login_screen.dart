import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/bloc/cubit.dart';
import 'package:news/bloc/states.dart';
import 'package:news/firebase_manager/firebase_auth.dart';
import 'package:news/items/text_field_item.dart';
import 'package:news/screens/home_screen.dart';
import 'package:news/screens/register_screen.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = "LoginScreen";

  LoginScreen({super.key});

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Login",
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 50),
          child: Form(
            key: formKey,
            child: BlocProvider(
              create: (context) => HomeCubit(),
              child: BlocBuilder<HomeCubit, HomeStates>(
                builder: (context, state) {
                  var bloc = BlocProvider.of<HomeCubit>(context);
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 24, bottom: 16),
                        child: TextFieldItem(
                            lable: "Email",
                            controller: emailController,
                            validate: (String? value) {
                              if (value == null || value.isEmpty) {
                                return "Email required";
                              }
                            },
                            onSearch: (v) {},
                            prefixIcon: Icon(Icons.mail)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 30),
                        child: TextFieldItem(
                          lable: "Password",
                          controller: passwordController,
                          validate: (String? value) {
                            if (value == null || value.isEmpty) {
                              return "Password required";
                            }
                            return null;
                          },
                          onSearch: (v) {},
                          prefixIcon: Icon(Icons.lock),
                          isObscure: bloc.isObscure == false ? false : true,
                          suffixIcon: InkWell(
                              onTap: () {
                                bloc.changePassVisibility();
                              },
                              child: bloc.isObscure == false
                                  ? Icon(Icons.visibility_off)
                                  : Icon(Icons.visibility_rounded)),
                        ),
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xff171717),
                              padding: EdgeInsets.symmetric(vertical: 15)),
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              FirebaseAuthentication.login(
                                emailAddress: emailController.text,
                                password: passwordController.text,
                                onLoading: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: Center(
                                          child: CircularProgressIndicator(
                                        color: Theme.of(context)
                                            .unselectedWidgetColor,
                                      )),
                                      backgroundColor: Colors.transparent,
                                    ),
                                  );
                                },
                                onSuccess: () {
                                  Navigator.pushNamedAndRemoveUntil(
                                    context,
                                    HomeScreen.routeName,
                                    (route) => false,
                                  );
                                },
                                onError: (massage) {
                                  Navigator.pop(context);
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: Text("Some thing went Wrong"),
                                      content: Text(massage),
                                      actions: [
                                        ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.white),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text("Ok")),
                                      ],
                                    ),
                                  );
                                },
                              );
                            }
                          },
                          child: Text(
                            "Log in",
                            style: Theme.of(context).textTheme.titleMedium,
                          )),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don’t Have Account ?",
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, RegisterScreen.routeName);
                              },
                              child: Text(
                                "Create Account",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                        color: Theme.of(context)
                                            .unselectedWidgetColor,
                                        decoration: TextDecoration.underline,
                                        decorationColor: Theme.of(context)
                                            .unselectedWidgetColor,
                                        decorationThickness: 2),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: Divider(
                            color: Theme.of(context).unselectedWidgetColor,
                            indent: 26,
                            endIndent: 16,
                          )),
                          Text("Or",
                              style: Theme.of(context).textTheme.titleSmall),
                          Expanded(
                              child: Divider(
                            color: Theme.of(context).unselectedWidgetColor,
                            indent: 16,
                            endIndent: 24,
                          )),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 24),
                        child: InkWell(
                          onTap: () {
                            FirebaseAuthentication.signInWithGoogle(context);
                          },
                          child: Container(
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Theme.of(context).unselectedWidgetColor,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.g_mobiledata, color: Colors.white),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    "Login with Google",
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
