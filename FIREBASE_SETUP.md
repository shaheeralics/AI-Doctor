# AI Doctor App - Firebase Setup Instructions

## Firebase Configuration Steps

### 1. Create a Firebase Project
1. Go to [Firebase Console](https://console.firebase.google.com/)
2. Click "Create a project" or "Add project"
3. Enter your project name (e.g., "ai-doctor-app")
4. Follow the setup wizard

### 2. Enable Authentication
1. In your Firebase project, go to "Authentication"
2. Click "Get started"
3. Go to "Sign-in method" tab
4. Enable "Email/Password" authentication
5. Optionally enable other sign-in methods (Google, Facebook, etc.)

### 3. Configure Firebase for Flutter

#### Option A: Using FlutterFire CLI (Recommended)
1. Install Firebase CLI:
   ```bash
   npm install -g firebase-tools
   ```

2. Install FlutterFire CLI:
   ```bash
   dart pub global activate flutterfire_cli
   ```

3. Login to Firebase:
   ```bash
   firebase login
   ```

4. Configure FlutterFire:
   ```bash
   flutterfire configure
   ```
   - Select your Firebase project
   - Choose platforms (Android, iOS, Web)
   - This will generate `firebase_options.dart` file automatically

#### Option B: Manual Configuration
1. For Android:
   - Download `google-services.json` from Firebase Console
   - Place it in `android/app/` directory
   - Add the following to `android/build.gradle`:
     ```gradle
     dependencies {
         classpath 'com.google.gms:google-services:4.3.15'
     }
     ```
   - Add to `android/app/build.gradle`:
     ```gradle
     apply plugin: 'com.google.gms.google-services'
     ```

2. For iOS:
   - Download `GoogleService-Info.plist` from Firebase Console
   - Add it to your iOS project in Xcode

### 4. Install Dependencies
Run the following command to install Firebase dependencies:
```bash
flutter pub get
```

### 5. Test the Authentication
1. Run the app: `flutter run`
2. Try to create a new account
3. Try to log in with existing credentials
4. Test forgot password functionality
5. Test logout functionality

## App Features

### Authentication Flow
- **Login Screen**: Users must authenticate before accessing the app
- **Sign Up**: New users can create accounts with email and password
- **Forgot Password**: Users can reset their passwords via email
- **Auto-login**: Users stay logged in between app sessions
- **Logout**: Users can logout from the Settings page

### Navigation Flow
1. App starts → Login Screen (if not authenticated)
2. Successful login → Home Page
3. From Home Page → Access all AI Doctor features
4. Settings Page → Logout option available

### Error Handling
- Form validation for email format and password length
- Firebase authentication error messages
- Loading states during authentication operations
- Success/error snackbars for user feedback

## Project Structure
```
lib/
├── main.dart                 # App entry point with authentication wrapper
├── services/
│   └── auth_service.dart     # Firebase authentication service
├── screens/
│   ├── login_screen/         # Login/signup UI
│   ├── home_page.dart        # Main app page
│   ├── settings_page.dart    # Settings with logout
│   └── ...                   # Other app screens
└── utils/
    └── constants.dart        # App colors and constants
```

## Security Rules (Optional)
If you plan to use Firestore database, set up security rules in Firebase Console:
```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    // Users can only access their own data
    match /users/{userId} {
      allow read, write: if request.auth != null && request.auth.uid == userId;
    }
  }
}
```

## Troubleshooting
- If you get build errors, run `flutter clean && flutter pub get`
- Make sure your `minSdkVersion` in `android/app/build.gradle` is at least 21
- For iOS, ensure you have the latest Xcode version
- Check Firebase Console for any configuration issues

## Next Steps
1. Complete Firebase setup following the instructions above
2. Test authentication functionality
3. Add additional features like user profiles
4. Implement cloud storage for medical reports
5. Add push notifications for appointment reminders
