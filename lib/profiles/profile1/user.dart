class User {
  String name, address, about;
  User({
    required this.name,
    required this.address,
    required this.about,
  });
}

class Profile {
  User user;

  int followers, following, friends;
  Profile({
    required this.user,
    required this.friends,
    required this.followers,
    required this.following,
  });
}
