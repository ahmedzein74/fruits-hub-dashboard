import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fruits_hub_dashboard/core/utils/app_text_styels.dart';

import 'custom_check_box.dart';

class IsOrgancCheckBox extends StatefulWidget {
  const IsOrgancCheckBox({super.key, required this.onChanged});

  final ValueChanged<bool> onChanged;
  @override
  State<IsOrgancCheckBox> createState() => _IsOrgancCheckBoxState();
}

class _IsOrgancCheckBoxState extends State<IsOrgancCheckBox> {
  bool isTermsAccepted = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'is Organic Item?',
                style: TextStyles.semiBold13
                    .copyWith(color: const Color(0xFF949D9E), fontSize: 20),
              ),
            ],
          ),
          textAlign: TextAlign.right,
        ),
        const Expanded(
          child: SizedBox(
            width: 16,
          ),
        ),
        CustomCheckBox(
          onChecked: (value) {
            isTermsAccepted = value;
            widget.onChanged(value);
            setState(() {});
          },
          isChecked: isTermsAccepted,
        ),
      ],
    );
  }
}
