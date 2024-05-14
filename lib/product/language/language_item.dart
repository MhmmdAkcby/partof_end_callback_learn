enum LanguageItem { appBarName, answerTextName, loadingButtonName, changeBackgorund }

extension LanguageItemExtension on LanguageItem {
  String languageItemString() {
    switch (this) {
      case LanguageItem.appBarName:
        return 'Part Of & Callback Learn ';
      case LanguageItem.answerTextName:
        return 'click';
      case LanguageItem.loadingButtonName:
        return 'send';
      case LanguageItem.changeBackgorund:
        return 'Change Background';
    }
  }
}
