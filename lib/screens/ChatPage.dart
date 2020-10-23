import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:toast/toast.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<Message> messages = [
    Message(
      text: 'Hey, how are you?',
      isSendByMe: true,
    ),
    Message(
      text: 'Huhh!!',
      isSendByMe: false,
    ),
    Message(
      text: 'How\'s it going?',
      isSendByMe: true,
    ),
    Message(
      text: 'Huhh',
      isSendByMe: false,
    ),
    Message(
      text: 'Nice! ',
      isSendByMe: true,
    ),
    Message(
      text: 'Bye',
      isSendByMe: false,
    ),
  ];

  TextEditingController _chatBoxController = new TextEditingController();

  sendMessage() {
    if (_chatBoxController.text.isEmpty) {
      Map<String, String> messageMap = {};
    }
  }

  List<DropdownMenuItem<Message>> messagesDropDownList;

  @override
  void initState() {
    messagesDropDownList = buildDropDownMenuItems(messages);
    super.initState();
  }

  List<DropdownMenuItem<Message>> buildDropDownMenuItems(messages) {
    List<DropdownMenuItem<Message>> items = List();
    for (Message category in messages) {
      items.add(DropdownMenuItem(
        value: category,
        child: Text(category.text),
      ));
    }
    return items;
  }

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
          "John Wick",
          style: TextStyle(
              fontFamily: "Montserrat Bold",
              color: Color(0xFFE5E5E5),
              fontSize: 16,
              letterSpacing: 2),
        ),
        elevation: 1,
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20.0),
          ),
        ],
      ),
      backgroundColor: Color(0xFF1E1E29),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              child: Stack(
                children: [
                  Container(
                      //margin: EdgeInsets.only(top: 0,left: 10),
                      /*
                      This the container which contains all the chats between the users. This has to be kind of like scrollable but
                      try to find a youtube video for this. There is a better method for this than just using a SingleScrollChild (Also using this
                      will give an error.:( )
                     */

                      ),
                  Positioned(
                    bottom: 0,
                    left: 10,
                    child: Row(
                      children: [
                        Container(
                          alignment: Alignment.bottomLeft,
                          height: 38,
                          width: 130,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(48),
                            color: Color(0xFFFFF7C6),
                          ),
                          child: FlatButton(
                            onPressed: () {
                              Toast.show("Incomplete!", context,
                                  duration: Toast.LENGTH_SHORT);
                            },
                            child: Center(
                              child: Text(
                                "Confirm Booking",
                                style: TextStyle(
                                    color: Color(0xFF1E1E29),
                                    fontSize: 11,
                                    fontFamily: 'Montserrat SemiBold'),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          alignment: Alignment.bottomLeft,
                          height: 38,
                          width: 90,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(48),
                            color: Color(0xFFFFF7C6),
                          ),
                          child: FlatButton(
                            onPressed: () {
                              Toast.show("Incomplete!", context,
                                  duration: Toast.LENGTH_SHORT);
                            },
                            child: Center(
                              child: Text(
                                "Cancel",
                                style: TextStyle(
                                    color: Color(0xFF1E1E29),
                                    fontSize: 11,
                                    fontFamily: 'Montserrat SemiBold'),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            height: 52,
            margin: EdgeInsets.fromLTRB(12, 8, 12, 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(28),
              color: Color(0xFF282833),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 16),
                    child: TextField(
                      controller: _chatBoxController,
                      decoration: InputDecoration(
                          hintText: "Type a message…",
                          border: InputBorder.none),
                      style: TextStyle(
                          color: Color(0xFF858484),
                          fontSize: 16,
                          fontFamily: 'Montserrat Regular'),
                    ),
                  ),
                ),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Toast.show("Incomplete!", context,
                          duration: Toast.LENGTH_SHORT);
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 5),
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          color: Color(0xFF282833),
                          borderRadius: BorderRadius.circular(40)),
                      padding: EdgeInsets.all(12),
                      child: Icon(
                        Icons.arrow_forward,
                        color: Color(0xFFFFF7C6),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Message extends StatelessWidget {
  final String text;
  final bool isSendByMe;
  Message({this.text, this.isSendByMe});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.only(
          left: isSendByMe ? 0 : 24, right: isSendByMe ? 24 : 0),
      width: MediaQuery.of(context).size.width,
      alignment: isSendByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        decoration: BoxDecoration(
            color: isSendByMe ? Color(0xFFC495) : Color(0x282833),
            borderRadius: isSendByMe
                ? BorderRadius.only(
                    topLeft: Radius.circular(23),
                    topRight: Radius.circular(23),
                    bottomLeft: Radius.circular(23),
                  )
                : BorderRadius.only(
                    topLeft: Radius.circular(23),
                    topRight: Radius.circular(23),
                    bottomRight: Radius.circular(23),
                  )),
        child: Text(
          text,
          style: TextStyle(
            color: isSendByMe ? Color(0x1E1E29) : Color(0xFFE5E5E5),
            fontSize: 17,
          ),
        ),
      ),
    );
  }
}
