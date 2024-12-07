

class shiftListItemModel{

  String tarih;
  String saat;
  String ad;
  String soyad;
  double satisToplam;
  double fark;



  shiftListItemModel({required this.tarih, required this.saat, required this.ad, required this.soyad, required this.satisToplam, required this.fark});

  String get getTarih => tarih;
  String get getSaat => saat;
  String get getAd => ad;
  String get getSoyad => soyad;
  double get getSatisToplam => satisToplam;
  double get getFark => fark;


  //convert json to model
  factory shiftListItemModel.fromJson(Map<String, dynamic> json){
    return shiftListItemModel(
      tarih: json['tarih'],
      saat: json['saat'],
      ad: json['ad'],
      soyad: json['soyad'],
      satisToplam: json['satisToplam'],
      fark: json['fark']
    );
  }


  //convert model to json
  Map<String, dynamic> toJson() => {
    'tarih': tarih,
    'saat': saat,
    'ad': ad,
    'soyad': soyad,
    'satisToplam': satisToplam,
    'fark': fark
  };

  selectedShiftDataModel mergeToSelectedShiftModel(tempModel model){
    return selectedShiftDataModel(
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
      iadeToplam: double.parse(json['iadeToplam'].toString()),
      veresiyeToplam: double.parse(json['veresiyeToplam'].toString()),
      posToplam: double.parse(json['posToplam'].toString()),
      nakteStop: double.parse(json['nakteStop'].toString()),
      giderToplam: double.parse(json['giderToplam'].toString()),
      gelirToplam: double.parse(json['gelirToplam'].toString()),
      musteriSayisi: int.parse(json['musteriSayisi'].toString())

    );
  }
}

// now we will create a model for selected shift data that both tempModel values and shiftListItemModel values will be used

class selectedShiftDataModel{
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

  selectedShiftDataModel({required this.tarih, required this.saat, required this.ad, required this.soyad, required this.satisToplam, required this.fark, required this.iadeToplam, required this.veresiyeToplam, required this.posToplam, required this.nakteStop, required this.giderToplam, required this.gelirToplam, required this.musteriSayisi});

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
      tarih: json['tarih'],
      saat: json['saat'],
      ad: json['ad'],
      soyad: json['soyad'],
      satisToplam: json['satisToplam'],
      fark: json['fark'],
      iadeToplam: json['iadeToplam'],
      veresiyeToplam: json['veresiyeToplam'],
      posToplam: json['posToplam'],
      nakteStop: json['nakteStop'],
      giderToplam: json['giderToplam'],
      gelirToplam: json['gelirToplam'],
      musteriSayisi: json['musteriSayisi']);
  }

  //convert model to json
  Map<String, dynamic> toJson() => {
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
