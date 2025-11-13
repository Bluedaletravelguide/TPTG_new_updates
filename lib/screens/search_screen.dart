// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:material_floating_search_bar/material_floating_search_bar.dart';
// import '../Data/content_list_data.dart';
// import '../widgets/content_list_widget.dart';

// class SearchScreen extends StatefulWidget {
//   @override
//   _SearchScreenState createState() => _SearchScreenState();
// }

// class _SearchScreenState extends State<SearchScreen> {
//   static const historyLength = 5;

//   List<String> _searchHistory = [''].reversed.toList();
//   late List<String> filteredSearchHistory;

//   late String selectedTerm = '';

//   List<String> _searchSuggestion = [
//     'Taiping',
//     'Taiping Zoo & Night Safari',
//     'Perak Museum',
//     'Taiping Prison',
//     'Matang Mangrove Forest Reserve',
//     'Burmese Pool',
//     '5D Art Paradise Taiping',
//     'Peace Hotel and Coffee Shop',
//     'Larut MAtang Hawker Centre',
//     'Restoran Kakak',
//     'Taiping PSL Goreng Pisang',
//     'Bismillah Restoran',
//     'Yut Sun',
//     'Kedai Ti Chien',
//     'Pusat Penjaja Taiping',
//     'Lin Ling Restaurant',
//     'Oosten Bar N Bistro',
//     'Sky Bar',
//     'Mansion 5',
//     'Warison Square',
//     'One 11 Bar & Lounge',
//     'Bukit Larut',
//     'Maxwell Hill',
//     'Kuala Sepetang',
//     'Fireflies',
//     'ATV Adventure Park Larut',
//     'Yinn\'s Patisserie',
//     'Double Tap Cafe',
//     'Triple Shot Bed & Coffee',
//     'Mansion 5',
//     'Monday Brew Cafe',
//     'Nagaria Steak House',
//     'La Promise Bakery and Cafe',
//     'Cheeky Summer',
//     'STG Taiping',
//     'Taiping Lake Gardens',
//     'Spritzer EcoPark',
//     'Taman Botanik Perak',
//     'Taiping Sentral Mall',
//     'Taiping Mall',
//     'AEON Taiping',
//     'Giant Hypermarket Taiping',
//     'Novotel Taiping',
//     'Legend Inn Hotel',
//     'The Louis Hotel',
//     'Hotel Grand Barton',
//     'Hotel Seri Malaysia Taiping',
//     'Flemington Hotel',
//     'Hotel Taiping Perdana',
//     'Sense Hotel',
//     'SSL Traders Hotel',
//     'Hotel',
//     'Clinic',
//     'Klinik',
//     'Pharmacy',
//     'Hospital',
//     'Pak Keng Kedai Ubat'
//   ].reversed.toList();
//   late List<String> filteredSearchSuggestion;

//   List<String> filteredSearchHistoryTerm({required String filter}) {
//     if (filter.isNotEmpty) {
//       return _searchHistory.reversed
//           .where((term) => term.toLowerCase().startsWith(filter.toLowerCase()))
//           .toList();
//     } else {
//       return _searchHistory.reversed.toList();
//     }
//   }

//   List<String> filteredSearchSuggestions({required String filter}) {
//     if (filter.isNotEmpty) {
//       return _searchSuggestion.reversed
//           .where((term) => term.toLowerCase().startsWith(filter.toLowerCase()))
//           .toList();
//     } else {
//       return [''].toList();
//     }
//   }

//   void addSearchTerm(String term) {
//     if (_searchHistory.contains(term)) {
//       putSearchTermFirst(term);
//       return;
//     }
//     _searchHistory.add(term);
//     _searchHistory.remove('');

//     if (_searchHistory.length > historyLength) {
//       _searchHistory.removeRange(0, _searchHistory.length - historyLength);
//     }

//     filteredSearchHistory = filteredSearchHistoryTerm(filter: '');
//   }

//   void deleteSearchTerm(String term) {
//     _searchHistory.removeWhere((t) => t == term);
//     if (_searchHistory.isEmpty) {
//       _searchHistory.add('');
//     }
//     filteredSearchHistory = filteredSearchHistoryTerm(filter: '');
//   }

//   void putSearchTermFirst(String term) {
//     deleteSearchTerm(term);
//     addSearchTerm(term);
//   }

//   late FloatingSearchBarController controller;

//   @override
//   void initState() {
//     super.initState();
//     controller = FloatingSearchBarController();
//     filteredSearchHistory = filteredSearchHistoryTerm(filter: '');
//     filteredSearchSuggestion = filteredSearchSuggestions(filter: '');
//   }

