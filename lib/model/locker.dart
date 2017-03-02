class Locker {
  Map<String,int> items;
  List<LockerEntry> storage;

  Locker() {
    items = new Map<String,int>();
    storage = new List<LockerEntry>();
  }

  int save(LockerEntry le, String name) {
    int index = storage.length;
    storage.add(le);
    items[name] = index;
    print("$name: $index");
    return index;
  }

  int storageLocation(String name) {
    int index = -1;
    if (items.containsKey(name)) {
      index = items[name];
    }
    return index;
  }

  int delete(String name) {
    int index = storageLocation(name);
    if (index >= 0) {
      storage[index] = null;
    }
  }

  LockerEntry getEntry(String name) {
    int index = storageLocation(name);
    return index >= 0 ? storage[index] : null;
  }

  void clear() {
    storage.clear();
    items.clear();

  }

}

class LockerEntry {
  String data;

  LockerEntry(String content) {
    data = content;
  }
}
