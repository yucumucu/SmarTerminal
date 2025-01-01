/*

Genel Tanım:
•	Controller Adı: MarketVardiyaMasterController
•	Temel URL: api/shifts
•	Service Kullanımı: MarketVardiyaMasterService

1. Tüm Vardiyaları Getir
•	Endpoint: GET /api/shifts
•	Açıklama: Sistem üzerinde kayıtlı tüm vardiyaları liste olarak döner.
2. Belirli Bir Vardiyayı ID ile Getir
•	Endpoint: GET /api/shifts/{id}
•	Açıklama: Girilen ID'ye sahip vardiyanın detaylarını döner.
•
3. Vardiya Özetlerini Getir
•	Endpoint: GET /api/shifts/summaries
•	Açıklama: Tüm vardiyalara ait özet bilgileri döner.
•
4. Vardiya Detaylarını Getir
•	Endpoint: GET /api/shifts/{id}/details
•	Açıklama: Belirli bir vardiyaya ait detaylı bilgileri döner (örn. çalışan listesi, saat bilgileri, vb.).
•


 */

enum urlEnum {
  //GET
  getRoot,
  getAllShifts,
  getShiftById,
  getShiftSummaries,
  getShiftDetails,
  getShiftSales,
  mainMenuStats;

  String url([String? id]) {
    switch (this) {
      case urlEnum.getRoot:
        return "http://10.1.249.234:8080";
      case urlEnum.getAllShifts:
        return "/api/shifts";
      case urlEnum.getShiftById:
        return "/api/shifts/{id}";
      case urlEnum.getShiftSummaries:
        return "/api/shifts/summaries";
      case urlEnum.getShiftDetails:
        return "/api/shifts/${id}/details";
      case urlEnum.getShiftSales:
        return "/api/shifts/${id}/sales";
      case urlEnum.mainMenuStats:
        return "/api/MainMenuStats";


      default:
        return "";
    }
  }
}