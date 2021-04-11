

import 'package:dart_tutorial/AbstractCollection.dart';
import 'package:dart_tutorial/stack/IStack.dart';

class MyStack<T> extends AbstractCollection<T> implements IStack<T>{

  MyStack(){
    intiValues(<T>[]);
  }

  ///visa senast tillagda elementet.
  @override
  T peek() {
    if(checkIndex(size(), size()+1)){ //för kursens skull,..
      return getValue(size());
    }
    else{
       throw Exception('pop() : IndexOutOfBoundsException');
     }
  }

  ///visa senast tillagda elementet. sen ta bort
  @override
  T pop() {
    if(checkIndex(size(), size()+1)){ //för kursens skull,..
      T value = getValue(size());
      removeValue(value);
      return value;
    }
    else{
      throw Exception('pop() : IndexOutOfBoundsException');
    }
  }

  @override
  void push(element) {
    insertValue(element);
  }
}