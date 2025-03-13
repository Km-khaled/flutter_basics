# Meals App

A Flutter mobile application that helps users discover, browse, and save their favorite meals across various cuisine categories.

## Features

- **Category-based Browsing**: Explore meals organized by cuisine categories in an intuitive grid layout
- **Detailed Recipes**: View comprehensive meal information including ingredients and preparation steps
- **Favorites Management**: Save your preferred meals to a dedicated favorites section for quick access
- **User-friendly Notifications**: Get feedback via snackbar messages when adding or removing favorites
- **Responsive UI**: Enjoyable user experience with smooth navigation between screens


## Tech Stack

- **Flutter SDK**: Cross-platform UI toolkit
- **Material Design**: Modern interface components
- **State Management**: StatefulWidget for local state management
- **Navigation**: Route-based navigation between screens
- **External Packages**:
  - `google_fonts`: For enhanced typography
  - `transparent_image`: For image loading optimization

## Project Structure

- `screens/`: Contains the main screens of the application
  - `categories.dart`: Grid display of meal categories
  - `meals.dart`: Lists meals belonging to a selected category
  - `meal_details.dart`: Displays detailed information about a selected meal
  - `tabs.dart`: Manages the bottom navigation between main sections
- `models/`: Data models for the application
  - `meal.dart`: Defines the Meal data structure
  - `category.dart`: Defines the Category data structure
- `widgets/`: Reusable UI components
  - `category_grid.dart`: Grid item for category display
  - `meal_item.dart`: Card display for individual meals
- `data/`: Contains sample data for the application
  - `dummy_data.dart`: Predefined meals and categories

## Getting Started

### Prerequisites

- Flutter SDK (version 3.7.0 or above)
- Dart SDK
- Android Studio or VS Code with Flutter extension

### Installation

1. Clone the repository: