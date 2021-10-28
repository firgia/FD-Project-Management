part of app_helpers;

extension TaskTypeExtension on TaskType {
  Color getColor() {
    switch (this) {
      case TaskType.done:
        return Colors.lightBlue;
      case TaskType.inProgress:
        return Colors.amber[700]!;
      default:
        return Colors.redAccent;
    }
  }

  String toStringValue() {
    switch (this) {
      case TaskType.done:
        return "Done";
      case TaskType.inProgress:
        return "In Progress";
      default:
        return "Todo";
    }
  }
}
