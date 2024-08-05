package com.example.ecom_app

import com.yandex.mapkit.MapKitFactory
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity: FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        MapKitFactory.setApiKey("3f58f294-eedc-4523-983c-542da99950da")
        GeneratedPluginRegistrant.registerWith(flutterEngine)
    }
}
