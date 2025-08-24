#!/bin/bash

echo "🧪 Testing BuildTales Site"
echo "=========================="

# Test 1: Build the site
echo "1. Testing Jekyll build..."
if bundle exec jekyll build --quiet; then
    echo "✅ Jekyll build successful"
else
    echo "❌ Jekyll build failed"
    exit 1
fi

# Test 2: Check for future-dated posts
echo "2. Checking for future-dated posts..."
future_posts=()
for file in _posts/*.md; do
    if [ -f "$file" ]; then
        date_line=$(grep "^date:" "$file" | head -1)
        if [[ $date_line =~ date:[[:space:]]*([0-9]{4}-[0-9]{2}-[0-9]{2}) ]]; then
            post_date="${BASH_REMATCH[1]}"
            current_date=$(date +%Y-%m-%d)
            if [[ "$post_date" > "$current_date" ]]; then
                future_posts+=("$file ($post_date)")
            fi
        fi
    fi
done

if [ ${#future_posts[@]} -eq 0 ]; then
    echo "✅ No future-dated posts found"
else
    echo "⚠️  Found future-dated posts:"
    for post in "${future_posts[@]}"; do
        echo "   $post"
    done
fi

# Test 3: Check for missing banner images
echo "3. Checking for missing banner images..."
missing_images=()
for file in _posts/*.md; do
    if [ -f "$file" ]; then
        banner_line=$(grep "^banner_image:" "$file" | head -1)
        if [[ $banner_line =~ banner_image:[[:space:]]*\"([^\"]+)\" ]]; then
            image_path="${BASH_REMATCH[1]}"
            # Remove leading slash and check if file exists
            image_path="${image_path#/}"
            if [ ! -f "$image_path" ]; then
                missing_images+=("$file -> $image_path")
            fi
        fi
    fi
done

if [ ${#missing_images[@]} -eq 0 ]; then
    echo "✅ All banner images found"
else
    echo "⚠️  Missing banner images:"
    for image in "${missing_images[@]}"; do
        echo "   $image"
    done
fi

# Test 4: Check for required front matter
echo "4. Checking post front matter..."
posts_with_issues=()
for file in _posts/*.md; do
    if [ -f "$file" ]; then
        issues=()
        
        # Check for title
        if ! grep -q "^title:" "$file"; then
            issues+=("missing title")
        fi
        
        # Check for date
        if ! grep -q "^date:" "$file"; then
            issues+=("missing date")
        fi
        
        # Check for categories
        if ! grep -q "^categories:" "$file"; then
            issues+=("missing categories")
        fi
        
        # Check for excerpt
        if ! grep -q "^excerpt:" "$file"; then
            issues+=("missing excerpt")
        fi
        
        if [ ${#issues[@]} -gt 0 ]; then
            posts_with_issues+=("$file: ${issues[*]}")
        fi
    fi
done

if [ ${#posts_with_issues[@]} -eq 0 ]; then
    echo "✅ All posts have required front matter"
else
    echo "⚠️  Posts with missing front matter:"
    for issue in "${posts_with_issues[@]}"; do
        echo "   $issue"
    done
fi

# Test 5: Check for broken internal links
echo "5. Checking for broken internal links..."
broken_links=()
for file in _posts/*.md; do
    if [ -f "$file" ]; then
        # Look for internal links like [text](/path)
        while IFS= read -r line; do
            if [[ $line =~ \[([^\]]+)\]\(([^)]+)\) ]]; then
                link_path="${BASH_REMATCH[2]}"
                if [[ $link_path =~ ^/ ]]; then
                    # Internal link, check if target exists
                    target_path="${link_path#/}"
                    if [[ ! -f "$target_path" ]] && [[ ! -d "$target_path" ]]; then
                        broken_links+=("$file -> $link_path")
                    fi
                fi
            fi
        done < "$file"
    fi
done

if [ ${#broken_links[@]} -eq 0 ]; then
    echo "✅ No broken internal links found"
else
    echo "⚠️  Broken internal links:"
    for link in "${broken_links[@]}"; do
        echo "   $link"
    done
fi

# Test 6: Check series page structure
echo "6. Checking series page structure..."
series_pages=("series/payments.md" "series/leadership.md" "series/ach.md" "series/systems.md")
for page in "${series_pages[@]}"; do
    if [ -f "$page" ]; then
        if grep -q "class=\"toc-container\"" "$page"; then
            echo "✅ $page has table of contents"
        else
            echo "⚠️  $page missing table of contents"
        fi
        
        if grep -q "class=\"articles-grid\"" "$page"; then
            echo "✅ $page has articles grid"
        else
            echo "⚠️  $page missing articles grid"
        fi
    else
        echo "❌ $page not found"
    fi
done

echo ""
echo "🎯 Testing completed!"
echo "===================="

# Summary
if [ ${#future_posts[@]} -eq 0 ] && [ ${#missing_images[@]} -eq 0 ] && [ ${#posts_with_issues[@]} -eq 0 ] && [ ${#broken_links[@]} -eq 0 ]; then
    echo "🎉 All tests passed! Your site is ready."
else
    echo "⚠️  Some issues found. Please review the warnings above."
fi
