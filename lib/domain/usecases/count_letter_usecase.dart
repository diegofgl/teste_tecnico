import '../repositories/letter_repository.dart';

class CountLetterUseCase {
  final LetterRepository repository;

  CountLetterUseCase(this.repository);

  int execute(String text, String letter) {
    return repository.countOccurrences(text, letter);
  }
}
