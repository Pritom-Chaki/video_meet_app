import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';
import 'package:video_meet_app/variables.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  String userName = '';
  bool dataisthere = false;
  void initState() {
    super.initState();
    getUserData();
  }

  getUserData() async {
    DocumentSnapshot userdoc =
        await userCollection.doc(FirebaseAuth.instance.currentUser.uid).get();
    setState(() {
      userName = userdoc.data()['username'];
      dataisthere = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[250],
      body: dataisthere == false
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Stack(
              children: [
                ClipPath(
                  clipper: OvalBottomBorderClipper(),
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height / 2.5,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: GradientColors.facebookMessenger),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width / 2 - 64,
                    top: MediaQuery.of(context).size.height / 3.1,
                  ),
                  child: CircleAvatar(
                    radius: 64,
                    backgroundImage: NetworkImage(
                        'http://sarangglobaltours.com/wp-content/uploads/2014/02/team.png'),
                  ),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 300),
                      Text(
                        userName,
                        style: myStyle(40, Colors.black),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 300),
                      Container(
                        width: MediaQuery.of(context).size.width / 2,
                        height: 40,
                        decoration: BoxDecoration(
                            gradient:
                                LinearGradient(colors: GradientColors.cherry)),
                        child: Center(
                          child: Text(
                            "Edit Profile",
                            style: myStyle(17, Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
