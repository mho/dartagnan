import 'package:angular2/angular2.dart';
import 'package:polymer_elements/iron_flex_layout/classes/iron_flex_layout.dart';
import 'package:polymer_elements/iron_icons.dart';
import 'package:polymer_elements/paper_header_panel.dart';
import 'package:polymer_elements/paper_toolbar.dart';
import 'package:polymer_elements/paper_icon_button.dart';

import '../../model/locker.dart';
import '../locker_view/locker_view.dart';
import '../message_bar/message_bar.dart';

@Component(selector: 'main-app',
    encapsulation: ViewEncapsulation.Native,
    templateUrl: 'main_app.html',
    directives: const [LockerView, MessageBar]
)
class MainApp {
  Locker locker;
  String message;
  int boardSize = 450;

  MainApp() {
    newLocker();
  }

  void newLocker() {
    locker = new Locker();
  }

  void addEntry() {
    int index = locker.items.length;
    locker.save(new LockerEntry("Content $index"), "Name $index");
  }

  void onDel(String name, int storage) {
    message = "$name is removed from $storage!";
  }

  void onAdd(String name, int storage) {
    message = "$name is added at $storage!";
  }

  void onSel(String name) {
    message = "$name is selected";
    print(message);
  }
}