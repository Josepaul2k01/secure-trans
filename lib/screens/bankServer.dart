import 'package:flutter/material.dart';

class BankServerScreen extends StatelessWidget {
  const BankServerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Sample transaction data
    List<Transaction> transactions = [
      Transaction(amount: 100, date: 'June 15, 2023', time: '10:00 AM'),
      Transaction(amount: 200, date: 'June 14, 2023', time: '02:30 PM'),
      Transaction(amount: 50, date: 'June 13, 2023', time: '08:45 AM'),
      Transaction(amount: 300, date: 'June 12, 2023', time: '05:15 PM'),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Bank Server'),
      ),
      body: ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (context, index) {
          Transaction transaction = transactions[index];
          return ListTile(
            leading: Icon(Icons.attach_money),
            title: Text('Amount: \$${transaction.amount}'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Date: ${transaction.date}'),
                Text('Time: ${transaction.time}'),
              ],
            ),
          );
        },
      ),
    );
  }
}

class Transaction {
  final double amount;
  final String date;
  final String time;

  Transaction({
    required this.amount,
    required this.date,
    required this.time,
  });
}