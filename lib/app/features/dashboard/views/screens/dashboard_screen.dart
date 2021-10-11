library dashboard;

import 'package:project_management/app/shared_components/task_card.dart';
import 'package:project_management/app/utils/helpers/app_helpers.dart';

import '../../../../shared_components/header_text.dart';
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
          children: const [
            Spacer(),
            TaskCard(type: TaskType.todo),
            TaskCard(type: TaskType.inProgress),
            TaskCard(type: TaskType.done),
            Card(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: HeaderText("dashboard"),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
