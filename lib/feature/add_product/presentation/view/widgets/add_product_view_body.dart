import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/core/common/custom_text_form_field.dart';
import 'package:fruit_hub_dashboard/feature/add_product/presentation/view/widgets/image_field.dart';

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
        child: const Column(
          children: [
            CustomTextFormField(
              hintText: 'Product Name',
              keyboardType: TextInputType.text,
            ),

            SizedBox(height: 16),
            CustomTextFormField(
              hintText: 'Product Price',
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),
            CustomTextFormField(
              hintText: 'Product Quantity',
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),
            CustomTextFormField(
              hintText: 'Product Code',
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),
            CustomTextFormField(
              maxLines: 5,
              hintText: 'Product Description',
              keyboardType: TextInputType.text,
            ),
            SizedBox(height: 16),
            ImageField(),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
