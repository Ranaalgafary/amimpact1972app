import 'package:amimpact/core/common/widgets/general/cached_image.dart';
import 'package:amimpact/core/orders/models/cart_model/item.dart';
import 'package:amimpact/core/orders/stores/cart_store/cart_store.dart';
import 'package:amimpact/core/orders/views/cart_view/cart_view.dart';
import 'package:amimpact/utils/extension/theme_extension.dart';
import 'package:amimpact/utils/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CartItemWidget extends StatefulWidget {
  const CartItemWidget({Key? key, required this.item}) : super(key: key);
  final CartItem item;

  @override
  _CartItemWidgetState createState() => _CartItemWidgetState();
}

class _CartItemWidgetState extends State<CartItemWidget> {
  int quantity = 4;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(8)),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 70,
                      child: CachedImage(
                        url: widget.item.extensionAttributes?.imageUrl ?? "",
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Text(
                                  widget.item.name ?? "",
                                  maxLines: 2,
                                  style: Theme.of(context)
                                      .textTheme
                                      .kufi12RegularTextStyle
                                      .copyWith(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  locator<CartStore>().removeItem(
                                      0,
                                      widget.item.sku ?? "",
                                      widget.item.itemId!);
                                },
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 4),
                                  child: Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ),
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            child: SizedBox(
                              width: double.infinity,
                              child: Text(
                                "",
                                maxLines: 1,
                                style: Theme.of(context)
                                    .textTheme
                                    .kufi12RegularTextStyle
                                    .copyWith(
                                      color: const Color(0xff565353),
                                    ),
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                "${widget.item.price ?? 0}",
                                style: Theme.of(context)
                                    .textTheme
                                    .kufi20BoldTextStyle,
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(
                                "ريال",
                                style: Theme.of(context)
                                    .textTheme
                                    .kufi10RegularTextStyle
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: const Color(0xff979797),
                                    ),
                              ),
                              const Spacer(),
                              Container(
                                width: 110,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey,
                                    width: .3,
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    IconButton(
                                      constraints: const BoxConstraints(
                                        maxHeight: 40,
                                      ),
                                      onPressed: () {
                                        locator<CartStore>()
                                            .addItem(1, widget.item.sku ?? "");
                                      },
                                      icon: const Icon(
                                        Icons.add,
                                        color: Colors.black54,
                                      ),
                                    ),
                                    Expanded(
                                      child: Center(
                                        child: Text(
                                          "${widget.item.qty}",
                                          style: Theme.of(context)
                                              .textTheme
                                              .kufi16RegularTextStyle
                                              .copyWith(
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                      constraints:
                                          const BoxConstraints(maxHeight: 40),
                                      onPressed: () {
                                        if (widget.item.qty! == 1) {
                                          locator<CartStore>().removeItem(
                                              0,
                                              widget.item.sku ?? "",
                                              widget.item.itemId!);
                                        } else {
                                          locator<CartStore>().decrease(
                                            widget.item.qty! - 1,
                                            widget.item.sku ?? "",
                                            widget.item.itemId!,
                                          );
                                        }
                                      },
                                      icon: const Icon(
                                        Icons.remove,
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
