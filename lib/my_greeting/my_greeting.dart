@HtmlImport('my_greeting.html')
library polymer_dart_starter_kit.lib.my_greeting;

import 'dart:html';

import '../styles/shared_styles.dart';

import 'package:polymer/polymer.dart';
import 'package:web_components/web_components.dart' show HtmlImport;

@PolymerRegister('my-greeting')
class MyGreeting extends PolymerElement {

  @Property(notify: true)
  String greeting = "Welcome!";

  MyGreeting.created() : super.created();

  void ready() {

  }
}
