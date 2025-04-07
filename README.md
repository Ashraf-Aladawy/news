# news App

A clean and modern Flutter application that provides users with the latest news from around the
world.
The app fetches news articles from a public API and displays them in an organized and visually
appealing format.

# Features

- View latest headlines from multiple categories
- Search for specific news articles
- Sign up / Sign in using Firebase Authentication(Email&password - Login with Google)

# Tech Stack

- *Flutter* – UI Toolkit
- *Dart* – Programming Language
- *Firebase Authentication* – User login and registration
- *REST API* – For fetching news data
- *Bloc(Cubit)* – State Management

# Getting Started

(1). **Clone the repo**

   ```bash
   git clone https://github.com/Ashraf-Aladawy/news.git
   cd news-app
   ```

(2).**Install dependencies**

- flutter pub get
-

(3).**Set up firebase**

- Go to Firebase Console and create a project.
- Enable Email/Password Authentication.
- Download google-services.json for Android and place it in android/app/.
- (Optional) For iOS, download GoogleService-Info.plist and add it to ios/Runner.

(4).**Run the app**

# APi Key setup

-This app uses a news API (NewsAPI.org). 

# Implementation approach

 *State Management:* I used BLoC (Cubit) for state management, enabling a clear separation between business logic and UI. 
   Each feature ( News fetching, Search) has its own Cubit to manage states in a predictable and scalable way.

 *Firebase Authentication:* Integrated Firebase Auth for user registration and login using Email/Password and Login with Google. 

 *Integrate API:* News data is retrieved from a public REST API using the http package. Data is parsed into model classes to ensure structured handling

# Modular Structure
lib/
│
├── bloc/                           
│   ├── cubit.dart                  # Contains Cubit class that handles state changes
│   └── states.dart                 # Defines various states for the Cubit
│
├── firebase_manger/              
│   └── firebase_auth.dart         # Handles Firebase authentication logic 
│
├── items/                         
│   ├── drawer_item.dart           # Drawer menu item widget
│   ├── news_item.dart             # News card widget to display individual news articles
│   └── text_field_item.dart       # Reusable styled TextField widget
│
├── models/                        
│   ├── news_data_model.dart       # Model for news articles
│   └── source_response_model.dart # Model for news sources
│
├── screens/                       # All UI screens grouped by feature
│   ├── categories_section.dart    
│   ├── home_screen.dart           
│   ├── login_screen.dart          
│   ├── news_details_screen.dart   
│   ├── register_screen.dart       
│   ├── search_screen.dart        
│   └── source_section.dart        
│
├── theme/                        
│   └── light_theme.dart           # Defines light mode theme styling
│
├── firebase_options.dart          # Auto-generated Firebase options file
└── main.dart                      # App entry point and root widget


