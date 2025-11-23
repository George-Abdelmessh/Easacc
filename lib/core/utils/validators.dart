extension AppValidators on String? {
  /// Validates an email address.
  ///
  /// Returns a locale key:
  /// - "validation.required_email"
  /// - "validation.invalid_email"
  String? email() {
    if (this == null || this!.isEmpty) {
      return 'validation.required_email';
    }
    if (!this!.contains('@')) {
      return 'validation.invalid_email';
    }
    final parts = this!.split('@');
    if (parts.length != 2 || parts.contains('')) {
      return 'validation.invalid_email';
    }
    return null;
  }

  /// Validates a password.
  ///
  /// Returns a locale key:
  /// - "validation.required_password"
  /// - "validation.password_min_length"
  /// - "validation.password_must_contain_number"
  /// - "validation.password_must_contain_uppercase"
  String? password() {
    if (this == null || this!.isEmpty) {
      return 'validation.required_password';
    }
    if (this!.length < 8) {
      return 'validation.password_min_length';
    }
    if (!this!.contains(RegExp('[0-9]'))) {
      return 'validation.password_must_contain_number';
    }
    if (!this!.contains(RegExp('[A-Z]'))) {
      return 'validation.password_must_contain_uppercase';
    }
    return null;
  }

  /// Validates if a value is required.
  ///
  /// Returns the locale key "validation.required"
  String? required() {
    if (this == null || this!.isEmpty) {
      return 'validation.required';
    }
    return null;
  }

  /// Validates if a value's length is exactly [length].
  ///
  /// Returns:
  /// - "validation.required"
  /// - "validation.numbers_exact_length" (use with interpolation)
  String? numbersExactLength(int length) {
    if (this == null || this!.isEmpty) {
      return 'validation.required';
    }
    if (this!.length != length) {
      return 'validation.numbers_exact_length';
    }
    return null;
  }

  /// Validates if a value's length is at least [length].
  ///
  /// Returns:
  /// - "validation.required"
  /// - "validation.min_length" (use with interpolation)
  String? minLength(int length) {
    if (this == null || this!.isEmpty) {
      return 'validation.required';
    }
    if (this!.length < length) {
      return 'validation.min_length';
    }
    return null;
  }

  /// Validates a phone number.
  ///
  /// Returns:
  /// - "validation.required"
  /// - "validation.invalid_phone"
  String? phoneNumber() {
    if (this == null || this!.isEmpty) {
      return 'validation.required';
    }
    if (!RegExp(r'^[0-9]*$').hasMatch(this!)) {
      return 'validation.invalid_phone';
    }
    return null;
  }

  /// Validates if a value is identical to [other].
  ///
  /// Returns:
  /// - "validation.required"
  /// - "validation.identical"
  String? identical(String? other) {
    if (this == null || this!.isEmpty) {
      return 'validation.required';
    }
    if (this! != other) {
      return 'validation.identical';
    }
    return null;
  }

    /// Validates a URL (http/https).
  ///
  /// Returns:
  /// - "validation.required_url"
  /// - "validation.invalid_url"
  String? url() {
    if (this == null || this!.isEmpty) {
      return 'validation.required_url';
    }

    final value = this!.trim();
    final uri = Uri.tryParse(value);

    if (uri == null ||
        !uri.hasScheme ||
        !(uri.scheme == 'http' || uri.scheme == 'https') ||
        uri.host.isEmpty) {
      return 'validation.invalid_url';
    }

    return null;
  }
}
