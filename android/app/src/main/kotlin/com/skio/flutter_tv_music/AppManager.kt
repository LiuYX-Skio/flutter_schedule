package com.skio.flutter_tv_music

import android.util.Log

import io.flutter.app.FlutterApplication
import com.umeng.commonsdk.UMConfigure
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.FlutterEngineCache
import io.flutter.embedding.engine.dart.DartExecutor


class AppManager : FlutterApplication() {
    val CACHED_ENGINE_ID = "MY_CACHED_ENGINE_ID"

    override fun onCreate() {
        super.onCreate()
        UMConfigure.setLogEnabled(true)
        UMConfigure.preInit(this, "5e3f96f3cb23d2a070000048", "Umeng")
        //在MyApplication中预先初始化Flutter引擎以提升Flutter页面打开速度
        //在MyApplication中预先初始化Flutter引擎以提升Flutter页面打开速度
        val flutterEngine = FlutterEngine(this)
        flutterEngine.getDartExecutor()
            .executeDartEntrypoint(DartExecutor.DartEntrypoint.createDefault())
        // Cache the FlutterEngine to be used by FlutterActivity.
        // Cache the FlutterEngine to be used by FlutterActivity.
        FlutterEngineCache.getInstance()
            .put(CACHED_ENGINE_ID, flutterEngine)

    }

}
