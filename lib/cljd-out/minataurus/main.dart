import "dart:core" as dc;
import "main.dart" as UmIcmlcom_main;
import "../cljd/core.dart" as UmIcmlcoc_core;
import "package:flutter/material.dart" as f_material;
import "package:flutter/painting.dart" as f_painting;
import "package:flutter/widgets.dart" as f_widgets;
import "package:flutter/src/widgets/framework.dart" as fsw_framework;
import "package:fluro/fluro.dart" as f_fluro;

// BEGIN main
dc.dynamic main(){
final dc.List<dc.dynamic> fl$1=(dc.List<dc.dynamic>.filled(2, "/", ));
fl$1[1]=UmIcmlcom_main.main_page;
final UmIcmlcoc_core.PersistentHashMap $1=UmIcmlcoc_core.$_map_lit(fl$1, );
final dc.Map<dc.String, fsw_framework.Widget Function(fsw_framework.BuildContext, )> casted$1=($1.cast<dc.String, fsw_framework.Widget Function(fsw_framework.BuildContext, )>());
return f_material.runApp(f_material.MaterialApp(title: "Welcome to Flutter", theme: f_material.ThemeData(primarySwatch: f_material.Colors.pink, ), initialRoute: "/", routes: casted$1, ), );
}

// END main

// BEGIN main-page
fsw_framework.Widget main_page(dc.dynamic ctx$1, ){
return f_material.Scaffold(appBar: f_material.AppBar(title: f_widgets.Text("clojure dart", ), ), body: f_widgets.Center(child: f_widgets.Text("This text is Centered!", style: f_painting.TextStyle(color: f_material.Colors.red, fontSize: 32.0, ), ), ), );
}

// END main-page

// BEGIN root-handler
var root_handler=f_fluro.Handler(type: f_fluro.HandlerType.route, handlerFunc: (dc.dynamic contex$1, dc.dynamic params$1, ){
return UmIcmlcom_main.main_page();
}, );

// END root-handler

// BEGIN router
var router=f_fluro.FluroRouter();

// END router
