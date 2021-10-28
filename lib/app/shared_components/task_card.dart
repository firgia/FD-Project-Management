import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_management/app/constans/app_constants.dart';
import 'package:project_management/app/shared_components/list_profil_image.dart';
import 'package:project_management/app/utils/helpers/app_helpers.dart';

class TaskCardData {
  final String title;
  final int dueDay;
  final List<ImageProvider> profilContributors;
  final TaskType type;
  final int totalComments;
  final int totalContributors;

  const TaskCardData({
    required this.title,
    required this.dueDay,
    required this.totalComments,
    required this.totalContributors,
    required this.type,
    required this.profilContributors,
  });
}

class TaskCard extends StatelessWidget {
  const TaskCard({
    required this.data,
    required this.onPressedMore,
    required this.onPressedTask,
    required this.onPressedContributors,
    required this.onPressedComments,
    Key? key,
  }) : super(key: key);

  final TaskCardData data;

  final Function() onPressedMore;
  final Function() onPressedTask;
  final Function() onPressedContributors;
  final Function() onPressedComments;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 300),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kBorderRadius),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(5),
              child: _Tile(
                dotColor: data.type.getColor(),
                title: data.title,
                subtitle: (data.dueDay < 0)
                    ? "Late in ${data.dueDay * -1} days"
                    : "Due in " +
                        ((data.dueDay > 1) ? "${data.dueDay} days" : "today"),
                onPressedMore: onPressedMore,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kSpacing),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      primary: data.type.getColor(),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: onPressedTask,
                    child: Text(
                      data.type.toStringValue(),
                    ),
                  ),
                  ListProfilImage(
                    images: data.profilContributors,
                    onPressed: onPressedContributors,
                  ),
                ],
              ),
            ),
            const SizedBox(height: kSpacing / 2),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kSpacing / 2),
              child: Row(
                children: [
                  _IconButton(
                    iconData: EvaIcons.messageCircleOutline,
                    onPressed: onPressedComments,
                    totalContributors: data.totalComments,
                  ),
                  const SizedBox(width: kSpacing / 2),
                  _IconButton(
                    iconData: EvaIcons.peopleOutline,
                    onPressed: onPressedContributors,
                    totalContributors: data.totalContributors,
                  ),
                ],
              ),
            ),
            const SizedBox(height: kSpacing / 2),
          ],
        ),
      ),
    );
  }
}

/* -----------------------------> COMPONENTS <------------------------------ */
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
              _dot(dotColor),
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

class _IconButton extends StatelessWidget {
  const _IconButton({
    required this.iconData,
    required this.totalContributors,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  final IconData iconData;
  final int totalContributors;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        primary: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kBorderRadius),
        ),
      ),
      onPressed: onPressed,
      icon: _icon(iconData),
      label: _label("$totalContributors"),
    );
  }

  Widget _label(String data) {
    return Text(
      data,
      style: const TextStyle(
        color: Colors.white54,
        fontSize: 10,
      ),
    );
  }

  Widget _icon(IconData iconData) {
    return Icon(
      iconData,
      color: Colors.white54,
      size: 14,
    );
  }
}
