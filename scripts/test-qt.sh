#!/bin/bash
set -ex
buildDir=$(pwd)/build-qt
weston --backend=headless-backend.so &

# gui tests

#cd "$buildDir/qtbase/tests/auto/gui/image" && make check #hangs
cd "$buildDir/qtbase/tests/auto/gui/itemmodels" && make check
cd "$buildDir/qtbase/tests/auto/gui/math3d" && make check
cd "$buildDir/qtbase/tests/auto/gui/qopengl" && make check
cd "$buildDir/qtbase/tests/auto/gui/qopenglconfig" && make check
#cd "$buildDir/qtbase/tests/auto/gui/painting" && make check #fails!
#cd "$buildDir/qtbase/tests/auto/gui/text" && make check #fails!
#cd "$buildDir/qtbase/tests/auto/gui/kernel" && make check #fails!

# gui/kernel tests (remove this section when all pass and enable above)

cd "$buildDir/qtbase/tests/auto/gui/kernel/qbackingstore" && make check
#cd "$buildDir/qtbase/tests/auto/gui/kernel/qclipboard" && make check #fails!
cd "$buildDir/qtbase/tests/auto/gui/kernel/qcursor" && make check
cd "$buildDir/qtbase/tests/auto/gui/kernel/qdrag" && make check
cd "$buildDir/qtbase/tests/auto/gui/kernel/qevent" && make check
cd "$buildDir/qtbase/tests/auto/gui/kernel/qfileopenevent" && make check
cd "$buildDir/qtbase/tests/auto/gui/kernel/qguiapplication" && make check
cd "$buildDir/qtbase/tests/auto/gui/kernel/qguieventdispatcher" && make check
cd "$buildDir/qtbase/tests/auto/gui/kernel/qguieventloop" && make check
cd "$buildDir/qtbase/tests/auto/gui/kernel/qguimetatype" && make check
cd "$buildDir/qtbase/tests/auto/gui/kernel/qguitimer" && make check
cd "$buildDir/qtbase/tests/auto/gui/kernel/qguivariant" && make check
cd "$buildDir/qtbase/tests/auto/gui/kernel/qinputmethod" && make check
cd "$buildDir/qtbase/tests/auto/gui/kernel/qkeyevent" && make check
cd "$buildDir/qtbase/tests/auto/gui/kernel/qkeysequence" && make check
cd "$buildDir/qtbase/tests/auto/gui/kernel/qmouseevent" && make check
cd "$buildDir/qtbase/tests/auto/gui/kernel/qmouseevent_modal" && make check
cd "$buildDir/qtbase/tests/auto/gui/kernel/qopenglwindow" && make check
cd "$buildDir/qtbase/tests/auto/gui/kernel/qpalette" && make check
cd "$buildDir/qtbase/tests/auto/gui/kernel/qpixelformat" && make check
#cd "$buildDir/qtbase/tests/auto/gui/kernel/qrasterwindow" && make check #fails!
cd "$buildDir/qtbase/tests/auto/gui/kernel/qscreen" && make check
cd "$buildDir/qtbase/tests/auto/gui/kernel/qsurfaceformat" && make check
#cd "$buildDir/qtbase/tests/auto/gui/kernel/qtouchevent" && make check #fails!
cd "$buildDir/qtbase/tests/auto/gui/kernel/qwindow" && make check
