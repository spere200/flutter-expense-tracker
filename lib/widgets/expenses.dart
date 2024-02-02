import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';

import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/models/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  void _openAddExpenseOverlay() {
    showModalBottomSheet(
        context: context, builder: (ctx) => const NewExpense());
  }

  final List<Expense> _registeredExpenses = [
    Expense("Flutter Course", 19.99, DateTime.now(), Category.work),
    Expense("Cinema", 15.99, DateTime.now(), Category.leisure),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Expense Tracker"),
        actions: [
          IconButton(
              onPressed: _openAddExpenseOverlay, icon: const Icon(Icons.add)),
        ],
      ),
      body: Column(
        children: [
          const Text("The Chart"),
          // Since ExpensesList returns a column, it has to be expansed since it's inside another column, otherwise
          // it won't be visible because flutter doesn't know how to set a size for it. Expanded just makes a child
          // inside a Column/Row/Flex to expand to take as much space as it needs along the main axis
          Expanded(
            child: ExpensesList(_registeredExpenses),
          ),
        ],
      ),
    );
  }
}
