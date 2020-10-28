import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:karvaan/screens/MapsPage.dart';
import 'package:karvaan/screens/authentication/GooglePh.dart';
import 'package:karvaan/screens/authentication/PhoneVerifPage.dart';
import 'package:karvaan/screens/authentication/SignUpPage.dart';
import 'package:karvaan/screens/services/authentication.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:toast/toast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


final int user = 0;

class GoogleOTP extends StatefulWidget {
  final phoneNumber;
  GoogleOTP(this.phoneNumber);
  @override
  _GoogleOTPState createState() => _GoogleOTPState(phoneNumber);
}

class _GoogleOTPState extends State<GoogleOTP> {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final databaseReference = Firestore.instance;

  String getUId() {
                        final User user = _auth.currentUser;
                        final uid = user.uid;

                        return uid;
                      }

   void updateData(String phoneNo) {
  try {
    databaseReference
        .collection("users")
        .document(getUId())
        .updateData({'phoneNo': phoneNo,});
  } catch (e) {
    print(e.toString());
  }
}



  String phoneNumber;
  _GoogleOTPState(this.phoneNumber);

  String verificationId, smsCode;
  bool codeSent = false;

  @override
  void initState() {
    verifyPhone(phoneNumber);
    super.initState();
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
                length: 6,
                width: MediaQuery.of(context).size.width,
                fieldWidth: 30,
                style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFF454551),
                    fontFamily: 'Montserrat Medium'),
                textFieldAlignment: MainAxisAlignment.spaceAround,
                fieldStyle: FieldStyle.underline,
                onChanged: (pin) {
                  setState(() {
                    this.smsCode = pin;
                  });
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
                      Toast.show("Resending...", context,
                          duration: Toast.LENGTH_SHORT);
                      verifyPhone(phoneNumber);
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
                    print(codeSent);
                    if (codeSent) {
                      AuthService().signInWithOtp(smsCode, verificationId);
                      updateData(phoneNumber);
                      return Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MapsPage()));
                    } else {
                      Toast.show("Error! Try Again.", context,
                          duration: Toast.LENGTH_SHORT);
                      return Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => GooglePh()));
                    }
                  },
                )),
          ],
        ),
      ),
    );
  }

  Future<void> verifyPhone(phoneNumber) async {
    final PhoneVerificationCompleted verified = (AuthCredential authResult) {
      AuthService().signIn(authResult);
    };

    final PhoneVerificationFailed verificationfailed =
        (FirebaseAuthException authException) {
      print('${authException.message}');
    };

    final PhoneCodeSent smsSent = (String verId, [int forceResend]) {
      this.verificationId = verId;
      setState(() {
        this.codeSent = true;
      });
    };

    final PhoneCodeAutoRetrievalTimeout autoTimeOut = (String verId) {
      this.verificationId = verId;
    };

    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        timeout: const Duration(seconds: 60),
        verificationCompleted: verified,
        verificationFailed: verificationfailed,
        codeSent: smsSent,
        codeAutoRetrievalTimeout: autoTimeOut);
  }
}
