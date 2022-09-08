# splyza-ios-teams

# Tech stack
- Swift 5
- Deployment target 15.5
- Storyboard
- Cocoa pod
- Auto-layout 
- Alamofire
- Codable

 # Lfecycle
     - Lifecycle - perform an action when the lifecycle state changes.
     - ViewModel - store and manage UI-related data in a lifecycle-conscious way.
# Architecture
- Three project layers:
  - data layer- contains  data layer dto(data transfer object) etc.
  - domain layer- contains a model that contains data like an interface for the repository
  - presentation layer- present something to the user & put all storyboard, view controllers, table cells, ViewModel
- common - contain the provided functions, custom class like(network,alert,Ip config) etc.

#Connection
 - If the connection to splyza - team (provided spring boot service). Please Go to splyza-ios-teams-> common-> put your IP to BASE_URL 
