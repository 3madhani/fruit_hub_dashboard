import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/core/common/custom_text_form_field.dart';
import 'package:fruit_hub_dashboard/feature/add_product/presentation/view/widgets/image_field.dart';
import 'package:fruit_hub_dashboard/feature/add_product/presentation/view/widgets/is_featured_check_box.dart';

import '../../../../../core/constants/app_const.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(
        horizontal: AppConst.horizontalPadding,
      ),
      child: Form(
        key: _formKey,
        autovalidateMode: autovalidateMode,
        child: Column(
          children: [
            const CustomTextFormField(
              hintText: 'Product Name',
              keyboardType: TextInputType.text,
            ),

            const SizedBox(height: 16),
            const CustomTextFormField(
              hintText: 'Product Price',
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            const CustomTextFormField(
              hintText: 'Product Quantity',
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            const CustomTextFormField(
              hintText: 'Product Code',
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            const CustomTextFormField(
              maxLines: 5,
              hintText: 'Product Description',
              keyboardType: TextInputType.text,
            ),
            const SizedBox(height: 16),
            IsFeaturedICheckBox(onChanged: (value) {}),
            const SizedBox(height: 16),
            ImageField(onFileChanged: (file) {}),
          ],
        ),
      ),
    );
  }
}
