import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_management/app/constans/app_constants.dart';
import 'package:project_management/app/utils/helpers/app_helpers.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({required this.type, Key? key}) : super(key: key);

  final TaskType type;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 300),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kBorderRadius),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _Tile(
                dotColor: Colors.red,
                title: "Landing page UI Design",
                subtitle: "Due in 6 days",
                onPressedMore: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Tile extends StatelessWidget {
  const _Tile({
    required this.dotColor,
    required this.title,
    required this.subtitle,
    required this.onPressedMore,
    Key? key,
  }) : super(key: key);

  final Color dotColor;
  final String title;
  final String subtitle;
  final Function() onPressedMore;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _dot(Colors.redAccent),
              const SizedBox(width: 8),
              Expanded(child: _title(title)),
              _moreButton(onPressed: onPressedMore),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: _subtitle(subtitle),
        ),
        const SizedBox(height: 12),
      ],
    );
  }

  Widget _dot(Color color) {
    return CircleAvatar(
      radius: 4,
      backgroundColor: color,
    );
  }

  Widget _title(String data) {
    return Text(
      data,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.left,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _subtitle(String data) {
    return Text(
      data,
      style: Theme.of(Get.context!).textTheme.caption,
      textAlign: TextAlign.left,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _moreButton({required Function() onPressed}) {
    return IconButton(
      iconSize: 20,
      onPressed: onPressed,
      icon: const Icon(Icons.more_vert_rounded),
      splashRadius: 20,
    );
  }
}
