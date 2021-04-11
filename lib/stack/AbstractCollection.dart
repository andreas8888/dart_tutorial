
///abstraktion av en collection (för utbildningens skull)
abstract class AbstractCollection<T>{

  //dart har ingen 'protected' typ?
  int _size = 0;
  List<T> _values; //denna får representera en array.. finns inga 'array' i dart, bara obj

  T getValue(int index){ 
    if(!checkIndex(index, _size)){
      throw Exception('getValue() : out of bounds');
    }
    return _values.elementAt(index);
  }

  List<T> copyValueArray(){
    return _values;
  }

  void intiValues(List<T> values){
    _values = values;
  }

  void insertValue(T element){
    _values.add(element);
    increaseSize();
  }

  void removeValue(T element){
    if(!_values.isNotEmpty){
      throw Exception('removeValue() : out of bounds');
    }
    _values.remove(element);
    decreaseSize();
  }

  int size() {
    return _size -1;  
  }

  void decreaseSize(){
    if(_size == 0){
      throw Exception('decreaseSize() : out of bounds');
    }
    _size--;
  }

  void increaseSize(){
    _size++;
  }

  bool isEmpty() {
    return _size == 0;  
  }

  bool checkIndex(int index, int upper){
    if (index < 0 || index >= upper) {
      //out of bounds
      return false;
    }
    return true;
  }

  ///egen index of för utbildningens skull
  int indexOf(T element){
    if(_values.isEmpty){
      throw Exception('indexOf() : out of bounds');
    }
    for(int i = 0; i < _size; i++){
      if(_values[i] == element){
        return i;
      }
    }
    return -1; //force crash
  }

  String myToString(){
    return _values.join(',');
  }
  //iterator..
}