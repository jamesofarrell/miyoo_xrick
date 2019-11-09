#!/bin/sh

OPK_NAME=xrick-`date +'%Y%m%d'`.opk

echo ${OPK_NAME}

# create default.gcw0.desktop
cat > default.gcw0.desktop <<EOF
[Desktop Entry]
Name=Rick Dangerous
Comment=xRick port. An action platformer.
Exec=xrick
Terminal=false
Type=Application
StartupNotify=true
Icon=xrick
Categories=games;
EOF

# create opk
FLIST="xrick"
FLIST="${FLIST} default.gcw0.desktop"
FLIST="${FLIST} data.zip"
FLIST="${FLIST} xrick.png"

rm -f ${OPK_NAME}
mksquashfs ${FLIST} ${OPK_NAME} -all-root -no-xattrs -noappend -no-exports

cat default.gcw0.desktop
rm -f default.gcw0.desktop
