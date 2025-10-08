import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_hi.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('hi')
  ];

  /// No description provided for @whatsApp.
  ///
  /// In en, this message translates to:
  /// **'WhatsApp'**
  String get whatsApp;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'login'**
  String get login;

  /// No description provided for @vPharmacy.
  ///
  /// In en, this message translates to:
  /// **'V Pharmacy'**
  String get vPharmacy;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @services.
  ///
  /// In en, this message translates to:
  /// **'Services'**
  String get services;

  /// No description provided for @about.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about;

  /// No description provided for @contact.
  ///
  /// In en, this message translates to:
  /// **'Contact'**
  String get contact;

  /// No description provided for @ourServices.
  ///
  /// In en, this message translates to:
  /// **'Our Services'**
  String get ourServices;

  /// No description provided for @experienceSeamlessHealthcareServices.
  ///
  /// In en, this message translates to:
  /// **'Experience seamless healthcare services with our comprehensive platform'**
  String get experienceSeamlessHealthcareServices;

  /// No description provided for @orderMedicine.
  ///
  /// In en, this message translates to:
  /// **'Order Medicine'**
  String get orderMedicine;

  /// No description provided for @uploadPrescriptionAndOrderWithEase.
  ///
  /// In en, this message translates to:
  /// **'Upload prescription and order with ease'**
  String get uploadPrescriptionAndOrderWithEase;

  /// No description provided for @trackOrder.
  ///
  /// In en, this message translates to:
  /// **'Track Order'**
  String get trackOrder;

  /// No description provided for @realTimeTrackingWithWhatsAppAndCallUpdates.
  ///
  /// In en, this message translates to:
  /// **'Real-time tracking with WhatsApp and call updates'**
  String get realTimeTrackingWithWhatsAppAndCallUpdates;

  /// No description provided for @verifyMedicine.
  ///
  /// In en, this message translates to:
  /// **'Verify Medicine'**
  String get verifyMedicine;

  /// No description provided for @checkAuthenticityVerificationSystem.
  ///
  /// In en, this message translates to:
  /// **'Check authenticity verification system'**
  String get checkAuthenticityVerificationSystem;

  /// No description provided for @whyChooseVPharmacy.
  ///
  /// In en, this message translates to:
  /// **'Why Choose V Pharmacy'**
  String get whyChooseVPharmacy;

  /// No description provided for @wePrioritizeYourHealthAndSafetyWithOurTrustedAndReliableServices.
  ///
  /// In en, this message translates to:
  /// **'We prioritize your health and safety with our trusted and reliable services'**
  String get wePrioritizeYourHealthAndSafetyWithOurTrustedAndReliableServices;

  /// No description provided for @happyCustomers.
  ///
  /// In en, this message translates to:
  /// **'Happy Customers'**
  String get happyCustomers;

  /// No description provided for @deliverySuccess.
  ///
  /// In en, this message translates to:
  /// **'Delivery Success'**
  String get deliverySuccess;

  /// No description provided for @supportAvailable.
  ///
  /// In en, this message translates to:
  /// **'Support Available'**
  String get supportAvailable;

  /// No description provided for @verifiedMedicines.
  ///
  /// In en, this message translates to:
  /// **'Verified Medicines'**
  String get verifiedMedicines;

  /// No description provided for @readyToGetStarted.
  ///
  /// In en, this message translates to:
  /// **'Ready to Get Started'**
  String get readyToGetStarted;

  /// No description provided for @joinThousandsOfSatisfiedCustomersWhoTrustMediCareForTheirHealthcareNeeds.
  ///
  /// In en, this message translates to:
  /// **'Join thousands of satisfied customers who trust MediCare for their healthcare needs'**
  String get joinThousandsOfSatisfiedCustomersWhoTrustMediCareForTheirHealthcareNeeds;

  /// No description provided for @yourTrusted.
  ///
  /// In en, this message translates to:
  /// **'Your Trusted'**
  String get yourTrusted;

  /// No description provided for @medicinePartner.
  ///
  /// In en, this message translates to:
  /// **'Medicine Partner'**
  String get medicinePartner;

  /// No description provided for @orderVerifiedMedicinesTrackDeliver.
  ///
  /// In en, this message translates to:
  /// **'Order verified medicines, track deliveries in real-time,and ensure authenticity with our professional healthcare platform.'**
  String get orderVerifiedMedicinesTrackDeliver;

  /// No description provided for @learnMore.
  ///
  /// In en, this message translates to:
  /// **'Learn More'**
  String get learnMore;

  /// No description provided for @rating.
  ///
  /// In en, this message translates to:
  /// **'Rating'**
  String get rating;

  /// No description provided for @allMedicinesAreThoroughly.
  ///
  /// In en, this message translates to:
  /// **'All medicines are thoroughly\\nverified for authenticity and quality'**
  String get allMedicinesAreThoroughly;

  /// No description provided for @fastDelivery.
  ///
  /// In en, this message translates to:
  /// **'Fast Delivery'**
  String get fastDelivery;

  /// No description provided for @quickAndReliableDeliveryRightTo.
  ///
  /// In en, this message translates to:
  /// **'Quick and reliable delivery right to\\nyour doorstep'**
  String get quickAndReliableDeliveryRightTo;

  /// No description provided for @support.
  ///
  /// In en, this message translates to:
  /// **'Support'**
  String get support;

  /// No description provided for @roundTheClockCustomer.
  ///
  /// In en, this message translates to:
  /// **'Round-the-clock customer\\nsupport via WhatsApp and phone'**
  String get roundTheClockCustomer;

  /// No description provided for @licensedPharmacy.
  ///
  /// In en, this message translates to:
  /// **'Licensed Pharmacy'**
  String get licensedPharmacy;

  /// No description provided for @fullyLicensedAndCertified.
  ///
  /// In en, this message translates to:
  /// **'Fully licensed and certified\\npharmacy with quality assurance'**
  String get fullyLicensedAndCertified;

  /// No description provided for @ourValues.
  ///
  /// In en, this message translates to:
  /// **'Our Values'**
  String get ourValues;

  /// No description provided for @thePrinciplesThatGuideEverythingWeDo.
  ///
  /// In en, this message translates to:
  /// **'The principles that guide everything we do'**
  String get thePrinciplesThatGuideEverythingWeDo;

  /// No description provided for @qualityAssurance.
  ///
  /// In en, this message translates to:
  /// **'Quality Assurance'**
  String get qualityAssurance;

  /// No description provided for @everyMedicineUndergoesRigorousQualityChecks.
  ///
  /// In en, this message translates to:
  /// **'Every medicine undergoes rigorous quality checks and verification processes to ensure safety and efficacy.'**
  String get everyMedicineUndergoesRigorousQualityChecks;

  /// No description provided for @patientCare.
  ///
  /// In en, this message translates to:
  /// **'Patient Care'**
  String get patientCare;

  /// No description provided for @wePrioritizePatientWellbeingProvidingCompassionate.
  ///
  /// In en, this message translates to:
  /// **'We prioritize patient well-being, providing compassionate and reliable healthcare services.'**
  String get wePrioritizePatientWellbeingProvidingCompassionate;

  /// No description provided for @reliability.
  ///
  /// In en, this message translates to:
  /// **'Reliability'**
  String get reliability;

  /// No description provided for @trustedByThousandsOfCustomersWeMaintainTheHighest.
  ///
  /// In en, this message translates to:
  /// **'Trusted by thousands of customers, we maintain the highest standards of service and delivery.'**
  String get trustedByThousandsOfCustomersWeMaintainTheHighest;

  /// No description provided for @accessibility.
  ///
  /// In en, this message translates to:
  /// **'Accessibility'**
  String get accessibility;

  /// No description provided for @availabilityEnsuresYouCanAccessHealthcareServicesWheneverYou.
  ///
  /// In en, this message translates to:
  /// **'24/7 availability ensures you can access healthcare services whenever you need them.'**
  String get availabilityEnsuresYouCanAccessHealthcareServicesWheneverYou;

  /// No description provided for @ourImpact.
  ///
  /// In en, this message translates to:
  /// **'Our Impact'**
  String get ourImpact;

  /// No description provided for @numbersThatReflectOurCommitmentToExcellence.
  ///
  /// In en, this message translates to:
  /// **'Numbers that reflect our commitment to excellence'**
  String get numbersThatReflectOurCommitmentToExcellence;

  /// No description provided for @customersServed.
  ///
  /// In en, this message translates to:
  /// **'Customers Served'**
  String get customersServed;

  /// No description provided for @deliverySuccessRate.
  ///
  /// In en, this message translates to:
  /// **'Delivery Success Rate'**
  String get deliverySuccessRate;

  /// No description provided for @industryExperience.
  ///
  /// In en, this message translates to:
  /// **'Industry Experience'**
  String get industryExperience;

  /// No description provided for @customerSupport.
  ///
  /// In en, this message translates to:
  /// **'Customer Support'**
  String get customerSupport;

  /// No description provided for @certificationsTrust.
  ///
  /// In en, this message translates to:
  /// **'Certifications & Trust'**
  String get certificationsTrust;

  /// No description provided for @ourCommitmentToQualityIsBackedByIndustryLeadingCertifications.
  ///
  /// In en, this message translates to:
  /// **'Our commitment to quality is backed by industry-leading certifications'**
  String get ourCommitmentToQualityIsBackedByIndustryLeadingCertifications;

  /// No description provided for @fDAApproved.
  ///
  /// In en, this message translates to:
  /// **'FDA Approved'**
  String get fDAApproved;

  /// No description provided for @iSO.
  ///
  /// In en, this message translates to:
  /// **'ISO'**
  String get iSO;

  /// No description provided for @wHOGMPCertified.
  ///
  /// In en, this message translates to:
  /// **'WHO GMP Certified'**
  String get wHOGMPCertified;

  /// No description provided for @whatOurCustomersSay.
  ///
  /// In en, this message translates to:
  /// **'What Our Customers Say'**
  String get whatOurCustomersSay;

  /// No description provided for @realExperiencesFromOurValuedCustomers.
  ///
  /// In en, this message translates to:
  /// **'Real experiences from our valued customers'**
  String get realExperiencesFromOurValuedCustomers;

  /// No description provided for @sarahJohnson.
  ///
  /// In en, this message translates to:
  /// **'Sarah Johnson'**
  String get sarahJohnson;

  /// No description provided for @regularCustomer.
  ///
  /// In en, this message translates to:
  /// **'Regular Customer'**
  String get regularCustomer;

  /// No description provided for @mediCareHasBeenALifesaverFastDeliveryGenuine.
  ///
  /// In en, this message translates to:
  /// **'MediCare has been a lifesaver! Fast delivery, genuine medicines, and excellent customer support.'**
  String get mediCareHasBeenALifesaverFastDeliveryGenuine;

  /// No description provided for @drMichaelChen.
  ///
  /// In en, this message translates to:
  /// **'Dr. Michael Chen'**
  String get drMichaelChen;

  /// No description provided for @healthcareProfessional.
  ///
  /// In en, this message translates to:
  /// **'Healthcare Professional'**
  String get healthcareProfessional;

  /// No description provided for @iRecommendMediCareToMyPatients.
  ///
  /// In en, this message translates to:
  /// **'I recommend MediCare to my patients. Their verification system ensures medicine authenticity.'**
  String get iRecommendMediCareToMyPatients;

  /// No description provided for @emilyRodriguez.
  ///
  /// In en, this message translates to:
  /// **'Emily Rodriguez'**
  String get emilyRodriguez;

  /// No description provided for @satisfiedCustomer.
  ///
  /// In en, this message translates to:
  /// **'Satisfied Customer'**
  String get satisfiedCustomer;

  /// No description provided for @theTrackingSystemIsAmazing.
  ///
  /// In en, this message translates to:
  /// **'The tracking system is amazing. I always know exactly when my medicines will arrive.'**
  String get theTrackingSystemIsAmazing;

  /// No description provided for @weAreALeadingHealthcarePlatformDedicatedToProvidingSafe.
  ///
  /// In en, this message translates to:
  /// **'We are a leading healthcare platform dedicated to providing safe, reliable, and accessible medicine ordering and verification services. Our mission is to bridge the gap between patients and quality healthcare.'**
  String get weAreALeadingHealthcarePlatformDedicatedToProvidingSafe;

  /// No description provided for @yearsExperience.
  ///
  /// In en, this message translates to:
  /// **'Years Experience'**
  String get yearsExperience;

  /// No description provided for @ourMission.
  ///
  /// In en, this message translates to:
  /// **'Our Mission'**
  String get ourMission;

  /// No description provided for @toProvideAccessibleReliableAndSafeHealthcareServicesByLeveragingTechnologyTo.
  ///
  /// In en, this message translates to:
  /// **'To provide accessible, reliable, and safe healthcare services by leveraging technology to connect patients with verified medicines and professional healthcare support. We strive to make healthcare more convenient and trustworthy for everyone.'**
  String get toProvideAccessibleReliableAndSafeHealthcareServicesByLeveragingTechnologyTo;

  /// No description provided for @ourVision.
  ///
  /// In en, this message translates to:
  /// **'Our Vision'**
  String get ourVision;

  /// No description provided for @toBecomeTheMostTrustedHealthcarePlatform.
  ///
  /// In en, this message translates to:
  /// **'To become the most trusted healthcare platform globally, where every patient can access quality medicines with confidence, transparency, and convenience.'**
  String get toBecomeTheMostTrustedHealthcarePlatform;

  /// No description provided for @getInTouch.
  ///
  /// In en, this message translates to:
  /// **'Get in Touch'**
  String get getInTouch;

  /// No description provided for @weHereToHelpReachOutToUsAnytimeForSupport.
  ///
  /// In en, this message translates to:
  /// **'We\'re here to help! Reach out to us anytime for support, questions, or assistance with your'**
  String get weHereToHelpReachOutToUsAnytimeForSupport;

  /// No description provided for @medicineOrdersAndVerification.
  ///
  /// In en, this message translates to:
  /// **'medicine orders and verification.'**
  String get medicineOrdersAndVerification;

  /// No description provided for @contactMethods.
  ///
  /// In en, this message translates to:
  /// **'Contact Methods'**
  String get contactMethods;

  /// No description provided for @chooseYourPreferredWayToReachUs.
  ///
  /// In en, this message translates to:
  /// **'Choose your preferred way to reach us'**
  String get chooseYourPreferredWayToReachUs;

  /// No description provided for @whatsAppSupport.
  ///
  /// In en, this message translates to:
  /// **'WhatsApp Support'**
  String get whatsAppSupport;

  /// No description provided for @getInstantHelpViaWhatsApp.
  ///
  /// In en, this message translates to:
  /// **'Get instant help via WhatsApp'**
  String get getInstantHelpViaWhatsApp;

  /// No description provided for @chatNow.
  ///
  /// In en, this message translates to:
  /// **'Chat Now'**
  String get chatNow;

  /// No description provided for @phoneSupport.
  ///
  /// In en, this message translates to:
  /// **'Phone Support'**
  String get phoneSupport;

  /// No description provided for @talkToOurSupportTeam.
  ///
  /// In en, this message translates to:
  /// **'Talk to our support team'**
  String get talkToOurSupportTeam;

  /// No description provided for @callNow.
  ///
  /// In en, this message translates to:
  /// **'Call Now'**
  String get callNow;

  /// No description provided for @emailSupport.
  ///
  /// In en, this message translates to:
  /// **'Email Support'**
  String get emailSupport;

  /// No description provided for @sendUsYourQueries.
  ///
  /// In en, this message translates to:
  /// **'Send us your queries'**
  String get sendUsYourQueries;

  /// No description provided for @sendEmail.
  ///
  /// In en, this message translates to:
  /// **'Send Email'**
  String get sendEmail;

  /// No description provided for @sendUsAMessage.
  ///
  /// In en, this message translates to:
  /// **'Send us a Message'**
  String get sendUsAMessage;

  /// No description provided for @fillOutTheFormBelowAndWeGetBackToYouWithin24Hours.
  ///
  /// In en, this message translates to:
  /// **'Fill out the form below and we\'ll get back to you within 24 hours.'**
  String get fillOutTheFormBelowAndWeGetBackToYouWithin24Hours;

  /// No description provided for @fullName.
  ///
  /// In en, this message translates to:
  /// **'Full Name *'**
  String get fullName;

  /// No description provided for @enterYourFullName.
  ///
  /// In en, this message translates to:
  /// **'Enter your full name'**
  String get enterYourFullName;

  /// No description provided for @emailAddress.
  ///
  /// In en, this message translates to:
  /// **'Email Address'**
  String get emailAddress;

  /// No description provided for @phoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Phone Number *'**
  String get phoneNumber;

  /// No description provided for @category.
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get category;

  /// No description provided for @subject.
  ///
  /// In en, this message translates to:
  /// **'Subject'**
  String get subject;

  /// No description provided for @briefDescriptionOfYourInquiry.
  ///
  /// In en, this message translates to:
  /// **'Brief description of your inquiry'**
  String get briefDescriptionOfYourInquiry;

  /// No description provided for @description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get description;

  /// No description provided for @submitMessage.
  ///
  /// In en, this message translates to:
  /// **'Submit Message'**
  String get submitMessage;

  /// No description provided for @ourSupportHours.
  ///
  /// In en, this message translates to:
  /// **'Our Support Hours'**
  String get ourSupportHours;

  /// No description provided for @available.
  ///
  /// In en, this message translates to:
  /// **'Available'**
  String get available;

  /// No description provided for @liveChat.
  ///
  /// In en, this message translates to:
  /// **'Live Chat'**
  String get liveChat;

  /// No description provided for @daily.
  ///
  /// In en, this message translates to:
  /// **'Daily'**
  String get daily;

  /// No description provided for @address.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get address;

  /// No description provided for @healthcareAvenue.
  ///
  /// In en, this message translates to:
  /// **'Healthcare Avenue'**
  String get healthcareAvenue;

  /// No description provided for @medicalDistrict.
  ///
  /// In en, this message translates to:
  /// **'Medical District'**
  String get medicalDistrict;

  /// No description provided for @newYork.
  ///
  /// In en, this message translates to:
  /// **'New York, NY'**
  String get newYork;

  /// No description provided for @unitedStates.
  ///
  /// In en, this message translates to:
  /// **'United States'**
  String get unitedStates;

  /// No description provided for @officeHours.
  ///
  /// In en, this message translates to:
  /// **'Office Hours'**
  String get officeHours;

  /// No description provided for @mondayFriday.
  ///
  /// In en, this message translates to:
  /// **'Monday - Friday'**
  String get mondayFriday;

  /// No description provided for @saturday.
  ///
  /// In en, this message translates to:
  /// **'Saturday'**
  String get saturday;

  /// No description provided for @sundayClosed.
  ///
  /// In en, this message translates to:
  /// **'Sunday: Closed'**
  String get sundayClosed;

  /// No description provided for @emergency.
  ///
  /// In en, this message translates to:
  /// **'Emergency'**
  String get emergency;

  /// No description provided for @interactiveMap.
  ///
  /// In en, this message translates to:
  /// **'Interactive Map'**
  String get interactiveMap;

  /// No description provided for @clickToViewLocation.
  ///
  /// In en, this message translates to:
  /// **'Click to view location'**
  String get clickToViewLocation;

  /// No description provided for @our.
  ///
  /// In en, this message translates to:
  /// **'Our'**
  String get our;

  /// No description provided for @comprehensiveHealthcareServicesDesignedTo.
  ///
  /// In en, this message translates to:
  /// **'Comprehensive healthcare services designed to make medicine ordering, tracking, and verification simple and secure.'**
  String get comprehensiveHealthcareServicesDesignedTo;

  /// No description provided for @uploadPrescriptionAndOrderVerifiedMedicines.
  ///
  /// In en, this message translates to:
  /// **'Upload prescription and order verified medicines'**
  String get uploadPrescriptionAndOrderVerifiedMedicines;

  /// No description provided for @realTimeOrderTrackingAndStatusUpdates.
  ///
  /// In en, this message translates to:
  /// **'Real-time order tracking and status updates'**
  String get realTimeOrderTrackingAndStatusUpdates;

  /// No description provided for @checkMedicineAuthenticityAndGenuineness.
  ///
  /// In en, this message translates to:
  /// **'Check medicine authenticity and genuineness'**
  String get checkMedicineAuthenticityAndGenuineness;

  /// No description provided for @keyFeatures.
  ///
  /// In en, this message translates to:
  /// **'Key Features'**
  String get keyFeatures;

  /// No description provided for @featureCategorySelection.
  ///
  /// In en, this message translates to:
  /// **'Category selection by disease/ailment'**
  String get featureCategorySelection;

  /// No description provided for @featurePrescriptionUpload.
  ///
  /// In en, this message translates to:
  /// **'Prescription upload and verification'**
  String get featurePrescriptionUpload;

  /// No description provided for @featureWhatsAppUpdates.
  ///
  /// In en, this message translates to:
  /// **'WhatsApp and call updates'**
  String get featureWhatsAppUpdates;

  /// No description provided for @featureSecurePayment.
  ///
  /// In en, this message translates to:
  /// **'Secure payment options'**
  String get featureSecurePayment;

  /// No description provided for @featureRealTimeOrder.
  ///
  /// In en, this message translates to:
  /// **'Real-time order status'**
  String get featureRealTimeOrder;

  /// No description provided for @featureAdminVerification.
  ///
  /// In en, this message translates to:
  /// **'Admin verification process'**
  String get featureAdminVerification;

  /// No description provided for @featurePriceConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Price confirmation with discount'**
  String get featurePriceConfirmation;

  /// No description provided for @featureDeliveryTracking.
  ///
  /// In en, this message translates to:
  /// **'Delivery tracking'**
  String get featureDeliveryTracking;

  /// No description provided for @featureBarcodeScanning.
  ///
  /// In en, this message translates to:
  /// **'Barcode scanning'**
  String get featureBarcodeScanning;

  /// No description provided for @featureMedicineDetails.
  ///
  /// In en, this message translates to:
  /// **'Medicine details verification'**
  String get featureMedicineDetails;

  /// No description provided for @featureAuthenticityConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Authenticity confirmation'**
  String get featureAuthenticityConfirmation;

  /// No description provided for @featureCounterfeitDetection.
  ///
  /// In en, this message translates to:
  /// **'Counterfeit detection'**
  String get featureCounterfeitDetection;

  /// No description provided for @orderMedicineSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Fill out the form below to order your medicines. Upload your prescription for verification.'**
  String get orderMedicineSubtitle;

  /// No description provided for @please.
  ///
  /// In en, this message translates to:
  /// **'Please '**
  String get please;

  /// No description provided for @toPlaceOrder.
  ///
  /// In en, this message translates to:
  /// **' to place an order.'**
  String get toPlaceOrder;

  /// No description provided for @orderInformation.
  ///
  /// In en, this message translates to:
  /// **'Order Information'**
  String get orderInformation;

  /// No description provided for @enterFullName.
  ///
  /// In en, this message translates to:
  /// **'Enter your full name'**
  String get enterFullName;

  /// No description provided for @diseaseCategory.
  ///
  /// In en, this message translates to:
  /// **'Disease/Ailment Category *'**
  String get diseaseCategory;

  /// No description provided for @selectCategory.
  ///
  /// In en, this message translates to:
  /// **'Select category'**
  String get selectCategory;

  /// No description provided for @deliveryAddress.
  ///
  /// In en, this message translates to:
  /// **'Delivery Address *'**
  String get deliveryAddress;

  /// No description provided for @enterAddress.
  ///
  /// In en, this message translates to:
  /// **'Enter your complete address'**
  String get enterAddress;

  /// No description provided for @emailAddressOptional.
  ///
  /// In en, this message translates to:
  /// **'Email Address (Optional)'**
  String get emailAddressOptional;

  /// No description provided for @enterEmail.
  ///
  /// In en, this message translates to:
  /// **'your.email@example.com'**
  String get enterEmail;

  /// No description provided for @enterPhoneNumber.
  ///
  /// In en, this message translates to:
  /// **'+1-234-567-8900'**
  String get enterPhoneNumber;

  /// No description provided for @whatsappNumber.
  ///
  /// In en, this message translates to:
  /// **'WhatsApp Number *'**
  String get whatsappNumber;

  /// No description provided for @enterWhatsAppNumber.
  ///
  /// In en, this message translates to:
  /// **'+1-234-567-8900'**
  String get enterWhatsAppNumber;

  /// No description provided for @whatsappInfo.
  ///
  /// In en, this message translates to:
  /// **'All order updates will be sent to this number'**
  String get whatsappInfo;

  /// No description provided for @alternateContactNumber.
  ///
  /// In en, this message translates to:
  /// **'Alternate Contact Number'**
  String get alternateContactNumber;

  /// No description provided for @enterAlternateContact.
  ///
  /// In en, this message translates to:
  /// **'+1-234-567-8900'**
  String get enterAlternateContact;

  /// No description provided for @medicineDuration.
  ///
  /// In en, this message translates to:
  /// **'Medicine Duration *'**
  String get medicineDuration;

  /// No description provided for @selectDuration.
  ///
  /// In en, this message translates to:
  /// **'Select duration'**
  String get selectDuration;

  /// No description provided for @specialInstructionsOptional.
  ///
  /// In en, this message translates to:
  /// **'Special Instructions (Optional)'**
  String get specialInstructionsOptional;

  /// No description provided for @addSpecialInstructions.
  ///
  /// In en, this message translates to:
  /// **'Add any special instructions or notes...'**
  String get addSpecialInstructions;

  /// No description provided for @submitOrder.
  ///
  /// In en, this message translates to:
  /// **'Submit Order'**
  String get submitOrder;

  /// No description provided for @categoryPainRelief.
  ///
  /// In en, this message translates to:
  /// **'Pain Relief'**
  String get categoryPainRelief;

  /// No description provided for @categoryColdFlu.
  ///
  /// In en, this message translates to:
  /// **'Cold & Flu'**
  String get categoryColdFlu;

  /// No description provided for @categoryDiabetes.
  ///
  /// In en, this message translates to:
  /// **'Diabetes'**
  String get categoryDiabetes;

  /// No description provided for @categoryHeartDisease.
  ///
  /// In en, this message translates to:
  /// **'Heart Disease'**
  String get categoryHeartDisease;

  /// No description provided for @categoryBloodPressure.
  ///
  /// In en, this message translates to:
  /// **'Blood Pressure'**
  String get categoryBloodPressure;

  /// No description provided for @categorySkinCare.
  ///
  /// In en, this message translates to:
  /// **'Skin Care'**
  String get categorySkinCare;

  /// No description provided for @categoryDigestiveHealth.
  ///
  /// In en, this message translates to:
  /// **'Digestive Health'**
  String get categoryDigestiveHealth;

  /// No description provided for @categoryMentalHealth.
  ///
  /// In en, this message translates to:
  /// **'Mental Health'**
  String get categoryMentalHealth;

  /// No description provided for @duration1to7Days.
  ///
  /// In en, this message translates to:
  /// **'1-7 days'**
  String get duration1to7Days;

  /// No description provided for @duration1to2Weeks.
  ///
  /// In en, this message translates to:
  /// **'1-2 weeks'**
  String get duration1to2Weeks;

  /// No description provided for @duration2to4Weeks.
  ///
  /// In en, this message translates to:
  /// **'2-4 weeks'**
  String get duration2to4Weeks;

  /// No description provided for @duration1to3Months.
  ///
  /// In en, this message translates to:
  /// **'1-3 months'**
  String get duration1to3Months;

  /// No description provided for @duration3to6Months.
  ///
  /// In en, this message translates to:
  /// **'3-6 months'**
  String get duration3to6Months;

  /// No description provided for @duration6PlusMonths.
  ///
  /// In en, this message translates to:
  /// **'6+ months'**
  String get duration6PlusMonths;

  /// No description provided for @orderProcess.
  ///
  /// In en, this message translates to:
  /// **'Order Process'**
  String get orderProcess;

  /// No description provided for @step1.
  ///
  /// In en, this message translates to:
  /// **'Submit order with prescription upload'**
  String get step1;

  /// No description provided for @step2.
  ///
  /// In en, this message translates to:
  /// **'Wait for prescription verification by admin (2-4 hours)'**
  String get step2;

  /// No description provided for @step3.
  ///
  /// In en, this message translates to:
  /// **'Receive final price with discount via WhatsApp/call'**
  String get step3;

  /// No description provided for @step4.
  ///
  /// In en, this message translates to:
  /// **'Accept price or cancel order'**
  String get step4;

  /// No description provided for @step5.
  ///
  /// In en, this message translates to:
  /// **'Receive medicine at your doorstep'**
  String get step5;

  /// No description provided for @needHelp.
  ///
  /// In en, this message translates to:
  /// **'Need Help?'**
  String get needHelp;

  /// No description provided for @helpDescription.
  ///
  /// In en, this message translates to:
  /// **'Our support team is available 24/7 to assist you with any questions or concerns.'**
  String get helpDescription;

  /// No description provided for @whatsappSupport.
  ///
  /// In en, this message translates to:
  /// **'WhatsApp Support'**
  String get whatsappSupport;

  /// No description provided for @callSupport.
  ///
  /// In en, this message translates to:
  /// **'Call Support'**
  String get callSupport;

  /// No description provided for @available247.
  ///
  /// In en, this message translates to:
  /// **'Available 24/7'**
  String get available247;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'hi'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'hi': return AppLocalizationsHi();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
