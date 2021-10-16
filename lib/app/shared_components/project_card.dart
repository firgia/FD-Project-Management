import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:project_management/app/constans/app_constants.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({
    required this.projectImage,
    required this.projectName,
    required this.releaseTime,
    required this.percent,
    Key? key,
  }) : super(key: key);

  final double percent;
  final ImageProvider projectImage;
  final String projectName;
  final DateTime releaseTime;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _progressIndicator(
          percent,
          center: _profilImage(projectImage),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _title(projectName),
              const SizedBox(height: 5),
              Row(
                children: [_subtitle("Release time : "), _date(releaseTime)],
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _progressIndicator(double percent, {required Widget center}) {
    return CircularPercentIndicator(
      radius: 55,
      lineWidth: 2.0,
      percent: .8,
      center: center,
      circularStrokeCap: CircularStrokeCap.round,
      backgroundColor: Colors.blueGrey,
      progressColor: Theme.of(Get.context!).primaryColor,
    );
  }

  Widget _profilImage(ImageProvider image) {
    return CircleAvatar(
      backgroundImage: projectImage,
      radius: 20,
      backgroundColor: Colors.white,
    );
  }

  Widget _title(String value) {
    return Text(
      value.capitalize!,
      style: TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w600,
        color: kFontColorPallets[0],
        letterSpacing: 0.8,
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _subtitle(String value) {
    return Text(
      value,
      style: TextStyle(fontSize: 12, color: kFontColorPallets[2]),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _date(DateTime date) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(Get.context!).cardColor,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(5),
      child: Text(
        DateFormat.yMMMd().format(releaseTime),
        style: TextStyle(fontSize: 10, color: kFontColorPallets[1]),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
