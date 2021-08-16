import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:marthon1/profiles/profile2/profile.dart';
import 'package:marthon1/profiles/profile2/provider.dart';

class Profile2 extends StatefulWidget {
  @override
  _Profile2State createState() => _Profile2State();
}

class _Profile2State extends State<Profile2> {
  Profile _profile = ProfileProvider.getProfile();
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
              bottom: MediaQuery.of(context).size.height * 0.5,
              child: Image.asset(
                'assets/profiles/landscape2.jpg',
                fit: BoxFit.cover,
              ),
            ),
            Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                leading: IconButton(
                  icon: Icon(FontAwesomeIcons.bars),
                  onPressed: () {},
                ),
                elevation: 0,
                backgroundColor: Colors.transparent,
                title: Text('PROFILE2'),
                centerTitle: true,
              ),
              body: Stack(
                children: [
                  _prfileTitle(context),
                  _bodyContent(context),
                ],
              ),
            )
          ],
        ));
  }

  Widget _prfileTitle(BuildContext context) {
    return Positioned(
      top: 20,
      left: 0,
      right: 0,
      bottom: 250,
      child: Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Container(
                width: 130,
                height: 130,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey.withOpacity(0.2)),
              ),
              Container(
                width: 115,
                height: 115,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey.withOpacity(0.3)),
              ),
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  // border:
                  //     Border.all(width: 5, color: Colors.grey.withOpacity(0.6)),
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: ExactAssetImage('assets/shared/profile.jpg'),
                      fit: BoxFit.cover),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              _profile.user.name,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1.4),
            ),
          ),
          Text(
            _profile.user.address,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              letterSpacing: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  Widget _bodyContent(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height * .30,
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _counters(context),
            _divider(context),
            ..._aboutMe(context),
            _friendes(context),
            _contacts(context),
          ],
        ),
      ),
    );
  }

  TextStyle _bottomBarTitle =
      TextStyle(color: Colors.grey.shade400, fontWeight: FontWeight.w500);
  TextStyle _bottomBarNum = TextStyle(
      color: Colors.grey.shade900, fontWeight: FontWeight.bold, fontSize: 18);
  Widget _counters(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
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

  _divider(BuildContext context) {
    return Container(
      height: 1,
      color: Colors.grey.shade200,
    );
  }

  List<Widget> _aboutMe(BuildContext context) {
    return [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Text(
          'ABOUT ME',
          style: TextStyle(
              color: Colors.grey.shade800,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.1),
        ),
      ),
      Expanded(
        flex: 3,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            _profile.user.about,
            style: TextStyle(
                color: Colors.grey.shade800,
                fontWeight: FontWeight.w400,
                height: 1.4,
                fontSize: 18,
                letterSpacing: 1.2),
          ),
        ),
      ),
    ];
  }

  _friendes(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        'FRIENDS ' + _profile.friends.toString(),
        style: TextStyle(
            color: Colors.grey.shade800,
            fontWeight: FontWeight.bold,
            height: 1.4,
            fontSize: 16,
            letterSpacing: 1.2),
      ),
    );
  }

  Widget _contacts(BuildContext context) {
    return Expanded(
      flex: 1,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 25,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              // maxRadius: 30,
              backgroundColor: Colors.transparent,
              radius: 30,
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  child: Image.asset(
                    'assets/shared/profile.jpg',
                    fit: BoxFit.cover,
                    height: 60,
                  )),
            ),
          );
        },
      ),
    );
  }
}
