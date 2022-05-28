#!/bin/bash -e
git submodule update --init
cd crates/witx-bindgen/WASI
git pull origin main
cd ../../..
cargo run -p witx-bindgen -- ./crates/witx-bindgen/WASI/phases/snapshot/witx/wasix_snapshot_preview1.witx > src/lib_generated.rs
