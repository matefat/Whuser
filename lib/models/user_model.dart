import 'package:hive/hive.dart';

part 'user_model.g.dart';

@HiveType(typeId: 2)
class UserName {
  @HiveField(0) final String title;
  @HiveField(1) final String first;
  @HiveField(2) final String last;

  const UserName({required this.title, required this.first, required this.last});

  factory UserName.fromJson(Map<String, dynamic>? json) => UserName(
    title: (json?['title'] ?? '') as String,
    first: (json?['first'] ?? '') as String,
    last:  (json?['last']  ?? '') as String,
  );

  String get fullName => [title, first, last].where((s) => s.trim().isNotEmpty).join(' ').trim();
}

@HiveType(typeId: 3)
class UserStreet {
  @HiveField(0) final int number;
  @HiveField(1) final String name;

  const UserStreet({required this.number, required this.name});

  factory UserStreet.fromJson(Map<String, dynamic>? json) => UserStreet(
    number: (json?['number'] is int) ? json!['number'] as int : int.tryParse('${json?['number'] ?? 0}') ?? 0,
    name: (json?['name'] ?? '') as String,
  );
}

@HiveType(typeId: 4)
class UserCoordinates {
  @HiveField(0) final String latitude;
  @HiveField(1) final String longitude;

  const UserCoordinates({required this.latitude, required this.longitude});

  factory UserCoordinates.fromJson(Map<String, dynamic>? json) => UserCoordinates(
    latitude: (json?['latitude'] ?? '') as String,
    longitude: (json?['longitude'] ?? '') as String,
  );
}

@HiveType(typeId: 5)
class UserTimezone {
  @HiveField(0) final String offset;
  @HiveField(1) final String description;

  const UserTimezone({required this.offset, required this.description});

  factory UserTimezone.fromJson(Map<String, dynamic>? json) => UserTimezone(
    offset: (json?['offset'] ?? '') as String,
    description: (json?['description'] ?? '') as String,
  );
}

@HiveType(typeId: 6)
class UserLocation {
  @HiveField(0) final UserStreet street;
  @HiveField(1) final String city;
  @HiveField(2) final String state;
  @HiveField(3) final String country;
  @HiveField(4) final String postcode;
  @HiveField(5) final UserCoordinates coordinates;
  @HiveField(6) final UserTimezone timezone;

  const UserLocation({
    required this.street,
    required this.city,
    required this.state,
    required this.country,
    required this.postcode,
    required this.coordinates,
    required this.timezone,
  });

  factory UserLocation.fromJson(Map<String, dynamic>? json) => UserLocation(
    street: UserStreet.fromJson(json?['street'] as Map<String, dynamic>?),
    city: (json?['city'] ?? '') as String,
    state: (json?['state'] ?? '') as String,
    country: (json?['country'] ?? '') as String,
    postcode: (() {
      final pc = json?['postcode'];
      return (pc == null) ? '' : pc.toString();
    })(),
    coordinates: UserCoordinates.fromJson(json?['coordinates'] as Map<String, dynamic>?),
    timezone: UserTimezone.fromJson(json?['timezone'] as Map<String, dynamic>?),
  );
}

@HiveType(typeId: 7)
class UserLogin {
  @HiveField(0) final String uuid;
  @HiveField(1) final String username;
  @HiveField(2) final String password;
  @HiveField(3) final String salt;
  @HiveField(4) final String md5;
  @HiveField(5) final String sha1;
  @HiveField(6) final String sha256;

  const UserLogin({
    required this.uuid,
    required this.username,
    required this.password,
    required this.salt,
    required this.md5,
    required this.sha1,
    required this.sha256,
  });

  factory UserLogin.fromJson(Map<String, dynamic>? json) => UserLogin(
    uuid: (json?['uuid'] ?? '') as String,
    username: (json?['username'] ?? '') as String,
    password: (json?['password'] ?? '') as String,
    salt: (json?['salt'] ?? '') as String,
    md5: (json?['md5'] ?? '') as String,
    sha1: (json?['sha1'] ?? '') as String,
    sha256: (json?['sha256'] ?? '') as String,
  );
}

@HiveType(typeId: 8)
class UserAge {
  @HiveField(0) final DateTime date;
  @HiveField(1) final int age;

  const UserAge({required this.date, required this.age});

  factory UserAge.fromJson(Map<String, dynamic>? json) => UserAge(
    date: DateTime.tryParse((json?['date'] ?? '') as String) ?? DateTime(1970),
    age: (json?['age'] is int) ? json!['age'] as int : int.tryParse('${json?['age'] ?? 0}') ?? 0,
  );
}

@HiveType(typeId: 9)
class UserDoc {
  @HiveField(0) final String? name;
  @HiveField(1) final String? value;

  const UserDoc({this.name, this.value});

  factory UserDoc.fromJson(Map<String, dynamic>? json) => UserDoc(
    name: (json?['name'] == null || (json?['name'] as String).isEmpty) ? null : json?['name'] as String,
    value: (json?['value'] == null || (json?['value']).toString().isEmpty) ? null : json?['value'].toString(),
  );
}

@HiveType(typeId: 10)
class UserPicture {
  @HiveField(0) final String large;
  @HiveField(1) final String medium;
  @HiveField(2) final String thumbnail;

  const UserPicture({required this.large, required this.medium, required this.thumbnail});

  factory UserPicture.fromJson(Map<String, dynamic>? json) => UserPicture(
    large: (json?['large'] ?? '') as String,
    medium: (json?['medium'] ?? '') as String,
    thumbnail: (json?['thumbnail'] ?? '') as String,
  );
}


@HiveType(typeId: 1)
class User {
  @HiveField(0)  final String gender;
  @HiveField(1)  final UserName name;
  @HiveField(2)  final UserLocation location;
  @HiveField(3)  final String email;
  @HiveField(4)  final UserLogin login;
  @HiveField(5)  final UserAge dob;
  @HiveField(6)  final UserAge registered;
  @HiveField(7)  final String phone;
  @HiveField(8)  final String cell;
  @HiveField(9)  final UserDoc idDoc;
  @HiveField(10) final UserPicture picture;
  @HiveField(11) final String nat;

  const User({
    required this.gender,
    required this.name,
    required this.location,
    required this.email,
    required this.login,
    required this.dob,
    required this.registered,
    required this.phone,
    required this.cell,
    required this.idDoc,
    required this.picture,
    required this.nat,
  });

  String get fullName => name.fullName;

  factory User.fromJson(Map<String, dynamic> json) => User(
    gender: (json['gender'] ?? '') as String,
    name: UserName.fromJson(json['name'] as Map<String, dynamic>?),
    location: UserLocation.fromJson(json['location'] as Map<String, dynamic>?),
    email: (json['email'] ?? '') as String,
    login: UserLogin.fromJson(json['login'] as Map<String, dynamic>?),
    dob: UserAge.fromJson(json['dob'] as Map<String, dynamic>?),
    registered: UserAge.fromJson(json['registered'] as Map<String, dynamic>?),
    phone: (json['phone'] ?? '') as String,
    cell: (json['cell'] ?? '') as String,
    idDoc: UserDoc.fromJson(json['id'] as Map<String, dynamic>?),
    picture: UserPicture.fromJson(json['picture'] as Map<String, dynamic>?),
    nat: (json['nat'] ?? '') as String,
  );
}