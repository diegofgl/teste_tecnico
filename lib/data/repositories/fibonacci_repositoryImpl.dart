import '../../domain/repositories/fibonacci_repository.dart';

class FibonacciRepositoryImpl implements FibonacciRepository {
  @override
  bool isFibonacci(int number) {
    if (number == 0) return true;
    int a = 0, b = 1;
    while (b < number) {
      int temp = a;
      a = b;
      b = temp + b;
    }
    return b == number;
  }
}
