class User {
  final String name;
  final String description;

  User({required this.name, required this.description});

  User copyWith(User newUser) {
    return User(
      name: newUser.name,
      description: newUser.description
    );
  }
}
