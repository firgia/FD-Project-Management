import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:project_management/app/constans/app_constants.dart';

class ProgressReportCardData {
  final double percent;
  final String title;
  final int task;
  final int doneTask;
  final int undoneTask;

  const ProgressReportCardData({
    required this.percent,
    required this.title,
    required this.task,
    required this.doneTask,
    required this.undoneTask,
  });
}

class ProgressReportCard extends StatelessWidget {
  const ProgressReportCard({
    required this.data,
    Key? key,
  }) : super(key: key);

  final ProgressReportCardData data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(kSpacing),
      height: 200,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color.fromRGBO(111, 88, 255, 1),
            Color.fromRGBO(157, 86, 248, 1),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(kBorderRadius),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                data.title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),
              _RichText(value1: "${data.task} ", value2: "Task"),
              const SizedBox(height: 3),
              _RichText(value1: "${data.doneTask} ", value2: "Done Task"),
              const SizedBox(height: 3),
              _RichText(value1: "${data.undoneTask} ", value2: "Undone Task"),
            ],
          ),
          const Spacer(),
          _Indicator(percent: data.percent),
        ],
      ),
    );
  }
}

class _RichText extends StatelessWidget {
  const _RichText({
    required this.value1,
    required this.value2,
    Key? key,
  }) : super(key: key);

  final String value1;
  final String value2;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          color: kFontColorPallets[0],
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
        children: [
          TextSpan(text: value1),
          TextSpan(
            text: value2,
            style: TextStyle(
              color: kFontColorPallets[0],
              fontWeight: FontWeight.w100,
            ),
          ),
        ],
      ),
    );
  }
}

class _Indicator extends StatelessWidget {
  const _Indicator({required this.percent, Key? key}) : super(key: key);

  final double percent;

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: 140,
      lineWidth: 15,
      percent: percent,
      circularStrokeCap: CircularStrokeCap.round,
      center: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            (percent * 100).toString() + " %",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const Text(
            "Completed",
            style: TextStyle(fontWeight: FontWeight.w300, fontSize: 12),
          ),
        ],
      ),
      progressColor: Colors.white,
      backgroundColor: Colors.white.withOpacity(.3),
    );
  }
}
