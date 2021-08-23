// To parse this JSON data, do
//
//     final tokenMember = tokenMemberFromJson(jsonString);

import 'dart:convert';

TokenMember tokenMemberFromJson(String str) =>
    TokenMember.fromJson(json.decode(str));

String tokenMemberToJson(TokenMember data) => json.encode(data.toJson());

class TokenMember {
  TokenMember({
    this.id,
    this.firstname,
    this.lastname,
    this.email,
    this.mobile,
    this.country,
    this.password,
    this.image,
    this.position,
    this.role,
    this.created,
    this.updated,
    this.v,
    this.tokenMemberId,
  });

  String id;
  String firstname;
  String lastname;
  String email;
  String mobile;
  String country;
  String password;
  String image;
  String position;
  int role;
  String created;
  String updated;
  int v;
  String tokenMemberId;

  factory TokenMember.fromJson(Map<String, dynamic> json) => TokenMember(
        id: json["_id"] == null ? null : json["_id"],
        firstname: json["firstname"] == null ? null : json["firstname"],
        lastname: json["lastname"] == null ? null : json["lastname"],
        email: json["email"] == null ? null : json["email"],
        mobile: json["mobile"] == null ? null : json["mobile"],
        country: json["country"] == null ? null : json["country"],
        password: json["password"] == null ? null : json["password"],
        image: json["image"] == null ? null : json["image"],
        position: json["position"] == null ? null : json["position"],
        role: json["role"] == null ? null : json["role"],
        created: json["created"] == null ? null : json["created"],
        updated: json["updated"] == null ? null : json["updated"],
        v: json["__v"] == null ? null : json["__v"],
        tokenMemberId: json["id"] == null ? null : json["id"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "firstname": firstname == null ? null : firstname,
        "lastname": lastname == null ? null : lastname,
        "email": email == null ? null : email,
        "mobile": mobile == null ? null : mobile,
        "country": country == null ? null : country,
        "password": password == null ? null : password,
        "image": image == null ? null : image,
        "position": position == null ? null : position,
        "role": role == null ? null : role,
        "created": created == null ? null : created,
        "updated": updated == null ? null : updated,
        "__v": v == null ? null : v,
        "id": tokenMemberId == null ? null : tokenMemberId,
      };
}
