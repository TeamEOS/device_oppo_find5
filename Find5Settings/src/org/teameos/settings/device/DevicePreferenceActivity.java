/*
 * Copyright (C) 2011 The CyanogenMod Project
 * Copyright (C) 2014 TeamEOS
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

import android.app.ActionBar;
import android.content.Context;
import android.os.Bundle;
import android.preference.CheckBoxPreference;
import android.preference.Preference;
import android.preference.Preference.OnPreferenceChangeListener;
import android.preference.PreferenceFragment;
import android.preference.PreferenceScreen;
import android.preference.SwitchPreference;
import android.view.MenuItem;

import org.teameos.settings.device.R;

public class DevicePreferenceActivity extends PreferenceFragment {

    public static final String KEY_MUSIC_GESTURE = "music_gesture";
    public static final String KEY_FLASH_GESTURE = "flash_gesture";
    public static final String KEY_CAMERA_GESTURE = "camera_gesture";
    public static final String KEY_DOUBLETAP_GESTURE = "doubletap_gesture";
    
    private Context context;
    private CheckBoxPreference mMusicGesture;
    private CheckBoxPreference mFlashGesture;
    private CheckBoxPreference mCameraGesture;
    private CheckBoxPreference mDoubleTapGesture;

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

		ActionBar actionBar = getActivity().getActionBar();
		actionBar.setDisplayOptions(ActionBar.DISPLAY_SHOW_HOME
					  | actionBar.DISPLAY_SHOW_TITLE);
		actionBar.setDisplayHomeAsUpEnabled(true);

        addPreferencesFromResource(R.xml.preferences);
        context = getActivity().getApplication();

        mMusicGesture = (CheckBoxPreference) findPreference(KEY_MUSIC_GESTURE);
        mMusicGesture.setChecked(MusicGesture.isEnabled());
        mMusicGesture.setEnabled(MusicGesture.isSupported());
        
        mFlashGesture = (CheckBoxPreference) findPreference(KEY_FLASH_GESTURE);
        mFlashGesture.setChecked(FlashGesture.isEnabled());
        mFlashGesture.setEnabled(FlashGesture.isSupported());
        
        mCameraGesture = (CheckBoxPreference) findPreference(KEY_CAMERA_GESTURE);
        mCameraGesture.setChecked(CameraGesture.isEnabled());
        mCameraGesture.setEnabled(CameraGesture.isSupported());
        
        mDoubleTapGesture = (CheckBoxPreference) findPreference(KEY_DOUBLETAP_GESTURE);
        mDoubleTapGesture.setChecked(DoubleTapGesture.isEnabled());
        mDoubleTapGesture.setEnabled(DoubleTapGesture.isSupported());
    }

	@Override
	public boolean onOptionsItemSelected(MenuItem item) {
		switch (item.getItemId()) {
		case android.R.id.home:
			getActivity().finish();
			break;
		default:
			break;
		}
		return super.onOptionsItemSelected(item);
	}

    @Override
    public boolean onPreferenceTreeClick(PreferenceScreen preferenceScreen, Preference preference) {
    if (preference == mMusicGesture) {
        if (mMusicGesture.isChecked())
            MusicGesture.enable(context);
        else
            MusicGesture.disable(context);
        return true;
    }
    else if (preference == mFlashGesture) {
        if (mFlashGesture.isChecked())
            FlashGesture.enable(context);
        else
            FlashGesture.disable(context);
        return true;
    }
    else if (preference == mCameraGesture) {
        if (mCameraGesture.isChecked())
            CameraGesture.enable(context);
        else
            CameraGesture.disable(context);
        return true;
    }
    else if (preference == mDoubleTapGesture) {
        if (mDoubleTapGesture.isChecked())
            DoubleTapGesture.enable(context);
        else
            DoubleTapGesture.disable(context);
        return true;
    }

    return super.onPreferenceTreeClick(preferenceScreen, preference);
}
}