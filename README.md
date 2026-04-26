# Event Finder 🎉

An intuitive and responsive Flutter application for discovering events in your area.Event Finder provides users with a seamless way to browse, search, and explore detailed information about upcoming events.

---

## 📋 Table of Contents

- [Features](#features)
- [Screens Implemented](#screens-implemented)
- [Tech Stack](#tech-stack)
- [Project Structure](#project-structure)
- [API Details](#api-details)
- [Setup Instructions](#setup-instructions)
- [Dependencies](#dependencies)
- [Challenges Faced](#challenges-faced)
- [Future Improvements](#future-improvements)

---

## ✨ Features

- **Event Discovery**: Browse a comprehensive list of upcoming events with essential details
- **Search Functionality**: Search and filter events by title, category, location, and description
- **API Integration**: Seamlessly fetch event data from a mock API with error handling
- **Navigation**: Smooth navigation between home and detailed event screens
- **Loading States**: Professional loading indicators while fetching data
- **Error Handling**: User-friendly error messages with retry functionality
- **Responsive UI**: Beautiful and responsive Material Design interface
- **Event Details**: View comprehensive information about each event including date, time, location, distance, and description

---

## 📱 Screens Implemented

### 1. **Home Screen**
The main landing page displays:
- A header section with app branding
- A search bar for filtering events
- A dynamic list of events fetched from the API
- Pull-to-refresh functionality to reload events
- Loading indicator while fetching data
- Error state with retry option

### 2. **Event Detail Screen**
Provides comprehensive event information:
- Event title, category, and cover image
- Date and time details
- Location and distance information
- Full event description
- Clean card-based layout with organized information tiles

---

## 🛠 Tech Stack

| Component | Technology |
|-----------|-----------|
| **Framework** | Flutter (Multi-platform) |
| **Language** | Dart |
| **HTTP Client** | http ^1.6.0 |
| **Design System** | Material Design 3 |
| **State Management** | StatefulWidget |

---

## 📁 Project Structure

```
lib/
├── main.dart                 # App entry point with theme configuration
├── core/
│   └── key.dart             # API endpoint constants
├── models/
│   └── event_model.dart     # Event data model with fromJson factory
├── screens/
│   ├── home_screen.dart     # Main listing screen with search
│   └── event_detail_screen.dart  # Event details view
├── services/
│   └── api_services.dart    # API integration and data fetching
└── widgets/
    ├── event_card_widget.dart           # Individual event card
    ├── header_section_widget.dart       # Header section
    ├── main_section_widget.dart         # Main content section
    └── search_bar_widget.dart           # Search bar component
```

---

## 🔌 API Details

**Mock API Provider**: MockAPI (mockapi.io)

**Endpoint**: 
```
https://69ed9671af4ff533142bca84.mockapi.io/api/v1/events
```

**Request Method**: GET

**Response Format**: JSON Array

**Event Data Structure**:
```json
{
  "id": "1",
  "title": "Music Festival 2024",
  "category": "Music",
  "date": "2024-05-15",
  "time": "18:00",
  "location": "Central Park, New York",
  "imageUrl": "https://example.com/image.jpg",
  "distance": "5.2 km",
  "description": "Join us for an amazing music festival featuring top artists..."
}
```

---

## 🚀 Setup Instructions

### Prerequisites
- Flutter SDK (3.11.4 or later)
- Dart SDK (included with Flutter)
- Git
- Android Studio / Xcode (for emulator/device)

### Installation Steps

1. **Clone the Repository**
   ```bash
   git clone https://github.com/shivanshchouhan453/event_finder.git
   cd event_finder
   ```

2. **Install Dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the Application**
   ```bash
   flutter run
   ```

   To run on a specific device:
   ```bash
   flutter devices  # List available devices
   flutter run -d <device_id>
   ```

4. **Build APK (Android)**
   ```bash
   flutter build apk
   ```

---

## 📦 Dependencies

The project uses the following packages:

| Package | Version | Purpose |
|---------|---------|---------|
| flutter | SDK | Flutter framework |
| cupertino_icons | ^1.0.8 | iOS-style icons |
| http | ^1.6.0 | HTTP client for API requests |

---

## 🏗️ Architecture Highlights

- **Separation of Concerns**: Clean separation between UI, business logic, and data layers
- **Model-based Design**: Event model handles data parsing and validation
- **Error Handling**: Comprehensive try-catch blocks and user-friendly error messages
- **Responsive Design**: Adaptive UI that works on different screen sizes
- **Material Design 3**: Modern UI with consistent theming and color scheme

---

## ⚠️ Challenges Faced

### 1. **API Integration & Error Handling**
   - Implementing robust error handling for network failures and invalid API responses
   - Parsing JSON responses with type validation and null safety
   - Distinguishing between network errors, parsing errors, and server errors

### 2. **Search Functionality**
   - Implementing efficient search across multiple event fields (title, category, location, description)
   - Maintaining search state while refreshing data
   - Ensuring case-insensitive and partial matching

### 3. **State Management & UI Responsiveness**
   - Managing async data fetching with proper loading states
   - Preventing UI rebuilds and memory leaks when navigating between screens
   - Handling device orientation changes and different screen sizes

---

## 🔮 Future Improvements

- ⭐ **Favorite/Saved Events**: Allow users to bookmark and save events for later
- 🔍 **Advanced Filtering**: Filter events by date range, category, distance, and price
- 🌙 **Dark Mode Support**: Implement dark theme with system preference detection
- 📍 **Location-based Services**: Integrate GPS for real location-based event discovery
- 🔔 **Push Notifications**: Notify users about upcoming events they're interested in
- 🗺️ **Map Integration**: Display events on an interactive map
- 💳 **Event Booking**: In-app ticket booking and registration
- ⭐ **User Reviews & Ratings**: Community feedback on past events

---

## 👨‍💻 Author

**Shivansh Chouhan**
- GitHub: [@shivanshchouhan453](https://github.com/shivanshchouhan453)

---

## 📝 License

This project is open source and available under the MIT License.

---

**Happy Event Finding! 🎊**
