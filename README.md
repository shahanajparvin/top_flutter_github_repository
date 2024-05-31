## Top Flutter GitHub Repository
This Flutter application, Top Flutter GitHub Repository, is designed to provide users with a seamless experience in exploring and managing top GitHub repositories related to Flutter. Leveraging clean architecture principles and modern state management techniques, this project offers robust functionalities for fetching, storing, and displaying repository data, both online and offline.

#### Screenshots

<table>
  <tr>
     <td>Home</td>
     <td>Detail</td>
     <td>Sort</td>
  </tr>
  <tr>
    <td><img src="https://gitlab.com/putulputul/top-flutter-repo/-/raw/master/screenshots/home.png"></td>
    <td><img src="https://gitlab.com/putulputul/top-flutter-repo/-/raw/master/screenshots/detail.png"></td>
    <td><img src="https://gitlab.com/putulputul/top-flutter-repo/-/raw/master/screenshots/sort.png"></td>
  </tr>
 </table>

<p><table>
  <tr>
     <td>Saved</td>
     <td>Online</td>
     <td>Offline</td>
  </tr>
  <tr>
    <td><img src="https://gitlab.com/putulputul/top-flutter-repo/-/raw/master/screenshots/saved.png"></td>
    <td><img src="https://gitlab.com/putulputul/top-flutter-repo/-/raw/master/screenshots/internet.png"></td>
    <td><img src="https://gitlab.com/putulputul/top-flutter-repo/-/raw/master/screenshots/offline.png"></td>
  </tr>
 </table></p>

## Features

- **GitHub Repository Fetching**: Utilizes the GitHub REST API to fetch top repositories based on user-defined query parameters, specifically targeting Flutter-related projects.

- **Local Data Storage**: Employs the floor package for SQLite-based local database storage, ensuring efficient caching of fetched repository data for offline use.

- **Paginated List View**: Implements pagination for repository lists, allowing users to seamlessly browse through a large number of repositories by scrolling.

- **Data Refreshing**: Updates data from the API to ensure the displayed repository information remains current, while minimizing unnecessary network requests. The required data is refreshed from the API no more frequently than once every 30 minutes

- **Flexible Sorting Options**: Enables users to sort repository lists by either updated datetime or star count, with the selected sorting preference persisting across app sessions.

- **Save Functionality**: Provides a convenient "Save" button for users to bookmark repositories of interest, storing them locally for easy access and reference.

- **Saved Repositories List**: Offers a dedicated screen for users to view their saved repositories, facilitating efficient management and retrieval of bookmarked items.

- **Detailed Repository View**: Navigates users to a detailed repository information page upon selection, presenting comprehensive details such as owner name and various repository attributes.

- **Internet Connection Notification:** Notifies the user when the internet connection status changes, allowing them to know if they are online or offline.

- **Online/Offline Data Fetching:** Fetches data from the API when the internet connection is available and switches to database-cached data when offline, ensuring continuous access to repository information.


## Technologies Utilized

- **Flutter Clean Architecture:** Follows a system of clean architecture principles, which means it organizes the code into different parts: data, domain, and presentation layers. This helps to make sure the code is easy to maintain and can grow without becoming messy.

- **Repository Pattern with Abstraction Layer (Utilizing Clean Architecture):** Implements a repository pattern with a clear abstraction layer, ensuring that different parts of the code are separate and providing a straightforward way to access and manage data. This is achieved by following the principles of Clean Architecture.

- **flutter_bloc State Management:** Uses the BLoC (Business Logic Component) pattern with the help of the flutter_bloc package for managing the app's state effectively. This pattern separates the different parts of the app's logic, making it easier to understand and manage. Additionally, it utilizes Cubit, which is a part of the BLoC pattern, to handle state changes in a more organized manner.

- **Dio Package:** Utilizes the Dio package for making HTTP requests in the application, enabling seamless interaction with external APIs.

- **Central Error Handling:** Implements an abstract BaseApiRepository class to handle central API call error handling, ensuring consistent error management across the application.

- **floor Local Database:** Utilizes floor as a lightweight, reactive local database solution, seamlessly integrating SQLite for efficient data storage and retrieval.

- **retrofit HTTP Client:** Generates REST API methods using retrofit, leveraging Dio as the HTTP client for seamless interaction with the GitHub API.

- **equatable Package:** Simplifies object comparison by equality using the equatable package, enhancing code readability and maintainability.

- **Dependency Injection with get_it:** Implements get_it as a service locator and runtime dependency injector, facilitating easy access to application services and components.

- **auto_route Routing Solution:** Utilizes auto_route for streamlined navigation within the application, leveraging the new Flutter Router for enhanced routing capabilities.

- **UI Components and Utilities:** Incorporates a range of Flutter packages including flutter_hooks, awesome_dio_interceptor, and oktoast to enhance UI interactions, network logging, and message display.

## Architecture Diagram
The architecture of the Top Flutter GitHub Repository follows a clean architecture pattern, dividing the application into distinct layers: Presentation, Domain, and Data.

<p><img src="https://gitlab.com/putulputul/top-flutter-repo/-/raw/master/screenshots/folder_structure.jpg"></p>

<p><img src="https://gitlab.com/putulputul/top-flutter-repo/-/raw/master/screenshots/architectural_diagram.jpg"></p>

## Presentation Layer
The Presentation layer is responsible for rendering data to the user interface using widgets. It listens for state changes and connects to the BLoC (Business Logic Component) or Cubit class, which handles state management in Flutter. This layer handles input validations, animations, and user interactions, ensuring a responsive and interactive user interface experience.

<p align='center'>
	<img
		src='https://gitlab.com/putulputul/top-flutter-repo/-/raw/master/screenshots/presentation_layer.png'
		title='Presentation Layer'
		alt='Presentation Layer'
	/>
</p>

## Domain Layer
The Domain layer acts as the bridge between the Presentation and Data layers. It implements business logic using entities and use cases, relying on the Repository to fetch data. Entities encapsulate high-level business rules, while use cases orchestrate data flow to and from entities. The Domain layer is independent of other layers and follows the SOLID principles.

<p align='center'>
	<img
		src='https://gitlab.com/putulputul/top-flutter-repo/-/raw/master/screenshots/domain_layer.png'
		title='Domain Layer'
		alt='Domain Layer'
	/>
</p>

## Data Layer
The Data layer is responsible for data retrieval from various sources. It consists of a repository class that implements the domain contract and determines data caching strategies. Data sources fetch data from specific sources like remote APIs or local databases. Models convert unstructured data into Dart objects.

<p align='center'>
	<img
		src='https://gitlab.com/putulputul/top-flutter-repo/-/raw/master/screenshots/data_layer.png'
		title='Data Layer'
		alt='Data Layer'
	/>
</p>

This architecture ensures separation of concerns and facilitates maintainability and scalability of the application. Each layer has a clear responsibility, promoting code organization and readability.





