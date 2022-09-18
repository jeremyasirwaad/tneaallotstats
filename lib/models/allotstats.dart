class allotstats {
  List<Agtotalcand>? agtotalcand;
  List<Agtotalallots>? agtotalallots;
  List<Agtotalcols>? agtotalcols;
  List<Agtotaltfcs>? agtotaltfcs;
  List<Vgtotalcand>? vgtotalcand;
  List<Vgtotalallots>? vgtotalallots;
  List<Vgtotalcols>? vgtotalcols;
  List<Vgtotaltfcs>? vgtotaltfcs;
  List<Agadmitcols>? agadmitcols;
  List<Agadmittfcs>? agadmittfcs;
  List<Vgadmitcols>? vgadmitcols;
  List<Vgadmittfcs>? vgadmittfcs;

  allotstats(
      {this.agtotalcand,
      this.agtotalallots,
      this.agtotalcols,
      this.agtotaltfcs,
      this.vgtotalcand,
      this.vgtotalallots,
      this.vgtotalcols,
      this.vgtotaltfcs,
      this.agadmitcols,
      this.agadmittfcs,
      this.vgadmitcols,
      this.vgadmittfcs});

  allotstats.fromJson(Map<String, dynamic> json) {
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
    if (json['agtotalcols'] != null) {
      agtotalcols = <Agtotalcols>[];
      json['agtotalcols'].forEach((v) {
        agtotalcols!.add(new Agtotalcols.fromJson(v));
      });
    }
    if (json['agtotaltfcs'] != null) {
      agtotaltfcs = <Agtotaltfcs>[];
      json['agtotaltfcs'].forEach((v) {
        agtotaltfcs!.add(new Agtotaltfcs.fromJson(v));
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
    if (json['vgtotalcols'] != null) {
      vgtotalcols = <Vgtotalcols>[];
      json['vgtotalcols'].forEach((v) {
        vgtotalcols!.add(new Vgtotalcols.fromJson(v));
      });
    }
    if (json['vgtotaltfcs'] != null) {
      vgtotaltfcs = <Vgtotaltfcs>[];
      json['vgtotaltfcs'].forEach((v) {
        vgtotaltfcs!.add(new Vgtotaltfcs.fromJson(v));
      });
    }
    if (json['agadmitcols'] != null) {
      agadmitcols = <Agadmitcols>[];
      json['agadmitcols'].forEach((v) {
        agadmitcols!.add(new Agadmitcols.fromJson(v));
      });
    }
    if (json['agadmittfcs'] != null) {
      agadmittfcs = <Agadmittfcs>[];
      json['agadmittfcs'].forEach((v) {
        agadmittfcs!.add(new Agadmittfcs.fromJson(v));
      });
    }
    if (json['vgadmitcols'] != null) {
      vgadmitcols = <Vgadmitcols>[];
      json['vgadmitcols'].forEach((v) {
        vgadmitcols!.add(new Vgadmitcols.fromJson(v));
      });
    }
    if (json['vgadmittfcs'] != null) {
      vgadmittfcs = <Vgadmittfcs>[];
      json['vgadmittfcs'].forEach((v) {
        vgadmittfcs!.add(new Vgadmittfcs.fromJson(v));
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
    if (this.agtotalcols != null) {
      data['agtotalcols'] = this.agtotalcols!.map((v) => v.toJson()).toList();
    }
    if (this.agtotaltfcs != null) {
      data['agtotaltfcs'] = this.agtotaltfcs!.map((v) => v.toJson()).toList();
    }
    if (this.vgtotalcand != null) {
      data['vgtotalcand'] = this.vgtotalcand!.map((v) => v.toJson()).toList();
    }
    if (this.vgtotalallots != null) {
      data['vgtotalallots'] =
          this.vgtotalallots!.map((v) => v.toJson()).toList();
    }
    if (this.vgtotalcols != null) {
      data['vgtotalcols'] = this.vgtotalcols!.map((v) => v.toJson()).toList();
    }
    if (this.vgtotaltfcs != null) {
      data['vgtotaltfcs'] = this.vgtotaltfcs!.map((v) => v.toJson()).toList();
    }
    if (this.agadmitcols != null) {
      data['agadmitcols'] = this.agadmitcols!.map((v) => v.toJson()).toList();
    }
    if (this.agadmittfcs != null) {
      data['agadmittfcs'] = this.agadmittfcs!.map((v) => v.toJson()).toList();
    }
    if (this.vgadmitcols != null) {
      data['vgadmitcols'] = this.vgadmitcols!.map((v) => v.toJson()).toList();
    }
    if (this.vgadmittfcs != null) {
      data['vgadmittfcs'] = this.vgadmittfcs!.map((v) => v.toJson()).toList();
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

class Agtotalcols {
  int? agtotalcols;

  Agtotalcols({this.agtotalcols});

  Agtotalcols.fromJson(Map<String, dynamic> json) {
    agtotalcols = json['agtotalcols'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['agtotalcols'] = this.agtotalcols;
    return data;
  }
}

class Agtotaltfcs {
  int? agtotaltfcs;

  Agtotaltfcs({this.agtotaltfcs});

  Agtotaltfcs.fromJson(Map<String, dynamic> json) {
    agtotaltfcs = json['agtotaltfcs'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['agtotaltfcs'] = this.agtotaltfcs;
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

class Vgtotalcols {
  int? vgtotalcols;

  Vgtotalcols({this.vgtotalcols});

  Vgtotalcols.fromJson(Map<String, dynamic> json) {
    vgtotalcols = json['vgtotalcols'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['vgtotalcols'] = this.vgtotalcols;
    return data;
  }
}

class Vgtotaltfcs {
  int? vgtotaltfcs;

  Vgtotaltfcs({this.vgtotaltfcs});

  Vgtotaltfcs.fromJson(Map<String, dynamic> json) {
    vgtotaltfcs = json['vgtotaltfcs'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['vgtotaltfcs'] = this.vgtotaltfcs;
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

class Agadmittfcs {
  int? agadmittfcs;

  Agadmittfcs({this.agadmittfcs});

  Agadmittfcs.fromJson(Map<String, dynamic> json) {
    agadmittfcs = json['agadmittfcs'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['agadmittfcs'] = this.agadmittfcs;
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

class Vgadmittfcs {
  int? vgadmittfcs;

  Vgadmittfcs({this.vgadmittfcs});

  Vgadmittfcs.fromJson(Map<String, dynamic> json) {
    vgadmittfcs = json['vgadmittfcs'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['vgadmittfcs'] = this.vgadmittfcs;
    return data;
  }
}
