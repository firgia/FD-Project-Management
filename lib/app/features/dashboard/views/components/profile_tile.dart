part of dashboard;

class _ProfilTile extends StatelessWidget {
  const _ProfilTile(
      {required this.data, required this.onPressedNotification, Key? key})
      : super(key: key);

  final _Profile data;
  final Function() onPressedNotification;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(backgroundImage: data.photo),
      title: Text(
        data.name,
        style: TextStyle(fontSize: 13, color: kFontColorPallets[0]),
      ),
      subtitle: Text(
        data.email,
        style: TextStyle(fontSize: 11, color: kFontColorPallets[2]),
      ),
      trailing: IconButton(
        onPressed: onPressedNotification,
        iconSize: 20,
        splashRadius: 20,
        icon: const Icon(Icons.notifications_outlined),
      ),
    );
  }
}
