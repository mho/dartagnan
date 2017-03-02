import 'package:polymer_elements/iron_flex_layout/classes/iron_flex_layout.dart';
import 'package:polymer/polymer.dart';
import 'package:angular2/platform/browser.dart';


import 'package:entrymvc/views/main_app/main_app.dart';

main() async {
  await initPolymer();
  bootstrap(MainApp);

}
