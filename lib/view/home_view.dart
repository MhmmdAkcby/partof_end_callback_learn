import 'package:flutter/material.dart';
import 'package:part_of_end_callback_learn/product/language/language_item.dart';
import 'package:part_of_end_callback_learn/product/widget/button/answer_button.dart';
import 'package:part_of_end_callback_learn/product/widget/button/loading_button.dart';
import 'package:part_of_end_callback_learn/product/widget/drawer/naw_draw.dart';
import 'package:part_of_end_callback_learn/product/widget/dropdown_menu/callback_dropdown.dart';

part 'part_appbar.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final int numburOne = 3;
  final int numberTwo = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDraw(
        onPressed: (change) {
          return change;
        },
      ),
      appBar: const _PartofAppBar(),
      body: Padding(
        padding: _WidgetPadding.standartPadding,
        child: Column(
          children: [
            SizedBox(height: _WidgetSize().sizedBoxHeight),
            CallbackDropdown(
              onUserSelected: (CallbackUser user) {},
            ),
            SizedBox(height: _WidgetSize().sizedBoxHeight),
            AnswerButton(
              text: LanguageItem.answerTextName.languageItemString(),
              onNumber: (number) {
                return number % numburOne == numberTwo;
              },
            ),
            SizedBox(height: _WidgetSize().sizedBoxHeight),
            LoadingButton(
              onPressed: () async {
                await Future.delayed(Duration(seconds: _WidgetSize().durationSecons));
              },
              title: LanguageItem.loadingButtonName.languageItemString(),
            )
          ],
        ),
      ),
    );
  }
}

class _WidgetPadding {
  static const standartPadding = EdgeInsets.all(8.0);
}

class _WidgetSize {
  final int durationSecons = 2;
  final double sizedBoxHeight = 50;
}
