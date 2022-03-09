import 'dart:convert';

List<Entrees> entreesFromJson(String str) =>
    List<Entrees>.from(json.decode(str).map((x) => Entrees.fromMap(x)));

String entreesToJson(List<Entrees> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Entrees {
  String id_act;
  String nom_art;
  String prix_art;
  String duree;
  String description;
  String image_art;

  Entrees({
    this.id_act,
    this.nom_art,
    this.prix_art,
    this.duree,
    this.description,
    this.image_art,
  });

  factory Entrees.fromMap(Map<String, dynamic> json) => Entrees(
        id_act: json["id_act"],
        nom_art: json["nom_art"],
        prix_art: json["prix_art"],
        duree: json["duree"],
        description: json["description"],
        image_art: json["image_art"],
      );

  Map<String, dynamic> toJson() => {
        "id_act": id_act,
        "nom_art": nom_art,
        "prix_art": prix_art,
        "duree": duree,
        "description": description,
        "image_art": image_art,
      };
}
