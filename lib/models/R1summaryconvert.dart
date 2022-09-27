class R1summaryconvert {
  List<Agtotalcand>? agtotalcand;
  List<Agtotalallots>? agtotalallots;
  List<Vgtotalcand>? vgtotalcand;
  List<Vgtotalallots>? vgtotalallots;
  List<Agadmitcols>? agadmitcols;
  List<Vgadmitcols>? vgadmitcols;

  R1summaryconvert(
      {this.agtotalcand,
      this.agtotalallots,
      this.vgtotalcand,
      this.vgtotalallots,
      this.agadmitcols,
      this.vgadmitcols});

  R1summaryconvert.fromJson(Map<String, dynamic> json) {
    if (json['agtotalcand'] != null) {
      agtotalcand = <Agtotalcand>[];
      json['agtotalcand'].forEach((v) {
        agtotalcand!.add(new Agtotalcand.fromJson(v));
      });
    }
    if (json['agtotalallots'] != null) {
      agtotalallots = <Agtotalallots>[];
      json['agtotalallots'].forEach((v) {
        agtotalallots!.add(new Agtotalallots.fromJson(v));
      });
    }
    if (json['vgtotalcand'] != null) {
      vgtotalcand = <Vgtotalcand>[];
      json['vgtotalcand'].forEach((v) {
        vgtotalcand!.add(new Vgtotalcand.fromJson(v));
      });
    }
    if (json['vgtotalallots'] != null) {
      vgtotalallots = <Vgtotalallots>[];
      json['vgtotalallots'].forEach((v) {
        vgtotalallots!.add(new Vgtotalallots.fromJson(v));
      });
    }
    if (json['agadmitcols'] != null) {
      agadmitcols = <Agadmitcols>[];
      json['agadmitcols'].forEach((v) {
        agadmitcols!.add(new Agadmitcols.fromJson(v));
      });
    }
    if (json['vgadmitcols'] != null) {
      vgadmitcols = <Vgadmitcols>[];
      json['vgadmitcols'].forEach((v) {
        vgadmitcols!.add(new Vgadmitcols.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.agtotalcand != null) {
      data['agtotalcand'] = this.agtotalcand!.map((v) => v.toJson()).toList();
    }
    if (this.agtotalallots != null) {
      data['agtotalallots'] =
          this.agtotalallots!.map((v) => v.toJson()).toList();
    }
    if (this.vgtotalcand != null) {
      data['vgtotalcand'] = this.vgtotalcand!.map((v) => v.toJson()).toList();
    }
    if (this.vgtotalallots != null) {
      data['vgtotalallots'] =
          this.vgtotalallots!.map((v) => v.toJson()).toList();
    }
    if (this.agadmitcols != null) {
      data['agadmitcols'] = this.agadmitcols!.map((v) => v.toJson()).toList();
    }
    if (this.vgadmitcols != null) {
      data['vgadmitcols'] = this.vgadmitcols!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Agtotalcand {
  int? agtotalcand;

  Agtotalcand({this.agtotalcand});

  Agtotalcand.fromJson(Map<String, dynamic> json) {
    agtotalcand = json['agtotalcand'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['agtotalcand'] = this.agtotalcand;
    return data;
  }
}

class Agtotalallots {
  int? agtotalallots;

  Agtotalallots({this.agtotalallots});

  Agtotalallots.fromJson(Map<String, dynamic> json) {
    agtotalallots = json['agtotalallots'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['agtotalallots'] = this.agtotalallots;
    return data;
  }
}

class Vgtotalcand {
  int? vgtotalcand;

  Vgtotalcand({this.vgtotalcand});

  Vgtotalcand.fromJson(Map<String, dynamic> json) {
    vgtotalcand = json['vgtotalcand'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['vgtotalcand'] = this.vgtotalcand;
    return data;
  }
}

class Vgtotalallots {
  int? vgtotalallots;

  Vgtotalallots({this.vgtotalallots});

  Vgtotalallots.fromJson(Map<String, dynamic> json) {
    vgtotalallots = json['vgtotalallots'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['vgtotalallots'] = this.vgtotalallots;
    return data;
  }
}

class Agadmitcols {
  int? agadmitcols;

  Agadmitcols({this.agadmitcols});

  Agadmitcols.fromJson(Map<String, dynamic> json) {
    agadmitcols = json['agadmitcols'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['agadmitcols'] = this.agadmitcols;
    return data;
  }
}

class Vgadmitcols {
  int? vgadmitcols;

  Vgadmitcols({this.vgadmitcols});

  Vgadmitcols.fromJson(Map<String, dynamic> json) {
    vgadmitcols = json['vgadmitcols'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['vgadmitcols'] = this.vgadmitcols;
    return data;
  }
}