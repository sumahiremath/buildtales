#!/bin/bash

# Image resizing script for BuildTales blog using macOS sips
# Resizes banner images to proper dimensions for different card types

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Dimensions for different card types
RECENT_WIDTH=400
RECENT_HEIGHT=140
BLOG_WIDTH=400
BLOG_HEIGHT=160
SERIES_WIDTH=400
SERIES_HEIGHT=200

# Source and output directories
SOURCE_DIR="assets/banners"
OUTPUT_DIR="assets/banners/resized"

# Create output directory if it doesn't exist
mkdir -p "$OUTPUT_DIR"

echo -e "${YELLOW}Starting image resizing process...${NC}"

# Function to resize an image
resize_image() {
    local input_file="$1"
    local output_file="$2"
    local width="$3"
    local height="$4"

    # First resize to the larger dimension to maintain aspect ratio
    if sips -s format jpeg -Z "$width" "$input_file" --out "$output_file" > /dev/null 2>&1; then
        # Then crop to exact dimensions
        sips -c "$height" "$width" "$output_file" > /dev/null 2>&1

        # Verify the final dimensions
        local actual_width=$(sips -g pixelWidth "$output_file" | tail -1 | cut -d: -f2 | xargs)
        local actual_height=$(sips -g pixelHeight "$output_file" | tail -1 | cut -d: -f2 | xargs)

        if [ "$actual_width" -eq "$width" ] && [ "$actual_height" -eq "$height" ]; then
            echo -e "${GREEN}✅ Resized: $(basename "$input_file") -> ${width}x${height}${NC}"
            return 0
        else
            echo -e "${RED}❌ Failed to achieve correct dimensions: ${actual_width}x${actual_height} (expected ${width}x${height})${NC}"
            return 1
        fi
    else
        echo -e "${RED}❌ Error resizing $(basename "$input_file")${NC}"
        return 1
    fi
}

# Prompt user for a specific file or process the directory
read -p "Enter the file name to resize (leave blank to process all files in the directory): " input_file

# Counter for successful operations
success_count=0
total_operations=0

if [ -n "$input_file" ]; then
    # If a specific file is provided
    if [ -f "$SOURCE_DIR/$input_file" ]; then
        echo -e "${YELLOW}Processing: $input_file${NC}"
        filename=$(basename "$input_file")
        basename_no_ext="${filename%.*}"

        # Create resized versions for each card type
        if resize_image "$SOURCE_DIR/$input_file" "$OUTPUT_DIR/${basename_no_ext}-recent.jpg" "$RECENT_WIDTH" "$RECENT_HEIGHT"; then
            ((success_count++))
        fi
        ((total_operations++))

        if resize_image "$SOURCE_DIR/$input_file" "$OUTPUT_DIR/${basename_no_ext}-blog.jpg" "$BLOG_WIDTH" "$BLOG_HEIGHT"; then
            ((success_count++))
        fi
        ((total_operations++))

        if resize_image "$SOURCE_DIR/$input_file" "$OUTPUT_DIR/${basename_no_ext}-series.jpg" "$SERIES_WIDTH" "$SERIES_HEIGHT"; then
            ((success_count++))
        fi
        ((total_operations++))
    else
        echo -e "${RED}❌ File not found: $SOURCE_DIR/$input_file${NC}"
        exit 1
    fi
