import 'package:flutter/material.dart';

class TaipingHistory {
  final String id;
  final Color colorR1;
  final Color colorR2;
  final Color colorL1;
  final Color colorL2;
  final String yearleft;
  final String yearright;
  final String descriptionleft;
  final String descriptionright;

  const TaipingHistory({
    required this.id,
    required this.yearleft,
    required this.yearright,
    required this.descriptionleft,
    required this.descriptionright,
    required this.colorR1,
    required this.colorR2,
    required this.colorL1,
    required this.colorL2,
  });
}
