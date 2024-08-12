import 'package:ecom_app/core/constants/assets_path_constants.dart';
import 'package:flutter/material.dart';

class TAppConstants {
  TAppConstants._();

  // -------------------------------------------------------- AUTHENTIFICATION FEATURE --------------------------------------------------------

  // - Onboarding screen texts

  static const String firstOnBoardImageTitle =
      'Various Collections Of The Latest Products';
  static const String firstOnBoardImageDesc =
      'Lorem amet, suspendisse ullamcorper ac elit diam facilisis cursus vestibulum.';

  static const String secondOnBoardImageTitle =
      'Complete Collection Of Colors And Sizes';
  static const String secondOnBoardImageDesc =
      'Lorem amet, suspendisse ullamcorper ac elit diam facilisis cursus vestibulum.';

  static const String thirdOnBoardImageTitle =
      'Find The Most Suitable Outfit For You';
  static const String thirdOnBoardImageDesc =
      'Lorem amet, suspendisse ullamcorper ac elit diam facilisis cursus vestibulum.';

  static const String createAccountButton = 'Create account';
  static const String alreadyHaveAccountButton = 'Already Have an Account';

  // - Confirm Sign Up screen texts

  static const String verificationTitle = 'Verification';
  static const String registerSuccessTitle = 'Register Success\n';
  static const String registerSuccessMessage =
      'Conglaturation! Your account already created.\nPlease login to get amazing experience.';
  static const String goToHomepageButton = 'Go to Homepage';
  static const String confirmationEmailTitle = 'Сonfirmation Email\n';
  static const String confirmationEmailMessage =
      'We have sent the email confirmation to\n';
  static const String didNotReceiveLetter = 'Didn\'t receive the letter?';
  static const String resendButton = 'Resend';

  // - Sign In screen texts

  static const String loginAccountTitle = 'Login Account';
  static const String loginAccountSubtitle =
      'Please login with registered account';
  static const String emailOrPhoneNumber = 'Email or Phone Number';
  static const String enterEmailOrPhoneNumber =
      'Enter your email or phone number';
  static const String password = 'Password';
  static const String enterPassword = 'Enter your password';
  static const String signInButton = 'Sign in';
  static const String otherMethod = 'Or using other method';

  // - Sign Up buttons texts

  static const String signUpGoogle = 'Sign Up with Google';
  static const String signUpFacebook = 'Sign Up with Facebook';

  // -  Sign Up screen texts

  static const String signUpTitle = 'Create Account';
  static const String signUpSubtitle =
      'Start learning with create your account';
  static const String username = 'Username';
  static const String createUsername = 'Create your username';
  static const String signUpEmailOrPhoneNumber = 'Email or Phone Number';
  static const String signUpEnterEmailOrPhoneNumber =
      'Enter your email or phone number';
  static const String signUpPassword = 'Password';
  static const String createPassword = 'Create your password';
  static const String signUpCreateAccountButton = 'Create Account';
  static const String signUpOtherMethod = 'Or using other method';

  // -------------------------------------------------------- CORE FEATURE --------------------------------------------------------

  // - Product Screen

  static const String detailProduct = 'Detail Product';
  static const String rating = '4.8';
  static const String reviewCount = '(320 Review)';
  static const String availableInStock = 'Available in stock';
  static const String notavailableInStock = 'Not available in stock';
  static const String color = 'Color';
  static const String description = 'Description';
  static const String descriptionText =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.';
  static const chooseAmount = 'Choose amount:';
  static const addToCart = 'Add to cart';
  static const dollarLiter = '\$';

  // - Cheaps Widget
  static const List<String> cheapsText = [
    'All',
    'Latest',
    'Most Popular',
    'Cheapest',
    'Dearest',
  ];

  // - Filter Modal Bottom Sheet
  static const List<String> locations = [
    'San Diego',
    'Amsterdam',
    'New York',
    'Austin',
  ];

