import 'package:flutter/material.dart';
import 'package:students_voice/application/user/bloc/user_bloc.dart';
import 'updateprofile.dart';
//// profile
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyProfile(),
    );
  }
}

class MyProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My profile'),
        backgroundColor: Colors.red,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
          // Add your logic here for the backward navigation}
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                  decoration: InputDecoration(
                    hintText: 'Enter user name',
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
                  decoration: InputDecoration(
                    hintText: 'user@gmail.com',
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
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Enter password',
                  ),
                ),
              ),
              SizedBox(height: 24.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    
                    onPressed: () {
                    },
                    
                    style: TextButton.styleFrom(
                      primary: Colors.red,
                      padding: EdgeInsets.all(16.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: Text(
                      'edit',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(width: 16),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context,MaterialPageRoute(
                        builder: (context) => updateprofile()),
    );
                    },
                    style: TextButton.styleFrom(
                      primary: Colors.red,
                      padding: EdgeInsets.all(16.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: Text(
                      'Logout',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
