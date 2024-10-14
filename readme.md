# Directory Traversal and File Content Extractor

This Ruby script traverses a directory structure, extracts the content of each file, and combines everything into a single output file. It's particularly useful for preparing project structures and code content for input into Large Language Models (LLMs).

## Features

- Recursively traverses directories
- Captures relative file paths
- Extracts full content of each file
- Combines all information into a single output file
- Configurable input directory and output file
- Command-line interface for easy use

## Requirements

- Ruby (version 2.0 or higher recommended)

## Installation

1. Clone this repository or download the `directory_traversal.rb` file.
2. Make the script executable:
   ```
   chmod +x directory_traversal.rb
   ```

## Usage

Run the script from the command line:

```
./directory_traversal.rb [options]
```

### Options

- `-d, --directory DIR`: Specify the directory to traverse (default: current directory)
- `-o, --output FILE`: Specify the output file (default: project_structure_and_content.txt)
- `-h, --help`: Show the help message

### Examples

1. Traverse the current directory with default settings:
   ```
   ./directory_traversal.rb
   ```

2. Traverse a specific directory:
   ```
   ./directory_traversal.rb -d /path/to/your/project
   ```

3. Specify a custom output file:
   ```
   ./directory_traversal.rb -o custom_output.txt
   ```

4. Traverse a specific directory and use a custom output file:
   ```
   ./directory_traversal.rb -d /path/to/your/project -o custom_output.txt
   ```

## Output

The script generates a text file (default: `project_structure_and_content.txt`) containing:

- Relative path of each file
- Full content of each file
- Separator lines between files for easy parsing

## Notes

- Large projects may generate very large output files. Ensure you have sufficient disk space.
- Binary files are included in the output, which may result in unreadable content for those files.
- Symlinks are followed, which could potentially lead to infinite loops if there are circular references.

## Contributing

Feel free to fork this project and submit pull requests with improvements or bug fixes.

## License

This script is provided "as is", without warranty of any kind. You are free to use, modify, and distribute it as needed.