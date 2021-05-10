import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeCard extends StatefulWidget {
  final String dp;
  final String name;
  final String des;
  final String img;
  final String hash;

  HomeCard(
      {Key key,
      @required this.dp,
      @required this.name,
      @required this.des,
      @required this.hash,
      @required this.img})
      : super(key: key);
  @override
  _HomeCardState createState() => _HomeCardState();
}

class _HomeCardState extends State<HomeCard> {
  bool isLiked = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(35.0)),
            child: ShaderMask(
              shaderCallback: (rect) {
                return LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.7),
                  ],
                ).createShader(
                    Rect.fromLTRB(0, 300, rect.width, rect.height - 1));
              },
              blendMode: BlendMode.darken,
              child: Container(
                height: MediaQuery.of(context).size.width * 1.45,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(widget.img),
                  ),
                  borderRadius: BorderRadius.circular(35),
                ),
              ),
            ),
          ),
          //Side-bar Container
          Positioned(
            right: -5,
            top: MediaQuery.of(context).size.shortestSide < 600
                ? (MediaQuery.of(context).size.width * 1.45 -
                        MediaQuery.of(context).size.width * 1.25) /
                    2
                : (MediaQuery.of(context).size.width * 1.45 -
                        MediaQuery.of(context).size.width * 0.7) /
                    2,
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.shortestSide < 600
                      ? 115
                      : 180,
                  height: MediaQuery.of(context).size.shortestSide < 600
                      ? MediaQuery.of(context).size.width * 1.25
                      : MediaQuery.of(context).size.width * 0.7,
                  child: ClipPath(
                    clipper: MyCustomClipper(),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                      child: SvgPicture.asset(
                        "assets/icons/side-bar.svg",
                        color: Color(0xffc9c9c9).withOpacity(0.5),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Positioned(
                    top: 0,
                    right: 0,
                    bottom: 0,
                    left: 0,
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: (MediaQuery.of(context).size.width * 1.25) / 8.1,
                        bottom:
                            (MediaQuery.of(context).size.width * 1.25) / 8.1,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Colors.white.withOpacity(0.4),
                              ),
                              height: 60,
                              width: 60,
                              child: Padding(
                                  padding: const EdgeInsets.all(17.0),
                                  child: SvgPicture.asset(
                                    isLiked
                                        ? "assets/icons/heart-shape-silhouette.svg"
                                        : "assets/icons/heart-shape-outine.svg",
                                    color: Color(0xffffffff),
                                  )),
                            ),
                            onTap: () {
                              setState(() {
                                isLiked = !isLiked;
                              });
                            },
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.white.withOpacity(0.4),
                            ),
                            height: 60,
                            width: 60,
                            child: Padding(
                              padding: const EdgeInsets.all(17.0),
                              child: SvgPicture.asset(
                                "assets/icons/comment-option.svg",
                                color: Color(0xffffffff),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.white.withOpacity(0.4),
                            ),
                            height: 60,
                            width: 60,
                            child: Padding(
                              padding: const EdgeInsets.all(17.0),
                              child: SvgPicture.asset(
                                "assets/icons/bookmark-black-shape.svg",
                                color: Color(0xffffffff),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.white.withOpacity(0.4),
                            ),
                            height: 60,
                            width: 60,
                            child: Padding(
                              padding: const EdgeInsets.all(17.0),
                              child: SvgPicture.asset(
                                "assets/icons/plane.svg",
                                color: Color(0xffffffff),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ))
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(widget.dp),
                        radius: 25,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        widget.name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "It is a long established fact that a reader will be distracted by it",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          widget.hash,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xff00d289),
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width * 0.64, size.height * 0.1);
    path.cubicTo(size.width * 0.64, size.height * 0.1, size.width * 0.38,
        size.height * 0.1, size.width * 0.38, size.height * 0.1);
    path.cubicTo(size.width * 0.17, size.height * 0.1, 0, size.height * 0.14, 0,
        size.height / 5);
    path.cubicTo(
        0, size.height / 5, 0, size.height * 0.8, 0, size.height * 0.8);
    path.cubicTo(0, size.height * 0.86, size.width * 0.17, size.height * 0.9,
        size.width * 0.38, size.height * 0.9);
    path.cubicTo(size.width * 0.38, size.height * 0.9, size.width * 0.64,
        size.height * 0.9, size.width * 0.64, size.height * 0.9);
    path.cubicTo(size.width * 0.84, size.height * 0.9, size.width,
        size.height * 0.95, size.width, size.height);
    path.cubicTo(size.width, size.height, size.width, 0, size.width, 0);
    path.cubicTo(size.width, size.height * 0.05, size.width * 0.84,
        size.height * 0.1, size.width * 0.64, size.height * 0.1);
    path.cubicTo(size.width * 0.64, size.height * 0.1, size.width * 0.64,
        size.height * 0.1, size.width * 0.64, size.height * 0.1);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
