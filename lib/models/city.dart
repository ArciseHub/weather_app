class City {
  final String? name;
  final double? lat;
  final double? lon;
  City({this.name, this.lat, this.lon});

  factory City.fromJSON(Map<String, dynamic> json) {
    return City(
      name: json["name"],
      lat: json["lat"],
      lon: json["lon"],
    );
  }
}
