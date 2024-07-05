class Validator {
  bool _isNumeric(String s) {
    for (int i = 0; i < s.length; i++) {
      if (double.tryParse(s[i]) != null) {
        return true;
      }
    }
    return false;
  }

  String? validateEmail(String s) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(s)) {
      return 'Vui lòng nhập email!';
    } else {
      return null;
    }
  }

  String? validateName(String s) {
    if (_isNumeric(s)) {
      return 'Tên không tồn tại';
    }
    if (s.isEmpty) {
      return 'Đừng quên tên của bạn!';
    }
    return null;
  }

  String? validatePassword(String s) {
    if (s.isEmpty) {
      return 'Phải an toàn, nhập mật khẩu!';
    }
    else if (s.length<8) {
      return 'Mật khẩu phải hơn 8 kí tự';
    }
    return null;
  }
}
