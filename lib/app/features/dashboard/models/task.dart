part of dashboard;

class _Task {
  final String title;
  final int dueDay;
  final int totalComments;
  final int totalContributors;
  final TaskType type;
  final List<ImageProvider> profilContributors;

  const _Task({
    required this.title,
    required this.dueDay,
    required this.totalComments,
    required this.totalContributors,
    required this.type,
    required this.profilContributors,
  });
}
