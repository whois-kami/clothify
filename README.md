![Frame 1](https://github.com/user-attachments/assets/b9f34aed-2168-431a-9486-7585aa9034dc)
![Dart Version](https://img.shields.io/badge/dart-%3E%3D2.12-brightgreen) ![Flutter Version](https://img.shields.io/badge/flutter-v3.23.0-blue) ![License](https://img.shields.io/badge/license-MIT-orange) ![Platform](https://img.shields.io/badge/platform-Android%20|%20iOS%20-blue) ![GitHub Stars](https://img.shields.io/github/stars/whois-kami/clothify?style=social) ![Last Commit](https://img.shields.io/github/last-commit/whois-kami/clothify)
# Clothify

## Description
**Clothify** is a fully-featured marketplace where users can browse and purchase a wide variety of products through an intuitive and user-friendly interface. The platform supports order management, profile editing, and user authentication, including registration and login. Future updates aim to expand the platform by providing a dedicated application for sellers, enabling them to easily push and manage their products directly from a mobile device.

## Features

-  **Auth**: 
    This feature fully covers user session management, including registration and authorization. During registration, users must confirm their email through a verification link before they can access the application.

-  **Cart**:
    This feature manages the user's shopping cart and order processing. It includes location search, coupon input, product quantity management, total cost calculation, and order submission to the backend.

  -  **Favorite**:
     This feature allows users to separate their favorite products from others. All favorite items are cached locally. When a user removes an item from favorites, it is deleted from memory. The feature also includes tag-based and deep filtering.

- **Home**:
    The home screen features two main categories: general products (new arrivals) and products by category. Users can like products and view categories (feature in progress).

- **Profile**:
  This feature displays the user's profile as retrieved from the database, showing personal details and account information.

- **Search**:
    This feature includes complete search functionality with request submission to the backend. It supports tag-based and deep filtering, along with the ability to add items to favorites.

- **Settings**:
    This feature manages personal settings and sensitive data such as password, email, and profile photo changes. It also allows users to switch themes, change the language, and log out of the session.

- **Tracking**:
    This feature tracks the status of purchased products until they are fully ready. After a purchase, users are prompted to navigate to the tracking screen, where detailed information about their order is displayed.

### Mini-Features

- **Caching**: 
   Favorite products are cached in memory until they are no longer marked as favorites. Similarly, items in the shopping cart (including their quantities and overall details) are cached. However, cart data is cleared after the order is placed.

- **Encryption**:
   All sensitive data is encrypted using symmetric encryption, and decryption keys are securely stored in `FlutterSecureStorage` on the user's device. This enhances security, ensuring that even if the database is compromised, the attacker would only obtain an unintelligible set of text without access to the decryption keys.

- **Filtering**:
  The application supports two types of filtering:
    **Tag-based Filtering**: Executed on the frontend, this allows users to quickly filter products by tags.
    **Deep Filtering**: Sends requests to the backend to filter products based on specific parameters, ensuring precise search results.
- **Custom Splash Screen**:
    The application features a custom splash screen that enhances the user experience by providing a visually appealing introduction while the app loads. This screen is fully customizable to reflect the branding and style of the application.
## Environment Variables

To run this project, you will need to set up the following environment variables in your `.env` file:

- `API_SUPABASE_URL`: The URL of your Supabase instance.
- `API_SUPABASE_KEY`: The API key for your Supabase project.
- `API_YAMAPS_KEY`: API key for Yandex Maps, used for location search and mapping services.
- `API_YAGEOCODER_KEY`: API key for Yandex Geocoder, used for converting geographic coordinates to addresses and vice versa.

Make sure these environment variables are properly set before running the application to ensure all features work correctly.

## Tech Stack

### **Frontend:**
- **Framework:** Flutter
- **State Management:** flutter_bloc
- **Routing:** go_router
- **UI Components:**
  - animated_text_kit
  - cached_network_image
  - flutter_staggered_animations
  - modal_bottom_sheet
  - pinput
  - shimmer
  - smooth_page_indicator
- **Image Handling:** image_picker
- **Splash Screen:** flutter_native_splash

### **Backend:**
- **API:** Supabase (supabase_flutter)
- **HTTP Client:** http

### **Database:**
- **Supabase:** SaaS platform providing a hosted backend as a service, built on PostgreSQL, enabling real-time data management and authentication.

### **Security:**
- **Encryption:** encrypt, crypto, pointycastle
- **Secure Storage:** flutter_secure_storage
- **Permission Handling:** permission_handler

### **Utilities:**
- **Environment Variables:** flutter_dotenv
- **Location Services:** geolocator, yandex_mapkit (for map services)
- **Dependency Injection:** injectable, get_it
- **Equatable:** equatable (for value comparison)
- **Credit Card Detection:** credit_card_type_detector

### **Testing:**
- **Unit and Widget Testing:** flutter_test
- **Code Generation:** build_runner, injectable_generator

### **Code Quality:**
- **Linting:** flutter_lints
- **Code Formatting:** dart_style

## DEMO

[Demo Video](https://github.com/user-attachments/assets/435c2d96-1917-43e0-b66f-00b34530c360)


## Deployment

### Local Deployment

1. Clone the repository:
  ```
  git clone https://github.com/your-username/clothify.git
  ```
  2. Navigate to the project directory:
  ```
  cd clothify
  ```
  3.Install the required dependencies:
  ```
  flutter pub get
  ```
  4. Set up the environment variables:
  Create a .env file in the root of the project.
  Add the necessary environment variables as mentioned in the Environment Variables section:
  ```
  API_SUPABASE_URL=''
  API_SUPABASE_KEY=''
  API_YAMAPS_KEY=''
  API_YAGEOCODER_KEY=''
  ```
  5. Run the application on your device or emulator:
  ```
  flutter run
  ```
## License

This project is licensed under the MIT License. See the `LICENSE` file for more information.

## Contact Information

For any questions, issues, or suggestions, please reach out to the project maintainer:

- **GitHub:** [whois-kami](https://github.com/your-github-username)
- **telegram** - [Contact me](https://t.me/vtelegpam)<br />
- **Project Link** : [Share project link](https://github.com/whois-kami/clothify)
