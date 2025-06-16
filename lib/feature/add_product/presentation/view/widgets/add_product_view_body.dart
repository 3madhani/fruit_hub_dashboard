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
                          name: 'John Doe',
                          image:
                              "https://imgs.search.brave.com/YZUpa3k5P4yEll5WhbaxVBV2_jDTuzDl-tXHpH38k_A/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly9pbWdz/LnNlYXJjaC5icmF2/ZS5jb20vcWZEdlJT/R1RQT0NQNzU5Zkp4/SDZsYnNKTk5NTUZQ/NUhzUmZlejJyUHBi/MC9yczpmaXQ6NTAw/OjA6MDowL2c6Y2Uv/YUhSMGNITTZMeTlz/YVhKdy9MbU5rYmkx/M1pXSnphWFJsL0xt/TnZiUzh6WXpjNVpX/SXgvTUM5a2JYTXpj/bVZ3TDIxMS9iSFJw/TDI5d2RDOUpUVUZI/L1JUSTBLM0JoYzNO/d2IzSjAvSzNkbFlp/dG5jbUZ3YUdsai9L/ekV6TURKd2VDMDRN/emcxL09EUXhZUzB4/T1RJd2R5NXEvY0dj.jpeg",
                          date: DateTime.now().toIso8601String(),
                          comment: 'This is a great product!',
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
