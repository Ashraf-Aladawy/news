import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/bloc/cubit.dart';
import 'package:news/bloc/states.dart';
import 'package:news/firebase_manager/firebase_auth.dart';
import 'package:news/items/text_field_item.dart';
import 'package:news/screens/login_screen.dart';

class RegisterScreen extends StatelessWidget {
  static const String routeName = "RegisterScreen";

  RegisterScreen({super.key});

  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var rePasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Register",
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: BlocProvider(
              create: (context) => HomeCubit(),
              child: BlocBuilder<HomeCubit, HomeStates>(
                builder: (context, state) {
                  var bloc = BlocProvider.of<HomeCubit>(context);
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 50, bottom: 16),
                        child: TextFieldItem(
                          lable: "Name",
                          controller: nameController,
                          prefixIcon: Icon(Icons.person),
                          validate: (String? value) {
                            if (value == null || value.isEmpty) {
                              return "Name required";
                            }
                          },
                          onSearch: (v) {},
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: TextFieldItem(
                          lable: "Email",
                          controller: emailController,
                          prefixIcon: Icon(Icons.mail),
                          validate: (String? value) {
                            if (value == null || value.isEmpty) {
                              return "Email required";
                            }
                            final bool emailFormate = RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(value);
                            if (emailFormate == false) {
                              return "Invalid email format";
                            }
                            return null;
                          },
                          onSearch: (v) {},
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: TextFieldItem(
                          lable: "Password",
                          controller: passwordController,
                          isObscure: bloc.isObscure == false ? false : true,
                          suffixIcon: InkWell(
                              onTap: () {
                                bloc.changePassVisibility();
                              },
                              child: bloc.isObscure == false
                                  ? Icon(Icons.visibility_off)
                                  : Icon(Icons.visibility_rounded)),
                          validate: (String? value) {
                            if (value == null || value.isEmpty) {
                              return "Password required";
                            }
                            if (passwordController.text.length < 6) {
                              return "Password must be more than 6 character";
                            }
                            return null;
                          },
                          onSearch: (v) {},
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 50),
                        child: TextFieldItem(
                          lable: "Confirm Password",
                          isObscure: bloc.rePassObscure == false ? false : true,
                          suffixIcon: InkWell(
                            onTap: () {
                              bloc.changeRePassVisibility();
                            },
                            child: bloc.rePassObscure == false
                                ? Icon(Icons.visibility_off)
                                : Icon(Icons.visibility_rounded),
                          ),
                          validate: (String? value) {
                            if (value == null || value.isEmpty) {
                              return "ReEnter password";
                            }
                            if (passwordController.text != value) {
                              return "Password hasn't match";
                            }
                            return null;
                          },
                          onSearch: (v) {},
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Theme.of(context).unselectedWidgetColor,
                            padding: EdgeInsets.symmetric(vertical: 16)),
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            FirebaseAuthentication.createAccount(
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
                                Navigator.pop(context);
                                Navigator.pop(context);
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
                        child: Text("Create Account",
                            style: Theme.of(context).textTheme.titleMedium),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16, bottom: 24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already Have Account ? ",
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamedAndRemoveUntil(
                                  context,
                                  LoginScreen.routeName,
                                  (route) => false,
                                );
                              },
                              child: Text(
                                "Login",
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
