import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gratikey/core/widgets/appheader.dart';
import 'package:gratikey/core/widgets/background.dart';
import 'package:gratikey/core/widgets/mediaquery.dart';
import 'package:gratikey/data/controllers/profilecontroller.dart';
import 'package:gratikey/presentation/bottomnavigation/profilesection/profilewidgets/notification_card.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileController controller = Get.find<ProfileController>();

    return AppBackground(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSize.width * 0.04),
            child: Appheader(
              title: "Notifications",
              subtitle: "Manage and explore current notifications",
              showBackButton: true,
            ),
          ),
          SizedBox(height: AppSize.height * 0.01),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.symmetric(
                horizontal: AppSize.width * 0.05,
                vertical: AppSize.height * 0.01,
              ),
              itemCount: controller.notifications.length,
              separatorBuilder: (_, __) =>
                  SizedBox(height: AppSize.height * 0.01),
              itemBuilder: (context, index) {
                final item = controller.notifications[index];
                return NotificationCard(
                  title: item["title"]!,
                  body: item["body"]!,
                  time: item["time"]!,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
