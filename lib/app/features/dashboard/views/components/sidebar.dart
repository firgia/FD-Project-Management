part of dashboard;

class _Sidebar extends StatelessWidget {
  const _Sidebar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minWidth: 150, maxWidth: 300),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(kBorderRadius),
          bottomRight: Radius.circular(kBorderRadius),
        ),
      ),
      padding: const EdgeInsets.all(10),
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
    );
  }
}
