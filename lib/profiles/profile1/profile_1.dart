import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:marthon1/profiles/profile1/provider.dart';
import 'package:marthon1/profiles/profile1/user.dart';

class Profile1 extends StatefulWidget {
  @override
  _Profile1State createState() => _Profile1State();
}

class _Profile1State extends State<Profile1> {
  Profile profile = Profile1Provider.getProfile();
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(fontFamily: 'SFUI'),
      child: Stack(children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          bottom: MediaQuery.of(context).size.height * 0.5,
          child: Image.asset(
            'assets/profiles/landscape1.JPG',
            height: MediaQuery.of(context).size.height * 0.45,
            // width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            leading:
                IconButton(onPressed: () {}, icon: Icon(FontAwesomeIcons.bars)),
            actions: [
              IconButton(onPressed: () {}, icon: Icon(FontAwesomeIcons.cog))
            ],
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text(
              'PROFILE',
              style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1.1),
            ),
          ),
          body: Stack(
            children: [
              CustomPaint(
                painter: ProfilePainter(),
                child: Container(),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * .28,
                left: MediaQuery.of(context).size.width * .05,
                child: CircleAvatar(
                  radius: 40,
                  backgroundImage: ExactAssetImage('assets/shared/profile.jpg'),
                ),
              ),
              _bodyText(context),
              _bottomBar(context)
            ],
          ),
        ),
      ]),
    );
  }

  Positioned _bodyText(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 24, right: 24,
      top: MediaQuery.of(context).size.height * .40,
      //left: MediaQuery.of(context).size.width * .05,
      child: Column(
        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              profile.user.name,
              style: TextStyle(
                fontSize: 32,
                color: Colors.grey.shade700,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          Row(
            children: [
              Icon(
                Icons.location_on,
                color: Colors.grey.shade400,
              ),
              Text(
                profile.user.address,
                style: TextStyle(color: Colors.grey.shade800),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              'ABOUT ME',
              style: TextStyle(color: Colors.grey.shade400),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Text(
              profile.user.about,
              style: TextStyle(
                  color: Colors.grey.shade800,
                  fontSize: 17,
                  height: 1.4,
                  letterSpacing: 1.1),
              softWrap: true,
            ),
          ),
        ],
      ),
    );
  }

  TextStyle _bottomBarTitle =
      TextStyle(color: Colors.grey.shade400, fontWeight: FontWeight.w500);
  TextStyle _bottomBarNum = TextStyle(
      color: Colors.grey.shade900, fontWeight: FontWeight.bold, fontSize: 18);

  Positioned _bottomBar(BuildContext context) {
    return Positioned(
      bottom: 25,
      left: 24,
      right: 24,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                'FOLLOWERS',
                style: _bottomBarTitle,
              ),
              SizedBox(
                height: 8,
              ),
              Text(profile.followers.toString(), style: _bottomBarNum),
            ],
          ),
          Column(
            children: [
              Text('FOLLOWING', style: _bottomBarTitle),
              SizedBox(
                height: 8,
              ),
              Text(profile.following.toString(), style: _bottomBarNum),
            ],
          ),
          Column(
            children: [
              Text('FRIENDS', style: _bottomBarTitle),
              SizedBox(
                height: 8,
              ),
              Text(profile.friends.toString(), style: _bottomBarNum),
            ],
          ),
        ],
      ),
    );
  }
}

class ProfilePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    Path path = Path();
    paint.color = Colors.white;
    path.lineTo(0, size.height * 0.33);
    path.lineTo(size.width, size.height * 0.40);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, size.height * 0.25);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
