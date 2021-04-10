import 'package:dart_tutorial/queue/IQueue.dart';
import 'package:dart_tutorial/queue/MyQueue.dart';
import 'package:test/test.dart';

void main() {
  
  setUp((){

  });

  tearDown((){

  });

  ///hjälpfunktion som skapar upp dummy obj
  IQueue createEmptyTestData(){
    return MyQueue<dynamic>();
  }
  
  IQueue createTestDataNameQueue(){
    MyQueue<String> queue = MyQueue();
    queue.enqueue('Andreas');
    queue.enqueue('Melina');
    queue.enqueue('Regardie');
    return queue;
  }
  

  test('skapa ett köobjekt (bindning)', () {
    MyQueue<dynamic> queue = createEmptyTestData();
    expect(queue.runtimeType, MyQueue);
  });

  test('size() : returnera storlek på en kö', (){
    MyQueue<dynamic> queue = createEmptyTestData();
    expect(queue.size(), 0);
  });

  test('isEmpty() : kolla om kön är tom genom kontroll mot head', (){
    MyQueue<dynamic> queue = createEmptyTestData();
    expect(queue.isEmpty(), true);
  });

  test('first() : kontrollera första elementet i en kö', (){
    MyQueue<String> nameQueue = createTestDataNameQueue();
    expect(nameQueue.first(), 'Andreas');
  });

  test('last() : kontrollera sista elementet i en kö', (){
    MyQueue<String> nameQueue = createTestDataNameQueue();
    expect(nameQueue.last(), 'Regardie');
  });

  test('enqueue() : lägg på några node i kön', (){
      MyQueue<String> nameQueue = createTestDataNameQueue();
      expect(nameQueue.isEmpty(), false);
      expect(nameQueue.size(), 3);
      expect(nameQueue.first(), 'Andreas');
      expect(nameQueue.last(), 'Regardie');
  });

  test('dequeue() : lägg på några noder sen försök ta bort en', (){
      MyQueue<String> nameQueue = createTestDataNameQueue();
      //tabort elemente
      expect(nameQueue.dequeue(), 'Andreas');
      expect(nameQueue.first(), 'Melina');
      expect(nameQueue.size(), 2);

      expect(nameQueue.dequeue(), 'Melina');
      expect(nameQueue.first(), 'Regardie');
      expect(nameQueue.size(), 1);
      
      expect(nameQueue.dequeue(), 'Regardie');
      expect(nameQueue.size(), 0);
      expect(nameQueue.isEmpty(), true);
  });

  

  test('Exception first: Kontrollera att exceptions kastas (IndexOutOfBoundsException)', (){
    bool crash = false;
    try{
      MyQueue queue = new MyQueue();
      queue.first();
    }catch(e){
      crash = true;
    }
    expect(crash, true);
  });

  test('Exception last: Kontrollera att exceptions kastas (IndexOutOfBoundsException)', (){
    bool crash = false;
    try{
      MyQueue queue = new MyQueue();
      queue.last();
    }catch(e){
      crash = true;
    }
    expect(crash, true);
  });

  test('Exception dequeue: Kontrollera att exceptions kastas (IndexOutOfBoundsException)', (){
    bool crash = false;
    MyQueue<String> nameQueue = createTestDataNameQueue();
    try{
      //köa ur 4a av 3. ska crasha
      nameQueue.dequeue();
      nameQueue.dequeue();
      nameQueue.dequeue();
      nameQueue.dequeue();
    }catch(e){
      crash = true;
    }
    expect(crash, true);
  });

  //TODO: mer test
}
