import 'package:amimpact/core/account/stores/account_store/account_store.dart';
import 'package:amimpact/core/auth/views/no_account_view/no_account_view.dart';
import 'package:amimpact/core/products/stores/product_store/product_store.dart';
import 'package:amimpact/utils/extension/theme_extension.dart';
import 'package:amimpact/utils/locator.dart';
import 'package:amimpact/utils/nav_helper.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:queen_validators/queen_validators.dart';

class AddRateWidget extends StatefulWidget {
  const AddRateWidget({Key? key, required this.store}) : super(key: key);
  final ProductStore store;

  @override
  _AddRateWidgetState createState() => _AddRateWidgetState();
}

class _AddRateWidgetState extends State<AddRateWidget> {
  final ExpandableController _controller =
      ExpandableController(initialExpanded: true);
  final TextEditingController nameController = TextEditingController();
  final TextEditingController commentController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  double rate = 3.5;
  @override
  void initState() {
    nameController.text =
        "${locator<AccountStore>().user?.firstname ?? ""} ${locator<AccountStore>().user?.lastname ?? ""}";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: ExpandablePanel(
        controller: _controller,
        header: Text(
          "إضافة تقييم",
          style: Theme.of(context)
              .textTheme
              .kufi14RegularTextStyle
              .copyWith(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        collapsed: const SizedBox.shrink(),
        expanded: Form(
          key: formKey,
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: RatingBar.builder(
                  itemSize: 23,
                  allowHalfRating: true,
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    rate = rating;
                  },
                ),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(top: 16, bottom: 10),
                child: Text(
                  "اسمك",
                  style: Theme.of(context).textTheme.kufi10RegularTextStyle,
                ),
              ),
              TextFormField(
                controller: nameController,
                validator: qValidator([IsRequired("برجاء إدخال إسمك")]),
                decoration: InputDecoration(
                  border: border,
                  enabledBorder: border,
                  focusedBorder: border,
                ),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(top: 16, bottom: 10),
                child: Text(
                  "رأيك",
                  style: Theme.of(context).textTheme.kufi10RegularTextStyle,
                ),
              ),
              TextFormField(
                validator: qValidator([IsRequired("برجاء إدخال رأيك")]),
                minLines: 5,
                maxLines: 5,
                controller: commentController,
                textInputAction: TextInputAction.newline,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  border: border,
                  enabledBorder: border,
                  focusedBorder: border,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              buildButton(
                context: context,
                text: "إرسال تقييم",
                icon: Icons.star_border_outlined,
                color: Theme.of(context).primaryColor,
                onPressed: sendRate,
              ),
              const SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    nameController.dispose();
    commentController.dispose();
    super.dispose();
  }

  OutlineInputBorder get border => const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey, width: .5),
      );

  Widget buildButton({
    required BuildContext context,
    required String text,
    required IconData icon,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      height: 50,
      child: RawMaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        onPressed: onPressed,
        fillColor: color,
        child: Stack(
          children: [
            Center(
              child: Icon(
                icon,
                color: Colors.black12,
                size: 45,
              ),
            ),
            Center(
              child: Text(
                text,
                style: Theme.of(context)
                    .textTheme
                    .kufi12BoldTextStyle
                    .copyWith(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future sendRate() async {
    if (locator<AccountStore>().isLoggedIn()) {
      if (formKey.currentState!.validate()) {
        final res = await widget.store.addRate(
            comment: commentController.text.trim(),
            name: nameController.text.trim(),
            rate: rate,);
        if (res is bool && res) {
          commentController.clear();
        }
      }
    } else {
      locator<NavHelper>().push(const NoAccountView());
    }
  }
}
