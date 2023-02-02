import 'dart:ffi';

class Info{
  String category;
  String detailed_category;
  double id;
  String info;
  String location;
  double latitude;
  double longitude;
  String name;
  double no;

  Info(
      this.category,
      this.detailed_category,
      this.id,
      this.info,
      this.location,
      this.latitude,
      this.longitude,
      this.name,
      this.no,
      this.open);

  String open;
}