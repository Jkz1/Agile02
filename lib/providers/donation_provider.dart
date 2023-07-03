import 'package:flutter/foundation.dart';

class DonaturHistory {
  final String name;
  final String date;
  final double amount;
  final String message;

  DonaturHistory({
    required this.name,
    required this.date,
    required this.amount,
    required this.message,
  });
}

class DonationProvider extends ChangeNotifier {
  List<DonaturHistory> donaturHistories = [
    DonaturHistory(
      name: 'Puan Cantik',
      date: '26 April 2023',
      amount: 10000000,
      message: 'Tetap semangat ya kak',
    ),
    DonaturHistory(
      name: 'Tanpa Nama',
      date: '24 April 2023',
      amount: 100300,
      message: '',
    ),
    DonaturHistory(
      name: 'Megawita',
      date: '24 April 2023',
      amount: 450000,
      message:
          'Untuk sekarang segini dulu ya, nanti kalau ada uang lebih aku tambahin ^^',
    ),
    DonaturHistory(
      name: 'Gilang69',
      date: '23 April 2023',
      amount: 2000,
      message: 'Cuma punya uang segini',
    ),
    DonaturHistory(
      name: 'Bima Ardilla',
      date: '20 April 2023',
      amount: 1500000,
      message: 'Kapan-kapan undang aku live dung hehe',
    ),
    DonaturHistory(
      name: 'Alwi Betariji',
      date: '19 April 2023',
      amount: 460000,
      message: 'nt bang',
    ),
  ];
}
