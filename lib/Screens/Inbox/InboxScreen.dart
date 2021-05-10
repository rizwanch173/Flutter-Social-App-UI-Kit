
import 'package:floein_social_app/Screens/Inbox/chat_item.dart';
import 'package:floein_social_app/components/Custom_NavBar.dart';
import 'package:floein_social_app/components/data.dart';
import 'package:floein_social_app/components/enums.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

class InboxScreen extends StatefulWidget {
  static String routeName = "/inbox";
  @override
  _ChatsState createState() => _ChatsState();
}

class _ChatsState extends State<InboxScreen>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(0),
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.white,
                            ),
                            height: 55,
                            width: 55,
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color(0xff651CE5),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 18,
                        ),
                        Text(
                          "Start Conversation",
                          maxLines: 1,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
                      itemCount: chats.length,
                      itemBuilder: (BuildContext context, int index) {
                        Map chat = chats[index];
                        return ChatItem(
                          dp: chat['dp'],
                          name: chat['name'],
                          isOnline: chat['isOnline'],
                          counter: chat['counter'],
                          msg: chat['msg'],
                          time: chat['time'],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              child: CustomNavBar(
                selectedMenu: MenuState.inbox,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
