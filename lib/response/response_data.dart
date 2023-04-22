import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart' show rootBundle;

part 'response_data.g.dart';

@JsonSerializable()
class User {
  final int id;
  final String name;
  final String email;
  final String gender;
  final String status;
  final String created_at;
  final String updated_at;
  final double lat;
  final double lng;

  User(
      {required this.id,
      required this.name,
      required this.email,
      required this.gender,
      required this.status,
      required this.created_at,
      required this.updated_at,
      required this.lat,
      required this.lng});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable()
class ResponseData {
  int code;
  dynamic meta;
  List<dynamic> data;

  ResponseData({required this.code, required this.meta, required this.data});

  factory ResponseData.fromJson(Map<String, dynamic> json) =>
      _$ResponseDataFromJson(json);
  Map<String, dynamic> toJson() => _$ResponseDataToJson(this);
}
