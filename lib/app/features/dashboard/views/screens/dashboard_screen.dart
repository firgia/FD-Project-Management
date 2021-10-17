library dashboard;

import 'package:project_management/app/constans/app_constants.dart';
import 'package:project_management/app/shared_components/project_card.dart';
import 'package:project_management/app/shared_components/task_card.dart';
import 'package:project_management/app/utils/helpers/app_helpers.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

// binding
part '../../bindings/dashboard_binding.dart';

// controller
part '../../controllers/dashboard_controller.dart';

// model

// component

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            ProjectCard(
              percent: .3,
              projectImage: const AssetImage(ImageRasterPath.logo1),
              projectName: "Mobile Project Mobile Project Mobile Project",
              releaseTime: DateTime.now(),
            ),
            TaskCard(
              title: "Landing page UI Design",
              dueDay: 2,
              totalComents: 50,
              totalContributors: 34,
              type: TaskType.todo,
              profilContributors: const [
                AssetImage(ImageRasterPath.avatar1),
                AssetImage(ImageRasterPath.avatar2),
                AssetImage(ImageRasterPath.avatar3),
                AssetImage(ImageRasterPath.avatar4),
              ],
              onPressedMore: () {},
              onPressedTask: () {},
              onPressedContributors: () {},
              onPressedComments: () {},
            ),
            TaskCard(
              title: "Landing page UI Design",
              dueDay: -1,
              totalComents: 50,
              totalContributors: 34,
              type: TaskType.inProgress,
              profilContributors: const [
                AssetImage(ImageRasterPath.avatar5),
                AssetImage(ImageRasterPath.avatar6),
                AssetImage(ImageRasterPath.avatar7),
                AssetImage(ImageRasterPath.avatar8),
              ],
              onPressedMore: () {},
              onPressedTask: () {},
              onPressedContributors: () {},
              onPressedComments: () {},
            ),
            TaskCard(
              title: "Landing page UI Design",
              dueDay: 1,
              totalComents: 50,
              totalContributors: 34,
              type: TaskType.done,
              profilContributors: const [
                AssetImage(ImageRasterPath.avatar5),
                AssetImage(ImageRasterPath.avatar3),
                AssetImage(ImageRasterPath.avatar4),
                AssetImage(ImageRasterPath.avatar2),
              ],
              onPressedMore: () {},
              onPressedTask: () {},
              onPressedContributors: () {},
              onPressedComments: () {},
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
