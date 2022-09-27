class R1summaryclgwise {
  List<Agaandj>? agaandj;
  List<Agaandjjoined>? agaandjjoined;
  List<Agupward>? agupward;
  List<Agupwardjoined>? agupwardjoined;
  List<Vgaandj>? vgaandj;
  List<Vgaandjjoined>? vgaandjjoined;
  List<Vgupward>? vgupward;
  List<Vgupwardjoined>? vgupwardjoined;

  R1summaryclgwise(
      {this.agaandj,
      this.agaandjjoined,
      this.agupward,
      this.agupwardjoined,
      this.vgaandj,
      this.vgaandjjoined,
      this.vgupward,
      this.vgupwardjoined});

  R1summaryclgwise.fromJson(Map<String, dynamic> json) {
    if (json['agaandj'] != null) {
      agaandj = <Agaandj>[];
      json['agaandj'].forEach((v) {
        agaandj!.add(new Agaandj.fromJson(v));
      });
    }
    if (json['agaandjjoined'] != null) {
      agaandjjoined = <Agaandjjoined>[];
      json['agaandjjoined'].forEach((v) {
        agaandjjoined!.add(new Agaandjjoined.fromJson(v));
      });
    }
    if (json['agupward'] != null) {
      agupward = <Agupward>[];
      json['agupward'].forEach((v) {
        agupward!.add(new Agupward.fromJson(v));
      });
    }
    if (json['agupwardjoined'] != null) {
      agupwardjoined = <Agupwardjoined>[];
      json['agupwardjoined'].forEach((v) {
        agupwardjoined!.add(new Agupwardjoined.fromJson(v));
      });
    }
    if (json['vgaandj'] != null) {
      vgaandj = <Vgaandj>[];
      json['vgaandj'].forEach((v) {
        vgaandj!.add(new Vgaandj.fromJson(v));
      });
    }
    if (json['vgaandjjoined'] != null) {
      vgaandjjoined = <Vgaandjjoined>[];
      json['vgaandjjoined'].forEach((v) {
        vgaandjjoined!.add(new Vgaandjjoined.fromJson(v));
      });
    }
    if (json['vgupward'] != null) {
      vgupward = <Vgupward>[];
      json['vgupward'].forEach((v) {
        vgupward!.add(new Vgupward.fromJson(v));
      });
    }
    if (json['vgupwardjoined'] != null) {
      vgupwardjoined = <Vgupwardjoined>[];
      json['vgupwardjoined'].forEach((v) {
        vgupwardjoined!.add(new Vgupwardjoined.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.agaandj != null) {
      data['agaandj'] = this.agaandj!.map((v) => v.toJson()).toList();
    }
    if (this.agaandjjoined != null) {
      data['agaandjjoined'] =
          this.agaandjjoined!.map((v) => v.toJson()).toList();
    }
    if (this.agupward != null) {
      data['agupward'] = this.agupward!.map((v) => v.toJson()).toList();
    }
    if (this.agupwardjoined != null) {
      data['agupwardjoined'] =
          this.agupwardjoined!.map((v) => v.toJson()).toList();
    }
    if (this.vgaandj != null) {
      data['vgaandj'] = this.vgaandj!.map((v) => v.toJson()).toList();
    }
    if (this.vgaandjjoined != null) {
      data['vgaandjjoined'] =
          this.vgaandjjoined!.map((v) => v.toJson()).toList();
    }
    if (this.vgupward != null) {
      data['vgupward'] = this.vgupward!.map((v) => v.toJson()).toList();
    }
    if (this.vgupwardjoined != null) {
      data['vgupwardjoined'] =
          this.vgupwardjoined!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Agaandj {
  String? sId;
  int? agajcount;

  Agaandj({this.sId, this.agajcount});

  Agaandj.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    agajcount = json['agajcount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['agajcount'] = this.agajcount;
    return data;
  }
}

class Agaandjjoined {
  String? sId;
  int? agajjoined;

  Agaandjjoined({this.sId, this.agajjoined});

  Agaandjjoined.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    agajjoined = json['agajjoined'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['agajjoined'] = this.agajjoined;
    return data;
  }
}

class Agupward {
  String? sId;
  int? agupcount;

  Agupward({this.sId, this.agupcount});

  Agupward.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    agupcount = json['agupcount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['agupcount'] = this.agupcount;
    return data;
  }
}

class Agupwardjoined {
  String? sId;
  int? agupjoined;

  Agupwardjoined({this.sId, this.agupjoined});

  Agupwardjoined.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    agupjoined = json['agupjoined'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['agupjoined'] = this.agupjoined;
    return data;
  }
}

class Vgaandj {
  String? sId;
  int? vgajcount;

  Vgaandj({this.sId, this.vgajcount});

  Vgaandj.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    vgajcount = json['vgajcount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['vgajcount'] = this.vgajcount;
    return data;
  }
}

class Vgaandjjoined {
  String? sId;
  int? vgajjoined;

  Vgaandjjoined({this.sId, this.vgajjoined});

  Vgaandjjoined.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    vgajjoined = json['vgajjoined'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['vgajjoined'] = this.vgajjoined;
    return data;
  }
}

class Vgupward {
  String? sId;
  int? vgupcount;

  Vgupward({this.sId, this.vgupcount});

  Vgupward.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    vgupcount = json['vgupcount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['vgupcount'] = this.vgupcount;
    return data;
  }
}

class Vgupwardjoined {
  String? sId;
  int? vgupjoined;

  Vgupwardjoined({this.sId, this.vgupjoined});

  Vgupwardjoined.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    vgupjoined = json['vgupjoined'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['vgupjoined'] = this.vgupjoined;
    return data;
  }
}