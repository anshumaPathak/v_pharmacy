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
  /// **'WhatsApp:'**
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
  /// **'About Us'**
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
  /// **'We prioritize your health and safety with our trusted and reliable services,\n✅ 100% Genuine Medicines\n✅ Licensed Pharmacists & Certified Specialists\n✅ Free Home Health Checkups\n✅ 1-Day Fast Delivery\n✅ Free Delivery Above ₹500\n✅ Affordable Pricing & Continuous Support'**
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
  /// **'V Pharmacy'**
  String get yourTrusted;

  /// No description provided for @medicinePartner.
  ///
  /// In en, this message translates to:
  /// **'Your Partner in Chronic Care'**
  String get medicinePartner;

  /// No description provided for @orderVerifiedMedicinesTrackDeliver.
  ///
  /// In en, this message translates to:
  /// **'Your health deserves more than just medicine.At V Pharmacy, we bring you complete care for chronic diseases — right to your doorstep.'**
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
  /// **'V Pharmacy makes managing my diabetes simple. They deliver fast, and their doctors actually care.'**
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
  /// **'The home visits and quick delivery are amazing. It feels like a hospital came home!'**
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
  /// **'Best experience ever — fast, reliable, and genuinely caring staff'**
  String get theTrackingSystemIsAmazing;

  /// No description provided for @weAreALeadingHealthcarePlatformDedicatedToProvidingSafe.
  ///
  /// In en, this message translates to:
  /// **'We are a leading healthcare platform dedicated to providing safe, reliable, and accessible medicine ordering and verification services. Our mission is to bridge the gap between patients and quality healthcare.We specialize in managing chronic diseases such as diabetes, hypertension, thyroid disorders, heart conditions, asthma, and arthritis.Our team of certified pharmacists and healthcare professionals ensures you get the right medicines, on-time delivery, and continuous health monitoring.“We don’t just deliver medicines — we deliver care, comfort, and confidence.”'**
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
  /// **'Full Name'**
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
  /// **'Phone Number'**
  String get phoneNumber;

  /// No description provided for @category.
  ///
  /// In en, this message translates to:
  /// **'Category:'**
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
  /// **'Delivery Address:'**
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
  /// **'+91-234-567-8900'**
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
  /// **'+91-234-567-8900'**
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

  /// No description provided for @duration7Days.
  ///
  /// In en, this message translates to:
  /// **'7 days'**
  String get duration7Days;

  /// No description provided for @duration15Days.
  ///
  /// In en, this message translates to:
  /// **'15 days'**
  String get duration15Days;

  /// No description provided for @duration30Days.
  ///
  /// In en, this message translates to:
  /// **'30 days'**
  String get duration30Days;

  /// No description provided for @duration60Days.
  ///
  /// In en, this message translates to:
  /// **'60 days'**
  String get duration60Days;

  /// No description provided for @duration90Days.
  ///
  /// In en, this message translates to:
  /// **'90 days'**
  String get duration90Days;

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

  /// No description provided for @enterPhoneNumberTo.
  ///
  /// In en, this message translates to:
  /// **'Enter your phone number to get started'**
  String get enterPhoneNumberTo;

  /// No description provided for @sendOTP.
  ///
  /// In en, this message translates to:
  /// **'Send OTP'**
  String get sendOTP;

  /// No description provided for @sms.
  ///
  /// In en, this message translates to:
  /// **'SMS'**
  String get sms;

  /// No description provided for @verifyOTP.
  ///
  /// In en, this message translates to:
  /// **'Verify OTP'**
  String get verifyOTP;

  /// No description provided for @enterOTP.
  ///
  /// In en, this message translates to:
  /// **'Enter OTP'**
  String get enterOTP;

  /// No description provided for @resendOTP.
  ///
  /// In en, this message translates to:
  /// **'Resend OTP'**
  String get resendOTP;

  /// No description provided for @changePhoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Change Phone Number'**
  String get changePhoneNumber;

  /// No description provided for @completeRegistration.
  ///
  /// In en, this message translates to:
  /// **'Complete Registration'**
  String get completeRegistration;

  /// No description provided for @verified.
  ///
  /// In en, this message translates to:
  /// **'Verified'**
  String get verified;

  /// No description provided for @weSendYouAnOTPToVerifyYourNumber.
  ///
  /// In en, this message translates to:
  /// **'We\'ll send you an OTP to verify your number'**
  String get weSendYouAnOTPToVerifyYourNumber;

  /// No description provided for @demoUseAnyPhoneNumberEndingWith1234For.
  ///
  /// In en, this message translates to:
  /// **'Demo: Use any phone number ending with 1234 for existing user'**
  String get demoUseAnyPhoneNumberEndingWith1234For;

  /// No description provided for @byContinuingYouAgreeToOur.
  ///
  /// In en, this message translates to:
  /// **'By continuing, you agree to our'**
  String get byContinuingYouAgreeToOur;

  /// No description provided for @termsOfService.
  ///
  /// In en, this message translates to:
  /// **'Terms of Service'**
  String get termsOfService;

  /// No description provided for @getStarted.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get getStarted;

  /// No description provided for @yourOrders.
  ///
  /// In en, this message translates to:
  /// **'Your Orders'**
  String get yourOrders;

  /// No description provided for @trackOrdersInfo.
  ///
  /// In en, this message translates to:
  /// **'Track all your medicine orders and manage price confirmations.'**
  String get trackOrdersInfo;

  /// No description provided for @customer.
  ///
  /// In en, this message translates to:
  /// **'Customer:'**
  String get customer;

  /// No description provided for @duration.
  ///
  /// In en, this message translates to:
  /// **'Duration:'**
  String get duration;

  /// No description provided for @orderDate.
  ///
  /// In en, this message translates to:
  /// **'Order Date:'**
  String get orderDate;

  /// No description provided for @estimatedDelivery.
  ///
  /// In en, this message translates to:
  /// **'Estimated Delivery:'**
  String get estimatedDelivery;

  /// No description provided for @finalPrice.
  ///
  /// In en, this message translates to:
  /// **'Final Price:'**
  String get finalPrice;

  /// No description provided for @medicines.
  ///
  /// In en, this message translates to:
  /// **'Medicines:'**
  String get medicines;

  /// No description provided for @orderTimeline.
  ///
  /// In en, this message translates to:
  /// **'Order Timeline'**
  String get orderTimeline;

  /// No description provided for @priceConfirmationRequired.
  ///
  /// In en, this message translates to:
  /// **'Price Confirmation Required'**
  String get priceConfirmationRequired;

  /// No description provided for @originalPrice.
  ///
  /// In en, this message translates to:
  /// **'Original:'**
  String get originalPrice;

  /// No description provided for @discount.
  ///
  /// In en, this message translates to:
  /// **'Discount:'**
  String get discount;

  /// No description provided for @finalPriceText.
  ///
  /// In en, this message translates to:
  /// **'Final:'**
  String get finalPriceText;

  /// No description provided for @accept.
  ///
  /// In en, this message translates to:
  /// **'Accept'**
  String get accept;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @shippedTrack.
  ///
  /// In en, this message translates to:
  /// **'Shipped! Track:'**
  String get shippedTrack;

  /// No description provided for @viewDetails.
  ///
  /// In en, this message translates to:
  /// **'View Details'**
  String get viewDetails;

  /// No description provided for @generalInquiry.
  ///
  /// In en, this message translates to:
  /// **'General Inquiry'**
  String get generalInquiry;

  /// No description provided for @orderIssue.
  ///
  /// In en, this message translates to:
  /// **'Order Issue'**
  String get orderIssue;

  /// No description provided for @technicalSupport.
  ///
  /// In en, this message translates to:
  /// **'Technical Support'**
  String get technicalSupport;

  /// No description provided for @feedback.
  ///
  /// In en, this message translates to:
  /// **'Feedback'**
  String get feedback;

  /// No description provided for @orderNow.
  ///
  /// In en, this message translates to:
  /// **'Order Now'**
  String get orderNow;

  /// No description provided for @privacyPolicyTitle.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicyTitle;

  /// No description provided for @privacyPolicyHeading.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy for V Pharmacy'**
  String get privacyPolicyHeading;

  /// No description provided for @privacyPolicyIntro.
  ///
  /// In en, this message translates to:
  /// **'At V Pharmacy, your privacy is our top priority. We are committed to protecting the personal information you share with us when using our website https://vpharmacy.in. This Privacy Policy explains how we collect, use, and safeguard your information.'**
  String get privacyPolicyIntro;

  /// No description provided for @informationWeCollectTitle.
  ///
  /// In en, this message translates to:
  /// **'Information We Collect'**
  String get informationWeCollectTitle;

  /// No description provided for @informationWeCollect.
  ///
  /// In en, this message translates to:
  /// **' Name\n Email address\n Mobile number\n Delivery address (if required)\n Any other details you provide while using our services\nBrowser type and version\n Operating system and device information\n Pages visited and time spent on the website\n IP address'**
  String get informationWeCollect;

  /// No description provided for @howWeUseInfoTitle.
  ///
  /// In en, this message translates to:
  /// **'How We Use Your Information'**
  String get howWeUseInfoTitle;

  /// No description provided for @howWeUseInfo.
  ///
  /// In en, this message translates to:
  /// **' Processing and managing your medicine orders\n Responding to your queries and requests\n Providing updates on your order status\n Improving our website and overall user experience\n\nWe do not collect or store any payment details or sensitive financial information.'**
  String get howWeUseInfo;

  /// No description provided for @cookiesTitle.
  ///
  /// In en, this message translates to:
  /// **'Cookies and Tracking Technologies'**
  String get cookiesTitle;

  /// No description provided for @cookiesDetails.
  ///
  /// In en, this message translates to:
  /// **'Enhance your browsing experience\n Remember your preferences\n Monitor website performance and usage'**
  String get cookiesDetails;

  /// No description provided for @dataSharingTitle.
  ///
  /// In en, this message translates to:
  /// **'Data Sharing and Third-Party Services'**
  String get dataSharingTitle;

  /// No description provided for @dataSharingDetails.
  ///
  /// In en, this message translates to:
  /// **'We respect your privacy and do not sell, trade, or share your personal information with third parties.'**
  String get dataSharingDetails;

  /// No description provided for @dataSecurityTitle.
  ///
  /// In en, this message translates to:
  /// **'Data Security'**
  String get dataSecurityTitle;

  /// No description provided for @dataSecurityDetails.
  ///
  /// In en, this message translates to:
  /// **'We implement reasonable technical and organizational measures to protect your information.'**
  String get dataSecurityDetails;

  /// No description provided for @userRightsTitle.
  ///
  /// In en, this message translates to:
  /// **'Your Rights'**
  String get userRightsTitle;

  /// No description provided for @userRights.
  ///
  /// In en, this message translates to:
  /// **'- Request access to personal information\n Request correction of inaccurate information\n Request deletion of your data'**
  String get userRights;

  /// No description provided for @consentTitle.
  ///
  /// In en, this message translates to:
  /// **'Consent'**
  String get consentTitle;

  /// No description provided for @consentDetails.
  ///
  /// In en, this message translates to:
  /// **'By using our website and submitting forms, you consent to the collection and use of your information.'**
  String get consentDetails;

  /// No description provided for @contactTitle.
  ///
  /// In en, this message translates to:
  /// **'Contact for Inquiries'**
  String get contactTitle;

  /// No description provided for @contactDetails.
  ///
  /// In en, this message translates to:
  /// **'Email: vikaspharmacy11@gmail.com\nPhone: 9580366204'**
  String get contactDetails;

  /// No description provided for @changesTitle.
  ///
  /// In en, this message translates to:
  /// **'Changes to Privacy Policy'**
  String get changesTitle;

  /// No description provided for @changesDetails.
  ///
  /// In en, this message translates to:
  /// **'We may update this Privacy Policy from time to time.'**
  String get changesDetails;

  /// No description provided for @termsTitle.
  ///
  /// In en, this message translates to:
  /// **'Terms & Conditions'**
  String get termsTitle;

  /// No description provided for @termsHeading.
  ///
  /// In en, this message translates to:
  /// **'Terms & Conditions for V Pharmacy'**
  String get termsHeading;

  /// No description provided for @termsIntro.
  ///
  /// In en, this message translates to:
  /// **'Welcome to https://vpharmacy.in. By using this website, you agree to comply with the following Terms & Conditions.'**
  String get termsIntro;

  /// No description provided for @acceptanceTitle.
  ///
  /// In en, this message translates to:
  /// **'Acceptance of Terms'**
  String get acceptanceTitle;

  /// No description provided for @acceptanceDetails.
  ///
  /// In en, this message translates to:
  /// **'By accessing V Pharmacy, you agree to be bound by these Terms & Conditions and all applicable laws.'**
  String get acceptanceDetails;

  /// No description provided for @servicesTitle.
  ///
  /// In en, this message translates to:
  /// **' Services Provided'**
  String get servicesTitle;

  /// No description provided for @servicesDetails.
  ///
  /// In en, this message translates to:
  /// **'Order Medicine: Submit your medicine orders through our website form.\n Track Order: Check the status of your medicine order.\n Verify Medicine: Verify the authenticity of medicines before purchase.\n\nWe do not provide online payment services; all transactions are completed offline if required.'**
  String get servicesDetails;

  /// No description provided for @userObligationsTitle.
  ///
  /// In en, this message translates to:
  /// **' User Obligations'**
  String get userObligationsTitle;

  /// No description provided for @userObligationsDetails.
  ///
  /// In en, this message translates to:
  /// **'- Provide accurate and complete information while filling forms.\n Not misuse the website or its services.\n Avoid uploading harmful, illegal, or misleading content.'**
  String get userObligationsDetails;

  /// No description provided for @intellectualTitle.
  ///
  /// In en, this message translates to:
  /// **' Intellectual Property'**
  String get intellectualTitle;

  /// No description provided for @intellectualDetails.
  ///
  /// In en, this message translates to:
  /// **'All content, including text, images, logos, graphics, and software on this website, is owned by V Pharmacy and protected under Indian and international copyright laws.'**
  String get intellectualDetails;

  /// No description provided for @liabilityTitle.
  ///
  /// In en, this message translates to:
  /// **' Limitation of Liability'**
  String get liabilityTitle;

  /// No description provided for @liabilityDetails.
  ///
  /// In en, this message translates to:
  /// **'V Pharmacy is not liable for any direct, indirect, incidental, or consequential damages arising from the use of this website.'**
  String get liabilityDetails;

  /// No description provided for @linksTitle.
  ///
  /// In en, this message translates to:
  /// **'External Links'**
  String get linksTitle;

  /// No description provided for @linksDetails.
  ///
  /// In en, this message translates to:
  /// **'Our website may include links to third-party websites. V Pharmacy is not responsible for the content, policies, or practices of these external websites.'**
  String get linksDetails;

  /// No description provided for @termsContactDetails.
  ///
  /// In en, this message translates to:
  /// **'Email: vikaspharmacy11@gmail.com\nPhone: 9580366204'**
  String get termsContactDetails;

  /// No description provided for @modificationsTitle.
  ///
  /// In en, this message translates to:
  /// **' Modifications'**
  String get modificationsTitle;

  /// No description provided for @modificationsDetails.
  ///
  /// In en, this message translates to:
  /// **'We reserve the right to modify these Terms & Conditions at any time.'**
  String get modificationsDetails;

  /// No description provided for @governingLawTitle.
  ///
  /// In en, this message translates to:
  /// **' Governing Law'**
  String get governingLawTitle;

  /// No description provided for @governingLawDetails.
  ///
  /// In en, this message translates to:
  /// **'These Terms & Conditions are governed by the laws of India.'**
  String get governingLawDetails;

  /// No description provided for @disclaimerTitle.
  ///
  /// In en, this message translates to:
  /// **'Disclaimer'**
  String get disclaimerTitle;

  /// No description provided for @disclaimerIntro.
  ///
  /// In en, this message translates to:
  /// **'The information provided on https://vpharmacy.in is for general informational purposes only.'**
  String get disclaimerIntro;

  /// No description provided for @medicalInfoHeading.
  ///
  /// In en, this message translates to:
  /// **'Medical Information Disclaimer'**
  String get medicalInfoHeading;

  /// No description provided for @medicalInfoContent.
  ///
  /// In en, this message translates to:
  /// **'V Pharmacy provides information about medicines, their uses, and verification. This information is not intended to replace professional medical advice, diagnosis, or treatment. Always consult a qualified healthcare professional before starting, changing, or stopping any medication.'**
  String get medicalInfoContent;

  /// No description provided for @accuracyHeading.
  ///
  /// In en, this message translates to:
  /// **'Accuracy of Information'**
  String get accuracyHeading;

  /// No description provided for @accuracyContent.
  ///
  /// In en, this message translates to:
  /// **'We strive to provide accurate and up-to-date information. However, V Pharmacy does not guarantee the completeness, reliability, or accuracy of the information on the website.'**
  String get accuracyContent;

  /// No description provided for @externalLinksHeading.
  ///
  /// In en, this message translates to:
  /// **'External Links Disclaimer'**
  String get externalLinksHeading;

  /// No description provided for @externalLinksContent.
  ///
  /// In en, this message translates to:
  /// **'Our website may contain links to third-party websites. V Pharmacy is not responsible for the content, privacy policies, or practices of these websites.'**
  String get externalLinksContent;

  /// No description provided for @liabilityHeading.
  ///
  /// In en, this message translates to:
  /// **'Limitation of Liability'**
  String get liabilityHeading;

  /// No description provided for @liabilityContent.
  ///
  /// In en, this message translates to:
  /// **'V Pharmacy and its team are not responsible for any loss, injury, or damage arising directly or indirectly from using this website or relying on its content.'**
  String get liabilityContent;

  /// No description provided for @endUserHeading.
  ///
  /// In en, this message translates to:
  /// **'End-User Responsibility'**
  String get endUserHeading;

  /// No description provided for @endUserContent.
  ///
  /// In en, this message translates to:
  /// **'Users are responsible for using the information provided on the website responsibly. Do not rely solely on the website for medical or health decisions.'**
  String get endUserContent;

  /// No description provided for @contactHeading.
  ///
  /// In en, this message translates to:
  /// **'Contact for Inquiries'**
  String get contactHeading;

  /// No description provided for @contactContent.
  ///
  /// In en, this message translates to:
  /// **'Email: vikaspharmacy11@gmail.com\nPhone: 9580366204'**
  String get contactContent;

  /// No description provided for @blog.
  ///
  /// In en, this message translates to:
  /// **'Blog'**
  String get blog;

  /// No description provided for @latestArticles.
  ///
  /// In en, this message translates to:
  /// **'Latest Articles'**
  String get latestArticles;

  /// No description provided for @techUpdates.
  ///
  /// In en, this message translates to:
  /// **'Tech Updates'**
  String get techUpdates;

  /// No description provided for @lifestyleTips.
  ///
  /// In en, this message translates to:
  /// **'Lifestyle Tips'**
  String get lifestyleTips;

  /// No description provided for @alternateNumber.
  ///
  /// In en, this message translates to:
  /// **'Alternate Number'**
  String get alternateNumber;

  /// No description provided for @tapToUploadPrescription.
  ///
  /// In en, this message translates to:
  /// **'Tap to upload prescription'**
  String get tapToUploadPrescription;

  /// No description provided for @toPlaceAnOrder.
  ///
  /// In en, this message translates to:
  /// **'to place an order'**
  String get toPlaceAnOrder;

  /// No description provided for @welcomeYouDontHaveAnyOrdersYet.
  ///
  /// In en, this message translates to:
  /// **'Welcome! You dont have any orders yet. Please create your first order to start tracking it.'**
  String get welcomeYouDontHaveAnyOrdersYet;

  /// No description provided for @loadMoreOrders.
  ///
  /// In en, this message translates to:
  /// **'Load More Orders'**
  String get loadMoreOrders;

  /// No description provided for @comingSoon.
  ///
  /// In en, this message translates to:
  /// **'Coming Soon'**
  String get comingSoon;

  /// No description provided for @enterDescription.
  ///
  /// In en, this message translates to:
  /// **'Enter description'**
  String get enterDescription;

  /// No description provided for @confirmLogout.
  ///
  /// In en, this message translates to:
  /// **'Confirm Logout'**
  String get confirmLogout;

  /// No description provided for @areYouSureYouWantToLogout.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to logout'**
  String get areYouSureYouWantToLogout;

  /// No description provided for @oK.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get oK;
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
