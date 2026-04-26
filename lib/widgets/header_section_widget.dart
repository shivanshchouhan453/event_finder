import 'package:event_finder/widgets/search_bar_widget.dart';
import 'package:flutter/material.dart';

class HeaderSectionWidget extends StatelessWidget {
  final ThemeData theme;
  final TextEditingController searchController;
  final ValueChanged<String> onSearchChanged;
  final VoidCallback onClearSearch;
  final bool hasQuery;

  const HeaderSectionWidget({
    super.key,
    required this.theme,
    required this.searchController,
    required this.onSearchChanged,
    required this.onClearSearch,
    required this.hasQuery,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            theme.colorScheme.primary,
            theme.colorScheme.primaryContainer,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(28),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Find your next plan',
            style: theme.textTheme.headlineSmall?.copyWith(
              color: theme.colorScheme.onPrimary,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Search events, refresh the feed, and jump straight into the details.',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onPrimary.withValues(alpha: 0.9),
              height: 1.4,
            ),
          ),
          const SizedBox(height: 20),
          EventSearchBar(
            theme: theme,
            controller: searchController,
            onChanged: onSearchChanged,
            onClear: onClearSearch,
            hasQuery: hasQuery,
          ),
        ],
      ),
    );
  }
}
