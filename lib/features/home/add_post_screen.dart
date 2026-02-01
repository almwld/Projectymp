import 'dart:io';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  double _price = 0;
  String _city = 'صنعاء';
  String _description = '';
  File? _imageFile;
  bool _isLoading = false;

  final List<String> _cities = ['صنعاء', 'عدن', 'تعز', 'حضرموت', 'إب', 'الحديدة', 'مأرب'];

  // دالة اختيار صورة من المعرض أو الكاميرا
  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery, imageQuality: 50);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  // دالة رفع الصورة والبيانات
  void _submitData() async {
    if (!_formKey.currentState!.validate() || _imageFile == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('يرجى ملء البيانات واختيار صورة')));
      return;
    }

    _formKey.currentState!.save();
    setState(() => _isLoading = true);

    try {
      // 1. رفع الصورة إلى Firebase Storage
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      Reference storageRef = FirebaseStorage.instance.ref().child('product_images').child('$fileName.jpg');
      UploadTask uploadTask = storageRef.putFile(_imageFile!);
      TaskSnapshot snapshot = await uploadTask;
      String downloadUrl = await snapshot.ref.getDownloadURL();

      // 2. حفظ البيانات في Firestore
      await FirebaseFirestore.instance.collection('products').add({
        'name': _name,
        'price': _price,
        'city': _city,
        'description': _description,
        'imageUrl': downloadUrl,
        'createdAt': Timestamp.now(),
        'sellerPhone': '770000000', // سيتم ربطه بحساب المستخدم لاحقاً
      });

      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('تم نشر إعلانك بنجاح!')));
      _formKey.currentState!.reset();
      setState(() {
        _imageFile = null;
        _isLoading = false;
      });
    } catch (e) {
      setState(() => _isLoading = false);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('حدث خطأ أثناء الرفع: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('أضف إعلان جديد'), backgroundColor: const Color(0xFF007A33), foregroundColor: Colors.white),
      body: _isLoading 
        ? const Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [CircularProgressIndicator(), SizedBox(height: 10), Text('جاري رفع الإعلان...')]))
        : Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  GestureDetector(
                    onTap: _pickImage,
                    child: Container(
                      height: 150,
                      decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(10)),
                      child: _imageFile != null 
                          ? ClipRRect(borderRadius: BorderRadius.circular(10), child: Image.file(_imageFile!, fit: BoxFit.cover))
                          : const Column(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(Icons.camera_alt, size: 50), Text('اضغط لإضافة صورة المنتج')]),
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'اسم المنتج'),
                    validator: (value) => value!.isEmpty ? 'يرجى إدخال الاسم' : null,
                    onSaved: (value) => _name = value!,
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'السعر (ريال)'),
                    keyboardType: TextInputType.number,
                    onSaved: (value) => _price = double.parse(value!),
                  ),
                  const SizedBox(height: 15),
                  DropdownButtonFormField(
                    value: _city,
                    items: _cities.map((city) => DropdownMenuItem(value: city, child: Text(city))).toList(),
                    onChanged: (value) => setState(() => _city = value as String),
                    decoration: const InputDecoration(labelText: 'المحافظة'),
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.orange, foregroundColor: Colors.white, padding: const EdgeInsets.all(15)),
                    onPressed: _submitData,
                    child: const Text('نشر الإعلان', style: TextStyle(fontSize: 18)),
                  ),
                ],
              ),
            ),
          ),
    );
  }
}
