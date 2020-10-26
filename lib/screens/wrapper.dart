import 'package:flutter/material.dart';
import 'file:///D:/Projects/karvaan/lib/screens/authentication/LogInPage.dart';
import 'package:karvaan/screens/MapsPage.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return either maps page or the login page
    return LogInPage();
  }
}
