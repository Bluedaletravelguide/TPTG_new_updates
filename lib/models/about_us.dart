import 'package:flutter/material.dart';

class ClientCarsoul {
  final String id;
  final String image;
  final String url;

  const ClientCarsoul({
    required this.id,
    required this.image,
    required this.url,
  });
}

class SocialMedia {
  final String id;
  final String url;
  final Icon icon;
  final Color color;

  const SocialMedia({
    required this.id,
    required this.url,
    required this.icon,
    required this.color,
  });
}
