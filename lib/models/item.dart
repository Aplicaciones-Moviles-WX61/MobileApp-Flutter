import 'dart:convert';

Item itemFromJson(String str) => Item.fromJson(json.decode(str));

String itemToJson(Item data) => json.encode(data.toJson());

class Item {
  Item({
    this.id,
    required this.name,
    required this.quantity,
    required this.description,
    required this.categoryId,
    required this.partyId,
    this.image,
  });

  int? id;
  String name;
  int quantity;
  String description;
  int categoryId;
  int partyId;
  String? image;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        name: json["name"],
        quantity: json["quantity"],
        description: json["description"],
        categoryId: json["category_id"],
        partyId: json["party_id"],
        image: json["image"],
      );

  factory Item.fromJsonAdd(Map<String, dynamic> json) => Item(
        id: json["id"],
        name: json["name"],
        quantity: int.parse(json["quantity"]),
        description: json["description"],
        categoryId: int.parse(json["category_id"]),
        partyId: json["party_id"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "quantity": quantity,
        "description": description,
        "category_id": categoryId,
        "party_id": partyId,
        "image": image,
      };
}
