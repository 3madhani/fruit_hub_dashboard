import 'package:flutter/material.dart';

import '../../../../../core/utils/app_text_styles.dart';

class InfoRow extends StatelessWidget {
  final String label;
  final String value;
  final Color? color;
  const InfoRow({
    super.key,
    required this.label,
    required this.value,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: Text(label, style: AppTextStyles.medium14)),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 1),
            decoration: BoxDecoration(
              color: color ?? Colors.transparent,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              value,
              style: AppTextStyles.bold14.copyWith(
                color: color != null ? Colors.white : Colors.black,
              ),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}
