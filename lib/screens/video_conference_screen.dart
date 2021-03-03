import 'package:flutter/material.dart';
import 'package:video_meet_app/variables.dart';
import 'package:video_meet_app/videoConference/create_meeting.dart';
import 'package:video_meet_app/videoConference/join_meeting.dart';

class VideoConferenceScreen extends StatefulWidget {
  @override
  _VideoConferenceScreenState createState() => _VideoConferenceScreenState();
}

class _VideoConferenceScreenState extends State<VideoConferenceScreen>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  buildTab(String name) {
    return Container(
      width: 150,
      height: 50,
      child: Card(
        child: Center(
          child: Text(
            name,
            style: myStyle(15, Colors.black, FontWeight.w700),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
        title: Text(
          "Video Meet",
          style: myStyle(20, Colors.white, FontWeight.w700),
        ),
        bottom: TabBar(
          controller: tabController,
          tabs: [
            buildTab("Join Meeting"),
            buildTab("Create Meeting"),
          ],
        ),
      ),
      body: TabBarView(controller: tabController, children: [
        JoinMeeting(),
        CreateMeeting(),
      ]),
    );
  }
}
