

class productModel{
  String name;
  double purchasePrice;
  double salePrice;
  String group;
  int monthlySale;

  productModel({required this.name, required this.purchasePrice, required this.salePrice, required this.group, required this.monthlySale});

  String get getName => name;
  double get getPurchasePrice => purchasePrice;
  double get getSalePrice => salePrice;
  String get getGroup => group;
  int get getMonthlySale => monthlySale;

  factory productModel.fromJson(Map<String, dynamic> json){
    return productModel(
      name: json['name'] ?? "null",
      purchasePrice: json['purchasePrice'] ?? -1,
      salePrice: json['salePrice'] ?? -1,
      group: json['group'] ?? "null",
      monthlySale: json['monthlySale'] ?? -1);
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'purchasePrice': purchasePrice,
    'salePrice': salePrice,
    'group': group,
    'monthlySale': monthlySale
  };


}