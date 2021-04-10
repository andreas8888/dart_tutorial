
///Simpel generisk nod
class Node<T>{
  
  T _data;
  Node _next;

  Node(T data){
    _data = data;
    _next = null;
  }

  T getData(){
    return _data;
  }

  void setData(T data){
    _data = data;
  }

  Node getNext(){
    return _next;
  }

  void setNext(Node next){
    _next = next;
  }
}