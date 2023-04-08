import 'package:amimpact/core/orders/stores/cart_store/cart_store.dart';
import 'package:amimpact/core/orders/views/cart_view/cart_view.dart';
import 'package:amimpact/utils/extension/theme_extension.dart';
import 'package:amimpact/r.dart';
import 'package:amimpact/utils/locator.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';

class CartIconWidget extends StatelessWidget {
  const CartIconWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => const CartView(
              showAppBar: true,
            ),
          ),
        );
      },
      icon: Observer(
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
            R.assetsImagesCart,
            color: Theme.of(context).iconColor,
            height: 25,
          ),
        ),
      ),
    );
  }
}
