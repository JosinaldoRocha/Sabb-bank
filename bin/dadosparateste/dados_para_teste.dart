void dadosTeste() {
  double pixEnviado = 50, emprestimoPedido = 20000;

  List<Map<String, dynamic>> pessoa = [
    {
      "pix": {"pixEnviado": pixEnviado},
      "emprestimo": {
        "emprestimoPedido": {"pedido": emprestimoPedido},
      }
    }
  ];

  print(pessoa[0]["pix"]["pixEnviado"]);
}
