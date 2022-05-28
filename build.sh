#!/bin/bash -e
git submodule update --init
cd crates/witx-bindgen/WASI
git pull origin main
cd ../../..
cargo run -p witx-bindgen -- ./crates/witx-bindgen/WASI/phases/snapshot/witx/wasix_snapshot_preview1.witx > src/lib_generated32.rs
cargo run -p witx-bindgen -- ./crates/witx-bindgen/WASI/phases/snapshot/witx/wasix_snapshot_preview1.witx 64bit > src/lib_generated64.rs
cargo build
cargo build --target wasm32-wasi