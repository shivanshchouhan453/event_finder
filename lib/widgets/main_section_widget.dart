import 'package:event_finder/models/event_model.dart';
import 'package:event_finder/widgets/event_card_widget.dart';
import 'package:flutter/material.dart';

class MainSectionWidget extends StatelessWidget {
  final ThemeData theme;
  final List<Event> events;
  final String searchQuery;

  const MainSectionWidget({
    super.key,
    required this.theme,
    required this.events,
    required this.searchQuery,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
      sliver: events.isEmpty
          ? SliverToBoxAdapter(child: _EmptyState(theme: theme, searchQuery: searchQuery))
          : SliverList.separated(
              itemCount: events.length,
              itemBuilder: (context, index) {
                return EventCard(event: events[index]);
              },
              separatorBuilder: (_, __) => const SizedBox(height: 16),
            ),
    );
  }
}

class EventSectionHeader extends StatelessWidget {
  final ThemeData theme;
  final String searchQuery;
  final int count;
  final VoidCallback onRefresh;

  const EventSectionHeader({
    super.key,
    required this.theme,
    required this.searchQuery,
    required this.count,
    required this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                searchQuery.isEmpty ? 'Upcoming Events' : 'Search Results',
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                count == 1 ? '1 event available' : '$count events available',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
        FilledButton.tonalIcon(
          onPressed: onRefresh,
          icon: const Icon(Icons.refresh_rounded),
          label: const Text('Refresh'),
        ),
      ],
    );
  }
}

class _EmptyState extends StatelessWidget {
  final ThemeData theme;
  final String searchQuery;

  const _EmptyState({
    required this.theme,
    required this.searchQuery,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.event_busy_rounded,
              size: 54,
              color: theme.colorScheme.primary,
            ),
            const SizedBox(height: 16),
            Text(
              searchQuery.isEmpty
                  ? 'No events available right now'
                  : 'No events match your search',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              searchQuery.isEmpty
                  ? 'Pull down or tap refresh to fetch the latest events.'
                  : 'Try a different title, category, or location.',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
