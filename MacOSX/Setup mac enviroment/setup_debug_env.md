
# GDB

```sh
brew install gdb

# codesign the gdb: reference link https://sourceware.org/gdb/wiki/PermissionsDarwin
open /Applications/Utilities/Keychain\ Access.app/

## Create a certification for gdb
# 1. Launch /Applications/Utilities/Keychain Access.app
# 2. Press Keychain Access->Certificate Assistant->Create a Certificate...
# 3. Set the folloeing settings
#       Name = gdb-cert
#       Identity Type = Self Signed Root
#       Certificate Type = Code Signing
#
#    check on the 'Let me override defaults' option
# 4. Continue ...
# 5. Set keychain = System
# 6. Click Done
#
# 7. Double click on your new gdb-cert certificate
# 8. Turn down the "Trust" disclosure triangle
#    Change:
#        When using this certificate: Always Trust

cat > gdb-entitlement.xml <<EOF

<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>com.apple.security.cs.debugger</key>
    <true/>
</dict>
</plist>
</pre>
EOF

codesign --entitlements gdb-entitlement.xml -fs gdb-cert $(which gdb)
```

#

otool    ->    ldd
dtruss   ->    strace       # trace system call of a process
sample + filtercalltree ->  perf


https://code.visualstudio.com/docs/python/debugging