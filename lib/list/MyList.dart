import 'package:dart_tutorial/AbstractCollection.dart';
import 'package:dart_tutorial/list/IList.dart';

class MyList<T> extends AbstractCollection<T> implements IList<T>{
  
  MyList(){
    intiValues(<T>[]);
  }

  @override
  void add(T element) {
    insertValue(element);
  }
  
  @override
  void addAt(T element, int index) {
    if(checkIndex(index, size())){

      List<T> array = copyValueArray();//RAM killer      
      //fuling för att resize listan..
      int tmp_size = size()+1;
      array.add(null);

      for(int i = tmp_size; i > index; i--){
        array[i] = array[i-1];
      }
      array[index] = element;
      increaseSize();
      //copiera tillbaka.
      intiValues(array);
    }
    else{
      throw Exception('addAt() : Index out of bounds');
    }
  }
  
  @override
  void remove(int index) {
    if(checkIndex(index, size())){
      List<T> array = copyValueArray();//RAM killer
      for(int i = index; i < size(); i++){
        array[i] = array[i+1];
      }
      decreaseSize();
      intiValues(array);
    }
    else{
      throw Exception('remove() : Index out of bounds');
    }
  }
}