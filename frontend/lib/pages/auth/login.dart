import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../application/auth/bloc/auth_event.dart';
import '../../application/auth/bloc/auth_state.dart';
import '../../application/auth/bloc/auth_bloc.dart';
import '../../application/auth/auth.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: LoginPage(),
//     );
//   }

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailcontroler = TextEditingController();
  TextEditingController passwordcontroler = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.all(20.0),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Image.asset('splash.png'),
              SizedBox(height: 20),
              Text(
                'Student Voice',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 20),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: emailcontroler,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        hintText: 'Enter Email',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your email';
                        }
                      },
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 25, 100, 0),
                      child: BlocBuilder<AuthBloc, AuthState>(
                        builder: (_, AuthState state) {
                          bool erorr = false;
                          if (state is LoginFailed) {
                            erorr = true;
                          }
                          TextFormField(
                            controller: passwordcontroler,
                            obscureText: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              hintText: 'Enter Password',
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your password';
                              }
                              return null;
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    // Forgot password functionality
                  },
                  child: Text(
                    'Forgot Password',
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              BlocConsumer<AuthBloc, AuthState>(listener: (_, AuthState state) {
                if (state is LoginSuccessful) {
                  if (state.response.role == "manager") {
                    context.go(
                      '/managerpage',
                    );
                  } else if (state.response.role == "User") {
                    context.go(
                      '/homepage',
                    );
                  } else if (state.response.role == "Admin") {
                    context.go(
                      '/Adminpage',
                    );
                  }
                }
              }, builder: (_, AuthState state) {
                Widget buttonChild = const Text(
                  'Login',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                );

                if (state is LogingIn) {
                  buttonChild = const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(),
                  );
                }

                if (state is LoginSuccessful) {
                  buttonChild = const Text("Login Successful");
                }

                if (state is LoginFailed) {
                  buttonChild = const Text("Login failed");
                }

                return Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 100, 5),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xFFFFC600),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      minimumSize: const Size(280, 50),
                    ),
                    onPressed: state is LogingIn
                        ? null
                        : () {
                            if (!_formKey.currentState!.validate()) {
                              return;
                            }
                            final authBloc = BlocProvider.of<AuthBloc>(context);
                            authBloc.add(
                              Login(
                                  username: emailcontroler.text,
                                  password: passwordcontroler.text),
                            );
                          },
                    child: buttonChild,
                  ),
                );
              }),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 120, vertical: 10),
                child: Row(
                  children: [
                    const Text(' Not registerd yet ? '),
                    InkWell(
                      onTap: () => context.go('/signUp'),
                      child: const Text(
                        'Create Account ',
                        style: TextStyle(
                            fontSize: 15,
                            color: Color.fromARGB(255, 59, 118, 118),
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              )
            ])),
      ),
    );
  }
}
