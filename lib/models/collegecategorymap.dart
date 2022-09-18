class collegecategorymap {
  List<Collegecategory>? collegecategory;

  collegecategorymap({this.collegecategory});

  collegecategorymap.fromJson(Map<String, dynamic> json) {
    if (json['collegecategory'] != null) {
      collegecategory = <Collegecategory>[];
      json['collegecategory'].forEach((v) {
        collegecategory!.add(new Collegecategory.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.collegecategory != null) {
      data['collegecategory'] =
          this.collegecategory!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Collegecategory {
  int? ccode;
  String? cname;
  String? catname;
  int? catno;

  Collegecategory({this.ccode, this.cname, this.catname, this.catno});

  Collegecategory.fromJson(Map<String, dynamic> json) {
    ccode = json['ccode'];
    cname = json['cname'];
    catname = json['catname'];
    catno = json['catno'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ccode'] = this.ccode;
    data['cname'] = this.cname;
    data['catname'] = this.catname;
    data['catno'] = this.catno;
    return data;
  }
}