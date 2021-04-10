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

  test('enqueue() : lägg på några node i kön', (){
      MyQueue<String> nameQueue = MyQueue();
      nameQueue.enqueue('Andreas');
      nameQueue.enqueue('Melina');
      nameQueue.enqueue('Regardie');
      expect(nameQueue.isEmpty(), false);
      expect(nameQueue.size(), 3);
      expect(nameQueue.first(), 'Andreas');
      expect(nameQueue.last(), 'Regardie');
  });

  test('dequeue() : lägg på några noder sen försök ta bort en', (){
      MyQueue<String> nameQueue = MyQueue();
      nameQueue.enqueue('Andreas');
      nameQueue.enqueue('Melina');
      nameQueue.enqueue('Regardie');
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

  test('first', (){

  });

  test('last', (){

  });

  test('Exception first: Kontrollera att exceptions kastas (IndexOutOfBoundsException)', (){

  });

  test('Exception last: Kontrollera att exceptions kastas (IndexOutOfBoundsException)', (){

  });

  test('Exception dequeue: Kontrollera att exceptions kastas (IndexOutOfBoundsException)', (){

  });

  test('Exception enqueue: Kontrollera att exceptions kastas (IndexOutOfBoundsException)', (){

  });
}
