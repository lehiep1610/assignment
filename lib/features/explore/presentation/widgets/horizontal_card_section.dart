import 'package:assignment/app/constants/app_strings.dart';
import 'package:assignment/app/theme/app_demensions.dart';
import 'package:assignment/features/explore/presentation/view_data/explore_card_data.dart';
import 'package:assignment/features/explore/presentation/widgets/explore_section_header.dart';
import 'package:assignment/features/explore/presentation/widgets/trip_card.dart';
import 'package:flutter/material.dart';

class HorizontalCardSection extends StatelessWidget {
  final String title;
  final Future<List<ExploreCardData>> future;
  final double cardWidth;
  final double cardHeight;

  const HorizontalCardSection({
    super.key,
    required this.title,
    required this.future,
    required this.cardWidth,
    required this.cardHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.s16),
          child: ExploreSectionHeader(title: title),
        ),
        const SizedBox(height: AppSpacing.s20),
        FutureBuilder<List<ExploreCardData>>(
          future: future,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return SizedBox(
                height: cardHeight,
                child: const Center(child: CircularProgressIndicator()),
              );
            }
            if (snapshot.hasError) {
              return SizedBox(
                height: cardHeight,
                child: const Center(child: Text(AppStrings.errorLoadingData)),
              );
            }
            final items = snapshot.data!;
            return SizedBox(
              height: cardHeight,
              child: ListView.separated(
                clipBehavior: Clip.none,
                padding: EdgeInsets.fromLTRB(
                  AppSpacing.s16,
                  0,
                  AppSpacing.s16,
                  0,
                ),
                scrollDirection: Axis.horizontal,
                itemCount: items.length,
                separatorBuilder:
                    (_, __) => const SizedBox(width: AppSpacing.s20),
                itemBuilder:
                    (context, index) => TripCard(
                      imageUrl: items[index].imageUrl,
                      title: items[index].name,
                      width: cardWidth,
                    ),
              ),
            );
          },
        ),
      ],
    );
  }
}
