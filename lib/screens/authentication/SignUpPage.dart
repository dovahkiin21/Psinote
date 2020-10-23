import 'package:flutter/material.dart';
import 'package:karvaan/screens/MapsPage.dart';
import 'package:toast/toast.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController nameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();

  String _name, _email;

  String emailValidator(String value) {
    //to check email
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Email format is invalid';
    } else {
      return null;
    }
  }

  String nameValidator(String value) {
    //to check name
    if (value.isEmpty) {
      return "Name can't be empty";
    }
    if (value.length < 3) {
      return 'Enter a valid Name';
    } else {
      return null;
    }
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // toolbarHeight: 35,
        backgroundColor: Color(0xFFFFC495),
        iconTheme: IconThemeData(
          color: Color(0xFF1E1E29),
        ),
        elevation: 0,
      ),
      backgroundColor: Color(0xFFFFC495),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.fromLTRB(40, 10, 40, 0),
              child: Text(
                "Please fill in the details to create your account.",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontFamily: 'Montserrat SemiBold',
                  color: Color(0xFF1E1E29),
                  fontSize: 30,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(40, 40, 40, 0),
              child: Form(
                key: _formkey,
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color: Color(0xFFFFF7C6), width: 2))),
                      child: TextFormField(
                        style: TextStyle(
                            fontFamily: "Montserrat Medium",
                            fontSize: 19,
                            color: Color(0xFF1E1E29)),
                        validator: nameValidator,
                        controller: nameController,
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.person,
                              color: Color(0xFF212121),
                            ),
                            hintText: "Full Name",
                            hintStyle: TextStyle(
                                fontFamily: "Montserrat Medium",
                                fontSize: 18,
                                color: Color(0xFF45455199)),
                            border: InputBorder.none),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color: Color(0xFFFFF7C6), width: 2))),
                      child: TextFormField(
                        style: TextStyle(
                            fontFamily: "Montserrat Medium",
                            fontSize: 18,
                            color: Color(0xFF1E1E29)),
                        validator: emailValidator,
                        controller: emailController,
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.email,
                              color: Color(0xFF212121),
                            ),
                            hintText: "Email (Optional)",
                            hintStyle: TextStyle(
                                fontFamily: "Montserrat Medium",
                                fontSize: 18,
                                color: Color(0xFF45455199)),
                            border: InputBorder.none),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(40, 10, 40, 0),
            ),
            Container(
                height: 56,
                decoration: BoxDecoration(
                  //to decorate box with circular edges
                  borderRadius: BorderRadius.circular(17),
                  color: Color(0xFF1E1E29),
                ),
                margin: EdgeInsets.fromLTRB(25, 160, 25, 20),
                child: FlatButton(
                  onPressed: () {
                    print("Email: " + emailController.text.toString());
                    print("name: " + nameController.text.toString());
                    Toast.show("Incomplete!", context,
                        duration: Toast.LENGTH_SHORT);

                    return Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MapsPage()));
                  },
                  child: Text("REGISTER",
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Montserrat SemiBold',
                          color: Color(0xFFE5E5E5))),
                )),
          ],
        ),
      ),
    );
  }
}
