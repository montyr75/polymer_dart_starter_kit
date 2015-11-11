@HtmlImport('main_app.html')
library polymer_dart_starter_kit.lib.main_app;

import 'dart:html';
import 'dart:math';

import '../my_greeting/my_greeting.dart';
import '../my_list/my_list.dart';
import '../styles/app_theme.dart';
import '../styles/shared_styles.dart';

import 'package:polymer_elements/iron_flex_layout.dart';
import 'package:polymer_elements/iron_icons.dart';
import 'package:polymer_elements/iron_icon.dart';
import 'package:polymer_elements/iron_pages.dart';
import 'package:polymer_elements/paper_drawer_panel.dart';
import 'package:polymer_elements/paper_scroll_header_panel.dart';
import 'package:polymer_elements/paper_toolbar.dart';
import 'package:polymer_elements/paper_menu.dart';
import 'package:polymer_elements/paper_icon_button.dart';
import 'package:polymer_elements/paper_icon_item.dart';
import 'package:polymer_elements/paper_material.dart';
import 'package:polymer_elements/paper_input.dart';
import 'package:polymer/polymer.dart';
import 'package:web_components/web_components.dart' show HtmlImport;

@PolymerRegister('main-app')
class MainApp extends PolymerElement {

  @property
  String route = "home";

  MainApp.created() : super.created();

  void ready() {

  }

  @Listen('paper-header-transform')
  void onPaperHeaderTransform(CustomEvent event, Map detail) {
    var appName = $$('#mainToolbar .app-name');
    var middleContainer = $$('#mainToolbar .middle-container');
    var bottomContainer = $$('#mainToolbar .bottom-container');
    var heightDiff = detail['height'] - detail['condensedHeight'];
    detail['y'] ??= 0;
    var yRatio = min(1, detail['y'] / heightDiff);
    var maxMiddleScale = 0.50;  // appName max size when condensed. The smaller the number the smaller the condensed size.
    var scaleMiddle = max(maxMiddleScale, (heightDiff - detail['y']) / (heightDiff / (1-maxMiddleScale))  + maxMiddleScale);
    var scaleBottom = 1 - yRatio;

    // Move/translate middleContainer
    transform('translate3d(0, ${yRatio * 100}%,0)', middleContainer);

    // Scale bottomContainer and bottom sub title to nothing and back
    transform('scale($scaleBottom) translateZ(0)', bottomContainer);

    // Scale middleContainer appName
    transform('scale($scaleMiddle) translateZ(0)', appName);
  }

  @reflectable
  void onDataRoute(CustomEvent event, Map detail) {
    PaperDrawerPanel panel = $['paperDrawerPanel'];

    if (panel.narrow) {
      panel.closeDrawer();
    }

    scrollPageToTop();
  }

  @reflectable
  void scrollPageToTop([CustomEvent event, Map detail]) {
    ($['main-panel'] as PaperScrollHeaderPanel).scrollToTop(true);
  }
}
