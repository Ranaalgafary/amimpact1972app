import 'package:amimpact/r.dart';
import 'package:amimpact/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsView extends StatelessWidget {
  const ContactUsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("تواصل معنا"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 24,
              ),
              child: SizedBox(
                width: double.infinity,
                child: Text(
                  "تواصل معنا",
                  style: TextStyle(
                    fontFamily: kBeinFont,
                    fontSize: 16,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ),
            buildContactUsItem(
              context,
              "الموقع علي الخريطة",
              Icons.location_on,
              () => onContactUsWidgetPressed(
                // 'https://www.google.com/maps/search/?api=1&query=${kLocationLatLng.latitude},${kLocationLatLng.longitude}'
                "",
              ),
            ),
            buildContactUsItem(
              context,
              kPhoneNumber,
              Icons.phone,
              () => onContactUsWidgetPressed('tel://$kPhoneNumber'),
            ),
            buildContactUsItem(
              context,
              kWhatsappNumber,
              FontAwesomeIcons.whatsapp,
              () => onContactUsWidgetPressed(
                "https://wa.me/$kWhatsappNumber?text=مرحبا",
              ),
            ),
            buildContactUsItem(context, "أرسل لنا إيميل", Icons.email,
                () async {
              await onContactUsWidgetPressed("mailto:$kEmail");
            }),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Image.asset(
                    R.assetsImagesContact_usSnapChat,
                    width: 50,
                    fit: BoxFit.cover,
                  ),
                  iconSize: 40,
                  onPressed: () => onContactUsWidgetPressed(kSnapshat),
                ),
                IconButton(
                  icon: Image.asset(
                    R.assetsImagesContact_usTwitter,
                    width: 50,
                    fit: BoxFit.cover,
                  ),
                  iconSize: 40,
                  onPressed: () => onContactUsWidgetPressed(kTwitter),
                ),
                IconButton(
                  icon: Image.asset(
                    R.assetsImagesContact_usInsta,
                    width: 50,
                    fit: BoxFit.cover,
                  ),
                  iconSize: 40,
                  onPressed: () => onContactUsWidgetPressed(kInstgramUrl),
                ),
                IconButton(
                  icon: Image.asset(
                    R.assetsImagesContact_usFacebook,
                    width: 50,
                    fit: BoxFit.cover,
                  ),
                  iconSize: 40,
                  onPressed: () => onContactUsWidgetPressed(kFaceBook),
                ),
              ],
            ),
            const SizedBox(
              height: 64,
            )
          ],
        ),
      ),
    );
  }

  Widget buildContactUsItem(
      BuildContext context, String text, IconData icon, Function() onPressed) {
    return Row(
      children: [
        SizedBox(
          width: 250,
          child: TextButton(
            onPressed: onPressed,
            child: Row(
              children: [
                Icon(
                  icon,
                  color: Colors.black,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  text,
                  style: const TextStyle(
                    fontFamily: kBeinFont,
                    fontSize: 16,
                    color: Color(0xff444444),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  Future<void> onContactUsWidgetPressed(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    }
  }
}
