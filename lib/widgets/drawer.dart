import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:skeleton_text/skeleton_text.dart';
import 'package:staycation/data/login_handler.dart';

// ignore: must_be_immutable
class MainDrawer extends StatelessWidget {
  late ValueChanged<int> currentIndex;
  final index;
  MainDrawer({Key? key, required this.currentIndex, this.index})
      : super(key: key);

  User? user = FirebaseAuth.instance.currentUser;
  FirebaseService service = new FirebaseService();
  @override
  Widget build(BuildContext context) {
    void showLogout() {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Log Out?"),
              content: Text("Are you sure to Log Out?"),
              actions: [
                TextButton(
                  child: Text("Ok"),
                  onPressed: () async {
                    await service.signOutFromGoogle();
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/', (route) => false);
                  },
                ),
                TextButton(
                  child: Text("Cancel"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          });
    }

    return Column(children: [
      Container(
        child: Padding(
          padding: EdgeInsets.only(top: 50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(9999),
                child: CachedNetworkImage(
                  imageUrl: user!.photoURL ??
                      "https://upload.wikimedia.org/wikipedia/commons/7/7c/Profile_avatar_placeholder_large.png",
                  width: 95,
                  height: 95,
                  placeholder: (context, url) {
                    return SkeletonAnimation(
                      shimmerColor: Colors.white54,
                      child: Container(
                        width: 95,
                        height: 95,
                        decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(9999)),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(user!.displayName ?? "User",
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.w800,
                  ),
                  textAlign: TextAlign.center),
              SizedBox(
                height: 5.0,
              ),
              Text(
                "Software Engenieer",
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
      SizedBox(
        height: 20.0,
      ),
      ListTile(
        onTap: () {
          currentIndex(2);
        },
        leading: Icon(
          Icons.person,
          color: Colors.black,
        ),
        title: Text("Profile"),
      ),
      ListTile(
        onTap: () {
          currentIndex(1);
        },
        leading: Icon(
          Icons.inbox,
          color: Colors.black,
        ),
        title: Text("Inbox"),
      ),
      ListTile(
        onTap: () {},
        leading: Icon(
          Icons.info,
          color: Colors.black,
        ),
        title: Text("About Us"),
      ),
      Spacer(),
      ListTile(
        onTap: () {
          showLogout();
        },
        leading: Icon(
          Icons.logout,
          color: Colors.black,
        ),
        title: Text("Log Out"),
      ),
    ]);
  }
}
