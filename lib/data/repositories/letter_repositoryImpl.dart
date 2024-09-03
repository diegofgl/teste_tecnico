import '../../domain/repositories/letter_repository.dart';

class LetterRepositoryImpl implements LetterRepository {
  @override
  int countOccurrences(String text, String letter) {
    return RegExp(letter).allMatches(text).length;
  }
}
