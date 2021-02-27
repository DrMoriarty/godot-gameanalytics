# GameAnalytics

GameAnalytics SDK wrapper for NativeLib.

## Installation

Add (NativeLib-UI Addon)[https://godotengine.org/asset-library/asset/824] into your project. Then find `GameAnalytics` in the list of available plugins and press `Install` button.

Don't forget to enable your platforms (iOS/Android) before plugin installation.

## Usage

This plugin contain gd-wrapper `gameanalytics` which will be automatically added to your autoloading list. So you can call it everywhere in your gd code.

## API

- addBusinessEvent(params: Dictionary)
- addResourceEvent(params: Dictionary)
- addProgressionEvent(params: Dictionary)
- addDesignEvent(params: Dictionary)
- addErrorEvent(params: Dictionary)
- isRemoteConfigsReady() -> bool
- getRemoteConfigsContentAsString() -> String
- getRemoteConfigsValueAsString(key: String, defval: String = '') -> String
