import 'dart:convert';

List<ContactModel> contactModelFromJson(String str) => List<ContactModel>.from(
    json.decode(str).map((x) => ContactModel.fromJson(x)));

String contactModelToJson(List<ContactModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ContactModel {
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? dob;

  ContactModel({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.dob,
  });

  ContactModel copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? email,
    String? dob,
  }) =>
      ContactModel(
        id: id ?? this.id,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        email: email ?? this.email,
        dob: dob ?? this.dob,
      );

  factory ContactModel.fromJson(Map<String, dynamic> json) => ContactModel(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        dob: json["dob"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "dob": dob,
      };
}
