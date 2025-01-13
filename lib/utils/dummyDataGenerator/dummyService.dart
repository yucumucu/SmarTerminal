

import 'package:smarterminal/product/pages/productInfo/productModel.dart';

class dummyDataService{



  List<Map<String, dynamic>>  dummyShiftList(){
    return [
      {
        "tarih": "2024-12-16",
        "saat": "18:00-24:00",
        "ad": "Enes",
        "soyad": "Özkan",
        "satisToplam": 24000.0,
        "fark": 0.0
      },
      {
        "tarih": "2024-12-16",
        "saat": "12:00-18:00",
        "ad": "Yücel",
        "soyad": "Kaplaner",
        "satisToplam": 17300.0,
        "fark": -124.0
      },
      {
        "tarih": "2024-12-16",
        "saat": "06:00-12:00",
        "ad": "Ahmet Hakan",
        "soyad": "Sevinç",
        "satisToplam": 21100.0,
        "fark": -11.0
      },
      {
        "tarih": "2024-12-16",
        "saat": "00:00-06:00",
        "ad": "Furkan Nuri",
        "soyad": "Canıpek",
        "satisToplam": 28904.0,
        "fark": 39.0
      },

      {
        "tarih": "2024-12-15",
        "saat": "18:00-24:00",
        "ad": "Cemil Fatih",
        "soyad": "Yol",
        "satisToplam": 21300.0,
        "fark": 0.0
      },
      {
        "tarih": "2024-12-15",
        "saat": "12:00-18:00",
        "ad": "Yücel",
        "soyad": "Kaplaner",
        "satisToplam": 12440.0,
        "fark": -14.0
      },
      {
        "tarih": "2024-12-15",
        "saat": "06:00-12:00",
        "ad": "Ahmet Hakan",
        "soyad": "Sevinç",
        "satisToplam": 21503.0,
        "fark": -15.0
      },
      {
        "tarih": "2024-12-15",
        "saat": "00:00-06:00",
        "ad": "Furkan Nuri",
        "soyad": "Canıpek",
        "satisToplam": 25132.0,
        "fark": 3.0
      },
      {
        "tarih": "2024-12-14",
        "saat": "18:00-00:00",
        "ad": "Cemil Fatih",
        "soyad": "Yol",
        "satisToplam": 21195.0,
        "fark": 18.0
      },
      {
        "tarih": "2024-12-14",
        "saat": "12:00-18:00",
        "ad": "Furkan Nuri",
        "soyad": "Canıpek",
        "satisToplam": 17456.0,
        "fark": -5.0
      },
      {
        "tarih": "2024-12-14",
        "saat": "12:00-18:00",
        "ad": "Furkan Nuri",
        "soyad": "Canıpek",
        "satisToplam": 17456.0,
        "fark": -5.0
      },

    ];
  }


  Map<String, dynamic> dummySelectedShift() {
    return {
      "iadeToplam": 3.0,
      "veresiyeToplam": 0.0,
      "posToplam": 8300,
      "nakteStop": 2400.0,
      "giderToplam": 6400,
      "gelirToplam": 10700,
      "musteriSayisi": 64
    };
  }

  Map<String, dynamic> dummySelectedShiftSales(){
    return {
      "Ülker Çikolata": 12,
      "Fanta": 23,
      "Coca Cola": 32,
      "Marlboro": 40,
      "Lays": 50,
      "Doritos": 61,
      "Pepsi": 2,
      "Snickers": 82,
      "Kitkat": 90,
      "Redbull": 100
    };
  }

  Map<String, dynamic> dummyMainMenuStats(){
    return {
      "Snack": 33,
      "Auto Care": 23,
      "Beverage": 40,
      "Cigarette": 78
    };

  }


  List<productModel> fetchSearchProductData(){
    productModel _product1 = productModel(
        name: "product1",
        purchasePrice: 1,
        salePrice: 1,
        group: "group1",
        monthlySale: 1);

    productModel _product2 = productModel(
        name: "product2",
        purchasePrice: 2,
        salePrice: 2,
        group: "group2",
        monthlySale: 2);


    return [_product1, _product2];


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
