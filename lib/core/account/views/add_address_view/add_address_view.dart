import 'package:amimpact/core/auth/stores/auth_store/auth_store.dart';
import 'package:amimpact/core/common/models/regions_model/regions_model.dart';
import 'package:amimpact/core/common/models/regions_model/result.dart';
import 'package:amimpact/core/common/widgets/general/app_primary_button.dart';
import 'package:amimpact/core/common/widgets/general/app_text_field.dart';
import 'package:amimpact/core/common/widgets/general/loading_widget.dart';
import 'package:amimpact/utils/extension/theme_extension.dart';
import 'package:amimpact/r.dart';
import 'package:amimpact/utils/constants.dart';
import 'package:amimpact/utils/helpers/ui_helper.dart';
import 'package:amimpact/utils/locator.dart';
import 'package:amimpact/utils/network_services/common_service.dart';
import 'package:flutter/material.dart';
import 'package:loading_overlay/loading_overlay.dart';
// import 'package:google_maps_place_picker/google_maps_place_picker.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddAddressView extends StatefulWidget {
  const AddAddressView({Key? key}) : super(key: key);

  @override
  State<AddAddressView> createState() => _AddAddressViewState();
}

class _AddAddressViewState extends State<AddAddressView> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController streetController = TextEditingController();
  List<RegionModel>? regions;
  RegionModel? selectedRegion;
  String? city;

  @override
  void initState() {
    super.initState();
    getRegions();
  }

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("إضافة عنوان"),
      ),
      body: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.always,
        child: LoadingWidget(
          isLoading: loading,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  AppTextField(
                    controller: firstNameController,
                    formKey: _formKey,
                    enabled: !loading,
                    validator: (value) {
                      return (value ?? "").trim().isEmpty
                          ? "لا تترك هذا الحقل فارغا"
                          : null;
                    },
                    onChange: (value) {},
                    hint: "الإسم الأول",
                  ),
                  const SizedBox(height: 8),
                  AppTextField(
                    controller: lastNameController,
                    formKey: _formKey,
                    enabled: !loading,
                    validator: (value) {
                      return (value ?? "").trim().isEmpty
                          ? "لا تترك هذا الحقل فارغا"
                          : null;
                    },
                    onChange: (value) {},
                    hint: "الإسم الأخير",
                  ),
                  const SizedBox(height: 8),
                  AppTextField(
                    controller: phoneController,
                    formKey: _formKey,
                    textInputType: const TextInputType.numberWithOptions(
                      signed: true,
                      decimal: true,
                    ),
                    onChange: (val) {},
                    validator: (value) {
                      return (value ?? "").trim().isEmpty
                          ? "لا تترك هذا الحقل فارغا"
                          : null;
                    },
                    suffexIcon: Image.asset(R.assetsImagesSaudiFlag),
                    hint: "رقم الجوال",
                  ),
                  const SizedBox(height: 16),
                  DropdownButton<RegionModel>(
                    isExpanded: true,
                    items: (regions ?? [])
                        .map(
                          (e) => DropdownMenuItem<RegionModel>(
                            value: e,
                            child: Text(e.defaultName ?? ""),
                          ),
                        )
                        .toList(),
                    value: selectedRegion,
                    hint: const Text("المنطقة"),
                    onChanged: (value) {
                      setState(() {
                        selectedRegion = value;
                        city = null;
                      });
                    },
                  ),
                  DropdownButton<String>(
                    isExpanded: true,
                    items: (selectedRegion?.cities ?? [])
                        .map(
                          (e) => DropdownMenuItem<String>(
                            value: e,
                            child: Text(e),
                          ),
                        )
                        .toList(),
                    value: city,
                    hint: const Text("المدينة"),
                    onChanged: (value) {
                      setState(() {
                        city = value;
                      });
                    },
                  ),
                  AppTextField(
                    controller: streetController,
                    formKey: _formKey,
                    enabled: !loading,
                    validator: (value) {
                      return (value ?? "").trim().isEmpty
                          ? "لا تترك هذا الحقل فارغا"
                          : null;
                    },
                    onChange: (value) {},
                    hint: "العنوان",
                  ),
                  AppPrimaryButton(
                    onPressed: addAddress,
                    text: "حفظ",
                    color: Colors.black,
                    textStyle: const TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    phoneController.dispose();
    streetController.dispose();
    super.dispose();
  }

  Future getRegions() async {
    setState(() {
      loading = true;
    });
    regions = await locator<CommonService>().getRegions();
    loading = false;
    setState(() {});
  }

  Future addAddress() async {
    if (_formKey.currentState!.validate()) {
      if (selectedRegion == null) {
        locator<UiHelper>().showErrorMessage("إختر المنطقة");
      }
      if (city == null) {
        locator<UiHelper>().showErrorMessage("إختر المدينة");
      } else {
        setState(() {
          loading = true;
        });
        final res = await locator<CommonService>().addAddress(
            city: city!,
            region: selectedRegion!,
            firstName: firstNameController.text.trim(),
            lastName: lastNameController.text.trim(),
            phoneNumber: phoneController.text.trim(),
            address: streetController.text.trim());

        if (res is bool && res) {
          await locator<AuthStore>().init();
          Navigator.pop(context);
        } else {
          locator<UiHelper>().showErrorMessage(res.toString());
          setState(() {
            loading = false;
          });
        }
      }
    }
  }
}
