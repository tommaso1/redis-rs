build:
	@cargo build

test:
	@echo "Testing without unix_socket"
	@RUST_TEST_THREADS=1 cargo test
	@echo "Testing with unix_socket"
	@RUST_TEST_THREADS=1 cargo test --features=unix_socket
	@echo "Testing with rustc_serialize and serde_json"
	@RUST_TEST_THREADS=1 cargo test --features="rustc-serialize serde_json"

bench:
	@RUST_TEST_THREADS=1 cargo bench

docs: build
	@cargo doc --no-deps --features=unix_socket

upload-docs: docs
	@./upload-docs.sh

.PHONY: build test bench docs upload-docs