//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Builder(
//           builder: (context) => FloatingSearchBar(
//             controller: controller,
//             body: FloatingSearchBarScrollNotifier(
//               child: SearchResultsListView(
//                   key: Key('search_results'), searchTerm: selectedTerm),
//             ),
//             transition: CircularFloatingSearchBarTransition(),
//             physics: BouncingScrollPhysics(),
//             title: Text(
//               selectedTerm.isEmpty ? 'TAIPING THE GUIDE' : selectedTerm,
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//             hint: 'Search Taiping The Guide',
//             actions: [
//               FloatingSearchBarAction.searchToClear(),
//             ],
//             onQueryChanged: (query) {
//               setState(() {
//                 filteredSearchHistory =
//                     filteredSearchHistoryTerm(filter: query.toLowerCase());
//                 filteredSearchSuggestion =
//                     filteredSearchSuggestions(filter: query.toLowerCase());
//               });
//             },
//             onSubmitted: (query) {
//               setState(() {
//                 addSearchTerm(query);
//                 selectedTerm = query;
//               });
//               controller.close();
//             },
//             builder: (context, transition) {
//               return ClipRRect(
//                 borderRadius: BorderRadius.circular(8),
//                 child: Material(
//                   color: Colors.white,
//                   elevation: 4,
//                   child: Builder(
//                     builder: (context) {
//                       if (controller.query.isEmpty &&
//                           filteredSearchHistory.contains('') &&
//                           filteredSearchSuggestion.contains('')) {
//                         return Container(
//                           height: 56,
//                           width: double.infinity,
//                           alignment: Alignment.center,
//                           child: Text(
//                             'Start searching',
//                             maxLines: 1,
//                             overflow: TextOverflow.ellipsis,
//                             style: Theme.of(context).textTheme.bodySmall,
//                           ),
//                         );
//                       } else if (filteredSearchHistory.isNotEmpty ||
//                           filteredSearchHistory.contains(filteredSearchSuggestion
//                               .contains(controller.query))) {
//                         return Column(
//                             mainAxisSize: MainAxisSize.min,
//                             children: filteredSearchHistory
//                                 .map((term) => ListTile(
//                               title: Text(
//                                 term,
//                                 maxLines: 1,
//                                 overflow: TextOverflow.ellipsis,
//                               ),
//                               leading: const Icon(Icons.history),
//                               trailing: IconButton(
//                                 icon: const Icon(Icons.clear),
//                                 onPressed: () {
//                                   setState(() {
//                                     deleteSearchTerm(term);
//                                   });
//                                 },
//                               ),
//                               onTap: () {
//                                 setState(() {
//                                   putSearchTermFirst(term);
//                                   selectedTerm = term;
//                                 });
//                                 controller.close();
//                               },
//                             ))
//                                 .toList());
//                       } else if (filteredSearchSuggestion.isNotEmpty) {
//                         return Column(
//                           mainAxisSize: MainAxisSize.min,
//                           children: filteredSearchSuggestion
//                               .map((term) => ListTile(
//                             title: Text(
//                               term,
//                               maxLines: 1,
//                               overflow: TextOverflow.ellipsis,
//                             ),
//                             leading: const Icon(Icons.info),
//                             onTap: () {
//                               setState(() {
//                                 addSearchTerm(term);
//                                 selectedTerm = term;
//                               });
//                               controller.close();
//                             },
//                           ))
//                               .toList(),
//                         );
//                       } else {
//                         return ListTile(
//                           title: Text(controller.query),
//                           leading: const Icon(Icons.search),
//                           onTap: () {
//                             setState(() {
//                               addSearchTerm(controller.query);
//                               selectedTerm = controller.query;
//                             });
//                             controller.close();
//                           },
//                         );
//                       }
//                     },
//                   ),
//                 ),
//               );
//             },
//           ),
//         ));
//   }
// }

// class SearchResultsListView extends StatelessWidget {
//   final String searchTerm;

//   SearchResultsListView({
//     required Key key,
//     required this.searchTerm,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     // final fsb = FloatingSearchBar.of(context);
//     if (searchTerm.isEmpty) {
//       return Padding(
//           padding: EdgeInsets.only(top: 50),
//           child: Center(
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Icon(
//                   Icons.search,
//                   size: 128,
//                 ),
//                 Text(
//                   'Type in the field above to search.',
//                   style: Theme.of(context).textTheme.displayLarge,
//                 )
//               ],
//             ),
//           ));
//     }
//     final queryList = ContentListData.where((queryList) {
//       return queryList.contentListTitle
//           .toLowerCase()
//           .contains(searchTerm.toLowerCase());
//     }).toList();

//     if (queryList.isEmpty) {
//       return Padding(
//           padding: EdgeInsets.only(top: 50),
//           child: Center(
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Icon(
//                   Icons.error,
//                   size: 128,
//                 ),
//                 Text(
//                   'No results!',
//                   style: Theme.of(context).textTheme.displayLarge,
//                 )
//               ],
//             ),
//           ));
//     }

//     return Padding(
//       padding: EdgeInsets.only(top: 50),
//       child: SafeArea(
//         child: Material(
//           child: GridView.builder(
//             padding: EdgeInsets.all(8),
//             itemBuilder: (ctx, index) {
//               return ContentList(
//                 id: queryList[index].id,
//                 title: queryList[index].contentListTitle,
//                 image: queryList[index].image,
//                 description: queryList[index].description,
//                 isBookmarked: queryList[index].isBookmarked,
//                 onBookmarkChanged: (isBookmarked) {
//                   // Handle bookmark change
//                 },
//               );
//             },
//             itemCount: queryList.length,
//             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 2,
//               childAspectRatio: 0.97,
//               crossAxisSpacing: 4,
//               mainAxisSpacing: 3,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _controller = TextEditingController();
  String query = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: _controller,
              onChanged: (value) {
                setState(() => query = value);
              },
              decoration: InputDecoration(
                hintText: "Type to search...",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                query.isEmpty ? "No search input" : "Results for: $query",
                style: const TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
