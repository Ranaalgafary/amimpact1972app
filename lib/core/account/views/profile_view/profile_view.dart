import 'package:amimpact/core/account/stores/account_store/account_store.dart';
import 'package:amimpact/core/account/views/change_password_view/change_password_view.dart';
import 'package:amimpact/core/common/widgets/general/cached_image.dart';
import 'package:amimpact/core/orders/views/orders_view/orders_view.dart';
import 'package:amimpact/utils/extension/theme_extension.dart';
import 'package:amimpact/r.dart';
import 'package:amimpact/utils/constants.dart';
import 'package:amimpact/utils/locator.dart';
import 'package:amimpact/core/account/views/addresses_view/addresses_view.dart';
import 'package:amimpact/core/account/views/balance_view/balance_view.dart';
import 'package:amimpact/core/account/views/contact_us_view/contact_us_view.dart';
import 'package:amimpact/core/account/views/my_rates_view/my_rates_view.dart';
import 'package:amimpact/core/account/views/news_letter_subscribe_view/news_letter_subscribe_view.dart';
import 'package:amimpact/core/account/views/user_informations_view/user_informations_view.dart';
import 'package:amimpact/core/account/views/wishes_views/wishes_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final List<Map<String, dynamic>> items = [
    {
      "title": "المعلومات الشخصية",
      "icon": R.assetsImagesProfileAccount,
      "onTap": const UserInformationsView()
    },
    {
      "title": "تغيير الرقم السري",
      "icon": R.assetsImagesProfileAccount,
      "onTap": const ChangePasswordView()
    },
    {
      "title": "العناوين",
      "icon": R.assetsImagesProfileAddresses,
      "onTap": const AddressesView()
    },
    {
      "title": "الطلبات",
      "icon": R.assetsImagesProfileOrders,
      "onTap": const OrdersView()
    },
    {
      "title": "التقييمات",
      "icon": R.assetsImagesProfileRates,
      "onTap": const MyRatesView()
    },
    {
      "title": "إشتراكات القائمة البريدية",
      "icon": R.assetsImagesProfileEmail,
      "onTap": const NewsLetterSubscribeView()
    },
    {
      "title": "الأمنيات",
      "icon": R.assetsImagesProfileWishes,
      "onTap": const WishesView()
    },
    {
      "title": "الرصيد",
      "icon": R.assetsImagesProfileBalance,
      "onTap": const BalanceView()
    },
    {
      "title": "تواصل معنا",
      "icon": R.assetsImagesProfileBalance,
      "onTap": const ContactUsView()
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("الملف الشخصي"),
      ),
      body: ListView(
        children: [
          Align(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 32),
              width: 170,
              height: 170,
              child: ClipOval(child: Image.asset(R.assetsImagesAvatar)),
            ),
          ),
          Center(
            child: Text(
              "${locator<AccountStore>().user!.firstname} ${locator<AccountStore>().user!.lastname}",
              style: const TextStyle(
                fontFamily: kTajawalFont,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          ...items.map((e) => buildItem(context, e)).toList(),
          InkWell(
            onTap: () {
              locator<AccountStore>().logout();
            },
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  const Icon(
                    Icons.exit_to_app,
                    color: Colors.red,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Text(
                    "تسجيل الخروج",
                    style: Theme.of(context)
                        .textTheme
                        .kufi14RegularTextStyle
                        .copyWith(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildItem(BuildContext context, Map<String, dynamic> map) => InkWell(
        onTap: () async {
          if (map.containsKey("onTap")) {
            await Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => map['onTap'] as Widget),
            );
            setState(() {});
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SizedBox(
            height: 60,
            child: Center(
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                      color: const Color(0xffAFAFAF),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    width: 30,
                    height: 30,
                    padding: const EdgeInsets.all(6),
                    child: SvgPicture.asset(
                      "${map["icon"]}",
                      width: 20,
                      height: 20,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(right: 16, top: 9),
                                child: Text(
                                  "${map["title"]}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .kufi14RegularTextStyle
                                      .copyWith(color: const Color(0xff808080)),
                                ),
                              ),
                              const Spacer(),
                              const Icon(
                                Icons.arrow_forward_ios,
                                color: Color(0xffA7A7A7),
                                size: 20,
                              )
                            ],
                          ),
                        ),
                        const Divider(
                          height: 0,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
}
