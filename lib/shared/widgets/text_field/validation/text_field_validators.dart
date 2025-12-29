/// A collection of reusable text field validators for common validation patterns.
/// 
/// These validators can be composed together to create complex validation rules.
/// All validators return null if validation passes, or an error message if it fails.
class Validators {
  Validators._(); // Private constructor to prevent instantiation

  /// Validates that a field is not empty
  static String? required(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  /// Validates that a field is not empty with a custom message
  static String? Function(String?) requiredWithMessage(String message) {
    return (String? value) {
      if (value == null || value.trim().isEmpty) {
        return message;
      }
      return null;
    };
  }

  /// Validates email format
  static String? email(String? value) {
    if (value == null || value.isEmpty) return null;

    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );

    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  /// Validates phone number (basic validation for digits)
  static String? phone(String? value) {
    if (value == null || value.isEmpty) return null;

    final phoneRegex = RegExp(r'^[0-9]{8,15}$');

    if (!phoneRegex.hasMatch(value.replaceAll(RegExp(r'[\s\-\(\)]'), ''))) {
      return 'Please enter a valid phone number';
    }
    return null;
  }

  /// Validates minimum length
  static String? Function(String?) minLength(int min, {String? message}) {
    return (String? value) {
      if (value == null || value.isEmpty) return null;

      if (value.length < min) {
        return message ?? 'Must be at least $min characters';
      }
      return null;
    };
  }

  /// Validates maximum length
  static String? Function(String?) maxLength(int max, {String? message}) {
    return (String? value) {
      if (value == null || value.isEmpty) return null;

      if (value.length > max) {
        return message ?? 'Must be at most $max characters';
      }
      return null;
    };
  }

  /// Validates that value is within a length range
  static String? Function(String?) lengthRange(int min, int max) {
    return (String? value) {
      if (value == null || value.isEmpty) return null;

      if (value.length < min || value.length > max) {
        return 'Must be between $min and $max characters';
      }
      return null;
    };
  }

  /// Validates password strength (at least 8 chars with letters and numbers)
  static String? password(String? value) {
    if (value == null || value.isEmpty) return null;

    if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }

    if (!RegExp(r'[A-Za-z]').hasMatch(value)) {
      return 'Password must contain at least one letter';
    }

    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return 'Password must contain at least one number';
    }

    return null;
  }

  /// Validates password with custom localized messages
  /// Checks for required field and minimum length (8 characters)
  static String? Function(String?) passwordWithMessages({
    required String requiredMessage,
    required String minLengthMessage,
  }) {
    return (String? value) {
      if (value == null || value.trim().isEmpty) {
        return requiredMessage;
      }
      if (value.length < 8) {
        return minLengthMessage;
      }
      return null;
    };
  }

  /// Validates strong password (letters, numbers, and special characters)
  static String? strongPassword(String? value) {
    if (value == null || value.isEmpty) return null;

    if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }

    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return 'Password must contain at least one uppercase letter';
    }

    if (!RegExp(r'[a-z]').hasMatch(value)) {
      return 'Password must contain at least one lowercase letter';
    }

    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return 'Password must contain at least one number';
    }

    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return 'Password must contain at least one special character';
    }

    return null;
  }

  /// Validates that value matches another value (for password confirmation)
  static String? Function(String?) match(String matchValue, {String? message}) {
    return (String? value) {
      if (value == null || value.isEmpty) return null;

      if (value != matchValue) {
        return message ?? 'Values do not match';
      }
      return null;
    };
  }

  /// Validates numeric input
  static String? numeric(String? value) {
    if (value == null || value.isEmpty) return null;

    if (double.tryParse(value) == null) {
      return 'Please enter a valid number';
    }
    return null;
  }

  /// Validates integer input
  static String? integer(String? value) {
    if (value == null || value.isEmpty) return null;

    if (int.tryParse(value) == null) {
      return 'Please enter a valid integer';
    }
    return null;
  }

  /// Validates minimum numeric value
  static String? Function(String?) minValue(num min) {
    return (String? value) {
      if (value == null || value.isEmpty) return null;

      final numValue = num.tryParse(value);
      if (numValue == null) return 'Please enter a valid number';

      if (numValue < min) {
        return 'Must be at least $min';
      }
      return null;
    };
  }

  /// Validates maximum numeric value
  static String? Function(String?) maxValue(num max) {
    return (String? value) {
      if (value == null || value.isEmpty) return null;

      final numValue = num.tryParse(value);
      if (numValue == null) return 'Please enter a valid number';

      if (numValue > max) {
        return 'Must be at most $max';
      }
      return null;
    };
  }

  /// Validates URL format
  static String? url(String? value) {
    if (value == null || value.isEmpty) return null;

    final urlRegex = RegExp(
      r'^https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)$',
    );

    if (!urlRegex.hasMatch(value)) {
      return 'Please enter a valid URL';
    }
    return null;
  }

  /// Validates against a custom regex pattern
  static String? Function(String?) pattern(RegExp regex, String message) {
    return (String? value) {
      if (value == null || value.isEmpty) return null;

      if (!regex.hasMatch(value)) {
        return message;
      }
      return null;
    };
  }

  /// Composes multiple validators together
  /// Returns the first error message encountered, or null if all pass
  static String? Function(String?) compose(
    List<String? Function(String?)> validators,
  ) {
    return (String? value) {
      for (final validator in validators) {
        final error = validator(value);
        if (error != null) return error;
      }
      return null;
    };
  }

  /// Combines required validation with another validator
  static String? Function(String?) requiredAnd(
    String? Function(String?) validator,
  ) {
    return compose([required, validator]);
  }
}

