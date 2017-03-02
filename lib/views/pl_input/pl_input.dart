library entrymvc.pl_input;

import 'dart:html';
import 'package:polymer/polymer.dart';

@PolymerRegister('pl-input', extendsTag: 'input')
class EntryInput extends InputElement with PolymerMixin, PolymerBase {
  factory EntryInput() => new Element.tag('input', 'pl-input');
  EntryInput.created() : super.created() {
    polymerCreated();
  }

  @Listen('keypress')
  keyPressAction(e, [_]) {
    // Listen for enter on keypress but esc on keyup, because
    // IE doesn't fire keyup for enter.
    if ((e.original as KeyboardEvent).keyCode == KeyCode.ENTER) {
      e.preventDefault();
      fire('pl-input-commit');
    }
  }

  @Listen('keyup')
  keyUpAction(e, [_]) {
    if ((e.original as KeyboardEvent).keyCode == KeyCode.ESC) {
      fire('pl-input-cancel');
    }
  }
}
