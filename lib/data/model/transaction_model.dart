class TransactionModel{
  final int? id;
  final String title;
  final double amount;
  final String transactionType;
  final String category;
  final String? note;
  final DateTime transactionDate;

  TransactionModel({
    this.id,
    required this.title,
    required this.amount,
    required this.transactionType,
    required this.category,
    this.note,
    required this.transactionDate,
});

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      id: json['id'] != null ? int.tryParse(json['id'].toString()) : null,
      title: json['title'] ?? '',
      amount: double.tryParse(json['amount'].toString()) ?? 0.00,
      transactionType: json['transaction_type'] ?? 'income',
      category: json['category'] ?? '',
      note: json['note'],
      transactionDate: json['transaction_date'] != null
          ? DateTime.parse(json['transaction_date'])
          : DateTime.now(),
    );
  }
}
