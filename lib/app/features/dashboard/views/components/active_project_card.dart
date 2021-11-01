part of dashboard;

class _ActiveProjectCard extends StatelessWidget {
  const _ActiveProjectCard({
    required this.child,
    required this.onPressedSeeAll,
    Key? key,
  }) : super(key: key);

  final Widget child;
  final Function() onPressedSeeAll;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kBorderRadius),
      ),
      child: Padding(
        padding: const EdgeInsets.all(kSpacing),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _title("My Active Project"),
                _seeAllButton(onPressed: onPressedSeeAll),
              ],
            ),
            const Divider(
              thickness: 1,
              height: kSpacing,
            ),
            const SizedBox(height: kSpacing),
            child,
          ],
        ),
      ),
    );
  }

  Widget _title(String value) {
    return Text(
      value,
      style: const TextStyle(fontWeight: FontWeight.bold),
    );
  }

  Widget _seeAllButton({required Function() onPressed}) {
    return TextButton(
      onPressed: onPressed,
      child: const Text("See All"),
      style: TextButton.styleFrom(primary: kFontColorPallets[1]),
    );
  }
}
