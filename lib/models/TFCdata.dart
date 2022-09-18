class tfclist {
  List<Tfcdata>? tfcdata;

  tfclist({this.tfcdata});

  tfclist.fromJson(Map<String, dynamic> json) {
    if (json['tfcdata'] != null) {
      tfcdata = <Tfcdata>[];
      json['tfcdata'].forEach((v) {
        tfcdata!.add(new Tfcdata.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.tfcdata != null) {
      data['tfcdata'] = this.tfcdata!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Tfcdata {
  int? tfccode;
  String? tfcname;

  Tfcdata({this.tfccode, this.tfcname});

  Tfcdata.fromJson(Map<String, dynamic> json) {
    tfccode = json['tfccode'];
    tfcname = json['tfcname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tfccode'] = this.tfccode;
    data['tfcname'] = this.tfcname;
    return data;
  }
}