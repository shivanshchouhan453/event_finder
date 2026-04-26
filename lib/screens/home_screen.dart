import 'package:event_finder/models/event_model.dart';
import 'package:event_finder/services/api_services.dart';
import 'package:event_finder/widgets/header_section_widget.dart';
import 'package:event_finder/widgets/main_section_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();

  Future<List<Event>>? _eventsFuture;
  List<Event> _allEvents = const [];
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _refreshEvents();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<List<Event>> _loadEvents() {
    return ApiService.fetchEvents();
  }

  Future<void> _refreshEvents() async {
    final future = _loadEvents();

    setState(() {
      _eventsFuture = future;
    });

    try {
      final events = await future;
      if (!mounted) {
        return;
      }

      setState(() {
        _allEvents = events;
      });
    } catch (_) {
      rethrow;
    }
  }

  void _onSearchChanged(String value) {
    setState(() {
      _searchQuery = value.trim().toLowerCase();
    });
  }

  List<Event> _filteredEvents(List<Event> events) {
    if (_searchQuery.isEmpty) {
      return events;
    }

    return events.where((event) {
      final haystack = [
        event.title,
        event.category,
        event.location,
        event.description,
      ].join(' ').toLowerCase();

      return haystack.contains(_searchQuery);
    }).toList();
  }

  Widget _buildErrorState(Object? error, ThemeData theme) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.wifi_off_rounded,
              size: 56,
              color: theme.colorScheme.error,
            ),
            const SizedBox(height: 16),
            Text(
              'Could not load events',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w800,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              '$error',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 18),
            FilledButton.icon(
              onPressed: _refreshEvents,
              icon: const Icon(Icons.refresh_rounded),
              label: const Text('Try Again'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEventContent(ThemeData theme, List<Event> events) {
    final filteredEvents = _filteredEvents(events);

    return RefreshIndicator(
      onRefresh: _refreshEvents,
      color: theme.colorScheme.primary,
      child: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 12),
              child: HeaderSectionWidget(
                theme: theme,
                searchController: _searchController,
                onSearchChanged: _onSearchChanged,
                onClearSearch: () {
                  _searchController.clear();
                  _onSearchChanged('');
                },
                hasQuery: _searchQuery.isNotEmpty,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 4, 20, 8),
              child: EventSectionHeader(
                theme: theme,
                searchQuery: _searchQuery,
                count: filteredEvents.length,
                onRefresh: _refreshEvents,
              ),
            ),
          ),
          MainSectionWidget(
            theme: theme,
            events: filteredEvents,
            searchQuery: _searchQuery,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: const Color(0xFFF4F7FB),
      appBar: AppBar(
        title: Center(child: const Text('Event Finder')),
        centerTitle: false,
      ),
      body: FutureBuilder<List<Event>>(
        future: _eventsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting &&
              _allEvents.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError && _allEvents.isEmpty) {
            return _buildErrorState(snapshot.error, theme);
          }

          final events = snapshot.data ?? _allEvents;
          return _buildEventContent(theme, events);
        },
      ),
    );
  }
}
