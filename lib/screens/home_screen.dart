import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: <Widget>[
          _RecipesCard(context),
          _RecipesCard(context),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        child: Icon(Icons.add, color: Colors.white, size: 35,),
        onPressed: (){
          _showBottom(context);
        },
      )
    );
  }

  Future<void> _showBottom(BuildContext context){
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => FocusScope.of(context).unfocus(),
        child: Padding(
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              padding: const EdgeInsets.all(16),
              width: MediaQuery.of(context).size.width,
              height: 700,
              child: const RecipeForm(),
            ),
        ),
      )
    );
  }

  Widget _RecipesCard(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 7, left: 10, right: 10, bottom: 7),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 125,
        child: Card(
          child: Row(
              children: <Widget>[
                Container(
                  height: 125,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(13),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(13),
                    child: Image.asset('assets/images/lazania.jpg', fit: BoxFit.cover,),//imagen
                  ),
                ),
                SizedBox(width: 26),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Lazaña', style: TextStyle(fontSize: 16, fontFamily:'Quicksand') ),
                    Container(height: 1, width: 100, color: Colors.black,),
                    SizedBox(height: 4,),
                    Text('Ingredientes:'),
                  ],
                ),
              ]
          ),
        ),
      ),
    );
  }

}

class RecipeForm extends StatelessWidget {
  const RecipeForm({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    final TextEditingController _recipeName = TextEditingController();
    final TextEditingController _recipeAuthor = TextEditingController();
    final TextEditingController _recipeIMG = TextEditingController();
    final TextEditingController _recipeDescription = TextEditingController();

    return Padding(
      padding:EdgeInsets.all(8),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nueva Receta',
              style: TextStyle(
                  color: Colors.deepPurple,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16,),
            _buildTextField(controller: _recipeName, label: 'Nombre de la receta', validator: (value){
              if(value == null || value.isEmpty){
                return 'Por favor ingrese un nombre';
              }
              return null;
            }),
            SizedBox(height: 16,),
            _buildTextField(controller: _recipeAuthor, label: 'Autor', validator: (value){
              if(value == null || value.isEmpty){
                return 'Por favor ingrese un autor';
              }
              return null;
            }),
            SizedBox(height: 16,),
            _buildTextField(controller: _recipeIMG, label: 'URL Imágen', validator: (value){
              if(value == null || value.isEmpty){
                return 'Por favor ingrese una URL';
              }
              return null;
            }),
            SizedBox(height: 16,),
            _buildTextArea(controller: _recipeDescription, label: 'Ingredientes', validator: (value){
              if(value == null || value.isEmpty){
                return 'Por favor ingrese los ingredientes';
              }
              return null;
            }),
            SizedBox(height: 7,),
            Center(
              
            )

          ],
        ),
      )

    );
  }

  //build a text field
  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    required String? Function(String?) validator
  }) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          color: Colors.deepPurple,
          fontFamily: 'Quicksand',
          fontSize: 18,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.deepPurple,
            width: 2,
          ),
        ),
      ),
    );
  }

  //build a text area
  Widget _buildTextArea({
    required String label,
    required TextEditingController controller,
    required String? Function(String?) validator
  }){
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          color: Colors.deepPurple,
          fontFamily: 'Quicksand',
          fontSize: 18,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.deepPurple,
            width: 2,
          ),
        ),
      ),
      maxLines: 5,
    );
  }


}