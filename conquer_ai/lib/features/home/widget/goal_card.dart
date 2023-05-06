import 'package:conquer_ai/constants/constants.dart';
import 'package:conquer_ai/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GoalCard extends ConsumerStatefulWidget {
  final String title;
  final String daysRemaining;
  final String currentStep;
  final Color background;
  final VoidCallback? onTap;

  const GoalCard(this.title, this.daysRemaining, this.currentStep,
      this.background, this.onTap,
      {super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _GoalCardState();
}

class _GoalCardState extends ConsumerState<GoalCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        shadowColor: Pallete.greyColor,
        color: widget.background,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Conquer",
                        style: UIConstants.homeTitleTextStyle(),
                      ),
                      const SizedBox(height: 4),
                      Center(
                        child: Text(widget.title,
                            style: UIConstants.homeBodyTextStyle()),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text("Days Remaining",
                          style: UIConstants.homeTitleTextStyle()),
                      const SizedBox(height: 4),
                      Center(
                          child: Text(widget.daysRemaining,
                              style: UIConstants.homeBodyTextStyle())),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text("Progress - Steps (1/5)",
                  style: UIConstants.homeTitleTextStyle()),
              const SizedBox(height: 4),
              Text(widget.currentStep, style: UIConstants.homeBodyTextStyle()),
            ],
          ),
        ),
      ),
    );
  }
}
