import 'package:amimpact/core/account/views/addresses_view/addresses_view.dart';
import 'package:amimpact/core/auth/models/login_model/address.dart';
import 'package:amimpact/core/orders/stores/checkout_store/checkout_store.dart';
import 'package:amimpact/utils/extension/theme_extension.dart';
import 'package:amimpact/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class PickAddress extends StatelessWidget {
  const PickAddress({Key? key, required this.store}) : super(key: key);
  final CheckoutStore store;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "العنوان",
          style: TextStyle(fontSize: 14, fontFamily: kBeinFont),
        ),
        const SizedBox(
          height: 16,
        ),
        Observer(
          builder: (_) => store.address == null
              ? buildButton(context)
              : buildAddressWidget(context),
        ),
        const SizedBox(
          height: 8,
        ),
        const Divider()
      ],
    );
  }

  Widget buildButton(BuildContext context) {
    return SizedBox(
      height: 45,
      width: 160,
      child: RawMaterialButton(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        fillColor: Theme.of(context).primaryColor,
        onPressed: () => pickAddress(context),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.location_on,
              color: Colors.white,
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              "إختر عنوان",
              style: TextStyle(
                fontFamily: kHacinFont,
                fontSize: 18,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildAddressWidget(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      onTap: () => pickAddress(context),
      dense: false,
      horizontalTitleGap: 0,
      title: Text(
        "${store.address?.city ?? ""} - ${store.address?.region?.region ?? ""}",
      ),
      subtitle: Text(
        (store.address?.street ?? []).join(","),
        style: Theme.of(context).textTheme.kufi12RegularTextStyle,
      ),
      leading: const Icon(
        Icons.location_on_sharp,
        color: Colors.black,
        size: 35,
      ),
    );
  }

  Future<void> pickAddress(BuildContext context) async {
    final res = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => const AddressesView(
          isCallableBack: true,
        ),
      ),
    );
    if (res != null) store.setAddress(res as Address);
  }
}
