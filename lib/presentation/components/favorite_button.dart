import 'package:flutter/material.dart';

class FavoriteButton extends StatelessWidget {
  final bool isFavorite;
  final VoidCallback onPressed;
  final String? label;

  const FavoriteButton({super.key, required this.isFavorite, required this.onPressed, this.label});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border, color: Colors.black),
      label: Text(
        label ?? (isFavorite ? 'Remove from favorites' : 'Add to favorites'),
        style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFF4C430),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        elevation: 0,
      ),
    );
  }
}
