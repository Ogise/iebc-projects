
#!/bin/bash

# Define the directories
processed_dir="./Processed"
valid_subdirectory="Valid"

# Create Processed directory if it doesn't exist
mkdir -p "$processed_dir"

##FUNCTIONS
# Function to check if the file is a PDF (dummy function, needs real implementation)
is_pdf() {
    local file="$1"
    # Implement actual PDF checking logic here
    if [[ "$file" == *.pdf ]]; then  # This is a simple placeholder check
		return 1;
	else
		return 0;
	fi
}

# Function to check if the file is a PDF (dummy function, needs real implementation)
is_excel() {
    local file="$1"
    # Implement actual Excel file checking logic here
    if [[ "$file" == *.xls || "$file" == *.xlsx ]]; then
		return 1;
	else
		return 0;
	fi
	
}		
	
	
# Function to check if the file name is valid
is_valid_file_name() {
    local file_name="$1"
    
    # Define the regex pattern for the valid file name
    local pattern='^F(3[4-9])[A-D]-[0-9]{3}-[0-9]{3}-[0-9]{4}-[0-9]{3}-[0-9]{2}$'
    
    # Use the pattern to check the file name
    if [[ $file_name =~ $pattern ]]; then
        return 0  # Valid
		#echo "the file is valid"
    else
        return 1  # Invalid
		#echo "the file is invalid"
    fi
}

#Formulate directory path
create_dir_by_series() {
    series="$1"
    form_type="${series:0:3}"  # Extract form type
    form_series="${series:3:1}"    # Use full series as the form series name
    form_county_code="${series:5:3}"
	form_const_code="${series:9:3}"
		
	if [[ "$form_series" == "A" ]]; then
		#return 1;
		form_path = form_type/form_series/form_county_code/form_const_code
	else
	    #return 0;
		form_path = form_type/form_series/form_county_code
	fi
	
	
    form_type_dir="$valid_dir/$form_type"
    form_series_dir="$form_type_dir/$form_series"
    
    if [ ! -d "$form_type_dir" ]; then
        mkdir -p "$form_type_dir"
        echo "Created directory: $form_type_dir"
    else
        echo "Directory already exists: $form_type_dir"
    fi
    
    if [ ! -d "$form_series_dir" ]; then
        mkdir -p "$form_series_dir"
        echo "Created directory: $form_series_dir"
    else
        echo "Directory already exists: $form_series_dir"
    fi
}	
#### END OF FUNCTIONS


# Loop through source directory and its subdirectories
find source -type f | while read -r file; do
    # Check if file is a PDF
    if is_pdf "$file"; then
		
		# Create PDF directory inside Processed if it doesn't exist
		pdf_dir="$processed_dir/PDFs"
		mkdir -p "$pdf_dir"


        # Extract filename from the path
        filename=$(basename "$file")

        # Check if the filename is valid
        if is_valid_file_name "$filename"; then
            echo "Moving '$filename' to '$valid_dir'."
			# Formulate file path
            #mv "$file" "$valid_dir"
			
            # Move the file to Valid directory
            #mv "$file" "$valid_dir"
        fi
	else
		echo "Not PDF"
		pdf_dir="$processed_dir/Non-PDFs"
		mkdir -p "$pdf_dir"
    fi
	
	
	

	
	
	
	
	
	
	exit


# Check if the 'Processed/PDF/Valid' directory exists
if [ -d "$valid_dir" ]; then
    echo "Subdirectory 'Valid' exists inside 'Processed/PDF'."
else
    echo "Error: The '$valid_dir' directory does not exist."
	fi
# Create Valid directory inside PDF if it doesn't exist
valid_dir="$pdf_dir/$valid_subdirectory"
mkdir -p "$valid_dir"


exit
# Loop through each form series (replace "form_series.txt" with your actual file)
while IFS= read -r series; do
  create_dir_by_series "$series"
done < "form_series.txt"

echo "Directory structure creation completed."
    exit 
done
