# Submitting this app to F-Droid

must read:

* [Submitting to F-Droid Quick Start Guide](https://f-droid.org/docs/Submitting_to_F-Droid_Quick_Start_Guide/)
* [Requests For Packaging](https://gitlab.com/fdroid/rfp)

## Requirements

1. git version tag (e.g. `v0.1`) must match `versionName "0.1"` in `android/app/build.gradle`
2. For each new version `versionCode 1` in `android/app/build.gradle` must be incremented and 
   an according `fastlane/metadata/android/en-US/changelogs/x.txt` file is required.