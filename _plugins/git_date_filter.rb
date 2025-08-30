module Jekyll
  module GitDateFilter
    def git_last_modified(input)
      return input unless input.is_a?(String)
      
      # Get the file path relative to the site source
      file_path = input
      
      # Use git log to get the last commit date for this file
      begin
        # Get the last commit date for the file
        date_cmd = "git log -1 --format=%cd --date=short -- #{file_path}"
        date_output = `#{date_cmd} 2>/dev/null`.strip
        
        if date_output.empty?
          # Fallback to current date if git command fails
          return Time.now.strftime("%B %d, %Y")
        end
        
        # Parse the date and format it
        date = Date.parse(date_output)
        return date.strftime("%B %d, %Y")
      rescue => e
        # Fallback to current date if anything goes wrong
        return Time.now.strftime("%B %d, %Y")
      end
    end
  end
end

Liquid::Template.register_filter(Jekyll::GitDateFilter)
