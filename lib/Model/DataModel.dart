class DataModel {
  String? name;
  String? city;

  DataModel({this.name, this.city});

  DataModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    city = json['city'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['city'] = this.city;
    return data;
  }
}
