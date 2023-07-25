import 'package:conquer_ai/constants/constants.dart';
import 'package:conquer_ai/core/utils.dart';
import 'package:conquer_ai/features/goals/views/create_goal.dart';
import 'package:conquer_ai/features/home/widget/goal_card.dart';
import 'package:conquer_ai/features/profile/edit_profile.dart';
import 'package:conquer_ai/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeView extends ConsumerStatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const HomeView(),
      );
  const HomeView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  final quotesList = HomeConstants.motivationalQuotes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UIConstants.appBarWithSettings(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const SizedBox(height: 12),
              buildProfileSection(),
              const SizedBox(height: 32),
              buildSectionHeader("Quote of the day"),
              const SizedBox(height: 12),
              buildQuoteOfDayView(),
              const SizedBox(height: 32),
              buildActiveGoalsHeaderSection(),
              const SizedBox(height: 12),
              buildCurrentGoalsList(),
              buildCurrentGoalsList2(),
              buildCurrentGoalsList3()
            ],
          ),
        ),
      ),
    );
  }

  Row buildActiveGoalsHeaderSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildSectionHeader("Active Goals"),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Pallete.redColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onPressed: () => onTap(),
          child: Text(
            "Create Goal",
            style: UIConstants.homeBodyTextStyle()
                .copyWith(color: Pallete.whiteColor),
          ),
        )
      ],
    );
  }

  Widget buildQuoteOfDayView() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      shadowColor: Pallete.greyColor,
      color: Pallete.blueColor,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Text(quotesList[nextRandomInRange(0, quotesList.length)],
            style: UIConstants.homeTitleTextStyle().copyWith(
              color: Pallete.whiteColor,
            )),
      ),
    );
  }

  onTap() => Navigator.push(
        context,
        CreateGoalView.route(),
      );

  Widget buildCurrentGoalsList() {
    return GoalCard(
        "Fear of Heights",
        "5",
        "Get an online coach to help you overcome the anxiety",
        Pallete.creamColor,
        onTap);
  }

  Widget buildCurrentGoalsList2() {
    return GoalCard(
        "Fear of Public Speaking",
        "21",
        "Get an online coach to help you overcome the anxiety",
        const Color.fromRGBO(163, 224, 166, 1),
        onTap);
  }

  Widget buildCurrentGoalsList3() {
    return GoalCard("Losing Weight by 20 pounds", "45", "Get a Fitness Trainer",
        const Color.fromRGBO(154, 184, 249, 1), onTap);
  }

  Widget buildSectionHeader(String headerText) {
    return Text(
      headerText,
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
    );
  }

  Widget buildProfileSection() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: const Color.fromRGBO(158, 158, 158, 0.257),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: CircleAvatar(
              radius: 30,
              child: ClipOval(
                clipBehavior: Clip.antiAlias,
                child: SvgPicture.asset(
                  AssetsConstants.profileSvg,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Welcome! John Doe",
                  style: UIConstants.homeTitleTextStyle()
                      .copyWith(color: Pallete.whiteColor),
                ),
                const SizedBox(height: 4),
                Text("You have 3 active goals",
                    style: UIConstants.homeBodyTextStyle()
                        .copyWith(color: Pallete.whiteColor)),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                EditUserProfileScreen.route(),
              );
            },
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.edit,
                color: Pallete.whiteColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
