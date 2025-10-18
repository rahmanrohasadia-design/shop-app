import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_flutter/providers/cart_provider.dart';


class ProductDetailsPage extends StatefulWidget {
  final Map<String, Object> product;
  const ProductDetailsPage({
    super.key,
    required this.product,
  });

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  void  onTap(){
    
       Provider.of<CartProvider>(context, listen: false).addProduct(
        {
     'id': widget.product['id'] ,
    'title': widget.product['title'],
    'price': widget.product ['price'],
    'imageUrl': widget.product ['imageUrl'],
    'Company': widget.product ['Company'],
    'RamRom': widget.product ['RamRom'],
    'Camera': widget.product ['Camera'],
    'Display': widget.product ['Display'],

        },
       );
       ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Product Added Successfully!')
          ),
       );
       }                              

  @override
  Widget build(BuildContext context) {
    final ramRom = widget.product['RamRom'] as List<String>;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
      ),
      body: Column(
        children: [
          Text(
            widget.product['title'] as String,
            style: const TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset(widget.product['imageUrl'] as String,
            height: 250,),
          ),
          const Spacer(flex: 2),
          Container(
            height: 280,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(245, 247, 249, 1),
              borderRadius: BorderRadius.circular(40),
            ),
child: Column(
  crossAxisAlignment: CrossAxisAlignment.start, 
  children: [ 
    
    Center(
      child: Text(
        '৳${widget.product['price']}',
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    const SizedBox(height: 15),

   Padding(
      padding: const EdgeInsets.only(left: 12), 
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'RamRom: [${ramRom[0]}] [${ramRom[1]}]',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),

          Text(
            'Company: ${widget.product['Company']}',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),

          Text(
            'Camera: ${widget.product['Camera']}',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),

          Text(
            'Display: ${widget.product['Display']}',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
      ),
    ),
  ],
),
                ),
                
                 Padding(
                   padding: const EdgeInsets.all(20.0),
                   child: ElevatedButton(
                    onPressed: onTap,
                    style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    fixedSize: const Size(350, 50),
                    ),
                   child: const Text('Add To Cart',
                   style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                   ),)
                   ),
                 ),
              ],
            )
         ),
        ]
      )
    ); 
  }
}
