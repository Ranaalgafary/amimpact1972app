import 'package:amimpact/core/account/stores/account_store/account_store.dart';
import 'package:amimpact/core/account/views/notifications_view/notifications_view.dart';
import 'package:amimpact/core/account/views/profile_view/profile_view.dart';
import 'package:amimpact/core/auth//views/no_account_view/no_account_view.dart';
import 'package:amimpact/core/common/views/home_view/home_view.dart';
import 'package:amimpact/core/orders/views/cart_view/cart_view.dart';
import 'package:amimpact/utils/extension/theme_extension.dart';
import 'package:amimpact/core/orders/stores/cart_store/cart_store.dart';
import 'package:amimpact/utils/constants.dart';
import 'package:amimpact/utils/locator.dart';
import 'package:amimpact/utils/prefs.dart';
import 'package:amimpact/core/products/views/categories_view/categories_view.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StartView extends StatefulWidget {
  const StartView({Key? key}) : super(key: key);

  @override
  _StartViewState createState() => _StartViewState();
}

class _StartViewState extends State<StartView> {
  int _currentIndex = 2;
  final List<Map<String, String>> items = [
    {"title": "التصنيفات", "icon": "categories"},
    {"title": "الإشعارات", "icon": "notifications"},
    {"title": "", "icon": ""},
    {"title": "السلة", "icon": "cart"},
    {"title": "الحساب", "icon": "account"},
  ];
  late List<Widget> screens;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.deferToChild,
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Observer(builder: (context) {
        setScreens();
        return Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            onPressed: () => _tabSelected(2),
            elevation: 5,
            backgroundColor: Colors.white,
            child: Icon(
              Icons.home_outlined,
              color: _currentIndex == 2
                  ? Theme.of(context).primaryColor
                  : Theme.of(context).iconColor,
              size: 35,
            ),
          ),
          bottomNavigationBar: SizedBox(
            height: 90,
            child: BottomAppBar(
              elevation: 20,
              notchMargin: 5,
              color: Colors.white,
              shape: const CircularNotchedRectangle(),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[for (int i = 0; i < 5; i++) _buildItem(i)],
              ),
            ),
          ),
          body: SafeArea(
            child: screens[_currentIndex],
          ),
        );
      }),
    );
  }

  Widget _buildItem(int index) {
    final item = items[index];
    final color = index == _currentIndex
        ? Theme.of(context).primaryColor
        : Theme.of(context).iconColor;
    return Expanded(
      child: index == 2
          ? const SizedBox.shrink()
          : Material(
              color: Colors.transparent,
              child: InkWell(
                customBorder: const CircleBorder(),
                onTap: () => _tabSelected(index),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    // ignore: prefer_if_elements_to_conditional_expressions
                    index == 3
                        ? cartWidget(item, color, index)
                        : SvgPicture.asset(
                            "assets/images/${item["icon"]}.svg",
                            color: color,
                            height: index == _currentIndex ? 25 : 20,
                          ),
                    Text(
                      item["title"]!,
                      style: Theme.of(context)
                          .textTheme
                          .kufi10RegularTextStyle
                          .copyWith(color: color),
                    )
                  ],
                ),
              ),
            ),
    );
  }

  Observer cartWidget(Map<String, String> item, Color color, int index) {
    return Observer(
      builder: (_) => badges.Badge(
        position: badges.BadgePosition.topStart(),
        badgeColor: Colors.white,
        badgeContent: Text(
          '${locator<CartStore>().itemCount}',
          style: Theme.of(context).textTheme.kufi10RegularTextStyle.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
        ),
        child: SvgPicture.asset(
          "assets/images/${item["icon"]}.svg",
          color: color,
          height: index == _currentIndex ? 25 : 20,
        ),
      ),
    );
  }

  void _tabSelected(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void setScreens() {
    screens = [
      const CategoriesView(),
      // if (locator<AccountStore>().isLoggedIn())
      const NotificationsView(),
      // else
      //   const NoAccountView(),
      const HomeView(),
      if (locator<AccountStore>().isLoggedIn())
        const CartView()
      else
        const NoAccountView(),
      if (locator<AccountStore>().isLoggedIn())
        const ProfileView()
      else
        const NoAccountView(),
    ];
  }
}
