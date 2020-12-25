extends Node

var _ga = null

func _ready():
    if(Engine.has_singleton("GameAnalytics")):
        _ga = Engine.get_singleton("GameAnalytics")
    elif OS.get_name() == 'iOS':
        _ga = preload("res://addons/gameanalytics-ios/gameanalytics.gdns").new()
    if ProjectSettings.has_setting('GameAnalytics/GAME_KEY') and ProjectSettings.has_settings('GameAnalytics/SECRET_KEY'):
        var gk = ProjectSettings.get_setting('GameAnalytics/GAME_KEY')
        var sk = ProjectSettings.get_setting('GameAnalytics/SECRET_KEY')
        init(gk, sk, not OS.is_debug_build())
    else:
        push_error('Project settings have no keys for GameAnalytics!')

func init(game_key: String, secret_key: String, production: bool) -> void:
    if _ga != null:
        _ga.setEnabledInfoLog(not production)
        _ga.setEnabledVerboseLog(not production)

        if ProjectSettings.has_settings('GameAnalytics/CustomDimensions01'):
            var d = ProjectSettings.get_setting('GameAnalytics/CustomDimensions01')
            if d != null and d != '':
                var dims = d.split(',')
                _ga.configureAvailableCustomDimensions01(dims)
        if ProjectSettings.has_settings('GameAnalytics/CustomDimensions02'):
            var d = ProjectSettings.get_setting('GameAnalytics/CustomDimensions02')
            if d != null and d != '':
                var dims = d.split(',')
                _ga.configureAvailableCustomDimensions02(dims)
        if ProjectSettings.has_settings('GameAnalytics/CustomDimensions03'):
            var d = ProjectSettings.get_setting('GameAnalytics/CustomDimensions03')
            if d != null and d != '':
                var dims = d.split(',')
                _ga.configureAvailableCustomDimensions03(dims)
        if ProjectSettings.has_settings('GameAnalytics/ResourceCurrencies'):
            var c = ProjectSettings.get_setting('GameAnalytics/ResourceCurrencies')
            if c != null and c != '':
                var curs = c.split(',')
                _ga.configureAvailableResourceCurrencies(curs)
        if ProjectSettings.has_settings('GameAnalytics/ResourceItemTypes'):
            var t = ProjectSettings.get_setting('GameAnalytics/ResourceItemTypes')
            if t != null and t != '':
                var types = t.split(',')
                _ga.configureAvailableResourceItemTypes(types)
        _ga.configureAutoDetectAppVersion(true)
        _ga.init(game_key, secret_key)

func addBusinessEvent(params: Dictionary) -> void:
    if _ga != null:
        _ga.addBusinessEvent(params)

func addResourceEvent(params: Dictionary) -> void:
    if _ga != null:
        _ga.addResourceEvent(params)

func addProgressionEvent(params: Dictionary) -> void:
    if _ga != null:
        _ga.addProgressionEvent(params)

func addDesignEvent(params: Dictionary) -> void:
    if _ga != null:
        _ga.addDesignEvent(params)

func addErrorEvent(params: Dictionary) -> void:
    if _ga != null:
        _ga.addErrorEvent(params)

func isRemoteConfigsReady() -> bool:
    if _ga != null:
        return _ga.isRemoteConfigsReady()
    else:
        return false

func getRemoteConfigsContentAsString() -> String:
    if _ga != null:
        return _ga.getRemoteConfigsContentAsString()
    else:
        return ''

func getRemoteConfigsValueAsString(key: String, defval: String = '') -> String:
    if _ga != null:
        return _ga.getRemoteConfigsValueAsString({'key': key, 'defaultValue': defval})
    else:
        return defval

func _notification(what):
    if what == MainLoop.NOTIFICATION_WM_QUIT_REQUEST:
        if _ga != null:
            _ga.onQuit()
