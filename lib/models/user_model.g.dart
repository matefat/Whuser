// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserNameAdapter extends TypeAdapter<UserName> {
  @override
  final int typeId = 2;

  @override
  UserName read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserName(
      title: fields[0] as String,
      first: fields[1] as String,
      last: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, UserName obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.first)
      ..writeByte(2)
      ..write(obj.last);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserNameAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class UserStreetAdapter extends TypeAdapter<UserStreet> {
  @override
  final int typeId = 3;

  @override
  UserStreet read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserStreet(
      number: fields[0] as int,
      name: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, UserStreet obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.number)
      ..writeByte(1)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserStreetAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class UserCoordinatesAdapter extends TypeAdapter<UserCoordinates> {
  @override
  final int typeId = 4;

  @override
  UserCoordinates read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserCoordinates(
      latitude: fields[0] as String,
      longitude: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, UserCoordinates obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.latitude)
      ..writeByte(1)
      ..write(obj.longitude);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserCoordinatesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class UserTimezoneAdapter extends TypeAdapter<UserTimezone> {
  @override
  final int typeId = 5;

  @override
  UserTimezone read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserTimezone(
      offset: fields[0] as String,
      description: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, UserTimezone obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.offset)
      ..writeByte(1)
      ..write(obj.description);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserTimezoneAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class UserLocationAdapter extends TypeAdapter<UserLocation> {
  @override
  final int typeId = 6;

  @override
  UserLocation read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserLocation(
      street: fields[0] as UserStreet,
      city: fields[1] as String,
      state: fields[2] as String,
      country: fields[3] as String,
      postcode: fields[4] as String,
      coordinates: fields[5] as UserCoordinates,
      timezone: fields[6] as UserTimezone,
    );
  }

  @override
  void write(BinaryWriter writer, UserLocation obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.street)
      ..writeByte(1)
      ..write(obj.city)
      ..writeByte(2)
      ..write(obj.state)
      ..writeByte(3)
      ..write(obj.country)
      ..writeByte(4)
      ..write(obj.postcode)
      ..writeByte(5)
      ..write(obj.coordinates)
      ..writeByte(6)
      ..write(obj.timezone);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserLocationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class UserLoginAdapter extends TypeAdapter<UserLogin> {
  @override
  final int typeId = 7;

  @override
  UserLogin read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserLogin(
      uuid: fields[0] as String,
      username: fields[1] as String,
      password: fields[2] as String,
      salt: fields[3] as String,
      md5: fields[4] as String,
      sha1: fields[5] as String,
      sha256: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, UserLogin obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.uuid)
      ..writeByte(1)
      ..write(obj.username)
      ..writeByte(2)
      ..write(obj.password)
      ..writeByte(3)
      ..write(obj.salt)
      ..writeByte(4)
      ..write(obj.md5)
      ..writeByte(5)
      ..write(obj.sha1)
      ..writeByte(6)
      ..write(obj.sha256);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserLoginAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class UserAgeAdapter extends TypeAdapter<UserAge> {
  @override
  final int typeId = 8;

  @override
  UserAge read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserAge(
      date: fields[0] as DateTime,
      age: fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, UserAge obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.age);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserAgeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class UserDocAdapter extends TypeAdapter<UserDoc> {
  @override
  final int typeId = 9;

  @override
  UserDoc read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserDoc(
      name: fields[0] as String?,
      value: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, UserDoc obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.value);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserDocAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class UserPictureAdapter extends TypeAdapter<UserPicture> {
  @override
  final int typeId = 10;

  @override
  UserPicture read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserPicture(
      large: fields[0] as String,
      medium: fields[1] as String,
      thumbnail: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, UserPicture obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.large)
      ..writeByte(1)
      ..write(obj.medium)
      ..writeByte(2)
      ..write(obj.thumbnail);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserPictureAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class UserAdapter extends TypeAdapter<User> {
  @override
  final int typeId = 1;

  @override
  User read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return User(
      gender: fields[0] as String,
      name: fields[1] as UserName,
      location: fields[2] as UserLocation,
      email: fields[3] as String,
      login: fields[4] as UserLogin,
      dob: fields[5] as UserAge,
      registered: fields[6] as UserAge,
      phone: fields[7] as String,
      cell: fields[8] as String,
      idDoc: fields[9] as UserDoc,
      picture: fields[10] as UserPicture,
      nat: fields[11] as String,
    );
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.gender)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.location)
      ..writeByte(3)
      ..write(obj.email)
      ..writeByte(4)
      ..write(obj.login)
      ..writeByte(5)
      ..write(obj.dob)
      ..writeByte(6)
      ..write(obj.registered)
      ..writeByte(7)
      ..write(obj.phone)
      ..writeByte(8)
      ..write(obj.cell)
      ..writeByte(9)
      ..write(obj.idDoc)
      ..writeByte(10)
      ..write(obj.picture)
      ..writeByte(11)
      ..write(obj.nat);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
