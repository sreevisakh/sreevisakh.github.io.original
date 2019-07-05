---
published: false
---
## Adding Custom Build to Android Project

Android Project comes with to buildTypes debug & release. this is specified in app/build.gradle file. You can add a different build where you want to customize the versionCode, versionName, or applicationId you can do that as follows

```

android {
    buildTypes {
        debug {
            applicationIdSuffix ".debug"
        }
        internal {
            matchingFallbacks = ["release"]
            res "string" "deployment_key" "internal-deployment-key"
        }
		release {
            signingConfig signingConfigs.release
            minifyEnabled enableProguardInReleaseBuilds
            proguardFiles getDefaultProguardFile("proguard-android.txt"), "proguard-rules.pro"
        }

    }
}

```

Above I have added an Internal buildType and change the string resource deployment key. When you build your signed apk you will get an option to select this build variant and it will in this case generate apk in app/internal/app-internal.apk. You can also customize other resources by creating folder strcuture inside your app folder.

by creating app/debug/res/values/string.xml as follows

```xml
<resources>
    <string name="app_name">App Debug</string>
</resources>

```

Your debug build generate apk file will have the application name App Debug. Since we even change the applicationIdSuffix above. It will install as a seperate app. so You can keep your original and debug app together. Go Try and figure out how to change the icon for each of these variants now.




