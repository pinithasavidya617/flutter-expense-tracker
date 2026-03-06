class TransactionModel{
  final String iconName;
  final String title;
  final DateTime date;
  final double amount;
  final bool isExpense;

  TransactionModel({
    required this.iconName,
    required this.title,
    required this.date,
    required this.amount,
    required this.isExpense
});
}
