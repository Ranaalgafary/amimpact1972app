import 'package:amimpact/core/account/stores/account_store/account_store.dart';
import 'package:amimpact/core/auth/models/login_model/address.dart';
import 'package:amimpact/utils/extension/theme_extension.dart';
import 'package:amimpact/utils/constants.dart';
import 'package:amimpact/utils/locator.dart';
import 'package:amimpact/core/account/views/add_address_view/add_address_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class AddressesView extends StatefulWidget {
  const AddressesView({Key? key, this.isCallableBack = false})
      : super(key: key);
  final bool isCallableBack;

  @override
  State<AddressesView> createState() => _AddressesViewState();
}

class _AddressesViewState extends State<AddressesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("العناوين"),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          ListView.builder(
            padding: const EdgeInsets.only(
              bottom: 70,
              top: 16,
              left: 16,
              right: 16,
            ),
            itemCount: locator<AccountStore>().user?.addresses?.length ?? 0,
            itemBuilder: (_, index) =>
                buildItem(locator<AccountStore>().user!.addresses![index]),
          ),
          buildAddButton(context)
        ],
      ),
    );
  }

  Widget buildItem(Address address) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: widget.isCallableBack
          ? () {
              Navigator.pop(context, address);
            }
          : null,
      child: Slidable(
        // actionPane: const SlidableBehindActionPane(),
        // children: [
        //   Padding(
        //     padding: const EdgeInsets.symmetric(vertical: 6),
        //     child: SlidableAction(
        //       label: 'حذف',
        //       backgroundColor: Colors.red,
        //       icon: Icons.delete,
        //       // onPressed: () {},
        //     ),
        //   ),
        // ],
        child: Card(
          elevation: 6,
          child: Container(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.location_on,
                      color: Colors.green,
                      size: 16,
                    ),
                    Text(
                      "${address.city} - ${address.region?.region}",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontFamily: kBeinFont,
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "${address.street?.join(",")}",
                        maxLines: 1,
                        style: Theme.of(context)
                            .textTheme
                            .kufi12RegularTextStyle
                            .copyWith(color: const Color(0xFF808080)),
                      ),
                    ),
                    // RawMaterialButton(
                    //   shape: RoundedRectangleBorder(
                    //     borderRadius: BorderRadius.circular(8),
                    //   ),
                    //   onPressed: () {},
                    //   fillColor: Theme.of(context).primaryColor,
                    //   child: Row(
                    //     children: const [
                    //       Icon(
                    //         Icons.edit,
                    //         color: Colors.white,
                    //         size: 16,
                    //       ),
                    //       SizedBox(
                    //         width: 8,
                    //       ),
                    //       Text(
                    //         "تعديل",
                    //         style: TextStyle(
                    //           fontFamily: kBeinFont,
                    //           fontSize: 12,
                    //           color: Colors.white,
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Align buildAddButton(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 45,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: RawMaterialButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          fillColor: Colors.black,
          onPressed: () async {
            await Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const AddAddressView()),
            );
            setState(() {});
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                Icons.add,
                color: Colors.white,
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                "إضافة عنوان",
                style: TextStyle(
                  fontFamily: kHacinFont,
                  fontSize: 18,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
