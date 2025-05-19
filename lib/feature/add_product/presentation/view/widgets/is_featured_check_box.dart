import 'package:flutter/material.dart';

import '../../../../../core/utils/app_text_styles.dart';
import 'custom_check_box.dart';

class IsFeaturedICheckBox extends StatefulWidget {
  final ValueChanged<bool> onChanged;

  const IsFeaturedICheckBox({super.key, required this.onChanged});

  @override
  State<IsFeaturedICheckBox> createState() => _IsFeaturedICheckBoxState();
}

class _IsFeaturedICheckBoxState extends State<IsFeaturedICheckBox> {
  bool isFeatured = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Text(
            'Is Featured Item?',
            style: AppTextStyles.semiBold14.copyWith(
              color: const Color(0xFF949D9E),
            ),
          ),
        ),
        CustomCheckBox(
          isChecked: isFeatured,
          onChanged: (value) {
            isFeatured = value;
            widget.onChanged(value);
            setState(() {});
          },
        ),
      ],
    );
  }
}
