/*
Created by: Mbaka bilal <mbakabilal.t@gmail.com>
Created on: 24,June,2025
Updated by: Mbaka bilal <mbakabilal.t@gmail.com>
Updated on: 24,June,2025
*/

import 'package:flutter/material.dart';

import '../../../core/constants/constants.dart';
import '../../../core/constants/strings.dart';
import '../../../core/services/navigation_service.dart';
import '../../../core/styling/text_style.dart';
import '../app_text_field.dart';
import '../input_forms/app_input_form.dart';
import '../media/image_view.dart';

class SearchPopupData<T> {
  SearchPopupData({
    required this.title,
    required this.data,
    this.subTitle,
    this.leadingImage,
    this.leadingWidget,
  });

  final String title;
  final String? subTitle;
  final String? leadingImage;
  final Widget? leadingWidget;
  final T data;
}

class SearchPopupDialog extends StatefulWidget {
  const SearchPopupDialog(
      {super.key, required this.items, required this.onChanged});

  final List<SearchPopupData> items;
  final Function(String? str) onChanged;

  @override
  State<SearchPopupDialog> createState() => _SearchPopupDialogState();
}

class _SearchPopupDialogState extends State<SearchPopupDialog> {
  final _searchTextController = TextEditingController();

  @override
  void dispose() {
    _searchTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppInputForm(
            controller: _searchTextController,
            hint: AppStrings.search,
            onChanged: widget.onChanged,
          ),
          AppConstants.mediumYSpace,
          Flexible(
            child: Builder(
              builder: (context) {
                final filteredItems = _searchTextController.text.trim().isEmpty
                    ? widget.items
                    : widget.items
                        .where((item) => item.title
                            .toLowerCase()
                            .contains(_searchTextController.text.toLowerCase()))
                        .toList();

                return ListView.separated(
                  itemCount: filteredItems.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final item = filteredItems[index];

                    return GestureDetector(
                      onTap: () => NavigationService.pop<SearchPopupData>(
                          context: context, data: item),
                      child: Row(
                        children: [
                          if (item.leadingImage != null ||
                              item.leadingWidget != null) ...[
                            if (item.leadingImage != null)
                              ClipRRect(
                                borderRadius: BorderRadius.circular(1000),
                                child: ImageView(
                                  image: item.leadingImage!,
                                  width: 30,
                                  height: 30,
                                ),
                              ),
                            if (item.leadingWidget != null) item.leadingWidget!,
                            AppConstants.smallXSpace,
                          ],
                          Column(
                            children: [
                              AppTextField(
                                text: item.title,
                                textStyle:
                                    AppTextStyle(context: context).fw600(),
                              ),
                              if (item.subTitle != null) ...[
                                AppTextField(
                                  text: item.subTitle!,
                                  textStyle:
                                      AppTextStyle(context: context).fw400(),
                                ),
                              ]
                            ],
                          )
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => Divider(),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
