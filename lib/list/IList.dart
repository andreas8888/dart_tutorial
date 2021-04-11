abstract class IList<T>{
  void add(T element);
  void addAt(T element, int index);
  T getValue(int index);
  void remove(int index);
  void removeValue(T element);
  int size();
  bool isEmpty();
  int indexOf(T element);
  String myToString();
}