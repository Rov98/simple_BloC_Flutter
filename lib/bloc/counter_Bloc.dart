import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';

abstract class CounterEvent extends Equatable {
  //menggunakan equatable untuk BloC.
  //dengan abstract class bisa memanggil child dari inherit counterevent, yaitu increment dan decrement
  const CounterEvent();

  @override
  List<Object> get props => [];
}

class increment extends CounterEvent {} //class increment

class decrement extends CounterEvent {} //class decrement

class counterState extends Equatable { //class equatable untuk state sebagai setter
  final int count;
  const counterState({required this.count});

  @override
  List<Object> get props => [count];
}

class counterBloc extends Bloc<CounterEvent, counterState> {
  counterBloc() : super(counterState(count: 0)); //nilai awal state = 0

  // dengan menggunakan mapEventToState untuk melakukan logic
  @override
  Stream<counterState> mapEventToState(CounterEvent event) async* {
    if (event is increment) {
      yield counterState(count: state.count + 1);
    } else if (event is decrement) {
      yield counterState(count: state.count - 1);
    }
  }
}
