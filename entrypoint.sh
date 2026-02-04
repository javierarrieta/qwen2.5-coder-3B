#!/bin/sh

build_args() {
    args=""

    [ -n "$API_KEY" ] && args="$args --api-key $API_KEY"
    [ -n "$TEMP" ] && args="$args --temp $TEMP"
    [ -n "$TOP_K" ] && args="$args --top-k $TOP_K"
    [ -n "$TOP_P" ] && args="$args --top-p $TOP_P"
    [ -n "$CTX_SIZE" ] && args="$args --ctx-size $CTX_SIZE"

    echo "$args"
}

exec /app/llama-server $(build_args) -m $MODEL_PATH
