class LocationModel {
  late int id;
  late String name;
  late bool isShow;
  LocationModel.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'];
    name = json['name'];
    isShow = json['isShow'] == 1;
  }
  LocationModel({required this.id, required this.isShow, required this.name});
}
