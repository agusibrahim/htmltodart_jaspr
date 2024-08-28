# Makefile to compile Dart to WebAssembly

# Variables
DART_FILE=bin/htmltodart_jaspr.dart
OUTPUT_DIR=docs
OUTPUT_FILE=jasprconverter.wasm

# Default target
all: compile

# Compile Dart to WebAssembly
compile:
	dart compile wasm $(DART_FILE) -o $(OUTPUT_DIR)/$(OUTPUT_FILE)

# Clean up generated files
clean:
	rm -f $(OUTPUT_DIR)/$(OUTPUT_FILE)

# Phony targets
.PHONY: all compile clean
