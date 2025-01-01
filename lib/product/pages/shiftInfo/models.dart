

class shiftListItemModel{

  String id;
  String tarih;
  String saat;
  String ad;
  String soyad;
  double satisToplam;
  double fark;



  shiftListItemModel({required this.id, required this.tarih, required this.saat, required this.ad, required this.soyad, required this.satisToplam, required this.fark});

  String get getId => id;
  String get getTarih => tarih;
  String get getSaat => saat;
  String get getAd => ad;
  String get getSoyad => soyad;
  double get getSatisToplam => satisToplam;
  double get getFark => fark;


  //convert json to model
  factory shiftListItemModel.fromJson(Map<String, dynamic> json){
    return shiftListItemModel(
      id: json['id'] ?? "null",
      tarih: json['tarih'] ?? "null",
      saat: json['saat'] ?? "null",
      ad: json['ad'] ?? "null",
      soyad: json['soyad'] ?? "null",
      satisToplam: json['satisToplam'] ?? -1,
      fark: json['fark'] ?? -1
    );
  }


  //convert model to json
  Map<String, dynamic> toJson() => {
    'id': id,
    'tarih': tarih,
    'saat': saat,
    'ad': ad,
    'soyad': soyad,
    'satisToplam': satisToplam,
    'fark': fark
  };

  selectedShiftDataModel mergeToSelectedShiftModel(tempModel model){
    return selectedShiftDataModel(
      id: id,
      tarih: tarih,
      saat: saat,
      ad: ad,
      soyad: soyad,
      satisToplam: satisToplam,
      fark: fark,
      iadeToplam: model.iadeToplam,
      veresiyeToplam: model.veresiyeToplam,
      posToplam: model.posToplam,
      nakteStop: model.nakteStop,
      giderToplam: model.giderToplam,
      gelirToplam: model.gelirToplam,
      musteriSayisi: model.musteriSayisi
    );
  }

}

/*
json cevap:{
    "iadeToplam": 400.0,
    "veresiyeToplam": 0.0,
    "posToplam": 0.0,
    "nakteStop": 4725.0,
    "giderToplam": 0.0,
    "gelirToplam": 0.0,
    "musteriSayisi": 11
}
 */


class tempModel{
  double iadeToplam;
  double veresiyeToplam;
  double posToplam;
  double nakteStop;
  double giderToplam;
  double gelirToplam;
  int musteriSayisi;

  tempModel({required this.iadeToplam, required this.veresiyeToplam, required this.posToplam, required this.nakteStop, required this.giderToplam, required this.gelirToplam, required this.musteriSayisi});

  factory tempModel.fromJson(Map<String, dynamic> json){
    return tempModel(
      iadeToplam: json["iadeToplam"] != null ? double.parse(json['iadeToplam'].toString()) : -1,
      veresiyeToplam: json["veresiyeToplam"] != null ? double.parse(json['veresiyeToplam'].toString()) : -1,
      posToplam: json["posToplam"] != null ? double.parse(json['posToplam'].toString()) : -1,
      nakteStop: json["nakteStop"] != null ? double.parse(json['nakteStop'].toString()) : -1,
      giderToplam: json["giderToplam"] != null ? double.parse(json['giderToplam'].toString()) : -1,
      gelirToplam: json["gelirToplam"] != null ? double.parse(json['gelirToplam'].toString()) : -1,
      musteriSayisi: json["musteriSayisi"] != null ? int.parse(json['musteriSayisi'].toString()) : -1

    );
  }
}

// now we will create a model for selected shift data that both tempModel values and shiftListItemModel values will be used

class selectedShiftDataModel{
  String id;
  String tarih;
  String saat;
  String ad;
  String soyad;
  double satisToplam;
  double fark;
  double iadeToplam;
  double veresiyeToplam;
  double posToplam;
  double nakteStop;
  double giderToplam;
  double gelirToplam;
  int musteriSayisi;

  selectedShiftDataModel({required this.id, required this.tarih, required this.saat, required this.ad, required this.soyad, required this.satisToplam, required this.fark, required this.iadeToplam, required this.veresiyeToplam, required this.posToplam, required this.nakteStop, required this.giderToplam, required this.gelirToplam, required this.musteriSayisi});

  String get getId => id;
  String get getTarih => tarih;
  String get getSaat => saat;
  String get getAd => ad;
  String get getSoyad => soyad;
  double get getSatisToplam => satisToplam;
  double get getFark => fark;
  double get getIadeToplam => iadeToplam;
  double get getVeresiyeToplam => veresiyeToplam;
  double get getPosToplam => posToplam;
  double get getNakteStop => nakteStop;
  double get getGiderToplam => giderToplam;
  double get getGelirToplam => gelirToplam;
  int get getMusteriSayisi => musteriSayisi;

  //convert json to model
  selectedShiftDataModel fromJson(Map<String, dynamic> json){
    return selectedShiftDataModel(
      id: json['id'] ?? "null",
      tarih: json['tarih'] ?? "null",
      saat: json['saat'] ?? "null",
      ad: json['ad'] ?? "null",
      soyad: json['soyad'] ?? "null",
      satisToplam: json['satisToplam'] ?? -1,
      fark: json['fark'] ?? -1,
      iadeToplam: json['iadeToplam'] ?? -1,
      veresiyeToplam: json['veresiyeToplam'] ?? -1,
      posToplam: json['posToplam'] ?? -1,
      nakteStop: json['nakteStop'] ?? -1,
      giderToplam: json['giderToplam'] ?? -1,
      gelirToplam: json['gelirToplam'] ?? -1,
      musteriSayisi: json['musteriSayisi'] ?? -1);
  }

  //convert model to json
  Map<String, dynamic> toJson() => {
    'id': id,
    'tarih': tarih,
    'saat': saat,
    'ad': ad,
    'soyad': soyad,
    'satisToplam': satisToplam,
    'fark': fark,
    'iadeToplam': iadeToplam,
    'veresiyeToplam': veresiyeToplam,
    'posToplam': posToplam,
    'nakteStop': nakteStop,
    'giderToplam': giderToplam,
    'gelirToplam': gelirToplam,
    'musteriSayisi': musteriSayisi
  };


}


class shiftViewSalesModel{
  String productName;
  int amount;


  shiftViewSalesModel({required this.productName, required this.amount});



  Map<String, dynamic> toJson() => {
    'productName': productName,
    'amount': amount
  };

  shiftViewSalesModel fromJson(Map<String, dynamic> json){
    return shiftViewSalesModel(
        productName: json['productName'] ?? "null",
        amount: json['amount'] ?? -1
    );
  }
}