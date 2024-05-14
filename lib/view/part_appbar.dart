part of './home_view.dart';

class _PartofAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _PartofAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(LanguageItem.appBarName.languageItemString()),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            child: IconButton(onPressed: () {}, icon: const Icon(Icons.person)),
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
