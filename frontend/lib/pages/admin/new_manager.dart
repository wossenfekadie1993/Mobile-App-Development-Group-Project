import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'NewManagerBloc.dart';
import 'NewManagerState.dart';
import 'NewManagerEvent.dart';

class NewManagerPage extends StatefulWidget {
  @override
  _NewManagerPageState createState() => _NewManagerPageState();
}

class _NewManagerPageState extends State<NewManagerPage> {
  String name = '';
  String phoneNumber = '';
  String emailAddress = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NewManagerBloc>(
      create: (context) => NewManagerBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Add New Manager'),
          backgroundColor: Colors.red,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: BlocBuilder<NewManagerBloc, NewManagerState>(
                builder: (context, state) {
                  if (state is NewManagerLoadingState) {
                    return CircularProgressIndicator();
                  } else if (state is NewManagerSuccessState) {
                    return Text('Manager added successfully!');
                  } else if (state is NewManagerErrorState) {
                    return Text('Error: ${state.errorMessage}');
                  } else {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 5.0, right: 45),
                          child: Center(
                            child: IconButton(
                              icon: Icon(
                                Icons.account_circle_rounded,
                                color: Color.fromARGB(255, 143, 83, 240),
                                size: 80.0,
                              ),
                              onPressed: () {
                                // Add your logic here for onPressed (Add New Manager)
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 30.0),
                          child: Text(
                            'Name',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 16.0),
                          child: TextFormField(
                            onChanged: (value) {
                              setState(() {
                                name = value;
                              });
                            },
                            decoration: InputDecoration(
                              hintText: 'Enter manager name',
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 16.0),
                          child: Text(
                            'Phone Number',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 16.0),
                          child: TextFormField(
                            onChanged: (value) {
                              setState(() {
                                phoneNumber = value;
                              });
                            },
                            decoration: InputDecoration(
                              hintText: 'e.g., 251-978-7874',
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 16.0),
                          child: Text(
                            'Email Address',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 16.0),
                          child: TextFormField(
                            onChanged: (value) {
                              setState(() {
                                emailAddress = value;
                              });
                            },
                            decoration: InputDecoration(
                              hintText: 'manager@gmail.com',
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 16.0),
                          child: Text(
                            'Password',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 16.0),
                          child: TextFormField(
                            onChanged: (value) {
                              setState(() {
                                password = value;
                              });
                            },
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: 'Enter password',
                            ),
                          ),
                        ),
                        SizedBox(height: 24.0),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              final bloc =
                                  BlocProvider.of<NewManagerBloc>(context);
                              bloc.add(
                                AddManagerEvent(
                                  name: name,
                                  phoneNumber: phoneNumber,
                                  emailAddress: emailAddress,
                                  password: password,
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.red,
                              onPrimary: Colors.white,
                              padding: EdgeInsets.only(
                                top: 16.0,
                                left: 30,
                                right: 30,
                                bottom: 16.0,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            child: Text(
                              'Add',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      home: NewManagerPage(),
    );
  }
}
