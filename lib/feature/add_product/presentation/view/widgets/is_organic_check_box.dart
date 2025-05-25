import 'package:flutter/material.dart';

import '../../../../../core/utils/app_text_styles.dart';
import 'custom_check_box.dart';

class IsOrganicCheckBox extends StatefulWidget {
  final ValueChanged<bool> onChanged;

  const IsOrganicCheckBox({super.key, required this.onChanged});

  @override
  State<IsOrganicCheckBox> createState() => _IsOrganicCheckBoxState();
}

class _IsOrganicCheckBoxState extends State<IsOrganicCheckBox> {
  bool isOrganic = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Text(
            'Is Product Organic?',
            style: AppTextStyles.semiBold14.copyWith(
              color: const Color(0xFF949D9E),
            ),
          ),
        ),
        CustomCheckBox(
          isChecked: isOrganic,
          onChanged: (value) {
            isOrganic = value;
            widget.onChanged(value);
            setState(() {});
          },
        ),
      ],
    );
  }
}
