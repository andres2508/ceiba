import 'package:ceiba/infrastructure/database/persisten.entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'users.model.g.dart';

@JsonSerializable()
class User extends PersistenEntity {
  int id;
  String name;
  String username;
  String email;
  Address address;
  String phone;
  String website;
  Company company;

  User(this.id, this.name, this.username, this.email, this.address, this.phone,
      this.website, this.company);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  factory User.fromJson(Map<String, dynamic> json) =>
      _$UserFromJson(json);

  @override
  int getId() {
    return id;
  }

  @override
  Map<String, dynamic> toMap() {
    return this.toJson();
  }
}

@JsonSerializable()
class Address {
  String street;
  String suite;
  String city;
  String zipcode;
  Geolocation geo;

  Address(this.street, this.suite, this.city, this.zipcode, this.geo);

  Map<String, dynamic> toJson() => _$AddressToJson(this);

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);
}

@JsonSerializable()
class Geolocation {
  String lat;
  String lng;

  Geolocation(this.lat, this.lng);

  Map<String, dynamic> toJson() => _$GeolocationToJson(this);

  factory Geolocation.fromJson(Map<String, dynamic> json) =>
      _$GeolocationFromJson(json);
}

@JsonSerializable()
class Company {
  String name;
  String catchPhrase;
  String bs;

  Company(this.name, this.catchPhrase, this.bs);

  Map<String, dynamic> toJson() => _$CompanyToJson(this);

  factory Company.fromJson(Map<String, dynamic> json) =>
      _$CompanyFromJson(json);
}