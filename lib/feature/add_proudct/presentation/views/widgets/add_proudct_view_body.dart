import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/core/widgets/custom_text_form_field.dart';
import 'package:fruits_hub_dashboard/feature/add_proudct/presentation/views/widgets/image_field.dart';

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
          child: const Column(
            children: [
              CustomTextFormField(
                hintText: 'product name',
                textInputType: TextInputType.text,
              ),
              SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                hintText: 'product price',
                textInputType: TextInputType.number,
              ),
              SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                hintText: 'produt code',
                textInputType: TextInputType.number,
              ),
              SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                hintText: 'product description',
                textInputType: TextInputType.text,
                maxLines: 5,
              ),
              SizedBox(
                height: 16,
              ),
              ImageField(),
            ],
          ),
        ),
      ),
    );
  }
}
