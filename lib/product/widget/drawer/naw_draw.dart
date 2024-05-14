import 'package:flutter/material.dart';
import 'package:part_of_end_callback_learn/product/color/project_color.dart';
import 'package:part_of_end_callback_learn/product/language/language_item.dart';

class NavDraw extends StatefulWidget {
  const NavDraw({super.key, required this.onPressed});

  final bool Function(bool change)? onPressed;
  @override
  State<NavDraw> createState() => _NavDrawState();
}

class _NavDrawState extends NavManagment<NavDraw> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: _backgroundColor ?? ProjectColor.colorsWhite,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: _isChange ? ProjectColor.colorsDeepPurple : ProjectColor.colorsBlue,
            ),
            child: _drawHeader(context),
          ),
          ListTile(
            title: _textChangeBgColor(context),
            trailing: IconButton(
                onPressed: () {
                  _changeBackground();
                  final response = widget.onPressed?.call(_isChange) ?? false;
                  setState(() {
                    _backgroundColor = response ? ProjectColor.colorsBlack : ProjectColor.colorsWhite;
                  });
                },
                icon: _isChange
                    ? const Icon(
                        Icons.nightlight_round_outlined,
                        color: ProjectColor.colorsWhite,
                      )
                    : const Icon(Icons.sunny)),
          ),
        ],
      ),
    );
  }

  Text _textChangeBgColor(BuildContext context) {
    return Text(
      LanguageItem.changeBackgorund.languageItemString(),
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: _isChange ? ProjectColor.colorsWhite : ProjectColor.colorsBlack,
          ),
    );
  }

  Text _drawHeader(BuildContext context) {
    return Text(LanguageItem.appBarName.languageItemString(),
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: _isChange ? ProjectColor.colorsWhite : ProjectColor.colorsBlack,
            ));
  }
}

abstract class NavManagment<T extends StatefulWidget> extends State<T> {
  Color? _backgroundColor;
  bool _isChange = false;

  bool _changeBackground() {
    setState(() {
      _isChange = !_isChange;
    });
    return _isChange;
  }
}
