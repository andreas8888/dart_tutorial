

import 'package:dart_tutorial/list/MyList.dart';
import 'package:test/test.dart';

void main() {
  
  setUp((){

  });

  tearDown((){

  });
  
  MyList createDummyList(){
    MyList dummy = MyList();
    dummy.add('Andreas');
    dummy.add('Melina');
    dummy.add('Regardie');
    return dummy;
  }

  test('Konstruktor : testa skapa objekt.', () {
    MyList list = createDummyList();
    expect(list.runtimeType, MyList);
  });

  test('add() :', () {
    MyList list = createDummyList();
    list.add('Aliester');
    expect(list.size(), 3);
    expect(list.getValue(list.size()), 'Aliester');
    list.add('Orvar');
    expect(list.size(), 4);
    expect(list.getValue(list.size()), 'Orvar');

    expect(list.indexOf('Andreas'), 0);
  });

  test('addAt() :', () {
    MyList list = createDummyList();
    list.addAt('Berit', 1);
    expect(list.getValue(1), 'Berit');
    expect(list.getValue(2), 'Melina');
    expect(list.getValue(3), 'Regardie');
    expect(list.getValue(0), 'Andreas');
  });

  test('remove() :', () {
    MyList list = createDummyList();
    list.remove(1);
    expect(list.size(), 1);
    expect(list.getValue(0), 'Andreas');
    expect(list.getValue(1), 'Regardie');
  });

  test('addAt() : crash', () {
    bool crash = false;
    try{
      MyList list = MyList();
      list.addAt('element', 1);
    }catch(e){
      crash = true;
    }
    expect(crash, true);
  });

  test('remove() : crash', () {
    bool crash = false;
    try{
      MyList list = MyList();
      list.remove(0);
    }catch(e){
      crash = true;
    }
    expect(crash, true);
  });
}