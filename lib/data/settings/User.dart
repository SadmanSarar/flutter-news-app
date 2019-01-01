class User {
  String name;
  String email;
  String image;

  User(String name, String email, String image) {
    this.name = name == null ? '' : name;
    this.email = email == null ? '' : email;
    this.image = image == null ? '' : image;
  }
}
