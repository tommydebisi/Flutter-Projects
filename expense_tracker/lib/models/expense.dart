import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// generate unique ids using uuid
const uuid = Uuid();

final dateFormatter = DateFormat.yMd();

// use enums to reduce the flexibilty of strings and ensure type safety
enum Category { leisure, work, travel, food }

// create a map of icons based on categories
const categoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.leisure: Icons.movie,
  Category.travel: Icons.flight_takeoff,
  Category.work: Icons.work,
};

class Expense {
  Expense({
    required this.title,
    required this.date,
    required this.amount,
    required this.category,
  }) : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category; // should accept only leisure, work, travel, food

  // use a gettter method since we're making use of the value in the class
  String get formatDate {
    return dateFormatter.format(date);
  }
}
