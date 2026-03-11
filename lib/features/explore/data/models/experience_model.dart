class ExperienceModel {
  final String name;
  final String imageUrl;

  const ExperienceModel({required this.name, required this.imageUrl});

  factory ExperienceModel.fromJson(Map<String, dynamic> json) =>
      ExperienceModel(
        name: json['name'] as String,
        imageUrl: json['image'] as String,
      );
}
