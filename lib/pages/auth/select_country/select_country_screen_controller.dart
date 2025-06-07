import 'package:flutter/material.dart';

import 'package:country_picker_pro/country_picker_pro.dart';
import 'package:get/get.dart';

import 'package:veritey/api_repository/api_class.dart';
import 'package:veritey/routes/app_pages.dart';

class SelectCountryScreenController extends GetxController {
  Rx<Country?> selectedCountry = Rx<Country?>(null);
  final CountryProvider countryProvider = CountryProvider();
  RxList<Country> countryList = <Country>[].obs;
  RxList<Country> filteredCountryList = <Country>[].obs;
  TextEditingController searchController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    _fetchCountries();
  }

  @override
  void onClose() {
    selectedCountry.value = null;
    super.onClose();
  }

  void _fetchCountries() {
    countryList.assignAll(countryProvider.getAll());
    filteredCountryList.assignAll(countryList);
    selectedCountry.value = null;
  }

  void filterCountries(String query) {
    if (query.isEmpty) {
      filteredCountryList.assignAll(countryList);
    } else {
      filteredCountryList.assignAll(
        countryList.where((country) =>
            country.name.toLowerCase().contains(query.toLowerCase())),
      );
    }
  }

  void selectCountry(Country country) {
    selectedCountry.value = country;
    print(selectedCountry.value!.name);
  }

  void navigate() {
    Get.toNamed(Routes.SELECTED_ADDRESS, arguments: {
      HttpUtil.country: selectedCountry.value!.name,
    });
  }

  void openCountryPicker(context) {
    CountrySelector(
      context: context,
      viewType: ViewType.screen,
      countryPreferred: <String>['US'],
      appBarTitle: "Select Country",
      onSelect: (Country country) {
        selectedCountry.value = country;
      },
      listType: ListType.list,
      appBarBackgroundColour: Colors.indigo,
      appBarFontSize: 20,
      appBarFontStyle: FontStyle.normal,
      appBarFontWeight: FontWeight.bold,
      appBarTextColour: Colors.white,
      appBarTextCenterAlign: true,
      backgroundColour: Colors.white,
      backIcon: Icons.arrow_back,
      backIconColour: Colors.white,
      countryFontStyle: FontStyle.normal,
      countryFontWeight: FontWeight.bold,
      countryTextColour: Colors.black,
      countryTitleSize: 20,
      dividerColour: Colors.black12,
      searchBarAutofocus: true,
      searchBarIcon: Icons.search,
      searchBarBackgroundColor: Colors.white,
      searchBarBorderColor: Colors.black,
      searchBarBorderWidth: 2,
      searchBarOuterBackgroundColor: Colors.white,
      searchBarTextColor: Colors.black,
      searchBarHintColor: Colors.black,
      countryTheme: const CountryThemeData(
        appBarBorderRadius: 10,
      ),
      alphabetScrollEnabledWidget: true,
      showSearchBox: true,
    );
  }
}
