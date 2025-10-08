import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';
import '../res/const_color.dart';
import '../res/sizing_const.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({super.key});

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Column(
        children: [
          // 🔹 About Section (Responsive)
          Container(
            color: const Color(0xFFF1F5F9),
            padding: EdgeInsets.symmetric(
              horizontal: width < 600 ? 20 : 80,
              vertical: width < 600 ? 40 : 80,
            ),
            child: LayoutBuilder(
              builder: (context, constraints) {
                bool isMobile = constraints.maxWidth < 800;
                return isMobile
                    ? Column(
                        children: [
                          _aboutLeftContent(),
                          const SizedBox(height: 30),
                          _aboutRightImage(),
                        ],
                      )
                    : Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(flex: 5, child: _aboutLeftContent()),
                          const SizedBox(width: 60),
                          Expanded(flex: 4, child: _aboutRightImage()),
                        ],
                      );
              },
            ),
          ),

          // 🔹 Mission & Vision Section
          Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(
              horizontal: width < 600 ? 20 : 80,
              vertical: width < 600 ? 40 : 60,
            ),
            child: LayoutBuilder(
              builder: (context, constraints) {
                bool isMobile = constraints.maxWidth < 800;
                return isMobile
                    ? Column(
                        children: [
                          _missionCard(),
                          const SizedBox(height: 20),
                          _visionCard(),
                        ],
                      )
                    //     : Row(
                    //   crossAxisAlignment: CrossAxisAlignment.start,
                    //   children: [
                    //     Expanded(child: _missionCard()),
                    //     const SizedBox(width: 40),
                    //     Expanded(child: _visionCard()),
                    //   ],
                    // );
                    : IntrinsicHeight(
                        // 👈 equal height wrapper
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(child: _missionCard()),
                            const SizedBox(width: 40),
                            Expanded(child: _visionCard()),
                          ],
                        ),
                      );
              },
            ),
          ),

          Container(
            color: const Color(0xFFF8FAFC),
            padding: EdgeInsets.symmetric(
              horizontal: width < 600 ? 20 : 80,
              vertical: width < 600 ? 40 : 60,
            ),
            child: Column(
              children: [
                Text(
                  AppLocalizations.of(context)!.ourValues,
                  style: const TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  AppLocalizations.of(
                    context,
                  )!.thePrinciplesThatGuideEverythingWeDo,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Color(0xFF64748B),
                  ),
                ),
                const SizedBox(height: 48),
                LayoutBuilder(
                  builder: (context, constraints) {
                    bool isMobile = constraints.maxWidth < 900;
                    return isMobile
                        ? Column(
                            children: [
                              _valueCard(
                                Icons.shield_outlined,
                                AppLocalizations.of(context)!.qualityAssurance,
                                AppLocalizations.of(
                                  context,
                                )!.everyMedicineUndergoesRigorousQualityChecks,
                              ),
                              const SizedBox(height: 20),
                              _valueCard(
                                Icons.favorite_border,
                                AppLocalizations.of(context)!.patientCare,
                                AppLocalizations.of(
                                  context,
                                )!.wePrioritizePatientWellbeingProvidingCompassionate,
                              ),
                              const SizedBox(height: 20),
                              _valueCard(
                                Icons.check_circle_outline,
                                AppLocalizations.of(context)!.reliability,
                                AppLocalizations.of(
                                  context,
                                )!.trustedByThousandsOfCustomersWeMaintainTheHighest,
                              ),
                              const SizedBox(height: 20),
                              _valueCard(
                                Icons.schedule,
                                AppLocalizations.of(context)!.accessibility,
                                '24/7 ${AppLocalizations.of(context)!.availabilityEnsuresYouCanAccessHealthcareServicesWheneverYou}',
                              ),
                            ],
                          )
                        : IntrinsicHeight(
                            // 👈 equal height wrapper
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Expanded(
                                  child: _valueCard(
                                    Icons.shield_outlined,
                                    AppLocalizations.of(
                                      context,
                                    )!.qualityAssurance,
                                    AppLocalizations.of(
                                      context,
                                    )!.everyMedicineUndergoesRigorousQualityChecks,
                                  ),
                                ),
                                const SizedBox(width: 24),
                                Expanded(
                                  child: _valueCard(
                                    Icons.favorite_border,
                                    AppLocalizations.of(context)!.patientCare,
                                    AppLocalizations.of(
                                      context,
                                    )!.wePrioritizePatientWellbeingProvidingCompassionate,
                                  ),
                                ),
                                const SizedBox(width: 24),
                                Expanded(
                                  child: _valueCard(
                                    Icons.check_circle_outline,
                                    AppLocalizations.of(context)!.reliability,
                                    AppLocalizations.of(
                                      context,
                                    )!.trustedByThousandsOfCustomersWeMaintainTheHighest,
                                  ),
                                ),
                                const SizedBox(width: 24),
                                Expanded(
                                  child: _valueCard(
                                    Icons.schedule,
                                    AppLocalizations.of(context)!.accessibility,
                                    '24/7 ${AppLocalizations.of(context)!.availabilityEnsuresYouCanAccessHealthcareServicesWheneverYou}',
                                  ),
                                ),
                              ],
                            ),
                          );
                  },
                ),
              ],
            ),
          ),

          // Container(
          //   color: const Color(0xFFF8FAFC),
          //   padding: EdgeInsets.symmetric(
          //     horizontal: width < 600 ? 20 : 80,
          //     vertical: width < 600 ? 40 : 60,
          //   ),
          //   child: Column(
          //     children: [
          //        Text(
          //         AppLocalizations.of(context)!.ourValues,
          //         style: TextStyle(
          //           fontSize: 36,
          //           fontWeight: FontWeight.w700,
          //           color: Colors.black,
          //         ),
          //       ),
          //       const SizedBox(height: 12),
          //        Text(
          //          AppLocalizations.of(context)!.thePrinciplesThatGuideEverythingWeDo,
          //         style: TextStyle(fontSize: 18, color: Color(0xFF64748B)),
          //       ),
          //       const SizedBox(height: 48),
          //       LayoutBuilder(
          //         builder: (context, constraints) {
          //           bool isMobile = constraints.maxWidth < 900;
          //           return isMobile
          //               ? Column(
          //             children: [
          //               _valueCard(Icons.shield_outlined,
          //                   AppLocalizations.of(context)!.qualityAssurance,
          //                 AppLocalizations.of(context)!.everyMedicineUndergoesRigorousQualityChecks,),
          //               const SizedBox(height: 20),
          //               _valueCard(Icons.favorite_border,  AppLocalizations.of(context)!.patientCare,
          //                 AppLocalizations.of(context)!.wePrioritizePatientWellbeingProvidingCompassionate,),
          //               const SizedBox(height: 20),
          //               _valueCard(Icons.check_circle_outline,  AppLocalizations.of(context)!.reliability,
          //                 AppLocalizations.of(context)!.trustedByThousandsOfCustomersWeMaintainTheHighest,),
          //               const SizedBox(height: 20),
          //               _valueCard(Icons.schedule,  AppLocalizations.of(context)!.accessibility,
          //                   '24/7${ AppLocalizations.of(context)!.availabilityEnsuresYouCanAccessHealthcareServicesWheneverYou}'),
          //             ],
          //           )
          //               : Row(
          //             crossAxisAlignment: CrossAxisAlignment.start,
          //             children: [
          //               Expanded(
          //                   child: _valueCard(
          //                       Icons.shield_outlined,
          //                       AppLocalizations.of(context)!.qualityAssurance,
          //                     AppLocalizations.of(context)!.everyMedicineUndergoesRigorousQualityChecks,)),
          //               const SizedBox(width: 24),
          //               Expanded(
          //                   child: _valueCard(
          //                       Icons.favorite_border,
          //                       AppLocalizations.of(context)!.patientCare,
          //                     AppLocalizations.of(context)!.wePrioritizePatientWellbeingProvidingCompassionate,)),
          //               const SizedBox(width: 24),
          //               Expanded(
          //                   child: _valueCard(
          //                       Icons.check_circle_outline,
          //                       AppLocalizations.of(context)!.reliability,
          //                     AppLocalizations.of(context)!.trustedByThousandsOfCustomersWeMaintainTheHighest,)),
          //               const SizedBox(width: 24),
          //               Expanded(
          //                   child: _valueCard(
          //                       Icons.schedule,
          //                       AppLocalizations.of(context)!.accessibility,
          //                       '24/7 ${ AppLocalizations.of(context)!.availabilityEnsuresYouCanAccessHealthcareServicesWheneverYou}')),
          //             ],
          //           );
          //         },
          //       ),
          //     ],
          //   ),
          // ),
          Sizes.spaceHeight10,

          // 🔹 Our Impact Section (unchanged)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
            decoration: BoxDecoration(color: AppColor.blueColor),
            child: Column(
              children: [
                Text(
                  AppLocalizations.of(context)!.ourImpact,
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  AppLocalizations.of(
                    context,
                  )!.numbersThatReflectOurCommitmentToExcellence,
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                const SizedBox(height: 12),
                LayoutBuilder(
                  builder: (context, constraints) {
                    bool isMobile = constraints.maxWidth < 600;
                    return isMobile
                        ? Column(
                            children: [
                              _buildStatItem(
                                "50,000+",
                                AppLocalizations.of(context)!.customersServed,
                              ),
                              const SizedBox(height: 30),
                              _buildStatItem(
                                "99.9%",
                                AppLocalizations.of(
                                  context,
                                )!.deliverySuccessRate,
                              ),
                              const SizedBox(height: 30),
                              _buildStatItem(
                                "5 Years",
                                AppLocalizations.of(
                                  context,
                                )!.industryExperience,
                              ),
                              const SizedBox(height: 30),
                              _buildStatItem(
                                "24/7",
                                AppLocalizations.of(context)!.customerSupport,
                              ),
                            ],
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _buildStatItem(
                                "50,000+",
                                AppLocalizations.of(context)!.happyCustomers,
                              ),
                              _buildStatItem(
                                "99.9%",
                                AppLocalizations.of(context)!.deliverySuccess,
                              ),
                              _buildStatItem(
                                "24/7",
                                AppLocalizations.of(context)!.supportAvailable,
                              ),
                              _buildStatItem(
                                "100%",
                                AppLocalizations.of(context)!.verifiedMedicines,
                              ),
                            ],
                          );
                  },
                ),
              ],
            ),
          ),

          // 🔹 Certifications Section (responsive)
          // Container(
          //   color: Colors.white,
          //   padding: EdgeInsets.symmetric(
          //     horizontal: width < 600 ? 20 : 80,
          //     vertical: width < 600 ? 40 : 60,
          //   ),
          //   child: Column(
          //     children: [
          //        Text(
          //          AppLocalizations.of(context)!.certificationsTrust,
          //         style: TextStyle(
          //           fontSize: 36,
          //           fontWeight: FontWeight.w700,
          //           color: Colors.black,
          //         ),
          //       ),
          //       const SizedBox(height: 12),
          //        Text(
          //          AppLocalizations.of(context)!.ourCommitmentToQualityIsBackedByIndustryLeadingCertifications,
          //         style: TextStyle(fontSize: 18, color: Color(0xFF64748B)),
          //       ),
          //       const SizedBox(height: 48),
          //       LayoutBuilder(
          //         builder: (context, constraints) {
          //           bool isMobile = constraints.maxWidth < 900;
          //           return isMobile
          //               ? Column(
          //             children: [
          //               _certCard(Icons.military_tech_outlined, AppLocalizations.of(context)!.fDAApproved,),
          //               const SizedBox(height: 20),
          //               _certCard(Icons.shield_outlined, "${ AppLocalizations.of(context)!.iSO} 9001:2015"),
          //               const SizedBox(height: 20),
          //               _certCard(Icons.verified_outlined,  AppLocalizations.of(context)!.wHOGMPCertified,),
          //               const SizedBox(height: 20),
          //               _certCard(Icons.stars_outlined,  AppLocalizations.of(context)!.licensedPharmacy,),
          //             ],
          //           )
          //               : Row(
          //             children: [
          //               _certCard(Icons.military_tech_outlined, AppLocalizations.of(context)!.fDAApproved,),
          //               const SizedBox(width: 24),
          //               _certCard(Icons.shield_outlined, "${ AppLocalizations.of(context)!.iSO} 9001:2015"),
          //               const SizedBox(width: 24),
          //               _certCard(Icons.verified_outlined,  AppLocalizations.of(context)!.wHOGMPCertified,),
          //               const SizedBox(width: 24),
          //               _certCard(Icons.stars_outlined,  AppLocalizations.of(context)!.licensedPharmacy,),
          //             ],
          //           );
          //         },
          //       ),
          //       // 🔹 Testimonials Section
          //
          //     ],
          //   ),
          // ),
          Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(
              horizontal: width < 600 ? 20 : 80,
              vertical: width < 600 ? 40 : 60,
            ),
            child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.center, // 👈 vertically center
              crossAxisAlignment:
                  CrossAxisAlignment.center, // 👈 horizontally center
              children: [
                Text(
                  AppLocalizations.of(context)!.certificationsTrust,
                  textAlign: TextAlign.center, // 👈 center align text
                  style: const TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  AppLocalizations.of(
                    context,
                  )!.ourCommitmentToQualityIsBackedByIndustryLeadingCertifications,
                  textAlign: TextAlign.center, // 👈 center align
                  style: const TextStyle(
                    fontSize: 18,
                    color: Color(0xFF64748B),
                  ),
                ),
                const SizedBox(height: 48),
                LayoutBuilder(
                  builder: (context, constraints) {
                    bool isMobile = constraints.maxWidth < 900;
                    return isMobile
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              _certCard(
                                Icons.military_tech_outlined,
                                AppLocalizations.of(context)!.fDAApproved,
                              ),
                              const SizedBox(height: 20),
                              _certCard(
                                Icons.shield_outlined,
                                "${AppLocalizations.of(context)!.iSO} 9001:2015",
                              ),
                              const SizedBox(height: 20),
                              _certCard(
                                Icons.verified_outlined,
                                AppLocalizations.of(context)!.wHOGMPCertified,
                              ),
                              const SizedBox(height: 20),
                              _certCard(
                                Icons.stars_outlined,
                                AppLocalizations.of(context)!.licensedPharmacy,
                              ),
                            ],
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment
                                .center, // 👈 horizontally center row
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              _certCard(
                                Icons.military_tech_outlined,
                                AppLocalizations.of(context)!.fDAApproved,
                              ),
                              const SizedBox(width: 24),
                              _certCard(
                                Icons.shield_outlined,
                                "${AppLocalizations.of(context)!.iSO} 9001:2015",
                              ),
                              const SizedBox(width: 24),
                              _certCard(
                                Icons.verified_outlined,
                                AppLocalizations.of(context)!.wHOGMPCertified,
                              ),
                              const SizedBox(width: 24),
                              _certCard(
                                Icons.stars_outlined,
                                AppLocalizations.of(context)!.licensedPharmacy,
                              ),
                            ],
                          );
                  },
                ),
              ],
            ),
          ),

          Container(
            color: const Color(0xFFF1F5F9),
            padding: EdgeInsets.symmetric(
              horizontal: width < 600 ? 20 : 80,
              vertical: width < 600 ? 40 : 60,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  AppLocalizations.of(context)!.whatOurCustomersSay,
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  AppLocalizations.of(
                    context,
                  )!.realExperiencesFromOurValuedCustomers,
                  style: TextStyle(fontSize: 18, color: Color(0xFF64748B)),
                ),
                const SizedBox(height: 48),
                LayoutBuilder(
                  builder: (context, constraints) {
                    bool isMobile = constraints.maxWidth < 800;
                    return isMobile
                        ? Column(
                            children: [
                              _testimonialCard(
                                name: AppLocalizations.of(
                                  context,
                                )!.sarahJohnson,
                                role: AppLocalizations.of(
                                  context,
                                )!.regularCustomer,
                                quote: AppLocalizations.of(
                                  context,
                                )!.mediCareHasBeenALifesaverFastDeliveryGenuine,
                              ),
                              const SizedBox(height: 20),
                              _testimonialCard(
                                name: AppLocalizations.of(
                                  context,
                                )!.drMichaelChen,
                                role: AppLocalizations.of(
                                  context,
                                )!.healthcareProfessional,
                                quote: AppLocalizations.of(
                                  context,
                                )!.iRecommendMediCareToMyPatients,
                              ),
                              const SizedBox(height: 20),
                              _testimonialCard(
                                name: AppLocalizations.of(
                                  context,
                                )!.emilyRodriguez,
                                role: AppLocalizations.of(
                                  context,
                                )!.satisfiedCustomer,
                                quote: AppLocalizations.of(
                                  context,
                                )!.theTrackingSystemIsAmazing,
                              ),
                            ],
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: _testimonialCard(
                                  name: AppLocalizations.of(
                                    context,
                                  )!.sarahJohnson,
                                  role: AppLocalizations.of(
                                    context,
                                  )!.regularCustomer,
                                  quote: AppLocalizations.of(
                                    context,
                                  )!.mediCareHasBeenALifesaverFastDeliveryGenuine,
                                ),
                              ),
                              const SizedBox(width: 20),
                              Expanded(
                                child: _testimonialCard(
                                  name: AppLocalizations.of(
                                    context,
                                  )!.drMichaelChen,
                                  role: AppLocalizations.of(
                                    context,
                                  )!.healthcareProfessional,
                                  quote: AppLocalizations.of(
                                    context,
                                  )!.iRecommendMediCareToMyPatients,
                                ),
                              ),
                              const SizedBox(width: 20),
                              Expanded(
                                child: _testimonialCard(
                                  name: AppLocalizations.of(
                                    context,
                                  )!.emilyRodriguez,
                                  role: AppLocalizations.of(
                                    context,
                                  )!.satisfiedCustomer,
                                  quote: AppLocalizations.of(
                                    context,
                                  )!.theTrackingSystemIsAmazing,
                                ),
                              ),
                            ],
                          );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // --- UI helpers (same style) ---
  Widget _aboutLeftContent() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: AppLocalizations.of(context)!.about,
              style: TextStyle(
                color: Colors.black,
                fontSize: 40,
                fontWeight: FontWeight.w700,
              ),
            ),
            TextSpan(
              text: 'V Pharmacy',
              style: TextStyle(
                color: Color(0xFF2563EB),
                fontSize: 40,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
      const SizedBox(height: 20),
      Text(
        AppLocalizations.of(
          context,
        )!.weAreALeadingHealthcarePlatformDedicatedToProvidingSafe,
        style: TextStyle(color: Color(0xFF64748B), fontSize: 18, height: 1.6),
      ),
      const SizedBox(height: 20),
      Row(
        children: [
          Expanded(
            child: _smallBox(
              "5+",
              AppLocalizations.of(context)!.yearsExperience,
            ),
          ),
          const SizedBox(width: 24),
          Expanded(
            child: _smallBox(
              "50K+",
              AppLocalizations.of(context)!.happyCustomers,
            ),
          ),
        ],
      ),
    ],
  );

  Widget _aboutRightImage() => ClipRRect(
    borderRadius: BorderRadius.circular(12),
    child: Image.network(
      'https://images.unsplash.com/photo-1631815588090-d4bfec5b1ccb?w=800&h=600&fit=crop',
      height: 400,
      width: double.infinity,
      fit: BoxFit.cover,
    ),
  );

  Widget _smallBox(String value, String text) => Container(
    height: 130,
    padding: const EdgeInsets.all(25),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
    ),
    child: Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            color: Color(0xFF2563EB),
            fontSize: 25,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          text,
          style: const TextStyle(color: Color(0xFF64748B), fontSize: 14),
        ),
      ],
    ),
  );

  Widget _missionCard() => _card(
    Icons.adjust,
    AppLocalizations.of(context)!.ourMission,
    AppLocalizations.of(
      context,
    )!.toProvideAccessibleReliableAndSafeHealthcareServicesByLeveragingTechnologyTo,
  );

  Widget _visionCard() => _card(
    Icons.favorite_border,
    AppLocalizations.of(context)!.ourVision,
    AppLocalizations.of(context)!.toBecomeTheMostTrustedHealthcarePlatform,
  );

  Widget _card(IconData icon, String title, String desc) => Container(
    padding: const EdgeInsets.all(32),
    decoration: BoxDecoration(
      border: Border.all(color: const Color(0xFFE0F2FE)),
      borderRadius: BorderRadius.circular(12),
      color: Colors.white,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: const Color(0xFF2563EB), size: 36),
        const SizedBox(height: 12),
        Text(
          title,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          desc,
          style: const TextStyle(
            fontSize: 16,
            color: Color(0xFF64748B),
            height: 1.5,
          ),
        ),
      ],
    ),
  );

  Widget _valueCard(IconData icon, String title, String desc) => Container(
    padding: const EdgeInsets.all(32),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          blurRadius: 10,
          offset: const Offset(0, 4),
        ),
      ],
    ),
    child: Column(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: const BoxDecoration(
            color: Color(0xFFDEEBFF),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: const Color(0xFF2563EB), size: 40),
        ),
        const SizedBox(height: 20),
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          desc,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 15,
            color: Color(0xFF64748B),
            height: 1.5,
          ),
        ),
      ],
    ),
  );

  Widget _certCard(IconData icon, String title) => Container(
    padding: const EdgeInsets.all(32),
    decoration: BoxDecoration(
      border: Border.all(color: const Color(0xFFE2E8F0)),
      borderRadius: BorderRadius.circular(12),
      color: Colors.white,
    ),
    child: Column(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: const BoxDecoration(
            color: Color(0xFFDEEBFF),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: const Color(0xFF2563EB), size: 40),
        ),
        const SizedBox(height: 20),
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ],
    ),
  );

  Widget _buildStatItem(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
    );
  }

  Widget _testimonialCard({
    required String name,
    required String role,
    required String quote,
  }) {
    return Container(
      padding: const EdgeInsets.all(24),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: List.generate(
              5,
              (index) => const Icon(Icons.star, color: Colors.amber, size: 20),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            '"$quote"',
            style: const TextStyle(
              fontSize: 16,
              fontStyle: FontStyle.italic,
              color: Color(0xFF334155),
              height: 1.5,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            name,
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          Text(
            role,
            style: const TextStyle(fontSize: 14, color: Color(0xFF64748B)),
          ),
        ],
      ),
    );
  }
}
