import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/core/widgets/custom_button.dart';
import 'package:fruits_hub_dashboard/core/widgets/custom_text_form_field.dart';
import 'package:fruits_hub_dashboard/feature/add_proudct/domain/entities/add_proudct_entity.dart';
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

  late String name, code, description;
  late double price;
  bool isFeatured = false;
  File? image;
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
              CustomTextFormField(
                onSaved: (value) {
                  name = value!;
                },
                hintText: 'product name',
                textInputType: TextInputType.text,
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                onSaved: (value) {
                  price = double.parse(value!);
                },
                hintText: 'product price',
                textInputType: TextInputType.number,
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                onSaved: (value) {
                  code = value!.toLowerCase();
                },
                hintText: 'product code',
                textInputType: TextInputType.text,
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                onSaved: (value) {
                  description = value!;
                },
                hintText: 'product description',
                textInputType: TextInputType.text,
                maxLines: 5,
              ),
              const SizedBox(
                height: 16,
              ),
              IsFeaturedCheckBox(
                onChanged: (value) {
                  isFeatured = value;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              ImageField(
                onFileChanged: (image) {
                  this.image = image;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              CustomButton(
                  onPressed: () {
                    if (image != null) {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();

                        AddProudctEntity input = AddProudctEntity(
                          name: name,
                          code: code,
                          price: price,
                          description: description,
                          image: image!,
                          isFeatured: isFeatured,
                        );
                      } else {
                        setState(() {
                          autovalidateMode = AutovalidateMode.always;
                        });
                      }
                    } else {
                      showError(context);
                    }
                  },
                  text: 'Add Product'),
              const SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showError(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Please select an image'),
      ),
    );
  }
}
