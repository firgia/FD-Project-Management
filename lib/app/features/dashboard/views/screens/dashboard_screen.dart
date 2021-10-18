library dashboard;

import 'dart:developer';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:project_management/app/constans/app_constants.dart';
import 'package:project_management/app/shared_components/card_upgrade_to_premium.dart';
import 'package:project_management/app/shared_components/project_card.dart';
import 'package:project_management/app/shared_components/search_field.dart';
import 'package:project_management/app/shared_components/selection_button.dart';
import 'package:project_management/app/shared_components/task_card.dart';
import 'package:project_management/app/shared_components/today_text.dart';
import 'package:project_management/app/utils/helpers/app_helpers.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

// binding
part '../../bindings/dashboard_binding.dart';

// controller
part '../../controllers/dashboard_controller.dart';

// model

// component
part '../components/header.dart';
part '../components/sidebar.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const Flexible(flex: 3, child: _Sidebar()),
          Flexible(
            flex: 10,
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(kSpacing),
                  child: _Header(),
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
        ],
      ),
    );
  }
}
