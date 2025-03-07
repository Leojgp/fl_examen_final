import 'package:fl_examen_final/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SupportScreen extends StatefulWidget {
  const SupportScreen({super.key});

  @override
  State<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final email = _emailController.text.trim();
      final message = _messageController.text.trim();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(AppLocalizations.of(context)!.supportRequestSent)),
      );

      _emailController.clear();
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppTheme.iconGrey),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          AppLocalizations.of(context)!.support,
          style: theme.textTheme.displaySmall,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context)!.needHelpContactUs,
              style: theme.textTheme.displaySmall,
            ),
            const SizedBox(height: 12),
            Text(
              AppLocalizations.of(context)!.fillOutTheForm,
              style: theme.textTheme.bodyMedium,
            ),
            const SizedBox(height: 20),
            _buildSupportForm(theme),
          ],
        ),
      ),
    );
  }

  Widget _buildSupportForm(ThemeData theme) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: AppLocalizations.of(context)!.yourEmail,
            ),
            validator: (value) {
              if (value == null || value.isEmpty)
                return AppLocalizations.of(context)!.pleaseEnterYourEmail;
              if (!RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
                  .hasMatch(value)) {
                return AppLocalizations.of(context)!.enterAValidEmailAddress;
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _messageController,
            maxLines: 4,
            decoration: InputDecoration(
              labelText: AppLocalizations.of(context)!.yourMessage,
            ),
            validator: (value) {
              if (value == null || value.isEmpty)
                return AppLocalizations.of(context)!.pleaseEnterYourMessage;
              return null;
            },
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _submitForm,
            child: Text(
              AppLocalizations.of(context)!.submitRequest,
              style: const TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
