
///abstraktion av en collection (för utbildningens skull)
abstract class AbstractCollection<T>{

  //dart har ingen 'protected' typ?
  int _size = 0;
  List<T> _values; //denna får representera en array.. finns inga 'array' i dart, bara obj

  T getValue(int index){
    return _values.elementAt(index);
  }

  void intiValues(List<T> values){
    _values = values;
  }

  void insertValue(T element){
    _values.add(element);
    _increaseSize();
  }

  void removeValue(T element){
    if(!_values.isNotEmpty){
      throw Exception('removeValue() : out of bounds');
    }
    _values.remove(element);
    _decreaseSize();
  }

  int size() {
    return _size;  
  }

  void _decreaseSize(){
    if(_size == 0){
      throw Exception('decreaseSize() : out of bounds');
    }
    _size--;
  }

  void _increaseSize(){
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

  String myToString(){
    return _values.join(',');
  }
  //iterator..
}