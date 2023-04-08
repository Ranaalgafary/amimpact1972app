import 'package:amimpact/core/products/views/products_view/products_view.dart';
import 'package:amimpact/enums/products_types.dart';
import 'package:amimpact/utils/extension/theme_extension.dart';
import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      textInputAction: TextInputAction.done,
      keyboardType: TextInputType.text,
      onSubmitted: (value) {
        sendToProductsScreen(context, value);
      },
      style: Theme.of(context).textTheme.textFieldTextStyle,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        border: border(context),
        enabledBorder: border(context),
        focusedBorder: border(context),
        filled: true,
        hintText: "بحث",
        fillColor: Colors.white,
        suffixIcon: Icon(
          Icons.search,
          color: Theme.of(context).iconColor,
        ),
      ),
    );
  }

  void sendToProductsScreen(BuildContext context, String value) {
    if (value.isNotEmpty) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => ProductsView(
            allowPagination: false,
            productsType: ProductsTypes.search,
            title: value,
            path: value,
          ),
        ),
      );
    }
  }

  OutlineInputBorder border(BuildContext context) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: Theme.of(context).iconColor.withOpacity(.5),
        width: .5,
      ),
    );
  }
}
