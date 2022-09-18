// To parse this JSON data, do
//
//     final categorywise = categorywiseFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class Categorywise {
  Categorywise({
    required this.catagtfcs,
    required this.catagtfcsjoined,
    required this.catagcols,
    required this.catagcolsjoined,
    required this.catvgtfcs,
    required this.catvgtfcsjoined,
    required this.catvgcols,
    required this.catvgcolsjoined,
  });

  final List<Cat>? catagtfcs;
  final List<Catsjoined>? catagtfcsjoined;
  final List<Cat>? catagcols;
  final List<Catsjoined>? catagcolsjoined;
  final List<Cat>? catvgtfcs;
  final List<Catsjoined>? catvgtfcsjoined;
  final List<Cat>? catvgcols;
  final List<Catsjoined>? catvgcolsjoined;

  factory Categorywise.fromRawJson(String str) =>
      Categorywise.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Categorywise.fromJson(Map<String, dynamic> json) => Categorywise(
        catagtfcs: json["catagtfcs"] == null
            ? null
            : List<Cat>.from(json["catagtfcs"].map((x) => Cat.fromJson(x))),
        catagtfcsjoined: json["catagtfcsjoined"] == null
            ? null
            : List<Catsjoined>.from(
                json["catagtfcsjoined"].map((x) => Catsjoined.fromJson(x))),
        catagcols: json["catagcols"] == null
            ? null
            : List<Cat>.from(json["catagcols"].map((x) => Cat.fromJson(x))),
        catagcolsjoined: json["catagcolsjoined"] == null
            ? null
            : List<Catsjoined>.from(
                json["catagcolsjoined"].map((x) => Catsjoined.fromJson(x))),
        catvgtfcs: json["catvgtfcs"] == null
            ? null
            : List<Cat>.from(json["catvgtfcs"].map((x) => Cat.fromJson(x))),
        catvgtfcsjoined: json["catvgtfcsjoined"] == null
            ? null
            : List<Catsjoined>.from(
                json["catvgtfcsjoined"].map((x) => Catsjoined.fromJson(x))),
        catvgcols: json["catvgcols"] == null
            ? null
            : List<Cat>.from(json["catvgcols"].map((x) => Cat.fromJson(x))),
        catvgcolsjoined: json["catvgcolsjoined"] == null
            ? null
            : List<Catsjoined>.from(
                json["catvgcolsjoined"].map((x) => Catsjoined.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "catagtfcs": catagtfcs == null
            ? null
            : List<dynamic>.from(catagtfcs!.map((x) => x.toJson())),
        "catagtfcsjoined": catagtfcsjoined == null
            ? null
            : List<dynamic>.from(catagtfcsjoined!.map((x) => x.toJson())),
        "catagcols": catagcols == null
            ? null
            : List<dynamic>.from(catagcols!.map((x) => x.toJson())),
        "catagcolsjoined": catagcolsjoined == null
            ? null
            : List<dynamic>.from(catagcolsjoined!.map((x) => x.toJson())),
        "catvgtfcs": catvgtfcs == null
            ? null
            : List<dynamic>.from(catvgtfcs!.map((x) => x.toJson())),
        "catvgtfcsjoined": catvgtfcsjoined == null
            ? null
            : List<dynamic>.from(catvgtfcsjoined!.map((x) => x.toJson())),
        "catvgcols": catvgcols == null
            ? null
            : List<dynamic>.from(catvgcols!.map((x) => x.toJson())),
        "catvgcolsjoined": catvgcolsjoined == null
            ? null
            : List<dynamic>.from(catvgcolsjoined!.map((x) => x.toJson())),
      };
}

class Cat {
  Cat({
    required this.id,
    required this.count,
  });

  final int id;
  final int count;

  factory Cat.fromRawJson(String str) => Cat.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Cat.fromJson(Map<String, dynamic> json) => Cat(
        id: json["_id"] == null ? null : json["_id"],
        count: json["count"] == null ? null : json["count"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "count": count == null ? null : count,
      };
}

class Catsjoined {
  Catsjoined({
    required this.id,
    required this.joined,
  });

  final int id;
  final int joined;

  factory Catsjoined.fromRawJson(String str) =>
      Catsjoined.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Catsjoined.fromJson(Map<String, dynamic> json) => Catsjoined(
        id: json["_id"] == null ? null : json["_id"],
        joined: json["joined"] == null ? null : json["joined"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "joined": joined == null ? null : joined,
      };
}
