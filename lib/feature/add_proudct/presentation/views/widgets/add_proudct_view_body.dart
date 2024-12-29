import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/core/widgets/custom_text_form_field.dart';
import 'package:fruits_hub_dashboard/feature/add_proudct/presentation/views/widgets/image_field.dart';
import 'package:fruits_hub_dashboard/feature/add_proudct/presentation/views/widgets/is_featured_check_box.dart';

class AddProudctViewBody extends StatefulWidget {
  const AddProudctViewBody({super.key});

  @override
  State<AddProudctViewBody> createState() => _AddProudctViewBodyState();
}

class _AddProudctViewBodyState extends State<AddProudctViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        child: Form(
          autovalidateMode: autovalidateMode,
          key: formKey,
          child: Column(
            children: [
              const CustomTextFormField(
                hintText: 'product name',
                textInputType: TextInputType.text,
              ),
              const SizedBox(
                height: 16,
              ),
              const CustomTextFormField(
                hintText: 'product price',
                textInputType: TextInputType.number,
              ),
              const SizedBox(
                height: 16,
              ),
              const CustomTextFormField(
                hintText: 'product code',
                textInputType: TextInputType.number,
              ),
              const SizedBox(
                height: 16,
              ),
              const CustomTextFormField(
                hintText: 'product description',
                textInputType: TextInputType.text,
                maxLines: 5,
              ),
              const SizedBox(
                height: 16,
              ),
              IsFeaturedCheckBox(
                onChanged: (value) {},
              ),
              const SizedBox(
                height: 16,
              ),
              ImageField(
                onFileChanged: (image) {},
              ),
              const SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
