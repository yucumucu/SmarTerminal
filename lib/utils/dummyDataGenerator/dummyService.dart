

class dummyDataService{

  List<Map<String, dynamic>>  dummyShiftList(){
    return [
      {
        "tarih": "2016-11-11",
        "saat": "null-null",
        "ad": "Diğer",
        "soyad": "Diğer",
        "satisToplam": 0.0,
        "fark": 0.0
      },
      {
        "tarih": "2024-10-22",
        "saat": "15:00-15:00",
        "ad": "YÜCEL",
        "soyad": "KAPLANER",
        "satisToplam": 0.0,
        "fark": 0.0
      },
      {
        "tarih": "2024-11-11",
        "saat": "22:56-12:08",
        "ad": "YÜCEL",
        "soyad": "KAPLANER",
        "satisToplam": 211.0,
        "fark": -11.0
      },
      {
        "tarih": "2024-11-11",
        "saat": "12:38-12:08",
        "ad": "CEMİL FATİH",
        "soyad": "YOL",
        "satisToplam": 289.0,
        "fark": -39.0
      },
      {
        "tarih": "2024-11-12",
        "saat": "22:13-12:07",
        "ad": "FURKAN NURİ",
        "soyad": "CANIPEK",
        "satisToplam": 244.0,
        "fark": -4.0
      },
    ];
  }


  Map<String, dynamic> dummySelectedShift() {
    return {
      "iadeToplam": 0.0,
      "veresiyeToplam": 0.0,
      "posToplam": 800,
      "nakteStop": 200.0,
      "giderToplam": 500,
      "gelirToplam": 1000,
      "musteriSayisi": 20
    };
  }

  Map<String, dynamic> dummyMainMenuStats(){
    return {
      "Snack": 15,
      "Gas": 45,
      "Beverage": 40
    };

  }

}


/*
[
    {
        "tarih": "2016-11-11",
        "saat": "null-null",
        "ad": "Diğer",
        "soyad": "Diğer",
        "satisToplam": 0.0,
        "fark": 0.0
    },
    {
        "tarih": "2024-10-22",
        "saat": "15:00-15:00",
        "ad": "YÜCEL",
        "soyad": "KAPLANER",
        "satisToplam": 0.0,
        "fark": 0.0
    },
    {
        "tarih": "2024-11-11",
        "saat": "22:56-12:08",
        "ad": "YÜCEL",
        "soyad": "KAPLANER",
        "satisToplam": 211.0,
        "fark": -11.0
    },
    {
        "tarih": "2024-11-11",
        "saat": "12:38-12:08",
        "ad": "CEMİL FATİH",
        "soyad": "YOL",
        "satisToplam": 289.0,
        "fark": -39.0
    },
    {
        "tarih": "2024-11-12",
        "saat": "22:13-12:07",
        "ad": "FURKAN NURİ",
        "soyad": "CANIPEK",
        "satisToplam": 244.0,
        "fark": -4.0
    },
    {
        "tarih": "2024-11-12",
        "saat": "18:28-null",
        "ad": "AHMET HAKAN",
        "soyad": "SEVİNÇ",
        "satisToplam": 0.0,
        "fark": 0.0
    },
    {
        "tarih": "2024-11-16",
        "saat": "20:17-12:07",
        "ad": "AHMET HAKAN",
        "soyad": "SEVİNÇ",
        "satisToplam": 3557.0,
        "fark": 3.0
    },
    {
        "tarih": "2024-11-17",
        "saat": "01:55-12:06",
        "ad": "ENES",
        "soyad": "ÖZKAN",
        "satisToplam": 3714.0,
        "fark": 6.0
    },
    {
        "tarih": "2024-11-18",
        "saat": "10:42-12:04",
        "ad": "YÜCEL",
        "soyad": "KAPLANER",
        "satisToplam": 5129.0,
        "fark": -4.0
    },
    {
        "tarih": "2024-11-18",
        "saat": "12:08-null",
        "ad": "CEMİL FATİH",
        "soyad": "YOL",
        "satisToplam": 1013.0,
        "fark": -1013.0
    }
]


************

detay:
{
    "iadeToplam": 0.0,
    "veresiyeToplam": 0.0,
    "posToplam": 0.0,
    "nakteStop": 200.0,
    "giderToplam": 0.0,
    "gelirToplam": 0.0,
    "musteriSayisi": null
}

 */
