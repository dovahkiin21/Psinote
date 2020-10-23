import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:toast/toast.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController _chatBoxController = new TextEditingController();
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF282833),
          iconTheme: IconThemeData(
            color: Color(0xFFFFC495),
          ),
          centerTitle: true,
          title: Text(
            "MY DASHBOARD",
            style: TextStyle(
                fontFamily: "Montserrat Bold",
                color: Color(0xFFE5E5E5),
                fontSize: 20),
          ),
          elevation: 1,
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 20.0),
            ),
          ],
        ),
        backgroundColor: Color(0xFF1E1E29),
        body: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
                child: Column(children: <Widget>[
              Container(
                margin: EdgeInsets.all(30),
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://googleflutter.com/sample_image.jpg'),
                      fit: BoxFit.fill),
                ),
              ),
            ])),

            Container(
              height: 380,
              width: 250,
              color: Color(0xFF1E1E29),
              padding: const EdgeInsets.all(10.0),
              child: Card(
                color: Color(0xFF2C2C37),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  children: [
                    ListTile(
                      title: Text(
                        'John Wick',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 30,
                            fontFamily: "Montserrat Bold",
                            color: Color(0xFFFFC495)),
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                            padding: EdgeInsets.fromLTRB(30.0, 20.0, 10.0, 0.0),
                            child: Text(
                              'Phone',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: "Montserrat Medium",
                                  color: Color(0xFFCA9367)),
                            )),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                            padding: EdgeInsets.fromLTRB(20.0, 5.0, 10.0, 5.0),
                            child: Text(
                              '+91 1234567890',
                              style: TextStyle(
                                  fontSize: 19,
                                  fontFamily: "Montserrat Medium",
                                  color: Color(0xFFE5E5E5)),
                            )),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                            padding: EdgeInsets.fromLTRB(30.0, 30.0, 10.0, 0.0),
                            child: Text(
                              'Email',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: "Montserrat Medium",
                                  color: Color(0xFFCA9367)),
                            )),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                            padding: EdgeInsets.fromLTRB(20.0, 5.0, 10.0, 5.0),
                            child: Text(
                              'johnwick@gmail.com',
                              style: TextStyle(
                                  fontSize: 19,
                                  fontFamily: "Montserrat Medium",
                                  color: Color(0xFFE5E5E5)),
                            )),
                      ],
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 5.0),
                        child: FloatingActionButton(
                          heroTag: "btn1",
                          backgroundColor: Color(0xFFCA9367),
                          onPressed: () {},
                          child: Icon(
                            Icons.edit,
                            size: 30,
                          ),
                        ),
                      ),
                    ]),
                  ],
                ),
              ),
            ),

            //Divider in between two cards....
            Container(
              margin: EdgeInsets.only(left: 90, top: 1, right: 90, bottom: 0),
              child: Divider(
                // thickness: 1,
                color: Color(0xFFFFC495),
                height: 15.0,
                indent: 5.0,
              ),
            ),

            Row(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 5.0),
                  child: Text(
                    'My Cycles',
                    style: TextStyle(
                        fontSize: 27,
                        fontFamily: "Montserrat Bold",
                        color: Color(0xFFE5E5E5)),
                  ),
                ),
              ],
            ),

            //Here begins the second card,displaying a person's cycles....

            Container(
              height: 190,
              width: 260,
              color: Color(0xFF1E1E29),
              padding: const EdgeInsets.all(20.0),
              child: Card(
                color: Color(0xFF2C2C37),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ListTile(
                  trailing: Container(
                    width: 50,
                    height: 50,
                    child: Column(
                      children: [
                        Switch(
                          value: isSwitched,
                          onChanged: (value) {
                            setState(() {
                              isSwitched = value;
                              print(isSwitched);
                            });
                          },
                          activeTrackColor: Colors.amber,
                          activeColor: Colors.amberAccent,
                        ),
                      ],
                    ),
                  ),
                  leading: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      image: DecorationImage(
                        image: AssetImage('assets/images/cycle.png'),
                        fit: BoxFit.fill,
                      ),
                      shape: BoxShape.rectangle,
                    ),
                  ),
                  title: Text(
                    'Avon Contender',
                    style: TextStyle(
                        fontSize: 22,
                        fontFamily: "Montserrat Bold",
                        color: Color(0xFFFFC495)),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 25,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.rate_review,
                            color: Color(0xFFFFC495),
                            size: 20,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Rate',
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: "Montserrat Regular",
                                color: Color(0xFFCA9367)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Rs. 17 per hr.',
                        style: TextStyle(
                            fontSize: 17,
                            fontFamily: "Montserrat Regular",
                            color: Color(0xFFE5E5E5)),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.only(left: 90, top: 1, right: 90, bottom: 0),
              child: Divider(
                // thickness: 1,
                color: Color(0xFF1E1E29),
                height: 1.0,
                indent: 5.0,
              ),
            ),

            //Card for next Bike...
            Container(
              height: 190,
              width: 260,
              color: Color(0xFF1E1E29),
              padding: const EdgeInsets.all(20.0),
              child: Card(
                color: Color(0xFF2C2C37),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ListTile(
                  trailing: Container(
                    width: 50,
                    height: 50,
                    child: Column(
                      children: [
                        Switch(
                          value: isSwitched,
                          onChanged: (value) {
                            setState(() {
                              isSwitched = value;
                              print(isSwitched);
                            });
                          },
                          activeTrackColor: Colors.amber,
                          activeColor: Colors.amberAccent,
                        ),
                      ],
                    ),
                  ),
                  leading: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      image: DecorationImage(
                        image: AssetImage('assets/images/cycle.png'),
                        fit: BoxFit.fill,
                      ),
                      shape: BoxShape.rectangle,
                    ),
                  ),
                  title: Text(
                    'Hero Rancher',
                    style: TextStyle(
                        fontSize: 22,
                        fontFamily: "Montserrat Bold",
                        color: Color(0xFFFFC495)),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 25,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.rate_review,
                            color: Color(0xFFFFC495),
                            size: 20,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Rate',
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: "Montserrat Regular",
                                color: Color(0xFFCA9367)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Rs. 17 per hr.',
                        style: TextStyle(
                            fontSize: 17,
                            fontFamily: "Montserrat Regular",
                            color: Color(0xFFE5E5E5)),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.only(left: 90, top: 1, right: 90, bottom: 0),
              child: Divider(
                // thickness: 1,
                color: Color(0xFF1E1E29),
                height: 1.0,
                indent: 5.0,
              ),
            ),

            //Add More....

            Container(
              height: 190,
              width: 260,
              color: Color(0xFF1E1E29),
              padding: const EdgeInsets.all(20.0),
              child: Card(
                color: Color(0xFF2C2C37),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 30, 20, 20),
                      padding: const EdgeInsets.all(10.0),
                      child: FloatingActionButton(
                          heroTag: "btn2",
                          backgroundColor: Color(0xFF2C2C37),
                          onPressed: () {},
                          child: Icon(
                            Icons.add,
                            size: 40,
                          )),
                    )
                  ],
                ),
              ),
            ),
          ],
        )));
  }
}
