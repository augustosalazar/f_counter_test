import '../repositories/i_counter_repository.dart';

class CounterUseCase {
  final ICounterRepository _counterRepository;

  CounterUseCase(this._counterRepository);

  int increment() => _counterRepository.incrementCounter();

  int decrement() => _counterRepository.decrementCounter();

  int reset() => _counterRepository.resetCounter();

  int setCounter(int value) => _counterRepository.setCounter(value);
}
