if [ -z "$CCACHE_CONFIGURED" ]; then
    export USE_CCACHE=1
    export CCACHE_EXEC=/usr/bin/ccache
    ccache -M 50G
    export CCACHE_CONFIGURED=1
fi

# Change to root of source tree
croot
