import 'package:assignment/app/constants/app_strings.dart';
import 'package:assignment/app/theme/app_demensions.dart';
import 'package:assignment/features/explore/data/models/trip_model.dart';
import 'package:assignment/features/explore/presentation/widgets/explore_section_header.dart';
import 'package:assignment/features/explore/presentation/widgets/trip_card.dart';
import 'package:flutter/material.dart';

class TripSection extends StatelessWidget {
  final Future<List<TripModel>> future;

  const TripSection({super.key, required this.future});

  @override
  Widget build(BuildContext context) {
    // Card dimensions from design spec (width: 162, height: 227)
    final tripCardAspectRatio = 162 / 227;
    return SliverMainAxisGroup(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.s16),
            child: ExploreSectionHeader(
              title: AppStrings.findYourNextTrip,
              onSeeAll: () {},
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.s16,
            AppSpacing.s20,
            AppSpacing.s16,
            0,
          ),
          sliver: FutureBuilder<List<TripModel>>(
            future: future,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const SliverToBoxAdapter(
                  child: SizedBox(
                    child: Center(child: CircularProgressIndicator()),
                  ),
                );
              }
              if (snapshot.hasError) {
                return const SliverToBoxAdapter(
                  child: SizedBox(
                    child: Center(child: Text(AppStrings.errorLoadingTrips)),
                  ),
                );
              }
              final trips = snapshot.data!;
              return SliverGrid.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: AppGrid.crossAxisCount,
                  mainAxisSpacing: AppGrid.mainAxisSpacing,
                  crossAxisSpacing: AppGrid.crossAxisSpacing,
                  childAspectRatio: tripCardAspectRatio,
                ),
                itemCount: trips.length,
                itemBuilder:
                    (context, index) => TripCard(
                      imageUrl: trips[index].imageUrl,
                      title: trips[index].name,
                      rentedProps: trips[index].rentedPropsCount,
                    ),
              );
            },
          ),
        ),
      ],
    );
  }
}
