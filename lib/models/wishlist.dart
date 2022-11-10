import 'dart:convert';

Wishlist wishlistFromJson(String str) => Wishlist.fromJson(json.decode(str));

String wishlistToJson(Wishlist data) => json.encode(data.toJson());

class Wishlist {
  Wishlist({
    this.id,
    required this.description,
    this.partyId,
    this.image,
  });

  constructor(id, description, partyId, image) {
    this.id = id ?? 0;
    this.description = description ?? '';
    this.partyId = partyId ?? 0;
    this.image = image ?? '';
  }

  int? id;
  String description;
  int? partyId;
  String? image;

  factory Wishlist.fromJson(Map<String, dynamic> json) => Wishlist(
        id: json["id"],
        description: json["description"],
        partyId: json["party_id"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "description": description,
        "party_id": partyId,
        "image": image,
      };
}
