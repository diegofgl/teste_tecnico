class DescribeInterruptorsUseCase {
  String execute() {
    return '''
      Para identificar qual interruptor controla cada lâmpada:
1.Ligue o primeiro interruptor por alguns minutos e depois desligue-o.
2.Ligue o segundo interruptor.
3.Vá até as lâmpadas:
- A lâmpada acesa é controlada pelo segundo interruptor.
- A lâmpada apagada e quente é controlada pelo primeiro interruptor.
- A lâmpada apagada e fria é controlada pelo terceiro interruptor.
    ''';
  }
}
