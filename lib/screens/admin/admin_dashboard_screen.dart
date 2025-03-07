import 'package:fl_examen_final/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:fl_examen_final/screens/screens.dart';
import 'package:fl_examen_final/theme/theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fl_examen_final/services/user_service.dart';
import 'package:fl_examen_final/models/user.dart' as umodel;
import 'package:provider/provider.dart';

class AdminDashboardScreen extends StatefulWidget {
  const AdminDashboardScreen({super.key});

  @override
  State<AdminDashboardScreen> createState() => _AdminDashboardScreenState();
}

class _AdminDashboardScreenState extends State<AdminDashboardScreen> {
  List<umodel.User> _users = [];
  List<umodel.User> _filteredUsers = [];
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadUsers();
  }

  Future<void> _loadUsers() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final users = await getUsers();
      setState(() {
        _users = users;
        _filteredUsers = users;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
        _isLoading = false;
      });
    }
  }

  void _filterUsers(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredUsers = _users;
      } else {
        _filteredUsers = _users
            .where((user) =>
                user.name.toLowerCase().contains(query.toLowerCase()) ||
                user.uid.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkTheme = !themeProvider.isLightTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.adminDashboard,
            style: Theme.of(context).textTheme.displaySmall),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              onChanged: _filterUsers,
              decoration: InputDecoration(
                hintText: AppLocalizations.of(context)!.searchUsers,
                prefixIcon: const Icon(Icons.search, color: AppTheme.iconGrey),
                filled: true,
                fillColor: AppTheme.inputBackgroundDark,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 16),
            Expanded(
              child: _isLoading
                  ? const Center(
                      child: CircularProgressIndicator(
                          color: AppTheme.mediumGreen))
                  : _error != null
                      ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Error: $_error',
                                  style: const TextStyle(color: Colors.red)),
                              const SizedBox(height: 16),
                              ElevatedButton(
                                onPressed: _loadUsers,
                                child: Text(AppLocalizations.of(context)!.tryAgain),
                              ),
                            ],
                          ),
                        )
                      : _filteredUsers.isEmpty
                          ?  Center(
                              child: Text(
                                  AppLocalizations.of(context)!.noUserFound),
                            )
                          : RefreshIndicator(
                              onRefresh: _loadUsers,
                              color: AppTheme.mediumGreen,
                              child: ListView.builder(
                                itemCount: _filteredUsers.length,
                                itemBuilder: (context, index) {
                                  final user = _filteredUsers[index];
                                  return Column(
                                    children: [
                                      Card(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        elevation: 3,
                                        shadowColor: Colors.black12,
                                        child: ListTile(
                                          leading: CircleAvatar(
                                            backgroundColor: AppTheme.softGreen,
                                            child: Text(
                                              user.name[0].toUpperCase(),
                                              style:  TextStyle(
                                                  color: AppTheme.white),
                                            ),
                                          ),
                                          title: Text(user.name,
                                              style: 
                                              Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge,
                                                  ),
                                                
                                          subtitle: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(user.uid,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodySmall),
                                              Text(
                                                user.admin
                                                    ? "Admin"
                                                    : "Regular User",
                                                style: TextStyle(
                                                    color: user.admin
                                                        ? Colors.green
                                                        : Colors.grey,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                          trailing: const Icon(
                                              Icons.arrow_forward_ios,
                                              size: 16,
                                              color: AppTheme.iconGrey),
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              _slideTransition(UserDetailScreen(
                                                  userId: user.uid)),
                                            );
                                          },
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                    ],
                                  );
                                },
                              ),
                            ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _loadUsers,
        backgroundColor: AppTheme.mediumGreen,
        child: const Icon(Icons.refresh),
      ),
    );
  }

  PageRouteBuilder _slideTransition(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.easeInOut;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(position: offsetAnimation, child: child);
      },
    );
  }
}
