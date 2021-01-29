# MIT/Apache2 License

CARGO = cargo
GENR = $(PWD)/generator/target/debug/gluten-keyboard-generator
GENR_SRC = $(PWD)/generator/src
GENR_DEPS := $(wildcard $(GENR_SRC)/*)
RUSTFMT = rustfmt

autos: $(PWD)/src/lib.rs

$(GENR): $(GENR_DEPS)
	cd $(PWD)/generator; $(CARGO) build

$(PWD)/src/lib.rs: $(PWD)/keys.txt $(GENR)
	$(GENR) $(PWD)/keys.txt $(PWD)/src/lib.rs
	$(RUSTFMT) $(PWD)/src/lib.rs
