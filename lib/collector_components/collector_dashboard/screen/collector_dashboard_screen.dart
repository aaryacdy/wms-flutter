import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:waste_management_system/collector_components/services_requested/screen/view_approved_request_screen.dart';
import 'package:waste_management_system/collector_components/services_requested/screen/viewall_requests.dart';
import 'package:waste_management_system/user_components/category/screen/view_category_screen.dart';
import 'package:waste_management_system/user_components/feedback/screen/feedback_screen.dart';
import 'package:waste_management_system/login/provider/login_provider.dart';
import 'package:waste_management_system/login/screen/login_screen.dart';
import 'package:waste_management_system/user_components/request_service/screen/view_requests_screen.dart';
import 'package:waste_management_system/user_components/reset_password/screen/reset_password_screen.dart';
import 'package:waste_management_system/utils/toast_utils.dart';

class CollectorDashboardScreen extends ConsumerStatefulWidget {
  const CollectorDashboardScreen({super.key});
  @override
  ConsumerState<CollectorDashboardScreen> createState() =>
      _CollecterDashboardScreenState();
}

class _CollecterDashboardScreenState
    extends ConsumerState<CollectorDashboardScreen> {
  @override
  Widget build(BuildContext context) {
    ref.listen(logoutProvider, (previous, next) {
      next.maybeMap(
        orElse: () {},
        loading: (value) {
          ToastUtils().showSuccessToast(message: "Loading...");
        },
        success: (value) {
          ToastUtils().showSuccessToast(message: "Logout successfully");
        },
        error: (value) {
          ToastUtils().showErrorToast(message: 'error in logout');
        },
      );
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text('Collector Dashboard'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              showLogoutDialog(context);
            },
          ),
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
        ),
        itemCount: gridItems.length,
        itemBuilder: (context, index) {
          final item = gridItems[index];
          return GestureDetector(
            onTap: () {
              if (item.targetScreen != null) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => item.targetScreen!),
                );
              }
            },
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  item.icon,
                  const SizedBox(height: 10),
                  Text(item.title, textAlign: TextAlign.center),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  final List<GridItem> gridItems = [
    // GridItem(title: 'Overview', icon: const Icon(Icons.home_outlined)),
    GridItem(
        title: 'View Categories',
        icon: const Icon(Icons.category_outlined),
        targetScreen: const ViewCategory()),
    // GridItem(
    //     title: 'Request Services',
    //     icon: const Icon(Icons.request_page_outlined),
    //     targetScreen: const RequestService()),
    GridItem(
        title: 'View Service Requests',
        icon: const Icon(Icons.request_page_outlined),
        targetScreen: const ViewAllRequestsScreen()),
    GridItem(
        title: 'View Approved Requests',
        icon: const Icon(Icons.request_page_outlined),
        targetScreen: const ViewApprovedRequestScreen()),
    GridItem(title: 'Payment', icon: const Icon(Icons.payment_outlined)),
    // GridItem(title: 'Complaint', icon: const Icon(Icons.home_outlined)),
    // GridItem(
    //     title: 'Feedback',
    //     icon: const Icon(Icons.home_outlined),
    //     targetScreen: const FeedbackScreen()),
    GridItem(
        title: 'Contact Us', icon: const Icon(Icons.contact_mail_outlined)),
    GridItem(
        title: 'Reset Password',
        icon: const Icon(Icons.password_outlined),
        targetScreen: const ResetPasswordScreen()),
  ];

  void showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Logout'),
          content: const Text('Are you sure you want to logout?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () {
                ref.read(logoutProvider.notifier).logout();
                Navigator.pop(context);
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()));
              },
              child: const Text('Yes'),
            ),
          ],
        );
      },
    );
  }
}

class GridItem {
  final String title;
  final Icon icon;
  final Widget? targetScreen;

  GridItem({required this.title, required this.icon, this.targetScreen});
}
