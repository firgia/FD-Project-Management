part of dashboard;

class _OverviewHeader extends StatelessWidget {
  const _OverviewHeader({
    required this.onSelected,
    Key? key,
  }) : super(key: key);

  final Function(TaskType? task) onSelected;

  @override
  Widget build(BuildContext context) {
    final Rx<TaskType?> task = Rx(null);

    return Obx(
      () => Row(
        children: [
          const Text(
            "Task Overview",
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          const Spacer(),
          _button(
            selected: task.value == null,
            label: "All",
            onPressed: () {
              task.value = null;
              onSelected(null);
            },
          ),
          _button(
            selected: task.value == TaskType.todo,
            label: "To do",
            onPressed: () {
              task.value = TaskType.todo;
              onSelected(TaskType.todo);
            },
          ),
          _button(
            selected: task.value == TaskType.inProgress,
            label: "In progress",
            onPressed: () {
              task.value = TaskType.inProgress;
              onSelected(TaskType.inProgress);
            },
          ),
          _button(
            selected: task.value == TaskType.done,
            label: "Done",
            onPressed: () {
              task.value = TaskType.done;
              onSelected(TaskType.done);
            },
          ),
        ],
      ),
    );
  }

  Widget _button({
    required bool selected,
    required String label,
    required Function() onPressed,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          label,
        ),
        style: ElevatedButton.styleFrom(
          primary: selected
              ? Theme.of(Get.context!).cardColor
              : Theme.of(Get.context!).canvasColor,
          onPrimary: selected ? kFontColorPallets[0] : kFontColorPallets[2],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
