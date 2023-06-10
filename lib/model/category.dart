import 'dart:convert';

List<CategoryItem> categoryItemFromJson(String str) => List<CategoryItem>.from(json.decode(str).map((x) => CategoryItem.fromJson(x)));

String categoryItemToJson(List<CategoryItem> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CategoryItem {
    String id;
    String price;
    String title;
    String images;
    double rating;
    String description;

    CategoryItem({
        required this.id,
        required this.price,
        required this.title,
        required this.images,
        required this.rating,
        required this.description,
    });

    factory CategoryItem.fromJson(Map<String, dynamic> json) => CategoryItem(
        id: json["id"],
        price: json["price"],
        title: json["title"],
        images: json["images"],
        rating: json["rating"]?.toDouble(),
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "price": price,
        "title": title,
        "images": images,
        "rating": rating,
        "description": description,
    };
}