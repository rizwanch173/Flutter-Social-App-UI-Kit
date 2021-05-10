import 'dart:math';

Random random = Random();
List names = [
  "Blake Bird",
  "Avery Howell",
  "Dexter Ward",
  "Hunter Bradley",
  "Bill Buckley",
  "Vera Marsh",
  "Ruth Burton",
  "Carmen Blake",
  "Paige Lawrence",
  "Geneva Mccoy",
  "Cecilia Abbott",
];

List hash = [
  "#love, #instagood, #me",
  "#tbt, #cute, #follow, #followme",
  "Lenard Milton",
  "#photooftheday, #happy, #tagforlikes, #beautiful",
  "#self, #girl, #picoftheday, #like4like",
  "Guadalupe Ratledge",
  "#smile, #friends, #fun",
  "#food, #swag, #amazing, #tflers",
  "#style, #wcw, #family",
  "#pretty, #repost, #hair",
  "#girls, #all_shots, #party",
];

List messages = [
  "I am a traveler",
  "Are you available tomorrow?",
  "It's late. Go to bed!",
  "I know what I want - Confidence",
  "I work in an office",
  "The last rocket🚀",
  "I do NOT work in an office",
  "Will you be attending the meetup tomorrow?",
  "Are you angry at something?",
  "I am a bit of a bright spark - Intelligence",
  "Can i hear your voice?",
];

List notifs = [
  "${names[random.nextInt(10)]} and ${random.nextInt(100)} others liked your post",
  "${names[random.nextInt(10)]} mentioned you in a comment",
  "${names[random.nextInt(10)]} shared your post",
  "${names[random.nextInt(10)]} commented on your post",
  "${names[random.nextInt(10)]} replied to your comment",
  "${names[random.nextInt(10)]} reacted to your comment",
  "${names[random.nextInt(10)]} asked you to join a Group️",
  "${names[random.nextInt(10)]} asked you to like a page",
  "You have memories with ${names[random.nextInt(10)]}",
  "${names[random.nextInt(10)]} Tagged you and ${random.nextInt(100)} others in a post",
  "${names[random.nextInt(10)]} Sent you a friend request",
];

List posts = List.generate(
    4,
    (index) => {
          "name": names[random.nextInt(10)],
          "dp": "assets/images/dm${random.nextInt(4)}.jpg",
          "des": messages[random.nextInt(10)],
          "hash": hash[random.nextInt(10)],
          "img": "assets/images/dm${random.nextInt(4)}.jpg"
        });

List chats = List.generate(
    13,
    (index) => {
          "name": names[random.nextInt(10)],
          "dp": "assets/images/dm${random.nextInt(4)}.jpg",
          "msg": messages[random.nextInt(10)],
          "counter": random.nextInt(20),
          "time": "${random.nextInt(50)} min ago",
          "isOnline": random.nextBool(),
        });

List types = ["text", "image"];
List conversation = List.generate(
    10,
    (index) => {
          "username": "Group ${random.nextInt(20)}",
          "time": "${random.nextInt(50)} min ago",
          "type": types[random.nextInt(2)],
          "replyText": messages[random.nextInt(10)],
          "isMe": random.nextBool(),
          "isGroup": false,
          "isReply": random.nextBool(),
        });

List friends = List.generate(
    13,
    (index) => {
          "name": names[random.nextInt(10)],
          "dp": "assets/images/dm${random.nextInt(4)}.jpg",
          "status": "Anything could be here",
          "isAccept": random.nextBool(),
        });
