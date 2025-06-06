import 'package:country_code_picker/country_code_picker.dart';
import 'package:get/get.dart';

class PhoneController extends GetxController {
  CountryCode _selectedCountryCode = CountryCode.fromDialCode("+1");

  CountryCode get selectedCountryCode => _selectedCountryCode;
  String phoneNumber = "";

  void updateCountryCode(CountryCode code) {
    _selectedCountryCode = code;
    update();
  }
}
