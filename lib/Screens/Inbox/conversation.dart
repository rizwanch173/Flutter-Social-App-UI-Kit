import 'dart:math';
import 'package:floein_social_app/Screens/Inbox/chat_bubble.dart';
import 'package:floein_social_app/components/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Conversation extends StatefulWidget {
  final String? dp, name;

  Conversation({
    Key? key,
    required this.dp,
    required this.name,
  }) : super(key: key);
  @override
  _ConversationState createState() => _ConversationState();
}

class _ConversationState extends State<Conversation> {
  static Random random = Random();
  String name = names[random.nextInt(10)];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 3,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: SvgPicture.asset(
                "assets/icons/back-arrow.svg",
                color: Colors.black,
              ),
            ),
          ),
          titleSpacing: 0,
          title: InkWell(
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(0),
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white,
                    ),
                    height: 45,
                    width: 45,
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: CircleAvatar(
                        backgroundImage: AssetImage(
                          "${widget.dp}",
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        widget.name!,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Online",
                        style: TextStyle(
                          color: Color(0xff651CE5),
                          fontWeight: FontWeight.w400,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            onTap: () {},
          ),
          actions: <Widget>[
            SvgPicture.asset(
              "assets/icons/dots.svg",
              height: 5,
            ),
            SizedBox(
              width: 20,
            ),
          ],
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: <Widget>[
              Flexible(
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  itemCount: conversation.length,
                  reverse: true,
                  itemBuilder: (BuildContext context, int index) {
                    Map msg = conversation[index];
                    return ChatBubble(
                      message: msg['type'] == "text"
                          ? messages[random.nextInt(10)]
                          : "assets/images/px$index.jpg",
                      username: msg["username"],
                      time: msg["time"],
                      type: msg['type'],
                      replyText: msg["replyText"],
                      isMe: msg['isMe'],
                      isGroup: msg['isGroup'],
                      isReply: msg['isReply'],
                      replyName: name,
                    );
                  },
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: BottomAppBar(
                  elevation: 10,
                  color: Theme.of(context).primaryColor,
                  child: Container(
                    constraints: BoxConstraints(
                      maxHeight: 100,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(
                            Icons.add,
                            color: Theme.of(context).accentColor,
                          ),
                          onPressed: () {},
                        ),
                        Flexible(
                          child: TextField(
                            style: TextStyle(
                              fontSize: 15.0,
                              color:
                                  Theme.of(context).textTheme.headline6!.color,
                            ),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(10.0),
                              border: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              hintText: "Write your message...",
                              hintStyle: TextStyle(
                                fontSize: 15.0,
                                color:
                                    Theme.of(context).textTheme.headline6!.color,
                              ),
                            ),
                            maxLines: null,
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.mic,
                            color: Theme.of(context).accentColor,
                          ),
                          onPressed: () {},
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
