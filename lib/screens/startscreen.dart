import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager/assets/images.dart';
import 'package:task_manager/repo/userRepozitor.dart';
import '../bloc/regis_bloc.dart';
import 'mainscreen.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEEEEEE),
      body: SingleChildScrollView(
        child: Column(children: [
          BlocBuilder<RegisBloc, RegisState>(builder: (context, state) {
            if (state is SignIn) {
              return Column(
                children: [
                  Row(
                    children: [
                      AppImages.elipse,
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 40.0, bottom: 40, left: 10, right: 10),
                    child: Column(
                      children: [
                        const Text(
                          'Welcome Sovannaroth',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Text('lets Help you meet up your tests,'),
                        ),
                        MyTextfiled(text: '   Enter your full name '),
                        MyTextfiled(text: '   Enter your email '),
                        MyTextfiled(text: '   Enter password '),
                        MyTextfiled(text: '   Comfirm Password '),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: SizedBox(
                            width: 367,
                            height: 60,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: const Color(0xff6C63FF)),
                              onPressed: () {
                                BlocProvider.of<RegisBloc>(context)
                                    .add(GetStartedEvent());
                              },
                              child: const Text(
                                'Registar',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        TextButton(
                            onPressed: () {
                              BlocProvider.of<RegisBloc>(context)
                                  .add(GetStartedEvent());
                              RepositoryProvider.of<UserRepo>(context).regis =
                                  true;
                            },
                            child: RichText(
                                text: const TextSpan(
                                    text: 'Already have an account ? ',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 13),
                                    children: [
                                  TextSpan(
                                      text: 'login',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blueAccent)),
                                ])))
                      ],
                    ),
                  ),
                ],
              );
            }
            if (state is LogIn) {
              return Column(
                children: [
                  Row(
                    children: [
                      AppImages.elipse,
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 40.0, bottom: 40, left: 10, right: 10),
                    child: Column(
                      children: [
                        const Text(
                          'Welcome Back',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 250,
                          child: AppImages.loginpage,
                        ),
                        MyTextfiled(text: '   Enter your email '),
                        MyTextfiled(text: '   Enter password '),
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: SizedBox(
                            width: 367,
                            height: 60,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: const Color(0xff6C63FF)),
                              onPressed: () {},
                              child: const Text(
                                'Registar',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        TextButton(
                            onPressed: () {
                              BlocProvider.of<RegisBloc>(context)
                                  .add(GetStartedEvent());
                              RepositoryProvider.of<UserRepo>(context).regis =
                                  false;
                            },
                            child: RichText(
                                text: const TextSpan(
                                    text: ' have not  an account ? ',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 13),
                                    children: [
                                  TextSpan(
                                      text: 'Sign in',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blueAccent)),
                                ])))
                      ],
                    ),
                  ),
                ],
              );
            }
            if (state is Getstarted) {
              return Column(
                children: [
                  Row(
                    children: [
                      AppImages.elipse,
                    ],
                  ),
                  Container(
                    color: Color.fromARGB(255, 240, 240, 240),
                    height: 50,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 250,
                    child: AppImages.startpage,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(50.0),
                    child: Text(
                      'Gets things done with ToDo',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                        top: 5.0, right: 50, left: 50, bottom: 25),
                    child: Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Venenatis sed eu amet nec.',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    width: 367,
                    height: 60,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: const Color(0xff6C63FF)),
                      onPressed: () {
                        BlocProvider.of<RegisBloc>(context)
                            .add(GetStartedEvent());
                      },
                      child: const Text(
                        'Gets Started',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              );
            }
            if (state is MainPage) {
              return Mainpage();
            }
            return const Center(child: Text('Error'));
          }),
        ]),
      ),
    );
  }
}

class MyTextfiled extends StatelessWidget {
  MyTextfiled({Key? key, required this.text}) : super(key: key);
  String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          labelText: text,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white, width: 0),
            borderRadius: BorderRadius.circular(100.0),
          ),
        ),
      ),
    );
  }
}
