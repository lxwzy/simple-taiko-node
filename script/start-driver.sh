#!/bin/sh

set -eou pipefail

if [ "$DISABLE_P2P_SYNC" = "false" ]; then
    taiko-client driver \
        --l1.ws "${L1_ENDPOINT_WS}" \
        --l2.ws ws://127.0.0.1:8546 \
        --l1.beacon "${L1_BEACON_HTTP}" \
        --l2.auth http://127.0.0.1:8551 \
        --taikoL1 "${TAIKO_L1_ADDRESS}" \
        --taikoL2 "${TAIKO_L2_ADDRESS}" \
        --jwtSecret /data/taiko-geth/geth/jwtsecret \
        --p2p.sync \
        --p2p.checkPointSyncUrl https://rpc.hekla.taiko.xyz
else
    taiko-client driver \
        --l1.ws "${L1_ENDPOINT_WS}" \
        --l2.ws ws://127.0.0.1:8546 \
        --l1.beacon "${L1_BEACON_HTTP}" \
        --l2.auth http://127.0.0.1:8551 \
        --taikoL1 "${TAIKO_L1_ADDRESS}" \
        --taikoL2 "${TAIKO_L2_ADDRESS}" \
        --jwtSecret /data/taiko-geth/geth/jwtsecret
fi
