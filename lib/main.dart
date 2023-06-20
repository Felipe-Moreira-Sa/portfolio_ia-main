import 'package:flutter/material.dart';

import 'package:portfolio/investment.dart';

void main() async {
  print('name');
  // Passo 1: Ler o conteúdo do arquivo JSON
  // var response =
  //     await http.get(Uri.parse('assets/ticker.json'));
  // var jsonString = response.body;
  //  WidgetsFlutterBinding
  //      .ensureInitialized(); // Certifique-se de inicializar o Flutter
  //  final jsonString = await rootBundle.loadString('assets/ticker.json');

    // Passo 2: Converter o conteúdo JSON em uma lista de mapas
  //  List<Map<String, dynamic>> stockData =
  //      List<Map<String, dynamic>>.from(jsonDecode(jsonString));

    // Passo 3: Utilizar o dicionário stockData conforme necessário
  //  for (var stock in stockData) {
  //    print(stock['name']);
  //    print(stock['ticker']);
  //    print(stock['price']);
  //    print(stock['price_future']);
  //    print(stock['sector']);
  //    print(stock['percentage']);
  //    print(stock['backgroundColor']);
  //    print('------------------');
  //  }
  // função para ler arquivo json 
  
   runApp(MaterialApp(
     title: "InvestmentPortfolio",
     theme: ThemeData.dark().copyWith(
       // Cor dos ícones
       iconTheme: const IconThemeData(
         color: Colors.white, // Cor branca para os ícones
       ),
     // Cor dos textos
     textTheme: const TextTheme(
       bodyLarge: TextStyle(
         color: Colors.white, // Cor branca para textos principais
       ),
       bodyMedium: TextStyle(
         color: Colors.grey, // Cor cinza claro para textos secundários
       ),
     ),

     // Cor de fundo do Scaffold
     scaffoldBackgroundColor: Colors.black, // Cor preta para o fundo
   ),
   home: InvestmentPortfolio(),
   debugShowCheckedModeBanner: false,
));
}
