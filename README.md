# Album Viewer App

## Overview

The Album Viewer App is a Flutter application developed as part of a hiring challenge for **Waffarha**. The app showcases the ability to interact with an API to fetch, display, sort, and filter a list of albums. The app emphasizes functionality, performance, and effective API handling.

<img src="screen_shots/demo.gif" alt="Demo GIF" width="300"/>

## Key Features

- **Data Fetching**: Retrieves album data from an API with pagination support.
- **Sorting**: Sorts albums by ID and title.
- **Filtering**: Filters albums based on user input for album ID.
- **Pagination**: Provides navigation through multiple pages of album data.

## Design Choices and Architecture

### 1. API Client Package

The application uses an **API Client** package, implemented as a singleton class (`ApiClient`). This class is responsible for handling all API interactions across the project. By centralizing API calls in a single location, the design follows best practices for code reusability and maintainability, ensuring that API handling is consistent and efficient throughout the app.

### 2. Package-by-Convenience Technique

The project structure is based on the **Package-by-Convenience** technique, which combines elements of both **Package-by-Layer** and **Package-by-Feature** approaches:

- **Package-by-Layer**: Suitable for reusable components like the API client and other utilities that aren't tied to a single feature.
- **Package-by-Feature**: Used for feature-specific components like screens and state management.

This hybrid approach optimizes the codebase for the specific needs of this task, allowing for flexibility and clarity. While some widgets and components might seem suitable for a global scope in a larger application, this structure was chosen to best demonstrate the functionality required for this interview task. It emphasizes a modular design that could easily be refactored or expanded as project requirements evolve.

### 3. MediaQuery and Responsive Design

While using **MediaQuery** to achieve a responsive design is a good practice for building adaptable UIs, the primary focus of this task was on **functionality, performance, and API handling**. Ensuring that the application effectively manages API interactions and provides a robust user experience was prioritized over creating a fully responsive design. This choice reflects the understanding that, for this task, demonstrating effective handling of core app functionalities was more critical than optimizing for every possible screen size.

## State Management and Flexibility

The app utilizes GetX for state management, leveraging its reactive programming capabilities to manage album data effectively. The current architecture is flexible and can easily be adapted to other state management solutions, such as BLoC, to fit different project requirements.

## Widgets Overview

- **`AlbumScreen`**: Main screen managing the display of albums and integrating all other widgets while handling different data states.
- **`SearchTextField`**: Allows filtering of albums by ID.
- **`SortOptionsRow`**: Provides sorting functionality by album ID and title.
- **`PaginationControls`**: Handles navigation through pages of album data.
- **`AlbumListView`**: Displays the list of albums.
- **`NoDataWidget`**: Informs users when there are no albums to show.
- **`NetworkErrorView`**: Displays an error message when there is a network failure.
- **`LoadingIndicator`**: Shows a loading spinner during data fetching.


## Conclusion

This project was developed to highlight core competencies in handling API interactions, managing state, and organizing code effectively in Flutter. The choices made around architecture and UI responsiveness reflect a focus on delivering a robust, functional application while demonstrating clean and maintainable code practices.

