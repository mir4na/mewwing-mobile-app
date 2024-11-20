// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<Welcome> welcomeFromJson(String str) => List<Welcome>.from(json.decode(str).map((x) => Welcome.fromJson(x)));

String welcomeToJson(List<Welcome> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Welcome {
    String model;
    String pk;
    Fields fields;

    Welcome({
        required this.model,
        required this.pk,
        required this.fields,
    });

    factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
    );

    Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
    };
}

class Fields {
    String name;
    double amount;
    String description;
    String imageUrl;
    DateTime date;

    Fields({
        required this.name,
        required this.amount,
        required this.description,
        required this.imageUrl,
        required this.date,
    });

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        name: json["name"],
        amount: json["amount"]?.toDouble(),
        description: json["description"],
        imageUrl: json["image_url"],
        date: DateTime.parse(json["date"]),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "amount": amount,
        "description": description,
        "image_url": imageUrl,
        "date": date.toIso8601String(),
    };
}
