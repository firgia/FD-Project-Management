library dashboard;

import 'dart:developer';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:project_management/app/constans/app_constants.dart';
import 'package:project_management/app/shared_components/chatting_card.dart';
import 'package:project_management/app/shared_components/list_profil_image.dart';
import 'package:project_management/app/shared_components/progress_card.dart';
import 'package:project_management/app/shared_components/progress_report_card.dart';
import 'package:project_management/app/shared_components/upgrade_premium_card.dart';
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

// models
part '../../models/profile.dart';

// component
part '../components/active_project_card.dart';
part '../components/header.dart';
part '../components/overview_header.dart';
part '../components/profile_tile.dart';
part '../components/sidebar.dart';
part '../components/team_member.dart';

class DashboardScreen extends GetView<DashboardController> {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              flex: 3,
              child: _Sidebar(data: controller.getSelectedProject()),
            ),
            Flexible(
              flex: 9,
              child: Column(
                children: [
                  const SizedBox(height: kSpacing),
                  _buildHeader(),
                  const SizedBox(height: kSpacing * 2),
                  _buildProgress(),
                  const SizedBox(height: kSpacing * 2),
                  _buildTaskOverview(data: controller.getAllTask()),
                  const SizedBox(height: kSpacing * 2),
                  _buildActiveProject(data: controller.getActiveProject()),
                  const SizedBox(height: kSpacing),
                ],
              ),
            ),
            Flexible(
              flex: 4,
              child: Column(
                children: [
                  const SizedBox(height: kSpacing / 2),
                  _buildProfile(
                    data: controller.getProfil(),
                    onPressedNotification: () {},
                  ),
                  const Divider(thickness: 1),
                  const SizedBox(height: kSpacing),
                  _buildTeamMember(
                    data: controller.getMember(),
                    onPressedAdd: () {},
                  ),
                  ChattingCard(
                    data: const ChattingCardData(
                      image: AssetImage(ImageRasterPath.avatar1),
                      isOnline: false,
                      name: "firgia",
                      lastMessage: "hay..",
                      isRead: false,
                      totalUnread: 19,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: kSpacing),
      child: _Header(),
    );
  }

  Widget _buildProgress() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kSpacing),
      child: Row(
        children: [
          Flexible(
            flex: 5,
            child: ProgressCard(
              data: const ProgressCardData(
                totalUndone: 10,
                totalTaskInProress: 2,
              ),
              onPressedCheck: () {},
            ),
          ),
          const SizedBox(width: kSpacing / 2),
          const Flexible(
            flex: 4,
            child: ProgressReportCard(
              data: ProgressReportCardData(
                title: "1st Sprint",
                doneTask: 5,
                percent: .3,
                task: 3,
                undoneTask: 2,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTaskOverview({required List<TaskCardData> data}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kSpacing),
      child: Column(
        children: [
          _OverviewHeader(
            onSelected: (p0) {},
          ),
          const SizedBox(height: kSpacing),
          Row(
            children: data
                .map(
                  (e) => Expanded(
                    child: TaskCard(
                      data: e,
                      onPressedMore: () {},
                      onPressedTask: () {},
                      onPressedContributors: () {},
                      onPressedComments: () {},
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildActiveProject({required List<ProjectCardData> data}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kSpacing),
      child: _ActiveProjectCard(
        onPressedSeeAll: () {},
        data: data,
      ),
    );
  }

  Widget _buildProfile({
    required _Profile data,
    required Function() onPressedNotification,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kSpacing),
      child: _ProfilTile(
        data: data,
        onPressedNotification: onPressedNotification,
      ),
    );
  }

  Widget _buildTeamMember({
    required List<ImageProvider> data,
    required Function() onPressedAdd,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kSpacing),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _TeamMember(
            totalMember: data.length,
            onPressedAdd: onPressedAdd,
          ),
          const SizedBox(height: kSpacing / 2),
          ListProfilImage(maxImages: 6, images: data),
        ],
      ),
    );
  }
}
