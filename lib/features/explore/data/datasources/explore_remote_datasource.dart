import 'dart:convert';

import 'package:assignment/features/explore/data/models/experience_model.dart';
import 'package:assignment/features/explore/data/models/living_style_model.dart';
import 'package:assignment/features/explore/data/models/trip_model.dart';

abstract interface class ExploreRemoteDatasource {
  Future<List<TripModel>> getTrips();
  Future<List<LivingStyleModel>> getLivingStyles();
  Future<List<ExperienceModel>> getExperiences();
}

class ExploreRemoteDatasourceImpl implements ExploreRemoteDatasource {
  @override
  Future<List<TripModel>> getTrips() async {
    await Future.delayed(const Duration(seconds: 1));
    const json = '''[
      {"name": "Bali, Indonesia", "image": "https://i.ibb.co/hcwLryT/bali-indonesia.jpg", "rented_props_count": 100},
      {"name": "Tokyo, Japan", "image": "https://i.ibb.co/vZt1WZS/tokyo-city.jpg", "rented_props_count": 234363},
      {"name": "Sydney, Australia", "image": "https://i.ibb.co/mhKDThR/sydney-city.jpg", "rented_props_count": 9124},
      {"name": "New York, United States", "image": "https://i.ibb.co/phPV00W/new-york-city.jpg", "rented_props_count": 2541098}
    ]''';
    return (jsonDecode(json) as List)
        .map((e) => TripModel.fromJson(e))
        .toList();
  }

  @override
  Future<List<LivingStyleModel>> getLivingStyles() async {
    await Future.delayed(const Duration(milliseconds: 800));
    const json = '''[
      {"name": "Outdoor living", "image": "https://picsum.photos/600/400.jpg"},
      {"name": "Japanese housing", "image": "https://picsum.photos/600/400.jpg"},
      {"name": "Scandinavian minimalism", "image": "https://picsum.photos/600/400.jpg"},
      {"name": "Industrial loft", "image": "https://picsum.photos/600/400.jpg"},
      {"name": "French country", "image": "https://picsum.photos/600/400.jpg"},
      {"name": "Coastal beach house", "image": "https://picsum.photos/600/400.jpg"},
      {"name": "Mediterranean villa", "image": "https://picsum.photos/600/400.jpg"}
    ]''';
    return (jsonDecode(json) as List)
        .map((e) => LivingStyleModel.fromJson(e))
        .toList();
  }

  @override
  Future<List<ExperienceModel>> getExperiences() async {
    await Future.delayed(const Duration(milliseconds: 800));
    const json = '''[
      {"name": "Learn the culture", "image": "https://picsum.photos/500/500.jpg"},
      {"name": "Online events", "image": "https://picsum.photos/500/500.jpg"}
    ]''';
    return (jsonDecode(json) as List)
        .map((e) => ExperienceModel.fromJson(e))
        .toList();
  }
}
