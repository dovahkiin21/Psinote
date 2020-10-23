import 'package:flutter/material.dart';
import 'package:karvaan/SignUpPage.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:toast/toast.dart';

final int user = 0;

class OTPpage extends StatefulWidget {
  final phoneNumer;
  OTPpage(this.phoneNumer);
  @override
  _OTPpageState createState() => _OTPpageState();
}

class _OTPpageState extends State<OTPpage> {
  String otp = '';
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
                "Please wait for the OTP sent to your number.",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontFamily: 'Montserrat SemiBold',
                  color: Color(0xFF1E1E29),
                  fontSize: 30,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(35, 20, 100, 0),
              child: OTPTextField(
                length: 5,
                width: MediaQuery.of(context).size.width,
                fieldWidth: 30,
                style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFF454551),
                    fontFamily: 'Montserrat Medium'),
                textFieldAlignment: MainAxisAlignment.spaceAround,
                fieldStyle: FieldStyle.underline,
                onCompleted: (pin) {
                  otp = pin;
                  print(otp);
                },
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(40, 20, 40, 0),
                  child: Text(
                    "Didn't receive the OTP?",
                    style: TextStyle(
                        fontFamily: 'Montserrat Medium',
                        fontSize: 14,
                        color: Color(0xFF454551D1)),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(40, 10, 40, 0),
                  child: new GestureDetector(
                    onTap: () {
                      Toast.show("Incomplete!", context,
                          duration: Toast.LENGTH_SHORT);
                    },
                    child: Text('Resend OTP',
                        style: TextStyle(
                            fontFamily: 'Montserrat Medium',
                            fontSize: 16,
                            color: Color(0xFFFFF7C6))),
                  ),
                )
              ],
            ),
            Container(
                height: 56,
                decoration: BoxDecoration(
                  //to decorate box with circular edges
                  borderRadius: BorderRadius.circular(17),
                  color: Color(0xFF1E1E29),
                ),
                margin: EdgeInsets.fromLTRB(25, 200, 25, 20),
                child: FlatButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Spacer(),
                      Text(
                        "Verify",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'Montserrat SemiBold',
                            fontSize: 16,
                            color: Color(0xFFE5E5E5)),
                      ),
                      Spacer(),
                      Icon(
                        Icons.arrow_forward,
                        color: Color(0xFFFFF7C6),
                      )
                    ],
                  ),
                  onPressed: () {
                    ////////////////////// For Testing ////////////////////////
                    if (user == 1) {
                      //user exists
                      Toast.show("Incomplete!", context,
                          duration: Toast.LENGTH_SHORT);
                    } else {
                      //new user
                      return Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpPage()));
                    }
                  },
                )),
          ],
        ),
      ),
    );
  }
}
