class CalculateSomaUseCase {
  int execute(int indice) {
    int soma = 0, k = 1;
    while (k < indice) {
      k = k + 1;
      soma = soma + k;
    }
    return soma;
  }
}
