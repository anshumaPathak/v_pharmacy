import 'dart:js' as js;
import 'package:flutter/foundation.dart';
import 'dart:html' as html;

/// URL Tracking Helper for tracking UTM parameters and URL query strings
/// across Google Analytics and Meta Pixel
class UrlTrackingHelper {
  /// Extract UTM parameters from current URL
  static Map<String, String> getUtmParameters() {
    if (!kIsWeb) return {};
    
    try {
      final uri = Uri.parse(html.window.location.href);
      final params = uri.queryParameters;
      
      final utmParams = <String, String>{};
      
      if (params.containsKey('utm_source')) {
        utmParams['utm_source'] = params['utm_source']!;
      }
      if (params.containsKey('utm_medium')) {
        utmParams['utm_medium'] = params['utm_medium']!;
      }
      if (params.containsKey('utm_campaign')) {
        utmParams['utm_campaign'] = params['utm_campaign']!;
      }
      if (params.containsKey('utm_term')) {
        utmParams['utm_term'] = params['utm_term']!;
      }
      if (params.containsKey('utm_content')) {
        utmParams['utm_content'] = params['utm_content']!;
      }
      
      return utmParams;
    } catch (e) {
      debugPrint('Error extracting UTM parameters: $e');
      return {};
    }
  }

  /// Extract all query parameters from current URL
  static Map<String, String> getAllQueryParameters() {
    if (!kIsWeb) return {};
    
    try {
      final uri = Uri.parse(html.window.location.href);
      return uri.queryParameters;
    } catch (e) {
      debugPrint('Error extracting query parameters: $e');
      return {};
    }
  }

  /// Track page view with URL parameters in Google Analytics
  static void trackPageViewWithParams({
    String? pagePath,
    Map<String, String>? customParams,
  }) {
    if (!kIsWeb) return;
    
    try {
      final utmParams = getUtmParameters();
      final allParams = <String, dynamic>{
        ...utmParams,
        if (customParams != null) ...customParams,
      };
      
      if (pagePath != null) {
        allParams['page_path'] = pagePath;
      }
      
      js.context.callMethod('gtag', [
        'config',
        'G-G6028FTJBK',
        js.JsObject.jsify(allParams),
      ]);
      
      if (utmParams.isNotEmpty) {
        js.context.callMethod('gtag', [
          'event',
          'page_view',
          js.JsObject.jsify(utmParams),
        ]);
      }
    } catch (e) {
      debugPrint('Error tracking page view with params: $e');
    }
  }

  /// Track event with URL parameters in Google Analytics
  static void trackEventWithParams(
    String eventName, {
    Map<String, dynamic>? eventParams,
  }) {
    if (!kIsWeb) return;
    
    try {
      final utmParams = getUtmParameters();
      final allParams = <String, dynamic>{
        if (utmParams.isNotEmpty) ...utmParams,
        if (eventParams != null) ...eventParams,
      };
      
      js.context.callMethod('gtag', [
        'event',
        eventName,
        js.JsObject.jsify(allParams),
      ]);
    } catch (e) {
      debugPrint('Error tracking event with params: $e');
    }
  }

  /// Track page view with URL parameters in Meta Pixel
  static void trackMetaPixelPageViewWithParams({
    Map<String, String>? customParams,
  }) {
    if (!kIsWeb) return;
    
    try {
      final utmParams = getUtmParameters();
      final allParams = <String, dynamic>{
        if (utmParams.isNotEmpty) ...utmParams,
        if (customParams != null) ...customParams,
      };
      
      if (allParams.isNotEmpty) {
        js.context.callMethod('fbq', [
          'track',
          'PageView',
          js.JsObject.jsify(allParams),
        ]);
      } else {
        js.context.callMethod('fbq', ['track', 'PageView']);
      }
    } catch (e) {
      debugPrint('Error tracking Meta Pixel page view with params: $e');
    }
  }

  /// Track event with URL parameters in Meta Pixel
  static void trackMetaPixelEventWithParams(
    String eventName, {
    Map<String, dynamic>? eventParams,
  }) {
    if (!kIsWeb) return;
    
    try {
      final utmParams = getUtmParameters();
      final allParams = <String, dynamic>{
        if (utmParams.isNotEmpty) ...utmParams,
        if (eventParams != null) ...eventParams,
      };
      
      if (allParams.isNotEmpty) {
        js.context.callMethod('fbq', [
          'track',
          eventName,
          js.JsObject.jsify(allParams),
        ]);
      } else {
        js.context.callMethod('fbq', ['track', eventName]);
      }
    } catch (e) {
      debugPrint('Error tracking Meta Pixel event with params: $e');
    }
  }

  /// Track both Google Analytics and Meta Pixel with URL parameters
  static void trackPageViewBoth({
    String? pagePath,
    Map<String, String>? customParams,
  }) {
    trackPageViewWithParams(pagePath: pagePath, customParams: customParams);
    trackMetaPixelPageViewWithParams(customParams: customParams);
  }

  /// Track event in both Google Analytics and Meta Pixel with URL parameters
  static void trackEventBoth(
    String eventName, {
    Map<String, dynamic>? eventParams,
  }) {
    trackEventWithParams(eventName, eventParams: eventParams);
    trackMetaPixelEventWithParams(eventName, eventParams: eventParams);
  }
}

