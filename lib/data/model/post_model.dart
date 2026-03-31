class PostModel {
  final int id;
  final String title;
  final String description;
  final String category;
  final double price;

  PostModel({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.price,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: int.tryParse(json['id'].toString()) ?? 0,
      title: json['title'],
      description: json['description'],
      category: json['category'],
      price: double.tryParse(json['price'].toString()) ?? 0.00,
    );
  }
  }
