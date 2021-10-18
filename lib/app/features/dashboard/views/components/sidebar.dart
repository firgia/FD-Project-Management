part of dashboard;

class _Sidebar extends StatelessWidget {
  const _Sidebar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).cardColor,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(kSpacing),
            child: ProjectCard(
              percent: .3,
              projectImage: const AssetImage(ImageRasterPath.logo1),
              projectName: "Exon Project",
              releaseTime: DateTime.now(),
            ),
          ),
          const Divider(thickness: 1),
          Expanded(
            child: SelectionButton(
              data: [
                SelectionButtonData(
                  activeIcon: EvaIcons.grid,
                  icon: EvaIcons.gridOutline,
                  label: "Dashboard",
                ),
                SelectionButtonData(
                  activeIcon: EvaIcons.archive,
                  icon: EvaIcons.archiveOutline,
                  label: "Reports",
                ),
                SelectionButtonData(
                  activeIcon: EvaIcons.calendar,
                  icon: EvaIcons.calendarOutline,
                  label: "Calendar",
                ),
                SelectionButtonData(
                  activeIcon: EvaIcons.email,
                  icon: EvaIcons.emailOutline,
                  label: "Email",
                  totalNotif: 20,
                ),
                SelectionButtonData(
                  activeIcon: EvaIcons.person,
                  icon: EvaIcons.personOutline,
                  label: "Profil",
                ),
                SelectionButtonData(
                  activeIcon: EvaIcons.settings,
                  icon: EvaIcons.settingsOutline,
                  label: "Setting",
                ),
              ],
              onSelected: (index, value) {
                log("index : $index | label : ${value.label}");
              },
            ),
          ),
        ],
      ),
    );
  }
}
