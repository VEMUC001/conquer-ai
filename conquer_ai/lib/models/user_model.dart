import 'package:flutter/material.dart';

@immutable
class UserModel {
  const UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.avatar,
  });

  final String id;
  final String name;
  final String email;
  final String avatar;

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      avatar: json['avatar'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'avatar': avatar,
    };
  }

  UserModel clone() {
    return UserModel(
      id: id,
      name: name,
      email: email,
      avatar: avatar,
    );
  }

  UserModel copyWith({
    String? id,
    String? name,
    String? email,
    String? avatar,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      avatar: avatar ?? this.avatar,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserModel &&
          id == other.id &&
          name == other.name &&
          email == other.email &&
          avatar == other.avatar);

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      id.hashCode ^
      name.hashCode ^
      email.hashCode ^
      avatar.hashCode;

  @override
  String toString() {
    return 'UserModel{id: $id, name: $name, email: $email, avatar: $avatar}';
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'avatar': avatar,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
      avatar: map['avatar'] as String,
    );
  }
}