  static Map<Color, String> colors = {
    Colors.black: 'Black',
    Colors.red: 'Red',
    Colors.blue: 'Blue',
    Colors.green: 'Green',
    const Color(0xFF000080): 'Navy',
    Colors.grey: 'Grey',
    Colors.brown: 'Brown',
    Colors.purple: 'Purple',
    const Color(0xFFC0C0C0): 'Silver',
    const Color(0xFFF0E8FC): 'White',
    Colors.pink: 'Pink',
    const Color(0xFFD2B48C): 'Tan',
    Colors.orange: 'Orange',
  };

  static const String filterBy = 'Filter by';
  static const String price = 'Price';
  static const String location = 'Location';
  static const String applyFilter = 'Apply Filter';
  static const String dollarSign = '\$';

  // - Product Card Widget

  static const pictureError = 'Не удалось загрузить картинку...';

  // - Root Screen

  static const String homeIcon = 'Home';
  static const String orderIcon = 'Order';
  static const String favoriteIcon = 'Favorite';
  static const String profileIcon = 'Favorite';

  // -------------------------------------------------------- CART FEATURE --------------------------------------------------------

  // - Cart Screen

  static const String goToCheckout = 'Go to checkout';

  // - Map Widget

  static const String locationError =
      'Нет доступа к местоположению пользователя';

  // - New Card Widget

  static const String cardNumberTitle = 'Card Number';
  static const String cardHolderNameTitle = 'Card Holder Name';
  static const String cardExpiredTitle = 'Expired';
  static const String cardCvvCodeTitle = 'CVV Code';

  static const String enterCardNumber = 'Enter Card Number';
  static const String enterHolderName = 'Enter Holder Name';
  static const String enterExpirationDate = 'MM/YY';
  static const String enterCvvCode = 'CVV';

  static const String addCardButton = 'Add Card';

  // - Payment Screen

  static const String address = 'Address';
  static const String edit = 'Edit';
  static const String products = 'Products';
  static const String paymentMethod = 'Payment Method';
  static const String totalAmount = 'Total amount:';
  static const String checkoutNow = 'Checkout Now';

  static const String error = 'Error: ';
  static const String failedToGetPosition = 'Failed to get position.';

  // - Puschare Bottom Sheet
  static const String promoCodeHint = 'Enter Promo Code';

  static const String subtotal = 'Subtotal';
  static const String shipping = 'Shipping';
  static const String totalAmount1 = 'Total amount';

  static const String checkoutButton = 'Checkout';

  // - Select Card Bottom Sheet

  static const String paymentMethod1 = 'Payment Method';
  static const String paymentConfirm = 'Confirm Payment';

  // -------------------------------------------------------- FAVORITE FEATURE --------------------------------------------------------

  // Favorite Screen

  static const String myFavoriteAppbarTitle = 'My Favorite';
  static const String searchSomething = 'Search something';
  static const String favoriteEmpty = 'Похоже, здесь пока что пусто...';
  static const String favoriteError = 'Похоже, что-то пошло не так...';
  static const List<Color> colorizeColors = [
    Colors.black26,
    Colors.white10,
  ];


  // -------------------------------------------------------- HOME FEATURE  --------------------------------------------------------

  // - Home Appbar

  static const String letsGoShopping = 'Let\'s go shopping';
  static const String hi = 'Hi,';

  // - Home Filler Widget

  static const String newArrivals = 'New arrivals🔥';
  static const String seeAll = 'See All';

  // - Search Screen

  static const String lastSearch = 'Last Search';
  static const String clearAll = 'Clear all';

  // - Home Screen
  static const String tabHome = 'Home';
  static const String tabCategory = 'Category';
  static const String noAviableProducts = 'No products available';
  static const String noAviableCategories = 'No categories available';
  static const String someWentWrong = 'Something went wrong';

  // -------------------------------------------------------- PROFILE FEATURE  --------------------------------------------------------

