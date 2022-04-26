import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_math_fork/flutter_math.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: new MyHomePage(title: 'flutter_html Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

const htmlData = r"""
<b><font color="#0a7ad4">Lista de Sub actividades</font></b><div><ol><li>(Lista con puntos) Motivación: Los niños saldrán al patio formarán</li><li>Problematización: <b><font color="#ff9800">Carlitos y Anita corrían en el patio,</font></b> levantando sus dos manitas, movían su cabecita, un rato se sentaban&nbsp;<br></li><ol><li>Esta es una sub su actividad con puntos<br></li><li>Segundo item</li><li><b>Tercer item</b></li></ol><li>IFE: Mostrar por medio de alguna lámina cuando el hombre fue creado <font color="#f73526">e imagina como Dios creo al hombre como un</font> “muñeco” de barro</li><ol><li><i>Sub lista con numeración</i></li><li><i>Segundo</i></li><li><i>Tercero</i></li></ol><li>Última subactivida</li><ul><li>Sub discos</li><li>sd 2&nbsp;</li><li>sd 3</li></ul></ol><div><ul><li>(Lista con puntos) Motivación:&nbsp;</li><ol><li>Sub numerico</li><ul><li>Cuadrado</li><li>hgfhgfh</li></ul><li>dos</li><ol><li>Su sub uno</li><li>ss dos</li><li>ss tres</li></ol><li>tres</li><li>gdfgdfg</li></ol><li>Los niños saldrán al patio f</li><ul><li>sub discos</li><ul><li>sub sub cuadrado</li><ul><li>dfgdfg</li></ul><li>dfgdfg</li><li>dfghg</li></ul><li>sdfsdf</li><li>gdfg</li></ul><li>ormarán
Problematización: Ca</li><li>rlitos y Anita corrían en el patio, le</li></ul></div></div><div><br></div><div>Parrafo Sin tab&nbsp;Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scramble</div><blockquote style="margin: 0 0 0 40px; border: none; padding: 0px;"><div>Sub Parrafo con tab Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scramble</div></blockquote><blockquote style="margin: 0 0 0 40px; border: none; padding: 0px;"><blockquote style="margin: 0 0 0 40px; border: none; padding: 0px;"><blockquote style="margin: 0 0 0 40px; border: none; padding: 0px;"><blockquote style="margin: 0 0 0 40px; border: none; padding: 0px;"><div>Sub Parrafo con tab Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scramble</div></blockquote></blockquote></blockquote></blockquote>
""";

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('flutter_html Example'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Html(
          data: htmlData,
          tagsList: Html.tags..addAll(['tex', 'bird', 'flutter']),
          onLinkTap: (url, _, __, ___) {
            print("Opening $url...");
          },
          onImageTap: (src, _, __, ___) {
            print(src);
          },
          onImageError: (exception, stackTrace) {
            print(exception);
          },
          style: {
            "ul, ol":Style(
              margin: EdgeInsets.only(
                  top: 5,
                  bottom: 10
              ),
              padding: EdgeInsets.only(
                  left: 20,
                  right: 0
              ),
            ),
            "ol ol, ul ul, ul ol, ol ul":Style(
              margin: EdgeInsets.only(
                  left: 30,
                  bottom: 0
              ),

            ),
            "li": Style(
               padding: EdgeInsets.all(1)
            ),
            "li br": Style(
              display: Display.NONE
            ),
            "body": Style(
                fontSize: FontSize(13.0),

            )
          },
          onCssParseError: (css, messages) {
            print("css that errored: $css");
            print("error messages:");
            messages.forEach((element) {
              print(element);
            });
          },
        ),
      ),
    );
  }

}
