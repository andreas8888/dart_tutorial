

import 'package:dart_tutorial/queue/IQueue.dart';
import 'package:dart_tutorial/queue/Node.dart';

///Min testkö struktur (simpel länkad lista)
class MyQueue<T> implements IQueue<T>{
  
  int _size;
  Node _head;
  Node _tail;

  MyQueue(){
    _size = 0;
    _head = null;
    _tail = null;
  }

  @override
  T dequeue() {
    if(_head == null){
      throw Exception('Index Out Of BoundsException');
    }
    //plocka ut första noden (huvud)
    var firstNode = _head;
    //flytta fram den nästkommande
    _head = _head.getNext();
    //räkna ner storlek
    _size--;
    //returnera den urplockade.
    return firstNode.getData();
  }

  @override
  void enqueue(element) {
    //lägger in ett element i kön
    Node node = Node(element);
    if(isEmpty()){
      //specialare om kön är helt tom
      _head = node;
      _tail = node;
      _size++;
    }
    else{
      _tail.setNext(node);
      _tail = _tail.getNext();
      _size++;
    }
  }

  @override
  T first() {
    if(_head == null){
      throw Exception('Index Out Of BoundsException');
    }
    return _head.getData();
  }

  @override
  T last() {
    if(_head == null){
      throw Exception('Index Out Of BoundsException');
    }
    return _tail.getData();
  }

  @override
  bool isEmpty() {
    if(_head == null) {
      return true;
    }
    return false;
  }

  @override
  int size() {
    return _size;
  }

  @override
  T getElement(int index) {
    try{
        if(_head.getNext() == null || index >= _size){
        return null;
      }
      
      //Iterator löser detta men har inte förståt hur man implemterar dem i Dart
      Node head = _head;
      for(int i = 0; i < index; i++){
        head = head.getNext();
      }

      return head.getData();
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }
  
  @override
  int indexOf(T element) {
    Node head = _head;
    try{
      for(int i = 0; i < _size; i++){
        if(head.getData() == element){ //finns ingen equals i dart?!?!
          return i;
        }
        head = head.getNext();
      }
      return -1;
    }
    catch(e){
      print(e.toString());
      return -1;
    }
  }

  //TODO : en iterator vore mer optimalt,
}
