import 'package:amimpact/core/orders/models/payment_methods_model/payment_method.dart';
import 'package:amimpact/core/orders/stores/checkout_store/checkout_store.dart';
import 'package:amimpact/utils/extension/theme_extension.dart';
import 'package:amimpact/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class PaymentMethods extends StatelessWidget {
  const PaymentMethods({Key? key, required this.store}) : super(key: key);
  final CheckoutStore store;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return store.paymentMethods == null
            ? const SizedBox.shrink()
            : Column(
                children: [
                  const SizedBox(
                    width: double.infinity,
                    child: Text(
                      "طريقة  الدفع",
                      style: TextStyle(fontFamily: kBeinFont, fontSize: 14),
                    ),
                  ),
                  Wrap(
                    children: (store.paymentMethods?.paymentMethods ?? [])
                        .where(
                          (element) =>
                              element.title == "تحويل بنكي" ||
                              element.code == "cashondelivery",
                        )
                        .map(
                          (e) => Observer(
                            builder: (context) => GestureDetector(
                              onTap: () => store.pickedPaymentMethod = e,
                              child: Row(
                                children: [
                                  Radio<PaymentMethod>(
                                    activeColor: Colors.green,
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    visualDensity: VisualDensity.standard,
                                    value: e,
                                    groupValue: store.pickedPaymentMethod,
                                    onChanged: (PaymentMethod? value) {
                                      store.pickedPaymentMethod = value;
                                    },
                                  ),
                                  Text(e.title ?? ""),
                                ],
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                  buildBankDetails(),
                  const Divider(),
                  buildPriceWidget(
                    "الشحن",
                    store.paymentMethods?.totals?.shippingAmount ?? 0,
                    context,
                  ),
                  buildPriceWidget(
                    "الضريبة",
                    store.paymentMethods?.totals?.taxAmount ?? 0,
                    context,
                  ),
                  if (store.pickedPaymentMethod?.code == "cashondelivery")
                    buildPriceWidget(
                      "ضريبة الدفع عند الإستلام",
                      store.cashOnDeliveryFee ?? 0,
                      context,
                    ),
                  buildPriceWidget(
                    "المجموع",
                    store.pickedPaymentMethod?.code == "cashondelivery"
                        ? (store.paymentMethods?.totals?.grandTotal ?? 0) +
                            (store.cashOnDeliveryFee ?? 0)
                        : store.paymentMethods?.totals?.grandTotal ?? 0,
                    context,
                  ),
                ],
              );
      },
    );
  }

  Observer buildBankDetails() {
    return Observer(
      builder: (_) => store.pickedPaymentMethod?.title == "تحويل بنكي"
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    buildTitle("الإسم"),
                    buildSubtitle("مؤسسة تأثير للآلات والمعدات")
                  ],
                ),
                const Divider(),
                Row(
                  children: [buildTitle("البنك"), buildSubtitle("بنك البلاد")],
                ),
                Row(
                  children: [
                    buildTitle("رقم الحساب"),
                    buildSubtitle("566103341550026")
                  ],
                ),
                Row(
                  children: [
                    buildTitle("الأيبان"),
                    buildSubtitle("SA5915000566103341550026")
                  ],
                ),
                const Divider(),
                Row(
                  children: [buildTitle("البنك"), buildSubtitle("بنك الراجحي")],
                ),
                Row(
                  children: [
                    buildTitle("رقم الحساب"),
                    buildSubtitle("234608010609905")
                  ],
                ),
                Row(
                  children: [
                    buildTitle("الأيبان"),
                    buildSubtitle("SA9380000234608010609905")
                  ],
                ),
                const Divider(),
                buildFileWidget(),
              ],
            )
          : const SizedBox.shrink(),
    );
  }

  Widget buildTitle(String text) {
    return SizedBox(
      width: 88,
      child: Row(
        children: [
          Text(text, style: textStyle()),
          const Spacer(),
          Text(
            ":",
            style: textStyle(),
          ),
          const SizedBox(
            width: 8,
          ),
        ],
      ),
    );
  }

  Widget buildSubtitle(String text) {
    return Expanded(child: Text(text, style: textStyle(isTitle: false)));
  }

  TextStyle textStyle({bool isTitle = true}) {
    return TextStyle(
      fontFamily: kBeinFont,
      fontSize: 14,
      color: isTitle ? const Color(0xff565353) : const Color(0xff979797),
    );
  }

  Widget buildPriceWidget(String title, num price, BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .kufi20BoldTextStyle
              .copyWith(color: Colors.black, fontSize: 16),
        ),
        const Spacer(),
        Text(
          "$price",
          style: Theme.of(context).textTheme.kufi20BoldTextStyle,
        ),
        const SizedBox(
          width: 8,
        ),
        Text(
          "ريال",
          style: Theme.of(context).textTheme.kufi10RegularTextStyle.copyWith(
                fontWeight: FontWeight.bold,
                color: const Color(0xff979797),
              ),
        ),
      ],
    );
  }

  Widget buildFileWidget() {
    return Observer(
      builder: (context) {
        return store.file == null
            ? RawMaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                fillColor: const Color(0xffBE8C2F),
                onPressed: store.attachFile,
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: const Text(
                  "إرفاق الإيصال",
                  style: TextStyle(
                    fontFamily: kHacinFont,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              )
            : SizedBox(
                width: double.infinity,
                height: 300,
                child: Image.file(
                  store.file!,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  height: 300,
                ),
              );
      },
    );
  }
}
