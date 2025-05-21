import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_dashboard/core/common/custom_button.dart';
import 'package:fruit_hub_dashboard/core/common/custom_text_form_field.dart';
import 'package:fruit_hub_dashboard/feature/add_product/domain/entities/product_entity.dart';
import 'package:fruit_hub_dashboard/feature/add_product/presentation/view/widgets/image_field.dart';
import 'package:fruit_hub_dashboard/feature/add_product/presentation/view/widgets/is_featured_check_box.dart';

import '../../../../../core/common/build_snack_bar.dart';
import '../../../../../core/constants/app_const.dart';
import '../../cubit/add_product/add_product_cubit.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  late String productName, productCode, productDescription;
  late num productPrice;
  File? productImage;
  bool isFeatured = false;
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
            CustomTextFormField(
              onSaved: (p0) => productName = p0!,
              hintText: 'Product Name',
              keyboardType: TextInputType.text,
            ),

            const SizedBox(height: 16),
            CustomTextFormField(
              onSaved: (p0) => productPrice = num.parse(p0!),
              hintText: 'Product Price',
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            CustomTextFormField(
              onSaved: (p0) => productCode = p0!.toLowerCase(),
              hintText: 'Product Code',
              keyboardType: TextInputType.text,
            ),
            const SizedBox(height: 16),
            CustomTextFormField(
              onSaved: (p0) => productDescription = p0!,
              maxLines: 5,
              hintText: 'Product Description',
              keyboardType: TextInputType.text,
            ),
            const SizedBox(height: 16),
            IsFeaturedICheckBox(
              onChanged: (value) {
                isFeatured = value;
              },
            ),
            const SizedBox(height: 16),
            ImageField(
              onFileChanged: (file) {
                productImage = file;
              },
            ),
            const SizedBox(height: 24),
            CustomPrimaryButton(
              title: 'Add Product',
              onPressed: () {
                if (productImage != null) {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    ProductEntity product = ProductEntity(
                      title: productName,
                      description: productDescription,
                      price: productPrice,
                      image: productImage!,
                      code: productCode,
                      isFeatured: isFeatured,
                    );
                    context.read<AddProductCubit>().addProduct(product);
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                } else {
                  BuildSnackBar.buildErrorSnackBar(
                    context,
                    'Please select an image',
                  );
                }
              },
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
