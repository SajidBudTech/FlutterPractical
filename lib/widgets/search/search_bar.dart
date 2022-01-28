import 'package:flutter/material.dart';
import 'package:flutter_practical/constants/app_color.dart';
import 'package:flutter_practical/constants/app_strings.dart';
import 'package:flutter_practical/constants/app_text_styles.dart';
import 'package:flutter_practical/widgets/inputs/custom_text_form_field.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key key,
    @required this.onSearchBarPressed,
    this.onSubmit,
    this.readOnly = false,
    this.focusNode,
    this.hintText
  }) : super(key: key);

  final Function onSearchBarPressed;
  final Function onSubmit;
  final bool readOnly;
  final String hintText;
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      isReadOnly: readOnly,
      focusNode: this.focusNode,
      hintText: hintText,
      fillColor: AppColor.textFieldBackground(context),
      hintTextStyle: AppTextStyle.h5TitleTextStyle(
        color: AppColor.hintTextColor(context),
      ),
      prefixWidget: Icon(
        Icons.search,
        color: Colors.grey[500],
      ),
      onTap: this.onSearchBarPressed,
      onFieldSubmitted: this.onSubmit,
    );
  }
}
