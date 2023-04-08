import 'package:amimpact/core/common/widgets/general/loading_view.dart';
import 'package:amimpact/utils/extension/theme_extension.dart';
import 'package:amimpact/utils/locator.dart';
import 'package:amimpact/utils/network_services/products_service.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class SpecificationsWidget extends StatefulWidget {
  const SpecificationsWidget({Key? key, required this.productId})
      : super(key: key);
  final int productId;

  @override
  _SpecificationsWidgetState createState() => _SpecificationsWidgetState();
}

class _SpecificationsWidgetState extends State<SpecificationsWidget> {
  Map<String, dynamic>? attributes;
  final ExpandableController _controller =
      ExpandableController(initialExpanded: true);
  @override
  void initState() {
    getAttributes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return attributes == null
        ? const SizedBox(
            height: 150,
            child: LoadingView(),
          )
        : Padding(
            padding: const EdgeInsets.only(top: 16),
            child: ExpandablePanel(
              controller: _controller,
              header: Text(
                "المواصفات",
                style: Theme.of(context)
                    .textTheme
                    .kufi14RegularTextStyle
                    .copyWith(fontWeight: FontWeight.bold, color: Colors.black),
              ),
              collapsed: const SizedBox.shrink(),
              expanded: Container(
                margin: const EdgeInsets.symmetric(vertical: 16),
                child: Column(
                  children: [
                    ...attributes!.keys
                        .map((e) => buildRow(
                              context,
                              attributes![e]['label'] as String,
                              attributes![e]['value'] as String,
                            ))
                        .toList(),
                    Container(
                      height: 1,
                      width: double.infinity,
                      color: Colors.grey.withOpacity(.3),
                    )
                  ],
                ),
              ),
            ),
          );
  }

  Widget buildRow(BuildContext context, String title, String value) => Row(
        children: [
          SizedBox(
            width: 60,
            child: Text(
              title,
              style: Theme.of(context).textTheme.kufi12RegularTextStyle,
            ),
          ),
          Container(
            height: 50,
            width: 1,
            margin: const EdgeInsets.symmetric(horizontal: 24),
            color: Colors.grey.withOpacity(.3),
          ),
          Text(
            value,
            style: Theme.of(context).textTheme.kufi10RegularTextStyle,
          )
        ],
      );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future getAttributes() async {
    attributes =
        await locator<ProductService>().getProductAttributes(widget.productId);
    if (mounted) setState(() {});
  }
}
