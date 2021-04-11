

import 'package:dart_tutorial/stack/AbstractCollection.dart';
import 'package:dart_tutorial/stack/IStack.dart';

class MyStack<T> extends AbstractCollection<T> implements IStack<T>{

  MyStack(){
    intiValues(<T>[]);
  }

  ///visa senast tillagda elementet.
  @override
  T peek() {
    if(checkIndex(size()-1, size())){ //för kursens skull,..
      return getValue(size()-1);
    }
    else{
       throw Exception('pop() : IndexOutOfBoundsException');
     }
  }

  ///visa senast tillagda elementet. sen ta bort
  @override
  T pop() {
    if(checkIndex(size()-1, size())){ //för kursens skull,..
      T value = getValue(size()-1);
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