// /*
// Created by: Mbaka bilal <mbakabilal.t@gmail.com>
// Created on: 15,June,2025
// Updated by: Mbaka bilal <mbakabilal.t@gmail.com>
// Updated on: 15,June,2025
// Description: Otp input field
// */

// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:myapp/core/extensions/integer_extensions.dart';

// import '../../core/constants/constants.dart';
// import '../../core/constants/strings.dart';
// import '../../core/styling/colors.dart';
// import '../../core/styling/text_style.dart';
// import '../widgets/app_text_field.dart';
// import '../widgets/buttons/plain_button.dart';
// import '../widgets/input_forms/app_input_form.dart';


// class OtpField extends StatefulWidget {
//   final Function(String otp) onOtpFilled;
//   final Function onTapResendOtp;
//   final int otpLength;
//   final Function? onIncorrectOtp;

//   const OtpField(
//       {super.key,
//       required this.onOtpFilled,
//       required this.onTapResendOtp,
//       required this.otpLength,
//       this.onIncorrectOtp});

//   @override
//   State<OtpField> createState() => _OtpFieldState();
// }

// class _OtpFieldState extends State<OtpField> {
//   var _textControllers = const <TextEditingController>[];
//   var _focusNodes = const <FocusNode>[];

//   Timer? _resendOtpTimer;
//   final int _maxDuration = 10;

//   @override
//   void initState() {
//     super.initState();

//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       _beginTimer();

//       _textControllers =
//           List.generate(widget.otpLength, (index) => TextEditingController());
//       _focusNodes = List.generate(widget.otpLength, (index) => FocusNode());
//       setState(() {});
//     });
//   }

//   @override
//   void dispose() {
//     for (TextEditingController controller in _textControllers) {
//       controller.dispose();
//     }
//     for (FocusNode focusNode in _focusNodes) {
//       focusNode.dispose();
//     }

//     _resendOtpTimer?.cancel();

//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         if (_focusNodes.isNotEmpty && _textControllers.isNotEmpty)
//           Row(
//             children: List.generate(widget.otpLength, (index) {
//               return Padding(
//                 padding: const EdgeInsets.only(right: 10.0),
//                 child: KeyboardListener(
//                   focusNode: _focusNodes[index],
//                   onKeyEvent: (KeyEvent event) {
//                     if (event is KeyDownEvent) {
//                       if (event.logicalKey == LogicalKeyboardKey.backspace) {
//                         if (_textControllers[index].text.isEmpty) {
//                           _changeFocus(movingForward: false);
//                         }
//                       }
//                     }
//                   },
//                   child: AppInputForm(
//                     width: 60,
//                     height: 50,
//                     keyboardType: TextInputType.number,
//                     showDefaultMaxLengthWidget: false,
//                     border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12),
//                         borderSide: BorderSide(color: AppColors.stroke)),
//                     focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12),
//                         borderSide: BorderSide(color: AppColors.stroke)),
//                     enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12),
//                         borderSide: BorderSide(color: AppColors.stroke)),
//                     controller: _textControllers[index],
//                     textAlign: TextAlign.center,
//                     maxLength: 1,
//                     onChanged: (String? str) {
//                       _changeFocus(
//                           movingForward: str != null && str.isNotEmpty);
//                     },
//                   ),
//                 ),
//               );
//             }),
//           ),
//         40.h,
//         PlainButton(
//           text: AppStrings.confirm,
//           onTap: () {
//             //TODO request otp
//           },
//         ),
//         AppConstants.mediumYSpace,
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             AppTextField(
//               text: AppStrings.didNotReceiveOtp,
//               textStyle: AppTextStyle(context: context, fontSize: 16).fw400(),
//             ),
//             AppConstants.mediumXSpace,
//             GestureDetector(
//               onTap: () {
//                 _beginTimer();
//                 widget.onTapResendOtp();
//               },
//               child: AppTextField(
//                 text: (_resendOtpTimer?.tick ?? 0) != _maxDuration
//                     ? "00:${"${_maxDuration - (_resendOtpTimer?.tick ?? 0)}".padLeft(2, "0")}"
//                     : AppStrings.resend,
//                 textStyle: AppTextStyle(
//                         context: context,
//                         color: AppColors.complimentary,
//                         fontSize: 16)
//                     .fw900(),
//               ),
//             )
//           ],
//         )
//       ],
//     );
//   }

//   void _beginTimer() {
//     _resendOtpTimer = Timer.periodic(Duration(seconds: 1), (timer) {
//       if (timer.tick == _maxDuration) {
//         timer.cancel();
//       }

//       setState(() {});
//     });
//   }

//   void _changeFocus({required bool movingForward}) {
//     if (movingForward) {
//       FocusManager.instance.primaryFocus?.nextFocus();
//     } else {
//       FocusManager.instance.primaryFocus?.previousFocus();
//     }
//   }
// }
