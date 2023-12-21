import 'package:app_4/screens/tabs.dart';
import 'package:app_4/widgets/main_drawer.dart';
import 'package:flutter/material.dart';
import 'package:app_4/providers/filters_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(
        filterProvider); // use read instead of watch because initState is executed only one time.
    final activeFiltersNotifier = ref.watch(filterProvider.notifier);
    // return WillPopScope(
    // onWillPop: () async {
    //   ref.read(filterProvider.notifier).setFilters({
    //     Filter.glutenFree: _gluterFreeFilterSet,
    //     Filter.lactoseFree: _lactoseFreeFilterSet,
    //     Filter.vegetarian: _vegetarianFilterSet,
    //     Filter.vegan: _veganFilterSet,
    //   });

    //   return true;
    // },
    // child: Scaffold(
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      // drawer: MainDrawer(
      //   onSelectScreen: (identifier) {
      //     Navigator.of(context).pop();
      //     if (identifier == 'meals') {
      //       Navigator.of(context).pushReplacement(
      //         MaterialPageRoute(
      //           builder: (ctx) => const TabScreen(),
      //         ),
      //       );
      //     }
      //   },
      // ),
      body: Column(
        children: [
          SwitchListTile(
            value: activeFilters[Filter.glutenFree]!,
            onChanged: (value) {
              // setState(() {
                activeFiltersNotifier.setFilter(Filter.glutenFree, value);
              // });
            },
            title: Text(
              "Gluten-free",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            subtitle: Text(
              'Only include gluten-free meals.',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: activeFilters[Filter.lactoseFree]!,
            onChanged: (value) {
              // setState(() {
                // _lactoseFreeFilterSet = value;
                activeFiltersNotifier!.setFilter(Filter.lactoseFree, value);
              // });
            },
            title: Text(
              "Lactose",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            subtitle: Text(
              'Only include lactose meals.',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            // value: _vegetarianFilterSet,
            value: activeFilters[Filter.vegetarian]!,
            onChanged: (value) {
              // setState(() {
                // _vegetarianFilterSet = value;
                activeFiltersNotifier.setFilter(Filter.vegetarian, value);
              // });
            },
            title: Text(
              "Vegetarian-free",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            subtitle: Text(
              'Only include vegetarian-free meals.',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            // value: _veganFilterSet,
            value: activeFilters[Filter.vegan]!,

            onChanged: (value) {
              // setState(() {
                // _veganFilterSet = value;
                activeFiltersNotifier.setFilter(Filter.vegan, value);
              // });
            },
            title: Text(
              "vegan",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            subtitle: Text(
              'Only include vegan meals.',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
        ],
      ),
      // ),
    );
  }
}

// class _FiltersScreenState extends ConsumerState<FiltersScreen> {
//   Map<Filter, bool> activeFilters = {};
//   FiltersProvider ?activeFiltersNotifier = null;

//   @override
//   void initState() {
//     super.initState();
//     activeFilters = ref.read(
//         filterProvider); // use read instead of watch because initState is executed only one time.
//     activeFiltersNotifier = ref.watch(filterProvider.notifier);

//     // _gluterFreeFilterSet = activeFilters[Filter.glutenFree]!;
//     // _lactoseFreeFilterSet = activeFilters[Filter.lactoseFree]!;
//     // _vegetarianFilterSet = activeFilters[Filter.vegetarian]!;
//     // _veganFilterSet = activeFilters[Filter.vegan]!;
//   }

//   @override
//   Widget build(BuildContext context) {
//     // return WillPopScope(
//       // onWillPop: () async {
//       //   ref.read(filterProvider.notifier).setFilters({
//       //     Filter.glutenFree: _gluterFreeFilterSet,
//       //     Filter.lactoseFree: _lactoseFreeFilterSet,
//       //     Filter.vegetarian: _vegetarianFilterSet,
//       //     Filter.vegan: _veganFilterSet,
//       //   });

//       //   return true;
//       // },
//       // child: Scaffold(
//       return Scaffold(
//         appBar: AppBar(
//           title: const Text('Your Filters'),
//         ),
//         // drawer: MainDrawer(
//         //   onSelectScreen: (identifier) {
//         //     Navigator.of(context).pop();
//         //     if (identifier == 'meals') {
//         //       Navigator.of(context).pushReplacement(
//         //         MaterialPageRoute(
//         //           builder: (ctx) => const TabScreen(),
//         //         ),
//         //       );
//         //     }
//         //   },
//         // ),
//         body: Column(
//           children: [
//             SwitchListTile(
//               value: activeFilters[Filter.glutenFree]!,
//               onChanged: (value) {
//                 setState(() {
//                   activeFiltersNotifier!.setFilter(Filter.glutenFree, value);
//                 });
//               },
//               title: Text(
//                 "Gluten-free",
//                 style: Theme.of(context).textTheme.titleLarge!.copyWith(
//                       color: Theme.of(context).colorScheme.onBackground,
//                     ),
//               ),
//               subtitle: Text(
//                 'Only include gluten-free meals.',
//                 style: Theme.of(context).textTheme.titleMedium!.copyWith(
//                       color: Theme.of(context).colorScheme.onBackground,
//                     ),
//               ),
//               activeColor: Theme.of(context).colorScheme.tertiary,
//               contentPadding: const EdgeInsets.only(left: 34, right: 22),
//             ),
//             SwitchListTile(
//               value: activeFilters[Filter.lactoseFree]!,
//               onChanged: (value) {
//                 setState(() {
//                   // _lactoseFreeFilterSet = value;
//                   activeFiltersNotifier!.setFilter(Filter.lactoseFree, value);
//                 });
//               },
//               title: Text(
//                 "Lactose",
//                 style: Theme.of(context).textTheme.titleLarge!.copyWith(
//                       color: Theme.of(context).colorScheme.onBackground,
//                     ),
//               ),
//               subtitle: Text(
//                 'Only include lactose meals.',
//                 style: Theme.of(context).textTheme.titleMedium!.copyWith(
//                       color: Theme.of(context).colorScheme.onBackground,
//                     ),
//               ),
//               activeColor: Theme.of(context).colorScheme.tertiary,
//               contentPadding: const EdgeInsets.only(left: 34, right: 22),
//             ),
//             SwitchListTile(
//               // value: _vegetarianFilterSet,
//               value: activeFilters[Filter.vegetarian]!,
//               onChanged: (value) {
//                 setState(() {
//                   // _vegetarianFilterSet = value;
//                   activeFiltersNotifier!.setFilter(Filter.vegetarian, value);
//                 });
//               },
//               title: Text(
//                 "Vegetarian-free",
//                 style: Theme.of(context).textTheme.titleLarge!.copyWith(
//                       color: Theme.of(context).colorScheme.onBackground,
//                     ),
//               ),
//               subtitle: Text(
//                 'Only include vegetarian-free meals.',
//                 style: Theme.of(context).textTheme.titleMedium!.copyWith(
//                       color: Theme.of(context).colorScheme.onBackground,
//                     ),
//               ),
//               activeColor: Theme.of(context).colorScheme.tertiary,
//               contentPadding: const EdgeInsets.only(left: 34, right: 22),
//             ),
//             SwitchListTile(
//               // value: _veganFilterSet,
//               value: activeFilters[Filter.vegan]!,

//               onChanged: (value) {
//                 setState(() {
//                   // _veganFilterSet = value;
//                   activeFiltersNotifier!.setFilter(Filter.vegan, value);
//                 });
//               },
//               title: Text(
//                 "vegan",
//                 style: Theme.of(context).textTheme.titleLarge!.copyWith(
//                       color: Theme.of(context).colorScheme.onBackground,
//                     ),
//               ),
//               subtitle: Text(
//                 'Only include vegan meals.',
//                 style: Theme.of(context).textTheme.titleMedium!.copyWith(
//                       color: Theme.of(context).colorScheme.onBackground,
//                     ),
//               ),
//               activeColor: Theme.of(context).colorScheme.tertiary,
//               contentPadding: const EdgeInsets.only(left: 34, right: 22),
//             ),
//           ],
//         ),
//       // ),
//     );
//   }
// }
