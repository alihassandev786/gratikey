import 'package:get/get.dart';
import 'package:gratikey/core/widgets/appnavigator.dart';
import 'package:gratikey/presentation/bottomnavigation/profilesection/subcryption.dart';

/// Subscription / Membership screen ka controller
class SubscriptionController extends GetxController {
  final sections = [
    {
      "number": "1",
      "title": "Plans & Pricing",
      "points": [
        "Free download with a meaningful basic experience.",
        "GratiKey Premium Monthly: suggested \$4.99/month.",
        "GratiKey Premium Annual: suggested \$39.99/year.",
        "Both paid plans unlock the same Premium features.",
        "Localize pricing through Apple and Google.",
        "Confirm pricing before creating permanent product IDs.",
      ],
    },
    {
      "number": "2",
      "title": "Free Access",
      "points": [
        "Basic daily gratitude prompt",
        "“Just Stop and Breathe” exercise",
        "Preview of Key 1",
        "Limited journal history",
        "Basic reminders",
        "Profile and subscription settings",
        "A visible “Continue Free” choice",
      ],
    },
    {
      "number": "3",
      "title": "GratiKey Premium",
      "points": [
        "Complete access to all 12 Keys",
        "All guided prompts and Calls to Action",
        "Unlimited private journal history",
        "Search and export",
        "Personalized reminders",
        "Progress, badges, and challenges",
        "Audio meditations and breathing exercises",
        "Weekly encouragement and future Premium content",
      ],
    },
    {
      "number": "4",
      "title": "Upgrade Screen",
      "points": [
        "Show when a free user selects a Premium feature.",
        "Also make it available through Settings.",
        "Compare Free and Premium clearly.",
        "Display monthly and annual prices and billing periods.",
        "Disclose automatic renewal and cancellation.",
        "Include Privacy Policy, Terms, Restore Purchases.",
        "Manage Subscription, and Continue Free.",
      ],
    },
    {
      "number": "5",
      "title": "Purchase & Account",
      "points": [
        "Use Apple in-app subscriptions and Google Play Billing.",
        "Connect Premium status to the user’s GratiKey account.",
        "Verify purchases securely before unlocking access.",
        "Keep access after reinstalling or changing devices.",
        "Provide Restore Purchases.",
        "Use one Premium entitlement for monthly or annual.",
        "Prevent duplicate subscriptions whenever possible.",
      ],
    },
    {
      "number": "6",
      "title": "Cancellation & Expiration",
      "points": [
        "Cancellation stops renewal—not current paid access.",
        "Recognize active, canceled-active, grace period, hold, expired, refunded, and revoked states.",
        "On expiration, return the account to Free access.",
        "Never delete journal entries or personal information.",
        "Keep previous entries viewable and exportable.",
        "Invite reactivation respectfully—never shame the user.",
      ],
    },
    {
      "number": "7",
      "title": "Admin, Privacy & Analytics",
      "points": [
        "Admin can update paywall copy and feature descriptions.",
        "Admin can enable features and add Premium content.",
        "Content changes should not require an app-store release.",
        "Encrypt journal entries and keep them private.",
        "Never analyze journal wording for marketing.",
        "Track only non-sensitive events: paywall views, plan selection, purchase, restore, renewal, cancel.",
      ],
    },
    {
      "number": "8",
      "title": "Test Before Launch",
      "points": [
        "Test monthly and annual purchases on both platforms.",
        "Test cancellation, restoration, refund, and revocation.",
        "Test reinstalling and signing in on a new device.",
        "Test failed payment, grace period, and account hold.",
        "Test expiration and monthly/annual plan changes.",
        "Confirm no journal entries are lost.",
        "Do not launch until every test passes.",
      ],
    },
  ];

  void goToSubscription() => AppNavigator.push(const SubscriptionScreen());

  void startFreeTrial() {
    // TODO: Start trial / purchase flow
  }

  void continueFree() {
    Get.back();
  }
}
