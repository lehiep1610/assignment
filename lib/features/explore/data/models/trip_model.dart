class TripModel {
  final String name;
  final String imageUrl;
  final int rentedPropsCount;
  TripModel({
    required this.name,
    required this.imageUrl,
    required this.rentedPropsCount,
  });

  factory TripModel.fromJson(Map<String, dynamic> json) => TripModel(
    name: json['name'] as String,
    imageUrl: json['image'] as String,
    rentedPropsCount: json['rented_props_count'] as int,
  );
}
