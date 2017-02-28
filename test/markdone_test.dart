// Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.
@TestOn('browser')
library entrymvc.test.markdone_test;

import 'dart:async';
import 'dart:html';
import 'package:polymer/polymer.dart';
import 'package:test/test.dart';
import 'package:entrymvc/pl_entries.dart';
import 'package:entrymvc/entry.dart';

Node findWithText(node, String text) {
  if (node.text == text) return node;
  if (node is Element && node.localName == 'dom-module') {
    return null;
  }
  if (node is PolymerMixin) {
    node = node as PolymerBase;
    if (node.root != null) {
      var r = findWithText(Polymer.dom(node.root), text);
      if (r != null) return r;
    }
  }
  for (var n in node.childNodes) {
    var r = findWithText(n, text);
    if (r != null) return r;
  }
  return null;
}

/**
 * This test runs the EntryMVC app, adds a few entries, marks some as done
 * programatically, and clicks on a checkbox to mark others via the UI.
 */
main() async {
  await initPolymer();

  EntryList entryList;

  setUp(() {
    entryList = querySelector('pl-entries');
  });

  tearDown(() {
    entryList.clear('items');
  });

  test('mark done', () {
    entryList.addAll('items', [
      new Entry('one (unchecked)'),
      new Entry('two (unchecked)'),
      new Entry('three (checked)')..completed = true,
      new Entry('four (checked)'),
    ]);

    return new Future(() {
      var body = Polymer.dom(document.body);

      var label = findWithText(body, 'four (checked)');
      expect(label is LabelElement, true, reason: 'text is in a label: $label');

      PolymerDom host = Polymer.dom(label.parentNode.parentNode.root);
      var node = host.querySelector('input');
      expect(node is InputElement, true, reason: 'node is a checkbox');
      expect(node.type, 'checkbox', reason: 'node type is checkbox');
      expect(node.checked, isFalse, reason: 'element is unchecked');

      node.dispatchEvent(new MouseEvent('click', detail: 1));
      expect(node.checked, true, reason: 'element is checked');
    });
  });
}