  // - Profile Screen

  static const String somethingError = 'Something went wrong...';
  static const String profile = 'Profile';
  static const String tryAgain = 'Try again';

  // - User Data Widget

  static const String username1 = 'Username';
  static const String emailOrPhoneNumber1 = 'Email or Phone number';

  // -------------------------------------------------------- SETTINGS FEATURE  --------------------------------------------------------

  // - Change Password Screen

  static const String changePasswordAppBarTitle = 'Change Password';

  static const String newPasswordTitle = 'New Password';
  static const String confirmPasswordTitle = 'Confirm Password';

  static const String changeNowButton = 'Change now';

  static const String passwordChangeSuccess = 'Password changed successfully';
  static const String passwordMismatchError = 'Passwords must be the same';
  static const String passwordChangeError1 = 'Something went wrong... ';

  // - Edit Profile Screen

  static const String editProfileAppBarTitle = 'Edit Profile';

  static const String usernameTitle3 = 'Username';
  static const String emailOrPhoneTitle3 = 'Email or phone number';

  static const String saveChangesButton = 'Save Changes';

  static const String userNotFoundError =
      'Something went wrong... no user found';
  static const String genericError3 = 'Something went wrong... ';

  // - Help And Support Screen

  static const String helpAndSupportAppBarTitle = 'Help and Support';

  // - Language Screen

  static const String languageAppBarTitle = 'Language';
  static const String searchLanguage = 'Search language';

  static const Map<String, String> languages = {
    'English': TAssetsPath.unitedKingdomFlag,
    'Bahasa Indonesia': TAssetsPath.indonesiaFlag,
    'Chinese': TAssetsPath.chinaFlag,
    'Deutsch': TAssetsPath.germanyFlag,
  };

  // - Leagal And Policies Screen

  static const String leagalAndPoliciesAppBarTitle = 'Legal and Policies';

  // - Notifications Screen

  static const String notificationsAppBarTitle = 'Notifications';
  static const List<String> notificationOptions = [
    'Payment',
    'Traking',
    'Complete order',
    'Notification',
  ];

  // - Security Screen

  static const String securityAppBarTitle = 'Security';
  static const List<String> securityOptions = [
    'Face ID',
    'Remember Password',
    'Touch ID',
  ];

  // - Settings Screen

  static const List<Map<String, dynamic>> generalOptions = [
    {'icon': Icons.person, 'text': 'Edit Profile'},
    {'icon': Icons.lock, 'text': 'Change Password'},
    {'icon': Icons.notifications, 'text': 'Notifications'},
    {'icon': Icons.security, 'text': 'Security'},
    {'icon': Icons.language, 'text': 'Language', 'extra': 'English'},
  ];
  static const List<Map<String, dynamic>> preferencesOptions = [
    {'icon': Icons.policy, 'text': 'Legal and Policies'},
    {'icon': Icons.help, 'text': 'Help & Support'},
    {'icon': Icons.logout, 'text': 'Logout'},
  ];

  static const String settingsAppBarTitle = 'Settings';

  static const String generalTitle = 'General';
  static const String preferencesTitle = 'Preferences';

  static const String textFish =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.';

  static const articleTitle1 = 'Terms';
  static const articleTitle2 = 'Terms';

  static const String helpAndSupportFishTitle = 'Lorem ipsum dolor sit amet';
  static const String helpAndSupportFishSubtitle =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.';

  // -------------------------------------------------------- TRACKING FEATURE  --------------------------------------------------------

  // - Tracking Item Widget

  static const String color1 = 'Color:';
  static const String qty = 'Qty:';
  static const String buttonDetail = 'Detail';
  static const String buttonTracking = 'Detail';

  // - Tracking Screen

  static const String trackingScreenAppBarTitle = 'My Order';

  static const String myOrderTab = 'My order';
  static const String historyTab = 'History';

  static const String noOrdersFound = 'No Orders Found';
}
