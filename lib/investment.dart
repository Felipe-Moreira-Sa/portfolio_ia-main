import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:convert';

// import 'package:portfolio/pages/home.dart';
// import 'package:portfolio/pages/portfolio.dart';
// import 'package:portfolio/pages/prevision.dart';
// import 'package:portfolio/pages/sectorportfolio.dart';

class InvestmentPortfolio extends StatefulWidget {
  const InvestmentPortfolio({super.key});

  @override
  State<InvestmentPortfolio> createState() => _InvestmentPortfolioState();
}

class _InvestmentPortfolioState extends State<InvestmentPortfolio> {
  String calculatePercentage(Map<String, dynamic> data) {
    print("Entrou ");
    double price = data['price'];
    print(price);
    double priceFuture = data['price_future'];
    print(priceFuture);
    double percentage = ((price - priceFuture) / price) * 100;
    return '${percentage.toStringAsFixed(2)}%';
  }

  Widget _buildStockItem(String name, String ticker, String price,
      String priceFuture, String sector, String percentage) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          child: Text(ticker),
        ),
        title: Text(name),
        subtitle: Text(sector),
        trailing: Text(
          percentage,
          style: TextStyle(
              color: percentage.contains('-') ? Colors.red : Colors.green),
        ),
      ),
    );
  }

  List<Map<String, dynamic>> stockDataJson = () {
    // Lê o conteúdo do arquivo JSON
    String contents = File('assets/tickers.json').readAsStringSync();
    // Converte o conteúdo para um mapa
    List<Map<String, dynamic>> json = jsonDecode(contents);
    return json;
  }();
  //adicionar porcentagem no map stockDataJson
  void addPercentage() {
    for (var i = 0; i < stockDataJson.length; i++) {
      stockDataJson[i]['percentage'] = calculatePercentage(stockDataJson[i]);
    }
  }

  //ordena porcentagem
  void sortPercentage() {
    stockDataJson.sort((a, b) => a['percentage'].compareTo(b['percentage']));
  }

  //ordena porcentagem
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Investment Portfolio"),
        backgroundColor:
            Colors.blueGrey[800], // use a navy blue background color
      ),
      body: ListView.builder(
        itemCount: stockDataJson.length,
        itemBuilder: (context, index) {
          Map<String, dynamic> stock = stockDataJson[index];

          return _buildStockItens(
            stock['name'],
            stock['ticker'],
            stock['price'],
            stock['price_future'],
            stock['sector'],
            stock['percentage'],
            Colors.lightGreen[900]!,
          );
        },
      ),
      // bottomNavigationBar: BottomAppBar(
      //   shape: const CircularNotchedRectangle(),
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //     children: [
      //       IconButton(
      //         icon: const Icon(Icons.home),
      //         onPressed: () {
      //           Navigator.push(
      //             context,
      //             MaterialPageRoute(builder: (context) => HomePage()),
      //           );
      //         },
      //       ),
      //       IconButton(
      //         icon: Icon(Icons.account_balance_wallet),
      //         onPressed: () {
      //           Navigator.push(
      //             context,
      //             MaterialPageRoute(builder: (context) => PortfolioPage()),
      //           );
      //         },
      //       ),
      //       IconButton(
      //         icon: Icon(Icons.trending_up),
      //         onPressed: () {
      //           Navigator.push(
      //             context,
      //             MaterialPageRoute(builder: (context) => PrevisaoPage()),
      //           );
      //         },
      //       ),
      //       IconButton(
      //         icon: Icon(Icons.category_outlined),
      //         onPressed: () {
      //           Navigator.push(
      //             context,
      //             MaterialPageRoute(
      //                 builder: (context) => CarteiraSetoresPage()),
      //           );
      //         },
      //       ),
      //     ],
      //   ),
      // ),
    );
  }

  Widget _buildStockItens(
    String name,
    String ticket,
    String price,
    String price_future,
    String sector,
    double percentage,
    Color backgroundColor,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              // use an icon or image to represent the stock sector
              const Icon(Icons.business_center),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "$ticket - $price - $price_future",
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    sector,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Icon(Icons.bar_chart, color: Colors.white),
              const SizedBox(height: 4),
              Text(
                "${percentage.toStringAsFixed(2)}%",
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
