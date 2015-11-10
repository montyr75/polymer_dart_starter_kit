@HtmlImport('my_list.html')
library polymer_dart_starter_kit.lib.my_list;

import 'dart:html';

import 'package:polymer/polymer.dart';
import 'package:web_components/web_components.dart' show HtmlImport;

@PolymerRegister('my-list')
class MyList extends PolymerElement {

  @Property(notify: true)
  List<String> items = [
    "Responsive Web App boilerplate",
    "Iron Elements and Paper Elements",
    "End-to-end Build Tooling (included in Dart SDK)",
    "Routing (coming soon)",
    "Offline support with the Platinum Service Worker Elements (coming soon)"
  ];

  MyList.created() : super.created();

  void ready() {

  }
}
