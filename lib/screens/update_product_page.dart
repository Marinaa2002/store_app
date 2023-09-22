import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/update_product.dart';
import 'package:store_app/widgets/custom_button.dart';
import 'package:store_app/widgets/custom_textField.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class UpdateProductPage extends StatefulWidget {
  UpdateProductPage({Key? key}) : super(key: key);

  static String id = 'Update Product';

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? prodName, desc, image;
  String? price;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    ProductModel productModel =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Update Product',
            style: TextStyle(color: Colors.black),
          ),
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 25,
                ),
                CustomTextField(
                  onChanged: (data) {
                    prodName = data;
                  },
                  hintText: 'Product Name',
                ),
                SizedBox(
                  height: 15,
                ),
                CustomTextField(
                  onChanged: (data) {
                    desc = data;
                  },
                  hintText: 'Description',
                ),
                SizedBox(
                  height: 15,
                ),
                CustomTextField(
                  i: TextInputType.number,
                  onChanged: (data) {
                    price = data;
                  },
                  hintText: 'Price',
                ),
                SizedBox(
                  height: 15,
                ),
                CustomTextField(
                  onChanged: (data) {
                    image = data;
                  },
                  hintText: 'Image',
                ),
                SizedBox(height: 30),
                CustomButon(
                  text: 'Update',
                  onTap: () async {
                    isLoading = true;
                    setState((){
                    });

                    try {
                      await UpdateProductService(productModel);
                      print('Success');
                    } catch (e) {
                      print(e.toString());
                    }

                    isLoading = false;
                    setState((){
                    });

                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> UpdateProductService(ProductModel product) async{
    await UpdateProduct().updateProduct(
        title: prodName == null? product.title : prodName!,
        price: price == null? product.price.toString() : price!,
        description: desc == null? product.description : desc!,
        image: image == null? product.image : image!,
        id : product.id,
        category: product.category);
  }

}
