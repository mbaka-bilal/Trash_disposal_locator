/*
Created by: Mbaka bilal <mbakabilal.t@gmail.com>
Created on: 15,June,2025
Updated by: Mbaka bilal <mbakabilal.t@gmail.com>
Updated on: 20,June,2025
*/

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/styling/text_style.dart';
import '../app_text_field.dart';

class AppInputForm extends StatefulWidget {
  const AppInputForm({
    super.key,
    required this.controller,
    this.hideText = false,
    this.enabled = true,
    this.showDefaultMaxLengthWidget = true,
    this.focusNode,
    this.maxLength,
    this.textStyle,
    this.border,
    this.title,
    this.hint,
    this.onChanged,
    this.width,
    this.height,
    this.focusedBorder,
    this.enabledBorder,
    this.errorBorder,
    this.textAlign,
    this.keyboardType,
    this.prefix,
    this.inputFormatters,
    this.validator,
    this.hintStyle,
  });

  final TextEditingController controller;
  final FocusNode? focusNode;
  final bool hideText;
  final bool enabled;
  final int? maxLength;
  final TextStyle? textStyle;
  final InputBorder? border;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final InputBorder? errorBorder;
  final String? title;
  final String? hint;
  final Function(String? str)? onChanged;
  final double? width;
  final double? height;
  final TextAlign? textAlign;
  final TextInputType? keyboardType;
  final bool showDefaultMaxLengthWidget;
  final Widget? prefix;
  final List<TextInputFormatter>? inputFormatters;
  final FormFieldValidator? validator;
  final TextStyle? hintStyle;

  @override
  State<AppInputForm> createState() => _AppInputFormState();
}

class _AppInputFormState extends State<AppInputForm> {
  bool _hidden = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _hidden = widget.hideText;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.title != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: AppTextField(
              text: widget.title!,
              textStyle: AppTextStyle(context: context, fontSize: 14).fw500(),
            ),
          ),
        SizedBox(
          width: widget.width,
          height: widget.height,
          child: TextFormField(
            controller: widget.controller,
            style: widget.textStyle ??
                AppTextStyle(context: context, fontSize: 14).fw500(),
            enabled: widget.enabled,
            textAlign: widget.textAlign ?? TextAlign.start,
            focusNode: widget.focusNode,
            obscureText: _hidden,
            maxLength: widget.maxLength,
            onChanged: widget.onChanged,
            keyboardType: widget.keyboardType,
            inputFormatters: widget.inputFormatters,
            validator: widget.validator,
            decoration: InputDecoration(
              // filled: true,
              // fillColor: Colors.blue,
              hintStyle: widget.hintStyle,
              prefixIcon: widget.prefix == null
                  ? null
                  : Padding(
                      padding: EdgeInsets.all(10),
                      child: widget.prefix!,
                    ),
              suffixIcon: widget.hideText
                  ? GestureDetector(
                      onTap: () => setState(() {
                            _hidden = !_hidden;
                          }),
                      child: Icon(
                          _hidden ? Icons.visibility : Icons.visibility_off))
                  : null,
              focusedBorder: widget.focusedBorder,
              border: widget.border,
              enabledBorder: widget.enabledBorder,
              errorBorder: widget.errorBorder,
              hintText: widget.hint,
              counterText: widget.showDefaultMaxLengthWidget ? null : "",
            ),
          ),
        ),
      ],
    );
  }
}
