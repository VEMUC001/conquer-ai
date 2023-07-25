import 'package:conquer_ai/constants/ui_constants.dart';
import 'package:conquer_ai/theme/pallete.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../auth/widgets/auth_text_field.dart';

class EditUserProfileScreen extends ConsumerStatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const EditUserProfileScreen(),
      );
  const EditUserProfileScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EditUserProfileScreenState();
}

class _EditUserProfileScreenState extends ConsumerState<EditUserProfileScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  final TextEditingController currentPasswordController =
      TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    currentPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UIConstants.appBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Card(
              child: ExpandableNotifier(
                child: ExpandablePanel(
                  header: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 16.0),
                    child: Text("General Settings",
                        style: UIConstants.homeTitleTextStyle()
                            .copyWith(color: Pallete.whiteColor)),
                  ),
                  collapsed: Text("",
                      style: UIConstants.homeBodyTextStyle()
                          .copyWith(color: Pallete.whiteColor)),
                  expanded: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: buildExpandedGeneralSettings(),
                  ),
                ),
              ),
            ),
            Card(
              child: ExpandableNotifier(
                child: ExpandablePanel(
                  header: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 16.0),
                    child: Text("Password Settings",
                        style: UIConstants.homeTitleTextStyle()
                            .copyWith(color: Pallete.whiteColor)),
                  ),
                  collapsed: Text("",
                      style: UIConstants.homeBodyTextStyle()
                          .copyWith(color: Pallete.whiteColor)),
                  expanded: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: buildExpandedPasswordSettings(),
                  ),
                ),
              ),
            ),
            Card(
              child: ExpandableNotifier(
                child: ExpandablePanel(
                  header: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 16.0),
                    child: Text("Privacy & Legal",
                        style: UIConstants.homeTitleTextStyle()
                            .copyWith(color: Pallete.whiteColor)),
                  ),
                  collapsed: Text("",
                      style: UIConstants.homeBodyTextStyle()
                          .copyWith(color: Pallete.whiteColor)),
                  expanded: buildPrivacyAndLegalSection(),
                ),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Pallete.creamColor,
              ),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Sign Out",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildExpandedGeneralSettings() {
    return Column(
      children: [
        const SizedBox(height: 12),
        AuthField(
          controller: nameController,
          hintText: "Name",
        ),
        const SizedBox(height: 12),
        AuthField(
          controller: emailController,
          hintText: "Email",
        ),
        const SizedBox(height: 12),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Pallete.whiteColor,
            ),
            onPressed: () {},
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child:
                  Text("Update Details", style: TextStyle(color: Colors.black)),
            )),
        const SizedBox(height: 12),
      ],
    );
  }

  Widget buildExpandedPasswordSettings() {
    return Column(
      children: [
        const SizedBox(height: 12),
        AuthField(
          controller: currentPasswordController,
          hintText: "Current Password",
        ),
        const SizedBox(height: 12),
        AuthField(
          controller: newPasswordController,
          hintText: "New Password",
        ),
        const SizedBox(height: 12),
        AuthField(
          controller: confirmPasswordController,
          hintText: "Confirm New Password",
        ),
        const SizedBox(height: 12),
        ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Pallete.whiteColor,
            ),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Update Password",
                  style: TextStyle(color: Colors.black)),
            )),
        const SizedBox(height: 12),
      ],
    );
  }

  Widget buildPrivacyAndLegalSection() {
    return const Card(
        child: Column(
      children: [
        ListTile(
          title: Text("Privacy Policy"),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
        ListTile(
          title: Text("Terms of Service"),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
        ListTile(
          title: Text("About"),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
      ],
    ));
  }
}
