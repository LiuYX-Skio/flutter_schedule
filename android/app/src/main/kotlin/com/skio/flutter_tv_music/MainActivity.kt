package com.skio.flutter_tv_music

import android.os.Bundle
import android.view.View
import androidx.appcompat.app.AppCompatActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.dart.DartExecutor

class MainActivity : AppCompatActivity() {
    var flutterEngine: FlutterEngine? = null
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        //一个Engine代表的时一个flutter的进程实例（dart解析器，flutter平台线程）
        flutterEngine = FlutterEngine(this)
        flutterEngine!!.dartExecutor.executeDartEntrypoint(
            DartExecutor.DartEntrypoint.createDefault()
        )
    }

    fun test(view: View?) {
//        startActivity(
//                FlutterActivity
//                        //withNewEngine 回去创建一套flutter实例数据
////                        .withNewEngine()
//                        .withCachedEngine(CACHED_ENGINE_ID)
//                        .build(MainActivity.this)
//        );


//        FlutterFragment.withNewEngine().initialRoute("/").build();
//
//        getSupportFragmentManager().beginTransaction();
//
//        FlutterView flutterView = new FlutterView(this);
//        FrameLayout.LayoutParams lp = new FrameLayout.LayoutParams(
//                ViewGroup.LayoutParams.MATCH_PARENT,
//                ViewGroup.LayoutParams.MATCH_PARENT);
//        FrameLayout flContainer = findViewById(R.id.fl_flutter);
//        flContainer.addView(flutterView, lp);
//        // 关键代码，将Flutter页面显示到FlutterView中
//        flutterView.attachToFlutterEngine(flutterEngine);
        FlutterAppActivity.start(this@MainActivity, "1111")
    }
}