import 'package:assignment/app/constants/app_strings.dart';
import 'package:assignment/app/theme/app_colors.dart';
import 'package:assignment/app/theme/app_demensions.dart';
import 'package:assignment/features/explore/data/datasources/explore_remote_datasource.dart';
import 'package:assignment/features/explore/data/models/trip_model.dart';
import 'package:assignment/features/explore/data/repositories/explore_repository.dart';
import 'package:assignment/features/explore/data/repositories/explore_repository_impl.dart';
import 'package:assignment/features/explore/presentation/view_data/explore_card_data.dart';
import 'package:assignment/features/explore/presentation/widgets/explore_search_bar.dart';
import 'package:assignment/features/explore/presentation/widgets/horizontal_card_section.dart';
import 'package:assignment/features/explore/presentation/widgets/trip_section.dart';
import 'package:flutter/material.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  late final ExploreRepository _repository;
  late Future<List<TripModel>> _tripsFuture;
  late Future<List<ExploreCardData>> _livingStylesFuture;
  late Future<List<ExploreCardData>> _experiencesFuture;
  late final double _livingCardAspectRatio;

  @override
  void initState() {
    super.initState();
    _repository = ExploreRepositoryImpl(ExploreRemoteDatasourceImpl());

    // Card dimensions from design spec (width: 182, height: 211)
    _livingCardAspectRatio = 182 / 211;
    _loadPageData();
  }

  void _loadPageData() {
    _tripsFuture = _repository.getTrips();
    _livingStylesFuture = _repository.getLivingStyles().then(
      (data) =>
          data
              .map((e) => ExploreCardData(name: e.name, imageUrl: e.imageUrl))
              .toList(),
    );
    _experiencesFuture = _repository.getExperiences().then(
      (data) =>
          data
              .map((e) => ExploreCardData(name: e.name, imageUrl: e.imageUrl))
              .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            // Each card takes ~47.5% of screen width to fit 2 cards with spacing
            final cardWidth = constraints.maxWidth * 0.475;
            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(
                      AppSpacing.s16,
                      AppSpacing.s16,
                      AppSpacing.s16,
                      AppSpacing.s32,
                    ),
                    child: const ExploreSearchBar(),
                  ),
                ),
                TripSection(future: _tripsFuture),
                const SliverToBoxAdapter(
                  child: SizedBox(height: AppSpacing.s36),
                ),
                SliverToBoxAdapter(
                  child: HorizontalCardSection(
                    title: AppStrings.exploreByLivingStyle,
                    future: _livingStylesFuture,
                    cardWidth: cardWidth,
                    cardHeight: cardWidth / _livingCardAspectRatio,
                  ),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(height: AppSpacing.s36),
                ),
                SliverToBoxAdapter(
                  child: HorizontalCardSection(
                    title: AppStrings.discoverOtherExperiences,
                    future: _experiencesFuture,
                    cardWidth: cardWidth,
                    cardHeight: cardWidth / _livingCardAspectRatio,
                  ),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(height: AppSpacing.s36),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
