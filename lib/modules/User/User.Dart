class User {
	final String name, email, password;

	const User({required this.user, required this.email, required this.password});

	Map<String, dynamic> toJson() => {
    "name": this.name,
    "email": this.email,
    "password": this.password
  };
}
