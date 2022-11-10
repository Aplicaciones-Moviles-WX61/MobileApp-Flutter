import 'dart:convert';

List<Party> partyFromJsonList(String str) =>
    List<Party>.from(json.decode(str).map((x) => Party.fromJson(x)));

String partyToJson(Party data) => json.encode(data.toJson());

class Party {
  Party({
    this.id,
    required this.name,
    required this.description,
    this.location,
    this.date,
    this.image,
  });

  int? id;
  String name;
  String description;
  String? location;
  String? date;
  String? image;

  factory Party.fromJson(Map<String, dynamic> json) => Party(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        location: json["location"],
        date: json["date"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "location": location,
        "date": date,
        "image": image,
      };
}
