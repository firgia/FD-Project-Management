part of dashboard;

class _LoginButton extends StatelessWidget {
  const _LoginButton({required this.onPressed, Key? key}) : super(key: key);

  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: const Text("Login"),
    );
  }
}
