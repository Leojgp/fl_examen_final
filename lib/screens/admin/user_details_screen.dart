import 'package:fl_examen_final/screens/admin/diet_selection_sheet.dart';
import 'package:fl_examen_final/screens/admin/diet_selection_sheet.dart';
import 'package:flutter/material.dart';
import 'package:fl_examen_final/theme/theme.dart';
import 'package:fl_examen_final/services/user_service.dart';
import 'package:fl_examen_final/models/user.dart' as umodel;
import 'package:fl_examen_final/models/diet.dart';
import 'package:fl_examen_final/services/diet_service.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fl_examen_final/theme/theme.dart';
import 'package:fl_examen_final/services/user_service.dart';
import 'package:fl_examen_final/models/user.dart' as umodel;
import 'package:fl_examen_final/models/diet.dart';
import 'package:fl_examen_final/services/diet_service.dart';

class UserDetailScreen extends StatefulWidget {
  final String userId;
  const UserDetailScreen({super.key, required this.userId});

  @override
  State<UserDetailScreen> createState() => _UserDetailScreenState();
}

class _UserDetailScreenState extends State<UserDetailScreen> {
  umodel.User? _user;
  bool _isLoading = true;
  String? _error;
  bool _updatingAdmin = false;

  @override
  void initState() {
    super.initState();
    _loadUser();
  }

  Future<void> _loadUser() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final user = await getUserById(widget.userId);
      setState(() {
        _user = user;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
        _isLoading = false;
      });
    }
  }

  Future<void> _toggleAdminStatus() async {
    if (_user == null) return;

    setState(() {
      _updatingAdmin = true;
    });

    try {
      await umodel.userRef.doc(_user!.uid).update(
            admin: !_user!.admin,
          );
      await _loadUser();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Admin status updated successfully')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to update admin status: $e')),
      );
    } finally {
      setState(() {
        _updatingAdmin = false;
        _updatingAdmin = false;
      });
    }
  }

  void _showDietAssignmentDialog() async {
    if (_user == null) return;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => const Center(
        child: CircularProgressIndicator(color: AppTheme.mediumGreen),
      ),
    );

    try {
      final diets = await getAllAvailableDiets();
      if (!mounted) return;

      // Pop the loading dialog
      Navigator.pop(context);

      await showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        builder: (context) => DietSelectionSheet(
          user: _user!,
          diets: diets,
          onDietAssigned: () {
            _loadUser();
          },
        ),
      );
    } catch (e) {
      if (!mounted) return;

      // Pop the loading dialog
      Navigator.pop(context);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to load diets: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_user?.name ?? AppLocalizations.of(context)!.userDetails,
            style: Theme.of(context).textTheme.displaySmall),
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(color: AppTheme.mediumGreen))
          : _error != null
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(AppLocalizations.of(context)!.error + ': $_error',
                          style: const TextStyle(color: Colors.red)),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: _loadUser,
                        child: Text(AppLocalizations.of(context)!.tryAgain),
                      ),
                    ],
                  ),
                )
              : _user == null
                  ? const Center(child: Text('User  not found'))
                  : SingleChildScrollView(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: CircleAvatar(
                              backgroundColor: AppTheme.softGreen,
                              radius: 50,
                              child: Text(
                                _user!.name[0].toUpperCase(),
                                style: const TextStyle(
                                    fontSize: 40, color: AppTheme.white),
                              ),
                            ),
                          ),
                          const SizedBox(height: 24),
                          _buildInfoCard(
                              AppLocalizations.of(context)!.name, _user!.name),
                          _buildInfoCard(
                              AppLocalizations.of(context)!.userId, _user!.uid),
                          _buildInfoCard(
                              AppLocalizations.of(context)!.adminStatus,
                              _user!.admin
                                  ? AppLocalizations.of(context)!.administrator
                                  : AppLocalizations.of(context)!.regularUser),
                          if (_user!.age != null)
                            _buildInfoCard(AppLocalizations.of(context)!.age,
                                '${_user!.age} years'),
                          if (_user!.height != null)
                            _buildInfoCard(AppLocalizations.of(context)!.height,
                                '${_user!.height} cm'),
                          if (_user!.weight != null)
                            _buildInfoCard(AppLocalizations.of(context)!.weight,
                                '${_user!.weight} kg'),
                          if (_user!.dietFocus != null)
                            _buildInfoCard(
                                AppLocalizations.of(context)!.dietFocus,
                                _user!.dietFocus!),

                          const SizedBox(height: 24),

                          // Diet Assignment Button
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton.icon(
                              onPressed: _showDietAssignmentDialog,
                              icon: const Icon(Icons.restaurant_menu,
                                  color: Colors.white),
                              label: Text(
                                AppLocalizations.of(context)!.assignDiet,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppTheme.mediumGreen,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 12),
                              ),
                            ),
                          ),

                          const SizedBox(height: 16),

                          _updatingAdmin
                              ? const Center(
                                  child: CircularProgressIndicator(
                                      color: AppTheme.mediumGreen))
                              : SwitchListTile(
                                  title: Text(AppLocalizations.of(context)!
                                      .adminPrivileges),
                                  subtitle: Text(AppLocalizations.of(context)!
                                      .grantOrRevokeAdminAccess),
                                  value: _user!.admin,
                                  activeColor: AppTheme.mediumGreen,
                                  onChanged: (bool value) =>
                                      _toggleAdminStatus(),
                                ),
                        ],
                      ),
                    ),
    );
  }

  Widget _buildInfoCard(String label, String value) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 14,
                color: AppTheme.iconGrey,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              value,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
