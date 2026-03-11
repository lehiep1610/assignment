import 'package:assignment/features/explore/data/models/experience_model.dart';
import 'package:assignment/features/explore/data/models/living_style_model.dart';
import 'package:assignment/features/explore/data/models/trip_model.dart';

abstract interface class ExploreRepository {
  Future<List<TripModel>> getTrips();
  Future<List<LivingStyleModel>> getLivingStyles();
  Future<List<ExperienceModel>> getExperiences();
}
