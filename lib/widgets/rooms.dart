import 'package:facebook_ui_clone/widgets/profile_avatar.dart';
import 'package:facebook_ui_clone/widgets/responsive.dart';
import 'package:flutter/material.dart';

import '../config/palette.dart';
import '../models/user_model.dart';

class Rooms extends StatelessWidget {
  final List<dynamic> onlineUsers;

  const Rooms({
    Key? key,
    required this.onlineUsers,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context);
    return Card(
      margin: EdgeInsets.symmetric(horizontal: isDesktop ? 5.0 : 0.0),
      elevation: isDesktop ? 1.0 : 0.0,
      shape: isDesktop
          ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))
          : null,
      child: Container(
        height: 60.0,
        color: Colors.white,
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 4.0,
          ),
          scrollDirection: Axis.horizontal,
          itemCount: 1 + onlineUsers.length,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: _CreateRoomButton(),
              );
            }
            final User user = onlineUsers[index - 1];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ProfileAvatar(
                imageUrl: user.imageUrl,
                isActive: true,
              ),
            );
          },
        ),
      ),
    );
  }
}

class _CreateRoomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () => print('Create Room'),
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.white, shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        side: BorderSide(
          width: 3.0,
          color: Colors.blueAccent[100]!,
        ),
        textStyle: const TextStyle(
          color: Palette.facebookBlue,
        ),
      ),
      child: const Row(
        children: [
          Icon(
            Icons.video_call,
            size: 35.0,
            color: Colors.purple,
          ),
          SizedBox(width: 4.0),
          Text('Create\nRoom'),
        ],
      ),
    );

  }
}
