# READMEOverview
This project consists of a simple web interface that allows users to select a county in Kenya and view the constituencies within that county. The interface is built using HTML and JavaScript, and it provides dynamic dropdowns for selecting counties and their corresponding constituencies.

Files
index.html

This file contains the HTML structure of the web page. It includes a dropdown for selecting a county and another dropdown that populates with the constituencies of the selected county.
The JavaScript file county.js is linked to handle the dynamic interaction between the county and constituency selections.
county.js

This JavaScript file contains the logic for dynamically updating the constituencies dropdown based on the county selected by the user.
It includes a data object constituencyData that maps counties to their respective constituencies.
Features
County Selection: Users can select a county from a dropdown list.
Constituency Population: Upon selecting a county, the constituencies dropdown will automatically populate with the constituencies from the selected county.
County Display: When a user selects a constituency, the corresponding county is automatically selected in the counties dropdown.
How to Use
Open the index.html file in your web browser.
Select a county from the "Select a County" dropdown.
The "Select a Constituency" dropdown will automatically update with the constituencies belonging to the selected county.
Select a constituency from the updated dropdown.
The "Select a County" dropdown will automatically select the corresponding county.
How It Works
The constituencyData object in county.js maps each county to an array of its constituencies.
The showConstituencies() function is triggered when a county is selected. It clears the existing options in the constituencies dropdown and then populates it with the constituencies corresponding to the selected county.
The showCounty() function is triggered when a constituency is selected. It checks which county the selected constituency belongs to and updates the county dropdown accordingly.
Customization
To add more counties and constituencies, simply update the constituencyData object in the county.js file.
You can also modify the HTML structure in index.html to suit your needs, such as adding more styling or additional elements.
Compatibility
This project is compatible with modern web browsers that support HTML5 and JavaScript.
Conclusion
This simple project allows users to explore Kenyan counties and their constituencies through an interactive web interface. It can be extended and customized as needed to include more counties, constituencies, or additional features.





## Overview

This script is designed to process files within a specified source directory, specifically handling PDF and Excel files. The script checks if the files have valid filenames according to a predefined pattern, organizes them into appropriate subdirectories, and performs specific operations depending on the file type.

## Prerequisites

- Ensure you have `bash` installed on your system.

## Directory Structure

The script operates based on the following directory structure:

- `source/`: This is the root directory where the script looks for files.
- `Processed/`: This is the directory where all processed files will be moved or copied.
  - `PDFs/`: Contains all valid PDF files.
    - `Valid/`: Contains all PDF files with valid filenames.
  - `Non-PDFs/`: Contains all non-PDF files.

## Functions

### `is_pdf(file)`
- **Description**: Checks if the provided file is a PDF.
- **Parameters**: 
  - `file`: The file to be checked.
- **Returns**: `1` if the file is a PDF, `0` otherwise.

### `is_excel(file)`
- **Description**: Checks if the provided file is an Excel file.
- **Parameters**: 
  - `file`: The file to be checked.
- **Returns**: `1` if the file is an Excel file, `0` otherwise.

### `is_valid_file_name(file_name)`
- **Description**: Validates the filename against a specific pattern.
- **Parameters**: 
  - `file_name`: The name of the file to be validated.
- **Returns**: `0` if the filename is valid, `1` otherwise.

### `create_dir_by_series(series)`
- **Description**: Creates a directory structure based on the series identifier extracted from the file name.
- **Parameters**: 
  - `series`: A string representing the series to be used for directory creation.

## Usage

1. **Place the script in the root directory** where the `source/` directory is located.
2. **Run the script** using the following command:
   ```bash
   ./script_name.sh
   ```
3. **Monitor the output**: The script will create the necessary directories under `Processed/` and move valid files into them.

## Notes

- The `is_pdf()` and `is_excel()` functions currently have placeholder logic for checking file types. You need to implement actual file type checking.
- The script is set to operate on all files found in the `source/` directory and its subdirectories.
- Filenames must match the following pattern to be considered valid: 
  ```
  F(34-39)[A-D]-XXX-XXX-XXXX-XXX-XX
  ```

## Error Handling

- If the `Processed/PDFs/Valid/` directory does not exist, the script will output an error message.
  
## To-Do

- Implement the actual PDF and Excel file type checking in the `is_pdf()` and `is_excel()` functions.
- Enhance error handling to cover more potential issues.

## Conclusion

This script helps in organizing and processing files, specifically focusing on PDFs and Excel files, by validating their filenames and categorizing them accordingly.
