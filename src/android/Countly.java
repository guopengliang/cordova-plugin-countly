package com.guopengliang.cordova;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaPlugin;

import android.util.Log;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class Countly extends CordovaPlugin {

    ly.count.android.api.Countly CountlySDK;

    private Map<String, String> JsonToMap(JSONObject jdata) throws JSONException {
        if (jdata == null) {
            Log.d("Countly", "not a json");
            return null;
        }
        @SuppressWarnings ("unchecked")
        Iterator<String> nameItr = jdata.keys();
        Map<String, String> params = new HashMap<String, String>();
        while (nameItr.hasNext()) {
            String name = nameItr.next();
            params.put(name, jdata.getString(name));
        }
        return params;
    }

    @Override
    public boolean execute(String action, JSONArray args, CallbackContext callbackContext) throws JSONException {
        try {
            Log.d("Countly", action);

            if (action.equals("recordEvent")) {
                CountlySDK.sharedInstance().recordEvent(args.getString(0), args.optInt(1));

            } else if (action.equals("recordEventWithSum")) {
                CountlySDK.sharedInstance().recordEvent(args.getString(0), args.optInt(1), args.optDouble(2));

            } else if (action.equals("recordEventWithSegmentation")) {
                Map<String, String> segmentation = this.JsonToMap(args.optJSONObject(1));
                if (segmentation != null)
                    CountlySDK.sharedInstance().recordEvent(args.getString(0), segmentation, args.optInt(2));

            } else if (action.equals("recordEventWithSegmentationAndSum")) {
                Map<String, String> segmentation = this.JsonToMap(args.optJSONObject(1));
                if (segmentation != null)
                    CountlySDK.sharedInstance().recordEvent(args.getString(0), segmentation, args.optInt(2), args.optDouble(3));

            } else {
                Log.d("Countly", "invalid/na countly method: " + action);
                callbackContext.error("invalid/na countly method: " + action);
                return false;
            }
            callbackContext.success("");
            return true;
        } catch (JSONException e) {
            Log.d("Countly exception: ", e.getMessage());
            callbackContext.error("countly json exception: " + e.getMessage());
            return false;
        }
    }
}
