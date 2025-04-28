import 'package:deep_linking/detail_screen.dart';
import 'package:deep_linking/home_screen.dart';
import 'package:deep_linking/main.dart';
import 'package:deep_linking/routing_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uni_links/uni_links.dart';
import 'package:flutter/foundation.dart';

// class UniLinksService {
//   static void reset() {}

//   static Future<void> init({checkActualVersion = false}) async {
//     // This is used for cases when: APP is not running and the user clicks on a link.
//     try {
//       final Uri? uri = await getInitialUri();
//       _uniLinkHandler(uri: uri);
//     } on PlatformException {
//       if (kDebugMode) print("(PlatformException) Failed to receive initial uri.");
//     } on FormatException catch (error) {
//       if (kDebugMode) print("(FormatException) Malformed Initial URI received. Error: $error");
//     }

//     // This is used for cases when: APP is already running and the user clicks on a link.
//     uriLinkStream.listen((Uri? uri) async {
//       print("The link should be ${uri.toString()}");
//       _uniLinkHandler(uri: uri);
//     }, onError: (error) {
//       if (kDebugMode) print('UniLinks onUriLink error: $error');
//     });
//   }

//   static Future<void> _uniLinkHandler({required Uri? uri}) async {
//     try {
//       if (uri == null) {
//         throw Exception("Received null URI");
//       }

//       // Check if the deep link is the /detail path
//       if (uri.host == 'deeplinksweb.web.app' && uri.path == '/detail') {
//         // Extract id and price from query parameters
//         String? id = uri.queryParameters['Id'];
//         String? price = uri.queryParameters['price'];

//         // If no data is found, throw an error
//         if ((id == null || id.isEmpty) && (price == null || price.isEmpty)) {
//           throw Exception("data not found in the deep link");
//         }

//         // Navigate to the DetailScreen and pass the data
//         RoutingService.push(DetailScreen(
//           data1: id.toString(),
//           data2: price.toString(),
//         ));
//       } else if (uri.host == 'deeplinksweb.web.app' && uri.path != '/detail') {
//         // Navigate to the DetailScreen and pass the data
//         RoutingService.pushAndRemoveUntil(const HomeScreen());
//         throw Exception("Deep link path is not recognized: ${uri.path}");
//       }
//     } catch (e) {
//       // Handle any errors that occurred during the deep link handling
//       if (kDebugMode) {
//         print("Error handling deep link: $e");
//       }
//       // Optionally, show an error message to the user or log it
//     }
//   }
// }

class UniLinksService {
  static Uri? _initialUri;

  static Uri? get initialUri => _initialUri;

  static Future<void> init() async {
    try {
      _initialUri = await getInitialUri();
    } on PlatformException {
      if (kDebugMode) print("(PlatformException) Failed to receive initial uri.");
    } on FormatException catch (error) {
      if (kDebugMode) print("(FormatException) Malformed Initial URI received. Error: $error");
    }

    // Listen for live incoming links while app is running
    uriLinkStream.listen((Uri? uri) async {
      if (kDebugMode) print("Incoming link while running: ${uri.toString()}");
      await _uniLinkHandler(uri: uri);
    }, onError: (error) {
      if (kDebugMode) print('UniLinks onUriLink error: $error');
    });
  }

  // Return true if a link was handled, false otherwise
  static Future<bool> handleInitialUriIfNeeded() async {
    if (_initialUri != null) {
      await _uniLinkHandler(uri: _initialUri);
      _initialUri = null; // Important!
      return true;
    }
    return false;
  }

  static Future<void> _uniLinkHandler({required Uri? uri}) async {
    try {
      if (uri == null) return;

      if (kDebugMode) print("Handling URI: ${uri.toString()}");

      if (uri.host == 'deeplinksweb.web.app' && uri.path == '/detail') {
        String? id = uri.queryParameters['Id'];
        String? price = uri.queryParameters['price'];

        if ((id == null || id.isEmpty) && (price == null || price.isEmpty)) {
          RoutingService.pushAndRemoveUntil(const HomeScreen());
          throw Exception("Data not found in the deep link");
        }

        // ✅ Just push Detail screen (no replacement, no remove)
        RoutingService.push(DetailScreen(
          data1: id.toString(),
          data2: price.toString(),
        ));
      } else if (uri.host == 'deeplinksweb.web.app' && uri.path != '/detail') {
        RoutingService.pushAndRemoveUntil(const HomeScreen());
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error handling deep link: $e");
      }
    }
  }
}
