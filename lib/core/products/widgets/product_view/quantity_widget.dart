import 'package:amimpact/core/products/stores/product_store/product_store.dart';
import 'package:amimpact/utils/extension/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class QuantityWidget extends StatelessWidget {
  const QuantityWidget({Key? key, required this.productStore})
      : super(key: key);
  final ProductStore productStore;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "الكمية",
          style: Theme.of(context).textTheme.kufi14RegularTextStyle,
        ),
        const Spacer(),
        Container(
          width: 110,
          decoration:
              BoxDecoration(border: Border.all(color: Colors.grey, width: .3)),
          child: Row(
            children: [
              IconButton(
                constraints: const BoxConstraints(
                  maxHeight: 40,
                ),
                onPressed: () {
                  productStore.quantity++;
                },
                icon: const Icon(
                  Icons.add,
                  color: Colors.black54,
                ),
              ),
              Expanded(
                child: Center(
                  child: Observer(
                    builder: (_) => Text(
                      "${productStore.quantity}",
                      style: Theme.of(context)
                          .textTheme
                          .kufi16RegularTextStyle
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              IconButton(
                constraints: const BoxConstraints(maxHeight: 40),
                onPressed: () {
                  if (productStore.quantity > 1) productStore.quantity--;
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
    );
  }
}
