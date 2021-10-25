part of dashboard;

class DashboardController extends GetxController {
  // Data
  List<TaskCardData> getAllTask() {
    return [
      const TaskCardData(
        title: "Landing page UI Design",
        dueDay: 2,
        totalComments: 50,
        type: TaskType.todo,
        totalContributors: 30,
        profilContributors: [
          AssetImage(ImageRasterPath.avatar1),
          AssetImage(ImageRasterPath.avatar2),
          AssetImage(ImageRasterPath.avatar3),
          AssetImage(ImageRasterPath.avatar4),
        ],
      ),
      const TaskCardData(
        title: "Landing page UI Design",
        dueDay: -1,
        totalComments: 50,
        totalContributors: 34,
        type: TaskType.inProgress,
        profilContributors: [
          AssetImage(ImageRasterPath.avatar5),
          AssetImage(ImageRasterPath.avatar6),
          AssetImage(ImageRasterPath.avatar7),
          AssetImage(ImageRasterPath.avatar8),
        ],
      ),
      const TaskCardData(
        title: "Landing page UI Design",
        dueDay: 1,
        totalComments: 50,
        totalContributors: 34,
        type: TaskType.done,
        profilContributors: [
          AssetImage(ImageRasterPath.avatar5),
          AssetImage(ImageRasterPath.avatar3),
          AssetImage(ImageRasterPath.avatar4),
          AssetImage(ImageRasterPath.avatar2),
        ],
      ),
    ];
  }

  List<ProjectCardData> getActiveProject() {
    return [
      ProjectCardData(
        percent: .3,
        projectImage: const AssetImage(ImageRasterPath.logo1),
        projectName: "Marketplace Mobile",
        releaseTime: DateTime.now(),
      ),
      ProjectCardData(
        percent: .3,
        projectImage: const AssetImage(ImageRasterPath.logo1),
        projectName: "Marketplace Mobile",
        releaseTime: DateTime.now(),
      ),
      ProjectCardData(
        percent: .3,
        projectImage: const AssetImage(ImageRasterPath.logo1),
        projectName: "Marketplace Mobile",
        releaseTime: DateTime.now(),
      ),
    ];
  }
}
