# Men4U

## Project Overview

This project is a SwiftUI application designed to help students know what meals will be served next in their school's cafeterias. The app includes several key features such as filtering meal options, user authentication, and profile management.

## Features

1. **Home Page**: Displays the meal options available in the cafeteria. Users can see all meal options or filter them based on preferences.

2. **Filter Page**: Allows users to filter meal options based on meal types, dietary restrictions, and allergies.

3. **Profile Page**: Users can manage their profile information, including updating their profile picture, adjusting appearance settings, and accessing help information.

4. **Login and Sign-Up Pages**: Users can create a new account or log in to an existing one. The sign-up page prompts for essential details such as first name, last name, email, and password.

5. **Forgot Password Page**: Helps users recover their account by resetting their password.

## File Descriptions

### `ContentView.swift`
This file serves as the entry point of the application. It sets up the initial view that the user will see when they open the app.

### `FilterPage.swift`
This file contains the implementation of the filter page, allowing users to select various filters to narrow down the meal options displayed on the home page.

### `ForgotPasswordPage.swift`
This file handles the user interface and functionality for the forgot password feature. It allows users to reset their password if they have forgotten it.

### `HomePage.swift`
This file contains the main home page of the app where all meal options are displayed. It supports filtering based on user preferences set on the filter page.

### `LoginPage.swift`
This file manages the user login process. It includes fields for email and password, and a button to log in.

### `MyApp.swift`
This file sets up the main application structure and navigation between different pages.

### `Package.swift`
This file defines the dependencies and configuration for the Swift package used in the project.

### `ProfilePage.swift`
This file manages the user profile page, allowing users to update their profile information, change settings, and access help information.

### `SignUpPage.swift`
This file handles the user sign-up process, including input fields for first name, last name, email, password, and a confirm password field.

## Getting Started

To get started with the project, follow these steps:

1. **Clone the Repository**: Clone the project repository to your local machine.
   ```bash
   git clone <repository-url>
   ```

2. **Open in Xcode**: Open the project in Xcode by double-clicking the `.xcodeproj` file.

3. **Install Dependencies**: Ensure all dependencies are installed by running the following command in the terminal:
   ```bash
   swift package resolve
   ```

4. **Run the Project**: Build and run the project in Xcode by selecting a target device or simulator and clicking the "Run" button.

## Usage

1. **Home Page**: Browse through the available meal options. Use the filter button to apply filters set on the filter page.

2. **Filter Page**: Select filters for meal types, dietary restrictions, and allergies. Apply the filters to update the home page meal options.

3. **Profile Page**: Update your profile information, change profile picture, and adjust appearance settings. Access help information if needed.

4. **Login and Sign-Up**: Use the login page to access your account or sign up to create a new account. If you forget your password, use the forgot password page to reset it.

## Contributing

If you would like to contribute to this project, please fork the repository and submit a pull request with your changes. Ensure your code follows the project’s coding standards and includes appropriate tests.

## License

This project is licensed under the MIT License. See the LICENSE file for more details.

---

This comprehensive readme should help you understand the structure and functionality of the menu app for school cafeterias. If you have any questions or need further assistance, please feel free to ask.
