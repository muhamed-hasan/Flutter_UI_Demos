import 'package:marthon1/profiles/profile2/profile.dart';

class ProfileProvider {
  static Profile getProfile() {
    return Profile(
      user: User(
          name: 'Erik Smith',
          address: '677 Adams ByPass ',
          about:
              'working as flutter developer \n Lorem, ipsum dolor sit amet consectetur adipisicing elit. Eaque quos impedit nulla, quo quisquam amet minima rerum quidem esse velit sit ipsum placeat tempore perspiciatis vero similique voluptatum illum ab.'),
      friends: 144,
      followers: 2388,
      following: 584,
    );
  }
}
