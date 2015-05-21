#!/bin/sh
xctool -project PHAM_CHI_CONG.xcodeproj \
-scheme PHAM_CHI_CONG \
-reporter plain \
-sdk iphonesimulator \
-reporter junit:test-reports/ios-report.xml \
test \

# -resetSimulator \
#-freshInstall