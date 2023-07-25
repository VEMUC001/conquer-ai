import 'package:conquer_ai/constants/constants.dart';
import 'package:conquer_ai/features/ai/AiController.dart';
import 'package:conquer_ai/features/goals/widgets/goal_text_field.dart';
import 'package:conquer_ai/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreateGoalView extends ConsumerStatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const CreateGoalView(),
      );
  const CreateGoalView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CreateGoalViewState();
}

class _CreateGoalViewState extends ConsumerState<CreateGoalView> {
  final goalNameController = TextEditingController();
  final appbar = UIConstants.appBarNoTitle();
  Color selectedColor = Colors.greenAccent;

  @override
  void dispose() {
    goalNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              GoalTextField(
                  controller: goalNameController,
                  titleText: "Goal Name",
                  icon: null),
              const SizedBox(height: 18),
              GoalTextField(
                controller: goalNameController,
                titleText: "Description",
                icon: const Icon(Icons.description),
              ),
              const SizedBox(height: 18),
              GoalTextField(
                  controller: goalNameController,
                  titleText: "Start Date",
                  icon: const Icon(Icons.calendar_today)),
              const SizedBox(height: 18),
              GoalTextField(
                  controller: goalNameController,
                  titleText: "End Date",
                  icon: const Icon(Icons.calendar_today)),
              const SizedBox(height: 18),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Card Color",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              buildColorPickerContainer(context),
              const SizedBox(height: 16),
              buildRowButtons(),
              const SizedBox(height: 16),
              buildTasksView(context),
              const SizedBox(height: 16),
              buildSaveButton(),
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector buildColorPickerContainer(BuildContext context) {
    return GestureDetector(
      onTap: () {
        buildColorPickerDialog();
      },
      child: Container(
          height: 50,
          decoration: BoxDecoration(
              color: selectedColor, borderRadius: BorderRadius.circular(8)),
          width: MediaQuery.of(context).size.width),
    );
  }

  Align buildSaveButton() {
    return Align(
      alignment: FractionalOffset.bottomCenter,
      child: ElevatedButton(
        onPressed: () {
          ref.read(aiControllerProvider.notifier).getAIResponse(
                prompt:
                    "Please generate the steps to achieve the following goal: I want to ${goalNameController.text}",
              );
        },
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(40), // NEW
          backgroundColor: Pallete.creamColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 12.0),
          child: Text(
            "Save Goal",
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }

  Container buildTasksView(BuildContext context) {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          "Tasks",
          // "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vitae nisl eget nunc ultricies ultrices. Nulla facilisi. Nulla facilisi. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vitae nisl eget nunc ultricies ultrices. Nulla facilisi. Nulla facilisi. ",
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }

  Row buildRowButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Pallete.purpleColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 12.0),
            child: Text(
              "Generate Tasks",
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: const Row(
            children: [
              Text("Adjust Tasks"),
              SizedBox(width: 2),
              Icon(Icons.arrow_forward, color: Colors.white),
            ],
          ),
        ),
      ],
    );
  }

  Future buildColorPickerDialog() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          titlePadding: const EdgeInsets.all(0),
          contentPadding: const EdgeInsets.all(0),
          content: SingleChildScrollView(
            child: MaterialPicker(
              pickerColor: selectedColor,
              onColorChanged: (value) {
                selectedColor = value;
                setState(() {});
              },
              enableLabel: true,
              portraitOnly: false,
            ),
          ),
        );
      },
    );
  }
}
