require 'rspec/core/rake_task'
require 'html-proofer'

# RSpec task
RSpec::Core::RakeTask.new(:spec) do |t|
  t.pattern = 'spec/**/*_spec.rb'
end

# Build task
task :build do
  puts "Building Jekyll site..."
  system('bundle exec jekyll build --quiet')
end

# HTML Proofer task
task :html_proof => :build do
  puts "Running HTML Proofer..."
  HTMLProofer.check_directory("_site", {
    :allow_missing_href => true,
    :allow_hash_href => true,
    :check_html => true,
    :check_img_http => false,
    :url_ignore => [/localhost/, /127\.0\.0\.1/]
  }).run
end

# Full test suite
task :test => [:spec, :html_proof]

# Quick check task
task :check do
  puts "Running quick checks..."
  
  # Check for common issues
  puts "Checking for future-dated posts..."
  future_posts = Dir.glob("_posts/*.md").select do |file|
    content = File.read(file)
    if content.match(/^date:\s*(\d{4}-\d{2}-\d{2})/)
      date = Date.parse($1)
      date > Date.today
    else
      false
    end
  end
  
  if future_posts.any?
    puts "⚠️  Found future-dated posts:"
    future_posts.each { |f| puts "   #{f}" }
  else
    puts "✅ No future-dated posts found"
  end
  
  # Check for missing images
  puts "Checking for missing banner images..."
  posts_with_banners = Dir.glob("_posts/*.md").select do |file|
    content = File.read(file)
    content.match(/banner_image:/)
  end
  
  posts_with_banners.each do |file|
    content = File.read(file)
    if content.match(/banner_image:\s*"([^"]+)"/)
      banner_path = $1
      full_path = "_site#{banner_path}"
      unless File.exist?(full_path)
        puts "⚠️  Missing banner image: #{banner_path} (referenced in #{file})"
      end
    end
  end
  
  puts "✅ Quick checks completed"
end

# Default task
task :default => :test
