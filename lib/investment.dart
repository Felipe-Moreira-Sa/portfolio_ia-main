import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:portfolio/pages/home.dart';
import 'package:portfolio/pages/portfolio.dart';
import 'package:portfolio/pages/prevision.dart';
import 'package:portfolio/pages/sectorportfolio.dart';

class InvestmentPortfolio extends StatefulWidget {
  const InvestmentPortfolio({super.key});

  @override
  State<InvestmentPortfolio> createState() => _InvestmentPortfolioState();
}

class _InvestmentPortfolioState extends State<InvestmentPortfolio> {
  List<Map<String, dynamic>> stockData = [
    {
      "name": "Apple Inc.",
      "ticker": "AAPL",
      "price": "149.06",
      "price_future": "155.25",
      "sector": "Technology"
    },
    {
      "name": "Tesla Inc.",
      "ticker": "TSLA",
      "price": "725.32",
      "price_future": "700.15",
      "sector": "Automotive"
    },
    {
      "name": "Amazon.com Inc.",
      "ticker": "AMZN",
      "price": "3,143.87",
      "price_future": "3,200.50",
      "sector": "Retail"
    },
    {
      "name": "Apple Inc.",
      "ticker": "AAPL",
      "price": "149.06",
      "price_future": "155.25",
      "sector": "Technology"
    },
    {
      "name": "Tesla Inc.",
      "ticker": "TSLA",
      "price": "725.32",
      "price_future": "700.15",
      "sector": "Automotive"
    },
    {
      "name": "Amazon.com Inc.",
      "ticker": "AMZN",
      "price": "3,143.87",
      "price_future": "3,200.50",
      "sector": "Retail"
    },
    {
      "name": "Microsoft Corporation",
      "ticker": "MSFT",
      "price": "307.10",
      "price_future": "315.80",
      "sector": "Technology"
    },
    {
      "name": "Google LLC",
      "ticker": "GOOGL",
      "price": "2,531.05",
      "price_future": "2,600.20",
      "sector": "Technology"
    },
    {
      "name": "Facebook Inc.",
      "ticker": "FB",
      "price": "332.29",
      "price_future": "340.10",
      "sector": "Technology"
    },
    {
      "name": "Netflix Inc.",
      "ticker": "NFLX",
      "price": "590.78",
      "price_future": "600.90",
      "sector": "Technology"
    },
    {
      "name": "Johnson & Johnson",
      "ticker": "JNJ",
      "price": "172.45",
      "price_future": "175.60",
      "sector": "Healthcare"
    },
    {
      "name": "Pfizer Inc.",
      "ticker": "PFE",
      "price": "40.22",
      "price_future": "41.15",
      "sector": "Healthcare"
    },
    {
      "name": "General Electric",
      "ticker": "GE",
      "price": "13.67",
      "price_future": "13.80",
      "sector": "Industrials"
    },
    {
      "name": "Boeing Co.",
      "ticker": "BA",
      "price": "217.38",
      "price_future": "222.50",
      "sector": "Industrials"
    },
    {
      "name": "Walmart Inc.",
      "ticker": "WMT",
      "price": "139.80",
      "price_future": "142.10",
      "sector": "Retail"
    },
    {
      "name": "Target Corporation",
      "ticker": "TGT",
      "price": "225.56",
      "price_future": "230.40",
      "sector": "Retail"
    },
    {
      "name": "The Coca-Cola Company",
      "ticker": "KO",
      "price": "54.72",
      "price_future": "55.80",
      "sector": "Consumer Staples"
    },
    {
      "name": "Procter & Gamble",
      "ticker": "PG",
      "price": "134.25",
      "price_future": "136.50",
      "sector": "Consumer Staples"
    },
    {
      "name": "Procter & Gamble",
      "ticker": "PG",
      "price": "134.25",
      "price_future": "136.50",
      "sector": "Consumer Staples"
    },
    {
      "name": "Johnson Controls",
      "ticker": "JCI",
      "price": "69.14",
      "price_future": "70.80",
      "sector": "Industrials"
    },
    {
      "name": "Visa Inc.",
      "ticker": "V",
      "price": "224.35",
      "price_future": "230.10",
      "sector": "Financials"
    },
    {
      "name": "Mastercard Inc.",
      "ticker": "MA",
      "price": "367.89",
      "price_future": "375.50",
      "sector": "Financials"
    },
    {
      "name": "JPMorgan Chase & Co.",
      "ticker": "JPM",
      "price": "161.28",
      "price_future": "165.40",
      "sector": "Financials"
    },
    {
      "name": "Goldman Sachs Group",
      "ticker": "GS",
      "price": "410.21",
      "price_future": "415.80",
      "sector": "Financials"
    },
    {
      "name": "Verizon Communications",
      "ticker": "VZ",
      "price": "56.90",
      "price_future": "57.80",
      "sector": "Communication Services"
    },
    {
      "name": "AT&T Inc.",
      "ticker": "T",
      "price": "29.46",
      "price_future": "30.10",
      "sector": "Communication Services"
    },
    {
      "name": "Walt Disney Co.",
      "ticker": "DIS",
      "price": "180.22",
      "price_future": "185.50",
      "sector": "Communication Services"
    },
    {
      "name": "Exxon Mobil Corporation",
      "ticker": "XOM",
      "price": "60.28",
      "price_future": "61.80",
      "sector": "Energy"
    },
    {
      "name": "Chevron Corporation",
      "ticker": "CVX",
      "price": "104.73",
      "price_future": "107.50",
      "sector": "Energy"
    },
    {
      "name": "Royal Dutch Shell",
      "ticker": "RDS.A",
      "price": "40.59",
      "price_future": "41.80",
      "sector": "Energy"
    },
    {
      "name": "Nestle S.A.",
      "ticker": "NSRGF",
      "price": "121.80",
      "price_future": "125.10",
      "sector": "Consumer Goods"
    },
    {
      "name": "Unilever N.V.",
      "ticker": "UN",
      "price": "56.75",
      "price_future": "57.90",
      "sector": "Consumer Goods"
    },
    {
      "name": "Toyota Motor Corporation",
      "ticker": "TM",
      "price": "172.38",
      "price_future": "175.60",
      "sector": "Automotive"
    }
  ];
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

  List<Map<String, dynamic>> stockDataJson = (){
      // Lê o conteúdo do arquivo JSON
      String contents = File('assets/tickers.json').readAsStringSync();
      // Converte o conteúdo para um mapa
      List<Map<String, dynamic>> json = jsonDecode(contents);
      return json;
  }();
  //adicionar porcentagem no map stockDataJson
  void addPercentage(){
    for (var i = 0; i < stockDataJson.length; i++) {
      stockDataJson[i]['percentage'] = calculatePercentage(stockDataJson[i]);
    }
  }
  //ordena porcentagem
  void sortPercentage(){
    stockDataJson.sort((a, b) => a['percentage'].compareTo(b['percentage']));
  }

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
          Map<String, dynamic> stock = stockData[index];

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
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: const Icon(Icons.home),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.account_balance_wallet),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PortfolioPage()),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.trending_up),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PrevisaoPage()),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.category_outlined),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CarteiraSetoresPage()),
                );
              },
            ),
          ],
        ),
      ),
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
