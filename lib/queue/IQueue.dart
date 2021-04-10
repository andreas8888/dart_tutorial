
///Interface för egen köstruktur
abstract class IQueue<T>{
  
  int size();
  bool isEmpty();
  void enqueue(T element);
  T dequeue();
  T first();
  T last();
}