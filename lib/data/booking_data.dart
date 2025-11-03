import 'package:flutter/material.dart';

class Booking {
  final String dishName;
  final String category; // "CSIT" or "ME"
  final DateTime time;

  Booking({required this.dishName, required this.category})
      : time = DateTime.now();
}

// Global notifiers so both Student and Staff pages stay in sync
final ValueNotifier<List<Booking>> csitBookings = ValueNotifier([]);
final ValueNotifier<List<Booking>> mechBookings = ValueNotifier([]);

// Function to add a booking
void addBooking(String dishName, String category) {
  if (category == "CSIT") {
    csitBookings.value = [...csitBookings.value, Booking(dishName: dishName, category: category)];
  } else {
    mechBookings.value = [...mechBookings.value, Booking(dishName: dishName, category: category)];
  }
}

// Function to mark a booking as served
void removeBooking(String dishName, String category) {
  if (category == "CSIT") {
    csitBookings.value = csitBookings.value.where((b) => b.dishName != dishName).toList();
  } else {
    mechBookings.value = mechBookings.value.where((b) => b.dishName != dishName).toList();
  }
}
