# Mobile Machine Test

## Technology Used
* Swift
* SwiftUI
* Xcode
* REST API

## Requirements
* **Xcode version:** 15.0 or later (Tested on 15.x+)
* **SDK requirements:** iOS SDK
* **Minimum OS version:** iOS 16.0
* **Other dependencies:** None. (The project relies strictly on native Apple frameworks like `URLSession` and `AsyncImage`, ensuring a perfectly clean build with zero external third-party libraries).

## How to Run
1. Clone the repository to your local machine:
   `git clone github.com/Ronak-uh/MachineTest`
2. Open the `InternshipMachineTest.xcodeproj` file in Xcode.
3. No dependency sync is required as there are no external packages.
4. Select a Simulator (e.g., iPhone 15 or iPhone 16 Pro) from the device dropdown at the top.
5. Build the project (`Cmd + B`).
6. Run the application (`Cmd + R`).

## Test Credentials
* **Email:** test@example.com
* **Password:** password123

## API Used
* **Product Listing API:** https://fakestoreapi.com/products

## Known Limitations
* The login authentication is mocked locally per the assignment instructions. Write operations (like logging in) do not persist data to a real backend.
* Images are loaded asynchronously using SwiftUI's native `AsyncImage`, which does not aggressively cache images to disk between sessions.
