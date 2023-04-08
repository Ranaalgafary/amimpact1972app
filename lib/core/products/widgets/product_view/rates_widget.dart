import 'package:amimpact/core/products/stores/product_store/product_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatesWidget extends StatefulWidget {
  const RatesWidget({Key? key, required this.store}) : super(key: key);
  final ProductStore store;
  @override
  State<RatesWidget> createState() => _RatesWidgetState();
}

class _RatesWidgetState extends State<RatesWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return widget.store.reviews == null
          ? const SizedBox.shrink()
          : widget.store.reviews!.isEmpty
              ? const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Center(
                    child: Text("لا يوجد مراجعات لهذا المنتج"),
                  ),
                )
              : Column(
                  children: widget.store.reviews!
                      .where((element) => element.statusId == 1)
                      .map((e) => Card(
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              width: double.infinity,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(e.nickname ?? ""),
                                  Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 8),
                                    child: Text(
                                      e.createdAt ?? "",
                                      style: const TextStyle(
                                          color: Colors.black45,),
                                    ),
                                  ),
                                  Text(e.detail ?? ""),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  IgnorePointer(
                                    child: RatingBar.builder(
                                      itemSize: 15,
                                      initialRating:
                                          double.tryParse(e.avgValue ?? "") ??
                                              0,
                                      allowHalfRating: true,
                                      itemBuilder: (context, _) => const Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      onRatingUpdate: (rating) {},
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),)
                      .toList(),
                );
    },);
  }
}
