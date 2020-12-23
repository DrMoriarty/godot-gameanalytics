#pragma once

#include <Godot.hpp>
#include <Reference.hpp>

using namespace godot;

class GameAnalytics : public godot::Reference
{
    GODOT_CLASS(GameAnalytics, godot::Reference);

protected:
    static GameAnalytics *instance;

public:
    static void _register_methods();
    void _init();

    static GameAnalytics *get_singleton();
    GameAnalytics();
    ~GameAnalytics();

    void configureAvailableCustomDimensions01(const PoolStringArray &customDimensions);
    void configureAvailableCustomDimensions02(const PoolStringArray &customDimensions);
    void configureAvailableCustomDimensions03(const PoolStringArray &customDimensions);

    void configureAvailableResourceCurrencies(const PoolStringArray &resourceCurrencies);
    void configureAvailableResourceItemTypes(const PoolStringArray &resourceItemTypes);

    void configureBuild(const String &build);
    void configureAutoDetectAppVersion(bool flag);
    void configureUserId(const String &userId);
    void configureSdkGameEngineVersion(const String &version);
    void configureGameEngineVersion(const String &version);

    void init(const String &gameKey, const String &secretKey);

    void addBusinessEvent(const Dictionary &options);
    void addResourceEvent(const Dictionary &options);
    void addProgressionEvent(const Dictionary &options);
    void addDesignEvent(const Dictionary &options);
    void addErrorEvent(const Dictionary &options);

    void setEnabledInfoLog(bool flag);
    void setEnabledVerboseLog(bool flag);
    void setEnabledManualSessionHandling(bool flag);
    void setEnabledErrorReporting(bool flag);
    void setEnabledEventSubmission(bool flag);

    void setCustomDimension01(const String &dimension);
    void setCustomDimension02(const String &dimension);
    void setCustomDimension03(const String &dimension);

    void startSession();
    void endSession();
    void onQuit();

    String getRemoteConfigsValueAsString(const Dictionary &options);
    bool isRemoteConfigsReady();
    String getRemoteConfigsContentAsString();
};
