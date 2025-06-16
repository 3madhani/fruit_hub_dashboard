import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_dashboard/core/common/custom_button.dart';
import 'package:fruit_hub_dashboard/core/common/custom_text_form_field.dart';
import 'package:fruit_hub_dashboard/feature/add_product/domain/entities/product_entity.dart';
import 'package:fruit_hub_dashboard/feature/add_product/domain/entities/review_entity.dart';
import 'package:fruit_hub_dashboard/feature/add_product/presentation/view/widgets/image_field.dart';
import 'package:fruit_hub_dashboard/feature/add_product/presentation/view/widgets/is_featured_check_box.dart';
import 'package:fruit_hub_dashboard/feature/add_product/presentation/view/widgets/is_organic_check_box.dart';

import '../../../../../core/common/show_snack_bar.dart';
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
  late num productPrice, expirationMonth, numberOfCalories, unitAmount;
  File? productImage;
  bool isFeatured = false, isOrganic = false;
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
              onSaved: (p0) => expirationMonth = num.parse(p0!),
              hintText: 'Expiration Month',
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            CustomTextFormField(
              onSaved: (p0) => numberOfCalories = num.parse(p0!),
              hintText: 'Number of Calories',
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            CustomTextFormField(
              onSaved: (p0) => unitAmount = num.parse(p0!),
              hintText: 'Unit Amount',
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
            IsOrganicCheckBox(
              onChanged: (value) {
                isOrganic = value;
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
                      reviews: [
                        ReviewEntity(
                          name: 'سارة',
                          image:
                              "https://imgs.search.brave.com/oB7Ak67etRi_Ly1NApIiKr4VjhVC2ZehmrdxW0JsKo0/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5pc3RvY2twaG90/by5jb20vaWQvMTEz/MTE2NDU0OC92ZWN0/b3IvYXZhdGFyLTUu/anBnP3M9NjEyeDYx/MiZ3PTAmaz0yMCZj/PUNLNDlTaExKd0R4/RTRraXJvQ1I0Mmtp/bVR1dWh2dW8yRkg1/eV82YVNnRW89",
                          date: DateTime.now().toIso8601String(),
                          comment: 'طازج وكبير الحجم.',
                          rating: 5.0,
                        ),
                      ],
                      isOrganic: isOrganic,
                      title: productName,
                      description: productDescription,
                      price: productPrice,
                      image: productImage!,
                      code: productCode,
                      isFeatured: isFeatured,
                      expirationMonth: expirationMonth.toInt(),
                      numberOfCalories: numberOfCalories.toInt(),
                      unitAmount: unitAmount.toInt(),
                    );
                    context.read<AddProductCubit>().addProduct(product);
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                } else {
                  ShowCustomSnackBar.showErrorSnackBar(
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
