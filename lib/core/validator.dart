enum InputValidationType { title, positiveAmount }

enum ValidationStatus { success, failure }

class Validator {
  static ValidationResult validateData({
    required InputValidationType validationType,
    required String? stringToBeValidated,
  }) {
    if (stringToBeValidated == null || stringToBeValidated.trim().isEmpty) {
      return const ValidationResult(
        status: ValidationStatus.failure,
        message: 'This field is required',
      );
    }

    if (validationType == InputValidationType.title) {
      return const ValidationResult(status: ValidationStatus.success);
    }

    if (validationType == InputValidationType.positiveAmount) {
      final amount = double.tryParse(stringToBeValidated);

      if (amount == null) {
        return const ValidationResult(
          status: ValidationStatus.failure,
          message: 'Enter a valid amount',
        );
      }

      if (amount <= 0) {
        return const ValidationResult(
          status: ValidationStatus.failure,
          message: 'Amount must be greater than 0',
        );
      }
    }

    return const ValidationResult(
      status: ValidationStatus.success,
      message: 'No errors detected',
    );
  }
}

class ValidationResult {
  final ValidationStatus status;
  final String? message;

  const ValidationResult({required this.status, this.message});
}
