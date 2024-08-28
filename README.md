# HTML to Dart Jaspr Converter

This project provides a web-based tool to convert HTML into Dart components using the [Jaspr](https://github.com/schultek/jaspr) framework. The tool features a side-by-side editor interface powered by Ace Editor, allowing users to write HTML on the left and see the generated Dart code on the right.

## LIVE DEMO
https://www.agusibrah.im/htmltodart_jaspr/

## Features

- **Side-by-Side Editors**: Use Ace Editor to write HTML and see the converted Dart Jaspr code side-by-side.
- **Auto-Formatting**: Automatically formats the HTML code upon pasting.
- **Syntax Validation**: Validates HTML syntax and displays errors using Ace Editor's built-in capabilities.
- **Persistence**: Saves the HTML content to `localStorage` on change, allowing the user to resume editing from where they left off.

## Getting Started

### Prerequisites

- **Dart SDK**: Make sure you have Dart installed. You can download it from [dart.dev](https://dart.dev/get-dart).

### Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/agusibrahim/htmltodart_jaspr.git
   cd htmltodart_jaspr
   ```

2. Install dependencies (if any). For now, this project does not require any additional dependencies besides Dart.

### Compiling to WebAssembly

This project includes a Dart script (`bin/htmltodart_jaspr.dart`) that can be compiled into WebAssembly to power the converter. 

To compile the Dart script to WebAssembly:

1. Make sure you are in the root directory of the project.
2. Use the provided `Makefile` to compile:

   ```bash
   make
   ```

   This will generate a `jasprconverter.wasm` file inside the `web` directory.

3. The generated WebAssembly file can then be used within the web application to perform the HTML to Dart conversion.

### Running the Web Application

You can serve the `web` directory using any static file server or deploy it as a GitHub Pages site.

### Usage

1. Open the web application in your browser.
2. In the left editor, paste or write your HTML code.
3. The converted Dart code for Jaspr will appear in the right editor.
4. You can then copy the Dart code and use it in your Jaspr project.

## Acknowledgements

- **[Jaspr Framework](https://github.com/schultek/jaspr)**: For providing the tools to build powerful and reactive Dart applications.
- **[Ace Editor](https://ace.c9.io/)**: For the powerful code editor used in this project.
- **[jaspr_html_convert](https://github.com/tazatechnology/jaspr_html_convert)**: This project uses the engine converter from this repository to handle the HTML to Dart conversion.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request or open an issue if you encounter any bugs or have suggestions for improvements.
