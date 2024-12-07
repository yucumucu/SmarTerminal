

class homeViewDataModel{
  String categoryName;
  double categoryPercentage;


  homeViewDataModel({required this.categoryName, required this.categoryPercentage});

  String get getCategoryName => categoryName;
  double get getCategoryPercentage => categoryPercentage;

  Map<String, dynamic> toJson() => {
    'categoryName': categoryName,
    'categoryPercentage': categoryPercentage
  };

  homeViewDataModel fromJson(Map<String, dynamic> json){
    return homeViewDataModel(
      categoryName: json['categoryName'],
      categoryPercentage: json['categoryPercentage']
    );
  }
}