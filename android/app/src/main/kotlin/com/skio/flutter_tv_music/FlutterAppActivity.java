package com.skio.flutter_tv_music;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.util.Log;

import androidx.annotation.NonNull;

import io.flutter.embedding.android.FlutterActivity;

public class FlutterAppActivity extends FlutterActivity implements IShowMessage {
    private static final String TAG = FlutterAppActivity.class.getSimpleName();

    public final static String INIT_PARAMS = "initParams";
    private String initParams = "1111";
    private BasicMessageChannelPlugin basicMessageChannelPlugin;
    private EventChannelPlugin eventChannelPlugin;

    public static void start(Context context, String initParams) {
        Intent intent = new Intent(context, FlutterAppActivity.class);
        intent.putExtra(INIT_PARAMS, initParams);
        context.startActivity(intent);
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        if (getFlutterEngine() != null) {
            eventChannelPlugin = EventChannelPlugin.registerWith(getFlutterEngine().getDartExecutor());
            MethodChannelPlugin.registerWith(getFlutterEngine().getDartExecutor(), this);
            basicMessageChannelPlugin = BasicMessageChannelPlugin.registerWith(getFlutterEngine().getDartExecutor(), this);
        }

    }

    /**
     * 重载该方法来传递初始化参数
     *
     * @return
     */

    @NonNull
    @Override
    public String getInitialRoute() {
        return initParams == null ? super.getInitialRoute() : initParams;
    }

    @Override
    public void onShowMessage(String message) {
        sendMessage("发送测试数据",true);
    }

    @Override
    public void sendMessage(String message, boolean useEventChannel) {
        if (useEventChannel) {
            eventChannelPlugin.send(message);
        } else {
            basicMessageChannelPlugin.send(message, this::onShowMessage);
        }
    }
}
