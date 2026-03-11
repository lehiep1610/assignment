import 'package:assignment/features/explore/data/datasources/explore_remote_datasource.dart';
import 'package:assignment/features/explore/data/models/experience_model.dart';
import 'package:assignment/features/explore/data/models/living_style_model.dart';
import 'package:assignment/features/explore/data/models/trip_model.dart';
import 'package:assignment/features/explore/data/repositories/explore_repository.dart';

class ExploreRepositoryImpl implements ExploreRepository {
  final ExploreRemoteDatasource _datasource;

  const ExploreRepositoryImpl(this._datasource);

  @override
  Future<List<TripModel>> getTrips() async {
    try {
      return await _datasource.getTrips();
    } catch (e) {
      throw Exception('Failed to load trips: $e');
    }
  }

  @override
  Future<List<LivingStyleModel>> getLivingStyles() async {
    try {
      return await _datasource.getLivingStyles();
    } catch (e) {
      throw Exception('Failed to load living styles: $e');
    }
  }

  @override
  Future<List<ExperienceModel>> getExperiences() async {
    try {
      return await _datasource.getExperiences();
    } catch (e) {
      throw Exception('Failed to load experiences: $e');
    }
  }
}
