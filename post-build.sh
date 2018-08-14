#!/usr/bin/env bash

until cd $ANDROID_HOME
do
    sleep 5 && echo "Waiting for volumes to be mounted..."
done

wget https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip -P /app \
	&& yes 'A' | unzip /app/sdk-tools-linux-4333796.zip -d ${ANDROID_HOME} \
	&& yes | ${ANDROID_HOME}/tools/bin/sdkmanager \
	"build-tools;28.0.2" "sources;android-26" "platform-tools" "platforms;android-26" "system-images;android-26;google_apis;x86" \
	&& echo no | ${ANDROID_HOME}/tools/bin/avdmanager create avd -n Pixel -k "system-images;android-26;google_apis;x86" -c 2000M
