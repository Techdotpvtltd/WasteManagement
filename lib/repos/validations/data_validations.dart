import 'package:wasteapp/models/user_model.dart';

import '../../exceptions/auth_exceptions.dart';
import '../../utilities/utils.dart';

class DataValidation {
  static Future<void> loginUser({String? email, String? password}) async {
    if (email == null || email == "") {
      throw AuthExceptionEmailRequired();
    }

    if (!Util.isValidEmail(email: email)) {
      throw AuthExceptionInvalidEmail();
    }

    if (password == null || password == "") {
      throw AuthExceptionPasswordRequired();
    }
  }

  static Future<void> createUser({
    String? name,
    String? password,
    String? confirmPassword,
    String? email,
  }) async {
    if (name == null || name == "") {
      throw AuthExceptionFullNameRequired();
    }

    if (email == null || email == "") {
      throw AuthExceptionEmailRequired();
    }

    if (!Util.isValidEmail(email: email)) {
      throw AuthExceptionInvalidEmail();
    }

    if (password == null || password == "") {
      throw AuthExceptionPasswordRequired();
    }

    if (password.length < 6) {
      throw AuthExceptionWeekPassword();
    }

    if (confirmPassword == null || confirmPassword == "") {
      throw AuthExceptionConfirmPasswordRequired();
    }

    if (confirmPassword != password) {
      throw AuthExceptionConfirmPasswordDoesntMatching();
    }
  }

  static Future<void> updateUser({
    String? name,
    String? email,
    String? phone,
    UserLocation? location,
    String? apartment,
  }) async {
    if (name == null || name == "") {
      throw AuthExceptionFullNameRequired();
    }

    if (apartment == null || apartment == "") {
      throw AuthExceptionUnknown(message: "Please select apartment.");
    }

    if (email == null) {
      throw AuthExceptionEmailRequired();
    }

    if (!Util.isValidEmail(email: email)) {
      throw AuthExceptionInvalidEmail();
    }

    if (phone == null || phone == "") {
      throw AuthExceptionRequiredPhone();
    }

    if (location == null) {
      throw AuthExceptionRequiredAddress();
    }
  }
}
