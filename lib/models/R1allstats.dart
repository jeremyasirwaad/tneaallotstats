// To parse this JSON data, do
//
//     final receiveddatacode = receiveddatacodeFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class Receiveddatacode {
  Receiveddatacode({
    required this.agtfcs,
    required this.agtfcsjoined,
    required this.agcols,
    required this.agcolsjoined,
    required this.vgtfcs,
    required this.vgtfcsjoined,
    required this.vgcols,
    required this.vgcolsjoined,
  });

  final List<Agcol>? agtfcs;
  final List<Sjoined>? agtfcsjoined;
  final List<Agcol>? agcols;
  final List<Sjoined>? agcolsjoined;
  final List<Agcol>? vgtfcs;
  final List<Sjoined>? vgtfcsjoined;
  final List<Agcol>? vgcols;
  final List<Sjoined>? vgcolsjoined;

  factory Receiveddatacode.fromJson(String str) =>
      Receiveddatacode.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Receiveddatacode.fromMap(Map<String, dynamic> json) =>
      Receiveddatacode(
        agtfcs: json["agtfcs"] == null
            ? null
            : List<Agcol>.from(json["agtfcs"].map((x) => Agcol.fromMap(x))),
        agtfcsjoined: json["agtfcsjoined"] == null
            ? null
            : List<Sjoined>.from(
                json["agtfcsjoined"].map((x) => Sjoined.fromMap(x))),
        agcols: json["agcols"] == null
            ? null
            : List<Agcol>.from(json["agcols"].map((x) => Agcol.fromMap(x))),
        agcolsjoined: json["agcolsjoined"] == null
            ? null
            : List<Sjoined>.from(
                json["agcolsjoined"].map((x) => Sjoined.fromMap(x))),
        vgtfcs: json["vgtfcs"] == null
            ? null
            : List<Agcol>.from(json["vgtfcs"].map((x) => Agcol.fromMap(x))),
        vgtfcsjoined: json["vgtfcsjoined"] == null
            ? null
            : List<Sjoined>.from(
                json["vgtfcsjoined"].map((x) => Sjoined.fromMap(x))),
        vgcols: json["vgcols"] == null
            ? null
            : List<Agcol>.from(json["vgcols"].map((x) => Agcol.fromMap(x))),
        vgcolsjoined: json["vgcolsjoined"] == null
            ? null
            : List<Sjoined>.from(
                json["vgcolsjoined"].map((x) => Sjoined.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "agtfcs": agtfcs == null
            ? null
            : List<dynamic>.from(agtfcs!.map((x) => x.toMap())),
        "agtfcsjoined": agtfcsjoined == null
            ? null
            : List<dynamic>.from(agtfcsjoined!.map((x) => x.toMap())),
        "agcols": agcols == null
            ? null
            : List<dynamic>.from(agcols!.map((x) => x.toMap())),
        "agcolsjoined": agcolsjoined == null
            ? null
            : List<dynamic>.from(agcolsjoined!.map((x) => x.toMap())),
        "vgtfcs": vgtfcs == null
            ? null
            : List<dynamic>.from(vgtfcs!.map((x) => x.toMap())),
        "vgtfcsjoined": vgtfcsjoined == null
            ? null
            : List<dynamic>.from(vgtfcsjoined!.map((x) => x.toMap())),
        "vgcols": vgcols == null
            ? null
            : List<dynamic>.from(vgcols!.map((x) => x.toMap())),
        "vgcolsjoined": vgcolsjoined == null
            ? null
            : List<dynamic>.from(vgcolsjoined!.map((x) => x.toMap())),
      };
}

class Agcol {
  Agcol({
    required this.id,
    required this.count,
  });

  final String id;
  final int count;

  factory Agcol.fromJson(String str) => Agcol.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Agcol.fromMap(Map<String, dynamic> json) => Agcol(
        id: json["_id"] == null ? null : json["_id"],
        count: json["count"] == null ? null : json["count"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id == null ? null : id,
        "count": count == null ? null : count,
      };
}

class Sjoined {
  Sjoined({
    required this.id,
    required this.joined,
  });

  final String id;
  final int joined;

  factory Sjoined.fromJson(String str) => Sjoined.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Sjoined.fromMap(Map<String, dynamic> json) => Sjoined(
        id: json["_id"] == null ? null : json["_id"],
        joined: json["joined"] == null ? null : json["joined"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id == null ? null : id,
        "joined": joined == null ? null : joined,
      };
}
