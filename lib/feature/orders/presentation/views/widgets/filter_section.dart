import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/core/utils/app_text_styles.dart';

class FilterSection extends StatelessWidget {
  const FilterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: const Row(
        children: [
          Icon(Icons.filter_list),
          SizedBox(width: 16),
          Text('Filter', style: AppTextStyles.bold24),
        ],
      ),
    );
  }
}
