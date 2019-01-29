Project demonstrates work with MVVM and VIPER architectures
It is used TheGardians API to fetch some data https://open-platform.theguardian.com/documentation/

3rd party libs:
-
Alomafire - for network calls
Kingfisher - for image loader

Project structure:
-

* DataManager

This final class is responsible for API calls.
Currently there is only one API call https://open-platform.theguardian.com/documentation/search which is done in fetchArticles method. fetchArticles method returns completion with success or fail.
Mentioned API call returns list of articles from The Gardians.
Parsing is done by using native JSONDecoder.

* DataModels

Contains Codable structures to represent articles.

* Views

There are the following screens

Home view - contains table view to show articles

Menu view - menu opening by click on hamburger menu button, can be closed by tap on outside area

Menu subviews - 6 views, first one All Channels is the same Home view, the last one Logout just contains Logout button, other 4 views are empty views

RootViewController - is an initial view controller, contains logic to open/close menu and showing active view (Home view). Added tap gesture recognizer to handle tap on ouside area and close menu.

* Theming

UIColor, UIFont and UIImage extensions with constant values. This approach is very good when it is need to have some "thems" for all UI components. Here are specified different values for colors, fonts and images. They can easelly changed.

* UNIT tests. Not for all classes. Added just for showing.

ViewModelTests is just example to testing viewmodels. LogoutViewInteractorTests is for testing LogoutViewInteractor class.

MVVM and VIPER part:
- 

MVVM part can be found for Menu and Home view components - MenuTableViewModel and ArticlesTableViewModel.
VIPER part is Logout view with appropriate View-Presenter-Interactor-Router chain. Logout button is just for example to show work of mentioned chain



