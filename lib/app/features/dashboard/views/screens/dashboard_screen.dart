library dashboard;

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
          children: [
            const Spacer(),
            ElevatedButton(onPressed: () {}, child: const Text("button")),
            const Card(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: HeaderText("dashboard"),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
