import 'package:angular2/angular2.dart';
import 'package:polymer_elements/iron_flex_layout/classes/iron_flex_layout.dart';
import 'package:polymer_elements/paper_material.dart';

import '../../model/locker.dart';

@Component(
    selector: 'locker-view',
    encapsulation: ViewEncapsulation.Native,
    templateUrl: 'locker_view.html')

class LockerView {
  @Input()  Locker model;

  @Output() EventEmitter del = new EventEmitter<String>();
  @Output() EventEmitter add = new EventEmitter();
  @Output() EventEmitter sel = new EventEmitter<String>();

  LockerView();

  void entrySelected(String name) {


  }

}
