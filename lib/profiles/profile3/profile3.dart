import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:marthon1/profiles/profile3/profile.dart';
import 'package:marthon1/profiles/profile3/provider.dart';

class Profile3 extends StatefulWidget {
  const Profile3({Key? key}) : super(key: key);

  @override
  _Profile3State createState() => _Profile3State();
}

class _Profile3State extends State<Profile3> {
  Profile _profile = ProfileProvider.getProfile();
  TextStyle _bottomBarTitle =
      TextStyle(color: Colors.grey.shade400, fontWeight: FontWeight.w500);
  TextStyle _bottomBarNum = TextStyle(
      color: Colors.grey.shade900, fontWeight: FontWeight.bold, fontSize: 18);
  @override
  Widget build(BuildContext context) {
    return Theme(
        data: ThemeData(fontFamily: 'SFUI'),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              left: 0,
              bottom: 0,
              child: Image.asset(
                'assets/profiles/landscape3.jpg',
                fit: BoxFit.cover,
              ),
            ),
            Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                actions: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))
                ],
                leading: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                elevation: 0,
                backgroundColor: Colors.transparent,
                title: Text('PROFILE3'),
                centerTitle: true,
              ),
              body: Stack(
                children: [
                  _bodyContent(context),
                  _profileImage(context),
                ],
              ),
            )
          ],
        ));
  }

  Widget _bodyContent(BuildContext context) {
    return Positioned(
        left: 16,
        right: 16,
        bottom: 0,
        top: MediaQuery.of(context).size.height * .17,
        child: Container(
          padding: EdgeInsets.only(top: 70),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
          child: ListView(
            padding: EdgeInsets.all(16),
            children: [
              Text(
                _profile.user.name,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  color: Colors.grey.shade900,
                  fontWeight: FontWeight.w900,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  _profile.user.address,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    //fontSize: 28,
                    color: Colors.grey.shade500,
                    //   fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              _followButton(context),
              SizedBox(
                height: 24,
              ),
              Divider(),
              _counters(context),
              Divider(),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  'FRIENDS (' + _profile.friends.toString() + ')',
                  style: TextStyle(
                    //fontSize: 28,
                    color: Colors.grey.shade900,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              _photos(context),
              ..._aboutMe(context),
            ],
          ),
        ));
  }

  Widget _profileImage(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height * .17 - 50,
      left: MediaQuery.of(context).size.width * .5 - 50,
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: ExactAssetImage('assets/shared/profile.jpg'),
          ),
        ),
      ),
    );
  }

  Widget _followButton(BuildContext context) {
    return Align(
      child: MaterialButton(
        color: Colors.red.shade700,
        onPressed: () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Text(
            'FOLLOW',
            style: TextStyle(color: Colors.white),
          ),
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25))),
      ),
    );
  }

  Widget _counters(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
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
              Text(_profile.followers.toString(), style: _bottomBarNum),
            ],
          ),
          Column(
            children: [
              Text('FOLLOWING', style: _bottomBarTitle),
              SizedBox(
                height: 8,
              ),
              Text(_profile.following.toString(), style: _bottomBarNum),
            ],
          ),
          Column(
            children: [
              Text('FRIENDS', style: _bottomBarTitle),
              SizedBox(
                height: 8,
              ),
              Text(_profile.friends.toString(), style: _bottomBarNum),
            ],
          ),
        ],
      ),
    );
  }

  _photos(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 125,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(_profile.photos, (index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: Image(
                image: ExactAssetImage('assets/shared/profile2.jpg'),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  List<Widget> _aboutMe(BuildContext context) {
    return [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        child: Text(
          'ABOUT ME',
          style: TextStyle(
              color: Colors.grey.shade800,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.1),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Text(
          _profile.user.about,
          style: TextStyle(
              color: Colors.grey.shade800,
              fontWeight: FontWeight.w400,
              height: 1.4,
              fontSize: 15,
              letterSpacing: 1.2),
        ),
      ),
    ];
  }
}
