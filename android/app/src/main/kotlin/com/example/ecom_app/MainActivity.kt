package com.example.ecom_app

import com.yandex.mapkit.MapKitFactory
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant
import com.example.ecom_app.BuildConfig

class MainActivity: FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        MapKitFactory.setApiKey(BuildConfig.YANDEX_API_KEY)
        GeneratedPluginRegistrant.registerWith(flutterEngine)
    }
}
