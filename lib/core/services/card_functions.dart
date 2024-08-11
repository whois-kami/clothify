import 'package:credit_card_type_detector/credit_card_type_detector.dart';
import 'package:credit_card_type_detector/models.dart';
import 'package:ecom_app/core/constants/assets_path_constants.dart';

String cardTypeDetect(String cardNumber) {
  final cardTypes = detectCCType(cardNumber);

  if (cardNumber.contains('@')) {
    return 'PayPal';
  }

  if (cardTypes.contains(CreditCardType.visa())) {
    return 'Visa';
  } else if (cardTypes.contains(CreditCardType.mastercard())) {
    return 'Master Card';
  } else if (cardTypes.contains(CreditCardType.americanExpress())) {
    return 'American Express';
  } else if (cardTypes.contains(CreditCardType.discover())) {
    return 'Discover';
  } else if (cardTypes.contains(CreditCardType.jcb())) {
    return 'JCB';
  } else if (cardTypes.contains(CreditCardType.dinersClub())) {
    return 'Diners Club';
  } else if (cardTypes.contains(CreditCardType.unionPay())) {
    return 'UnionPay';
  } else if (cardTypes.contains(CreditCardType.maestro())) {
    return 'Maestro';
  } else if (cardTypes.contains(CreditCardType.elo())) {
    return 'Elo';
  } else if (cardTypes.contains(CreditCardType.mir())) {
    return 'Mir';
  } else if (cardTypes.contains(CreditCardType.hiper())) {
    return 'Hiper';
  } else {
    return "Couldn't determine the type";
  }
}

String editCardData(String cardData) {
  String cleanCardNumber = cardData.replaceAll(RegExp(r'[^0-9]'), '');

  if (cardData.contains('@')) {
    RegExp emailRegex = RegExp(r'([^@]+)@(.+)');
    return cardData.replaceAllMapped(emailRegex, (match) {
      String username = match.group(1)!;
      String domain = match.group(2)!;

      if (username.length <= 2) {
        return '*' * username.length + '@' + domain;
      }

      String visibleUsername = username.substring(0, 2);
      String maskedUsername = '*' * (username.length - 2);

      return '$visibleUsername$maskedUsername@$domain';
    });
  }

  if (cleanCardNumber.length <= 4) {
    return cardData;
  }

  String maskedSection = '*' * (cleanCardNumber.length - 4);
  String visibleSection = cleanCardNumber.substring(cleanCardNumber.length - 4);

  String maskedCardNumber = maskedSection + visibleSection;

  return maskedCardNumber
      .replaceAllMapped(RegExp(r".{1,4}"), (match) => "${match.group(0)} ")
      .trim();
}

String detectCardIcon(String cardBank) {
  switch (cardBank) {
    case 'Mir':
      return '';
    case 'PayPal':
      return TAssetsPath.paypal;
    case 'Master Card':
      return TAssetsPath.mastercard;
    case 'Visa':
      return TAssetsPath.visa;
    default:
      return "Couldn't determine the type";
  }
}
