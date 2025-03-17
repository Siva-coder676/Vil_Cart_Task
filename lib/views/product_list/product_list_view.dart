import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:vil_cart_task/core/models/product_list_data.dart';
import 'package:vil_cart_task/widgets/load_more.dart';
import 'package:vil_cart_task/widgets/product_detail_page.dart';
import 'product_list_view_model.dart';

class ProductListView extends StatefulWidget {
  @override
  State<ProductListView> createState() => _ProductListViewState();
}

class _ProductListViewState extends State<ProductListView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProductListViewModel>.reactive(
      builder:
          (BuildContext context, ProductListViewModel viewModel, Widget? _) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xFF005D71),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            ),
            title: const Text(
              'Product Management',
              style: TextStyle(color: Colors.white),
            ),
            centerTitle: true,
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    DropdownButtonFormField<Result>(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Select Customer',
                      ),
                      items: viewModel.dropDownListData.map((result) {
                        return DropdownMenuItem<Result>(
                          value: result,
                          child: Text(result.businessName!),
                        );
                      }).toList(),
                      onChanged: (Result? value) {
                        //Logger().d(value?.id);
                        viewModel.getCustomerId(value!.id);
                      },
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: '-/-/-',
                              prefixIcon: Icon(Icons.calendar_today),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          flex: 2,
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Search products...',
                              prefixIcon: Icon(Icons.search),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              viewModel.getProductDetaildata.isEmpty
                  ? Text("No Products Found")
                  : Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.57,
                          child: ListView.builder(
                            itemCount: viewModel.getProductDetaildata.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              var products =
                                  viewModel.getProductDetaildata[index];

                              return ListTile(
                                title: Text(
                                  products.SkuUpcEan! ?? "-",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                subtitle: Text(products.productName!),
                                trailing: Icon(Icons.arrow_forward_ios,
                                    size: 16, color: Colors.grey),
                                onTap: () {
                                  viewModel.navigationService
                                      .navigateWithTransition(
                                          ProductDetailPage(
                                            items: products,
                                          ),
                                          transition: "fade");
                                },
                              );
                            },
                          ),
                        ),

                        viewModel.shouldShowLoadMore
                            ? LoadMore(
                                text: "Load more Items",
                                textOnLoading: "Loading more Items ...",
                                loading: viewModel.loadingMore,
                                onClick: () {
                                  viewModel.loadMore();
                                },
                              )
                            : Text("No more data available")

                        // SizedBox(
                        //   height: 15,
                        // )
                      ],
                    ),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.inventory), label: 'Products'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: 'Settings'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle), label: 'Account'),
            ],
            currentIndex: 0,
            selectedItemColor: Colors.teal.shade700,
            unselectedItemColor: Colors.grey,
          ),
        );
      },
      viewModelBuilder: () => ProductListViewModel(),
    );
  }
}
