

class productModel{
  String name;
  double purchasePrice;
  double salePrice;
  String group;
  int monthlySale;
  List<int> yearlySale;
  List<int> monthlySales;

  productModel({required this.name, required this.purchasePrice, required this.salePrice, required this.group, required this.monthlySale, required this.yearlySale, required this.monthlySales});

  String get getName => name;
  double get getPurchasePrice => purchasePrice;
  double get getSalePrice => salePrice;
  String get getGroup => group;
  int get getMonthlySale => monthlySale;
  List<int> get getYearlySale => yearlySale;
  List<int> get getMonthlySales => monthlySales;

  factory productModel.fromJson(Map<String, dynamic> json){
    return productModel(
      name: json['name'] ?? "null",
      purchasePrice: json['purchasePrice'] ?? -1,
      salePrice: json['salePrice'] ?? -1,
      group: json['group'] ?? "null",
      monthlySale: json['monthlySale'] ?? -1,
      yearlySale: List<int>.from(json['yearlyGraph']),
      monthlySales: List<int>.from(json['monthlyGraph']),
    );

  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'purchasePrice': purchasePrice,
    'salePrice': salePrice,
    'group': group,
    'monthlySale': monthlySale,
    'yearlyGraph': yearlySale,
    'monthlyGraph': monthlySales
  };


}