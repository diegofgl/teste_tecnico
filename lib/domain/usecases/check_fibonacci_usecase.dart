import '../repositories/fibonacci_repository.dart';

class CheckFibonacciUseCase {
  final FibonacciRepository repository;

  CheckFibonacciUseCase(this.repository);

  bool execute(int number) {
    return repository.isFibonacci(number);
  }
}
