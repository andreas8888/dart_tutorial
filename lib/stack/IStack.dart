
///Interface för en klassisk stack struktur. 
abstract class IStack<T>{
  void push(T element);
  T pop();
  T peek();
  int size();
  bool isEmpty();
  String myToString();
}