import 'package:amimpact/r.dart';
import 'package:amimpact/core/products/widgets/dialogs/filter_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FilterWidget extends StatelessWidget {
  const FilterWidget({Key? key, required this.filters, required this.onFilter})
      : super(key: key);
  final Map<String, dynamic>? filters;
  final VoidCallback onFilter;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await showDialog(
          context: context,
          builder: (_) => FilterDialog(
            filters: filters,
          ),
          barrierDismissible: true,
        );
        onFilter();
      },
      child: SvgPicture.asset(
        R.assetsImagesFilter,
        height: 70,
        fit: BoxFit.cover,
      ),
    );
  }
}
