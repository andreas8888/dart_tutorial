import 'package:dart_tutorial/stack/MyStack.dart';
import 'package:test/test.dart';

void main() {
  
  setUp((){

  });

  tearDown((){

  });

  MyStack createDummyStack(){
    MyStack stack = MyStack();
    stack.push('Andreas');
    stack.push('Melina');
    stack.push('Regardie');
    return stack;
  }

  test('Konstruktor : testa skapa objekt.', () {
    MyStack stack = createDummyStack();
    expect(stack.runtimeType, MyStack);
  });

  test('push()', () {
    MyStack stack = createDummyStack();
    stack.push('Bardon');
    expect(stack.peek(), 'Bardon');
  });

  test('pop()', () {
    MyStack stack = createDummyStack();
    expect(stack.pop(), 'Regardie');
  });
  
  test('peek()', () {
    MyStack stack = createDummyStack();
    expect(stack.peek(), 'Regardie');
    expect(stack.pop(), 'Regardie');
    expect(stack.peek(), 'Melina');
    expect(stack.pop(), 'Melina');
    expect(stack.size(), 0);
  });
  
  test('peek() : Crash out of bounds', () {
    MyStack stack = MyStack();
    bool crash = false;
    try{
      stack.peek();
    }catch(e){
      crash = true;
    }
    expect(crash, true);
  });

  test('pop() : Crash out of bounds', () {
    MyStack stack = createDummyStack();
    bool crash = false;
    try{
      stack.pop();
      stack.pop();
      stack.pop();
      stack.pop();
      stack.pop();
    }catch(e){
      crash = true;
    }
    expect(crash, true);
  });

  test('size()', () {
    MyStack stack = createDummyStack();
    expect(stack.size(), 2);
  });
  
  test('isEmpty()', () {
    MyStack stack = MyStack();
    stack.push('testarn');
    stack.pop();
    expect(stack.isEmpty(), true);
  });
  
  test('toString()', () {
    MyStack stack = createDummyStack();
    expect(stack.myToString(), 'Andreas,Melina,Regardie');
  });

  test('indexOf()', () {
    MyStack stack = createDummyStack();
    expect(stack.indexOf('Melina'), 1);
  });

  test('indexOf() : crash', () {
    MyStack stack = MyStack();
    bool crash = false;
    try{
      stack.push('testarn');
      expect(stack.indexOf('Melina'), 1);
    }catch(e){
      crash = true;
    }
    expect(crash, true);
  });
}