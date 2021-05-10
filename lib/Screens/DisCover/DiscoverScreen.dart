import 'package:floein_social_app/components/Custom_NavBar.dart';
import 'package:floein_social_app/components/data.dart';
import 'package:floein_social_app/components/enums.dart';
import 'package:flutter/material.dart';

class Discover extends StatefulWidget {
  static String routeName = "/discover";
  @override
  _DiscoverState createState() => _DiscoverState();
}

class _DiscoverState extends State<Discover> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: ListView.builder(
                padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
                itemCount: friends.length,
                itemBuilder: (BuildContext context, int index) {
                  Map friend = friends[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 10),
                    child: ListTile(
                      leading: Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.white,
                        ),
                        height: 55,
                        width: 55,
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: CircleAvatar(
                            backgroundImage: AssetImage(
                              friend["dp"],
                            ),
                          ),
                        ),
                      ),
                      contentPadding: EdgeInsets.all(0),
                      title: Text(friend['name']),
                      subtitle: Text(friend['status']),
                      trailing: friend['isAccept']
                          ? Container(
                              width: 100.0,
                              height: 38.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xff651CE5).withOpacity(0.3),
                                    spreadRadius: 1,
                                    blurRadius: 8,
                                    offset: Offset(
                                        0, 5), // changes position of shadow
                                  ),
                                ],
                                gradient: LinearGradient(
                                  // Where the linear gradient begins and ends
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                  // Add one stop for each color. Stops should increase from 0 to 1
                                  stops: [0.1, 0.9],
                                  colors: [
                                    // Colors are easy thanks to Flutter's Colors class.

                                    Colors.black.withOpacity(0.5),
                                    Colors.grey,
                                  ],
                                ),
                              ),
                              child: FlatButton(
                                child: Text(
                                  'Unfollow',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                textColor: Colors.white,
                                color: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0)),
                                onPressed: () {},
                              ),
                            )
                          : Container(
                              width: 100.0,
                              height: 38.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xff651CE5).withOpacity(0.3),
                                    spreadRadius: 1,
                                    blurRadius: 8,
                                    offset: Offset(
                                        0, 5), // changes position of shadow
                                  ),
                                ],
                                gradient: LinearGradient(
                                  // Where the linear gradient begins and ends
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                  // Add one stop for each color. Stops should increase from 0 to 1
                                  stops: [0.1, 0.9],
                                  colors: [
                                    // Colors are easy thanks to Flutter's Colors class.
                                    Color(0xff651CE5),
                                    Color(0xff811ce5),
                                  ],
                                ),
                              ),
                              child: FlatButton(
                                child: Text(
                                  'Follow',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                textColor: Colors.white,
                                color: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0)),
                                onPressed: () {},
                              ),
                            ),
                      onTap: () {},
                    ),
                  );
                },
              ),
            ),
            Positioned(
              bottom: 0,
              child: CustomNavBar(
                selectedMenu: MenuState.discover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
