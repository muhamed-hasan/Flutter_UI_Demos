import 'package:marthon1/profiles/profile1/user.dart';

class Profile1Provider {
  static Profile getProfile() {
    return Profile(
      user: User(
          name: 'Erik Smith',
          address: '677 Adams ByPass ',
          about:
              'working as flutter developer \nLorem, ipsum dolor sit amet consectetur adipisicing elit. Eaque quos impedit nulla, quo quisquam amet minima rerum quidem esse velit sit ipsum placeat tempore perspiciatis vero similique voluptatum illum ab.'),
      friends: 144,
      followers: 2388,
      following: 584,
    );
  }
}