else
    # Process all files in the directory
    for input_file in "$SOURCE_DIR"/*.{jpg,jpeg,png,webp}; do
        # Check if file exists (in case no files match the pattern)
        if [ ! -f "$input_file" ]; then
            continue
        fi

        # Skip hidden files
        if [[ $(basename "$input_file") == .* ]]; then
            continue
        fi

        filename=$(basename "$input_file")
        basename_no_ext="${filename%.*}"

        echo -e "${YELLOW}Processing: $filename${NC}"

        # Create resized versions for each card type
        if resize_image "$input_file" "$OUTPUT_DIR/${basename_no_ext}-recent.jpg" "$RECENT_WIDTH" "$RECENT_HEIGHT"; then
            ((success_count++))
        fi
        ((total_operations++))

        if resize_image "$input_file" "$OUTPUT_DIR/${basename_no_ext}-blog.jpg" "$BLOG_WIDTH" "$BLOG_HEIGHT"; then
            ((success_count++))
        fi
        ((total_operations++))

        if resize_image "$input_file" "$OUTPUT_DIR/${basename_no_ext}-series.jpg" "$SERIES_WIDTH" "$SERIES_HEIGHT"; then
            ((success_count++))
        fi
        ((total_operations++))

        echo ""
    done
fi

echo -e "${GREEN}🎉 Image resizing complete!${NC}"
echo -e "${GREEN}✅ Successfully processed $success_count/$total_operations operations${NC}"
echo -e "${YELLOW}📁 Resized images saved to: $OUTPUT_DIR${NC}"
echo ""
echo -e "${YELLOW}Usage:${NC}"
echo "- Use \`-recent.jpg\` files for recent post cards (${RECENT_WIDTH}x${RECENT_HEIGHT})"
echo "- Use \`-blog.jpg\` files for blog post cards (${BLOG_WIDTH}x${BLOG_HEIGHT})"
echo "- Use \`-series.jpg\` files for series cards (${SERIES_WIDTH}x${SERIES_HEIGHT})"if [ -n "$input_file" ]; then
    # If a specific file is provided
    if [ -f "$SOURCE_DIR/$input_file" ]; then
        echo -e "${YELLOW}Processing: $input_file${NC}"
        filename=$(basename "$input_file")
        basename_no_ext="${filename%.*}"

        # Create resized versions for each card type
        if resize_image "$SOURCE_DIR/$input_file" "$OUTPUT_DIR/${basename_no_ext}-recent.jpg" "$RECENT_WIDTH" "$RECENT_HEIGHT"; then
            ((success_count++))
        fi
        ((total_operations++))

        if resize_image "$SOURCE_DIR/$input_file" "$OUTPUT_DIR/${basename_no_ext}-blog.jpg" "$BLOG_WIDTH" "$BLOG_HEIGHT"; then
            ((success_count++))
        fi
        ((total_operations++))

        if resize_image "$SOURCE_DIR/$input_file" "$OUTPUT_DIR/${basename_no_ext}-series.jpg" "$SERIES_WIDTH" "$SERIES_HEIGHT"; then
            ((success_count++))
        fi
        ((total_operations++))

        # Exit after processing the specific file
        echo -e "${GREEN}🎉 Processing complete for the specified file.${NC}"
        exit 0
    else
        echo -e "${RED}❌ File not found: $SOURCE_DIR/$input_file${NC}"
        exit 1
    fi
fi#!/bin/bash

# Image resizing script for BuildTales blog using macOS sips
# Resizes banner images to proper dimensions for different card types

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Dimensions for different card types
RECENT_WIDTH=400
RECENT_HEIGHT=140
BLOG_WIDTH=400
BLOG_HEIGHT=160
SERIES_WIDTH=400
SERIES_HEIGHT=200

# Source and output directories
SOURCE_DIR="assets/banners"
OUTPUT_DIR="assets/banners/resized"

# Create output directory if it doesn't exist
mkdir -p "$OUTPUT_DIR"

echo -e "${YELLOW}Starting image resizing process...${NC}"

# Function to resize an image
resize_image() {
    local input_file="$1"
    local output_file="$2"
    local width="$3"
    local height="$4"
    
    # First resize to the larger dimension to maintain aspect ratio
    if sips -s format jpeg -Z "$width" "$input_file" --out "$output_file" > /dev/null 2>&1; then
        # Then crop to exact dimensions
        sips -c "$height" "$width" "$output_file" > /dev/null 2>&1
        
        # Verify the final dimensions
        local actual_width=$(sips -g pixelWidth "$output_file" | tail -1 | cut -d: -f2 | xargs)
        local actual_height=$(sips -g pixelHeight "$output_file" | tail -1 | cut -d: -f2 | xargs)
        
        if [ "$actual_width" -eq "$width" ] && [ "$actual_height" -eq "$height" ]; then
            echo -e "${GREEN}✅ Resized: $(basename "$input_file") -> ${width}x${height}${NC}"
            return 0
        else
            echo -e "${RED}❌ Failed to achieve correct dimensions: ${actual_width}x${actual_height} (expected ${width}x${height})${NC}"
            return 1
        fi
    else
        echo -e "${RED}❌ Error resizing $(basename "$input_file")${NC}"
        return 1
    fi
}

# Counter for successful operations
success_count=0
total_operations=0

# Process each image file
for input_file in "$SOURCE_DIR"/*.{jpg,jpeg,png,webp}; do
    # Check if file exists (in case no files match the pattern)
    if [ ! -f "$input_file" ]; then
        continue
    fi
    
    # Skip hidden files
    if [[ $(basename "$input_file") == .* ]]; then
        continue
    fi
    
    filename=$(basename "$input_file")
    basename_no_ext="${filename%.*}"
    
    echo -e "${YELLOW}Processing: $filename${NC}"
    
    # Create resized versions for each card type
    if resize_image "$input_file" "$OUTPUT_DIR/${basename_no_ext}-recent.jpg" "$RECENT_WIDTH" "$RECENT_HEIGHT"; then
        ((success_count++))
    fi
    ((total_operations++))
    
    if resize_image "$input_file" "$OUTPUT_DIR/${basename_no_ext}-blog.jpg" "$BLOG_WIDTH" "$BLOG_HEIGHT"; then
        ((success_count++))
    fi
    ((total_operations++))
    
    if resize_image "$input_file" "$OUTPUT_DIR/${basename_no_ext}-series.jpg" "$SERIES_WIDTH" "$SERIES_HEIGHT"; then
        ((success_count++))
    fi
    ((total_operations++))
    
    echo ""
done

echo -e "${GREEN}🎉 Image resizing complete!${NC}"
echo -e "${GREEN}✅ Successfully processed $success_count/$total_operations operations${NC}"
echo -e "${YELLOW}📁 Resized images saved to: $OUTPUT_DIR${NC}"
echo ""
echo -e "${YELLOW}Usage:${NC}"
echo "- Use \`-recent.jpg\` files for recent post cards (${RECENT_WIDTH}x${RECENT_HEIGHT})"
echo "- Use \`-blog.jpg\` files for blog post cards (${BLOG_WIDTH}x${BLOG_HEIGHT})"
echo "- Use \`-series.jpg\` files for series cards (${SERIES_WIDTH}x${SERIES_HEIGHT})"
