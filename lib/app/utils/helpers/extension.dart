part of app_helpers;

extension TaskTypeExtension on TaskType {
  Color getColor() {
    switch (this) {
      case TaskType.done:
        return Colors.greenAccent;
      case TaskType.inProgress:
        return Colors.blueAccent;
      default:
        return Colors.redAccent;
    }
  }
}
