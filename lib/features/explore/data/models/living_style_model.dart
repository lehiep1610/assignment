class LivingStyleModel {
  final String name;
  final String imageUrl;

  const LivingStyleModel({required this.name, required this.imageUrl});

  factory LivingStyleModel.fromJson(Map<String, dynamic> json) =>
      LivingStyleModel(
        name: json['name'] as String,
        imageUrl: json['image'] as String,
      );
}
