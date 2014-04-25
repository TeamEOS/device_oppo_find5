/*
 * Copyright (C) 2014 codefireX
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package org.teameos.settings.device;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.preference.CheckBoxPreference;
import android.preference.Preference;
import android.preference.PreferenceManager;
import java.lang.String;

public class MusicGesture {

    private static final String MUSIC_GESTURE = "/proc/touchpanel/music_enable";

    public static boolean isSupported() {
        return Utils.fileExists(MUSIC_GESTURE);
    }

    public static boolean isEnabled() {
        if (!isSupported())
            return false;
        return Utils.readOneLine(MUSIC_GESTURE).equals("1");
    }

    public static void restore(Context context) {
        if (!isSupported())
            return;
        SharedPreferences sharedPrefs = PreferenceManager.getDefaultSharedPreferences(context);
        if (sharedPrefs.getBoolean(DevicePreferenceActivity.KEY_MUSIC_GESTURE, false))
            Utils.writeValue(MUSIC_GESTURE, "1");
        else
            Utils.writeValue(MUSIC_GESTURE, "0");
    }

    public static void enable(Context context) {
        if (!isSupported())
            return;
        Utils.writeValue(MUSIC_GESTURE, "1");
        SharedPreferences sharedPrefs = PreferenceManager.getDefaultSharedPreferences(context);
        SharedPreferences.Editor editor = sharedPrefs.edit();
        editor.putBoolean(DevicePreferenceActivity.KEY_MUSIC_GESTURE, true);
        editor.commit();
    }

    public static void disable(Context context) {
        if (!isSupported())
            return;
        Utils.writeValue(MUSIC_GESTURE, "0");
        SharedPreferences sharedPrefs = PreferenceManager.getDefaultSharedPreferences(context);
        SharedPreferences.Editor editor = sharedPrefs.edit();
        editor.putBoolean(DevicePreferenceActivity.KEY_MUSIC_GESTURE, false);
        editor.commit();
    }
}