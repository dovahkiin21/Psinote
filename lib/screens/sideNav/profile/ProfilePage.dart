import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:karvaan/screens/MapsPageRenter.dart';
import 'package:karvaan/screens/sideNav/profile/RequestPage.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:toast/toast.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<String> names =
      <String>[]; //defining lists for names and rates of bicycles..
  List<String> rates = <String>[];
  TextEditingController _newBikeNameController = new TextEditingController();
  TextEditingController _newBikeRentController = new TextEditingController();
  bool isSwitched = false;

  Future<int> createAlertDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            backgroundColor: Color(0xFFFFF7C6),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: Container(
                height: 290,
                width: 276,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Enter Bike Details",
                          style: TextStyle(
                              fontFamily: "Montserrat Bold",
                              fontSize: 20,
                              color: Color(0xFF1E1E29)),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Bike Name",
                            style: TextStyle(
                                fontFamily: "Montserrat Medium",
                                fontSize: 14,
                                color: Color(0xFFCA9367)),
                          ),
                          Container(
                            height: 30,
                            width: 150,
                            child: TextFormField(
                              style: TextStyle(
                                  fontFamily: "Montserrat SemiBold",
                                  color: Color(0xFF1E1E29)),
                              textAlign: TextAlign.start,
                              autocorrect: false,
                              controller: _newBikeNameController,
                              validator: (String value) {
                                if (value.isEmpty) {
                                  return 'Name is Required';
                                }
                                return null;
                              },
                            ),
                          ),
                          SizedBox(
                            height: 42,
                          ),
                          Text(
                            "Rate",
                            style: TextStyle(
                                fontFamily: "Montserrat Medium",
                                fontSize: 14,
                                color: Color(0xFFCA9367)),
                          ),
                          Container(
                            height: 30,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("Rs.",
                                    style: TextStyle(
                                        fontFamily: "Montserrat SemiBold",
                                        color: Color(0xFF1E1E29),
                                        fontSize: 18)),
                                SizedBox(
                                  width: 2,
                                ),
                                Container(
                                  height: 30,
                                  width: 50,
                                  child: TextFormField(
                                    style: TextStyle(
                                        fontFamily: "Montserrat SemiBold",
                                        fontSize: 18,
                                        color: Color(0xFF1E1E29)),
                                    textAlign: TextAlign.start,
                                    autocorrect: false,
                                    controller: _newBikeRentController,
                                    validator: (String value) {
                                      if (value.isEmpty) {
                                        return 'Rate is Required';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                                Text("per hr.",
                                    style: TextStyle(
                                        fontFamily: "Montserrat SemiBold",
                                        color: Color(0xFF1E1E29),
                                        fontSize: 18)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 38,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 39,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color(0xFF1E1E29),
                          ),
                          child: FlatButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Center(
                              child: Text(
                                "Cancel",
                                style: TextStyle(
                                    color: Color(0xFFE5E5E5),
                                    fontSize: 14,
                                    fontFamily: 'Montserrat Bold'),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 39,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color(0xFF1E1E29),
                          ),
                          child: FlatButton(
                            onPressed: () {
                              Toast.show("Incomplete!", context,
                                  duration: Toast.LENGTH_SHORT);
                              Navigator.of(context)
                                  .pop(addItemToList()); //pass bike data
                            },
                            child: Center(
                              child: Text(
                                "Save",
                                style: TextStyle(
                                    color: Color(0xFFE5E5E5),
                                    fontSize: 14,
                                    fontFamily: 'Montserrat Bold'),
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  void addItemToList() {
    setState(() {
      names.insert(
          0,
          _newBikeNameController.text
              .toString()); //function to add inputs provided by the user to the lists and making a card at the top of the list.
      rates.insert(0, _newBikeRentController.text.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF2C2C37),
          iconTheme: IconThemeData(
            color: Color(0xFFFFC495),
          ),
          centerTitle: true,
          title: Text(
            "DASHBOARD",
            style: TextStyle(
                fontFamily: "Montserrat Bold",
                color: Color(0xFFE5E5E5),
                fontSize: 16),
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
            FloatingActionButton(
                //tap on the button to add your cycles......
                backgroundColor: Color(0xFFFFC495),
                child: Icon(Icons.add),
                mini: true,
                onPressed: () {
                  createAlertDialog(context);
                  _newBikeNameController.clear();
                  _newBikeRentController.clear();
                }),
            SizedBox(
              height: 200,
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: names.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(17)),
                          color: Color(0xFF2C2C37),
                          child: ListTile(
                            trailing: Container(
                              width: 60,
                              height: 50,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                        height: 2,
                                      ),
                                      Switch(
                                        value: isSwitched,
                                        onChanged: (value) {
                                          setState(() {
                                            isSwitched = value;
                                            print(isSwitched);
                                          });
                                        },
                                        activeTrackColor:
                                            Colors.lightGreenAccent,
                                        activeColor: Colors.green,
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            leading: Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                image: DecorationImage(
                                    image:
                                        AssetImage('assets/images/profile.png'),
                                    fit: BoxFit.fill),
                                shape: BoxShape.rectangle,
                              ),
                            ),
                            title: Text(
                              '${names[index]}',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: "Montserrat Medium",
                                  color: Color(0xFFFFC495)),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 2,
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
                                          fontSize: 14,
                                          fontFamily: "Montserrat Regular",
                                          color: Color(0xFFCA9367)),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  'Rs. ${rates[index]} per hr.',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: "Montserrat Regular",
                                      color: Color(0xFFCA9367)),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
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
          ],
        )));
  }
}
