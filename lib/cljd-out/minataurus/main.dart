import "dart:core" as dc;
import "main.dart" as UmIcmlcom_main;
import "../cljd/core.dart" as UmIcmlcoc_core;
import "package:flutter/material.dart" as f_material;
import "package:flutter/painting.dart" as f_painting;
import "package:flutter/widgets.dart" as f_widgets;
import "package:fluro/fluro.dart" as f_fluro;
import "package:flutter/src/widgets/framework.dart" as fsw_framework;

// BEGIN main
dc.dynamic main(){
return f_material.runApp(f_material.MaterialApp(title: "Welcome to Flutter", theme: f_material.ThemeData(primarySwatch: f_material.Colors.pink, ), home: (UmIcmlcom_main.scaffold() as fsw_framework.Widget?), ), );
}

// END main

// BEGIN register
dc.dynamic register(){
return (UmIcmlcom_main.router.define(const UmIcmlcoc_core.Keyword(null, "handler", 297822107, ), UmIcmlcom_main.root_handler, ));
}

// END register

// BEGIN root-handler
var root_handler=f_fluro.Handler(type: f_fluro.HandlerType.route, handlerFunc: (dc.dynamic contex$1, dc.dynamic params$1, ){
return UmIcmlcom_main.scaffold();
}, );

// END root-handler

// BEGIN router
var router=f_fluro.FluroRouter();

// END router

// BEGIN scaffold
dc.dynamic scaffold(){
return f_material.Scaffold(appBar: f_material.AppBar(title: f_widgets.Text("Welcome to ClojureDart", ), ), body: f_widgets.Center(child: f_widgets.Text("This text is Centered.", style: f_painting.TextStyle(color: f_material.Colors.red, fontSize: 32.0, ), ), ), );
}

// END scaffold
