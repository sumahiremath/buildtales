require 'spec_helper'

RSpec.describe "Posts" do
  describe "Front Matter Validation" do
    let(:posts) { site.posts.docs }

    it "has posts" do
      expect(posts).not_to be_empty
    end

    posts.each do |post|
      context "#{post.data['title'] || post.basename}" do
        it "has a title" do
          expect(post.data['title']).to be_present
        end

        it "has a date" do
          expect(post.data['date']).to be_present
        end

        it "has categories" do
          expect(post.data['categories']).to be_present
          expect(post.data['categories']).to be_an(Array)
          expect(post.data['categories']).not_to be_empty
        end

        it "has an excerpt" do
          expect(post.data['excerpt']).to be_present
          expect(post.data['excerpt'].length).to be > 10
        end

        it "has tags" do
          expect(post.data['tags']).to be_present
          expect(post.data['tags']).to be_an(Array)
        end

        it "has a valid date format" do
          date = post.data['date']
          expect(date).to be_a(Date)
          expect(date.year).to be_between(2020, 2030)
        end

        it "has valid categories" do
          valid_categories = %w[leadership management payments ach systems engineering fintech]
          post.data['categories'].each do |category|
            expect(valid_categories).to include(category.downcase)
          end
        end

        it "has content" do
          expect(post.content.strip).not_to be_empty
        end

        it "has proper markdown structure" do
          content = post.content
          expect(content).to include('#') # Should have at least one heading
          expect(content).to include('##') # Should have subsections
        end
      end
    end
  end

  describe "Content Quality" do
    posts.each do |post|
      context "#{post.data['title']}" do
        it "has a reasonable excerpt length" do
          excerpt = post.data['excerpt']
          expect(excerpt.length).to be_between(50, 300)
        end

        it "has proper heading hierarchy" do
          content = post.content
          lines = content.split("\n")
          heading_levels = lines.select { |line| line.start_with?('#') }
          
          heading_levels.each_with_index do |heading, index|
            next if index == 0
            current_level = heading.count('#')
            prev_level = heading_levels[index - 1].count('#')
            expect(current_level - prev_level).to be <= 1
          end
        end
      end
    end
  end

  describe "Series Organization" do
    let(:leadership_posts) { posts.select { |p| p.data['categories']&.include?('leadership') } }
    let(:payments_posts) { posts.select { |p| p.data['categories']&.include?('payments') } }
    let(:ach_posts) { posts.select { |p| p.data['categories']&.include?('ach') } }

    it "has leadership posts with proper sections" do
      leadership_posts.each do |post|
        if post.data['section']
          valid_sections = ['Vision & Planning', 'Strategies & Tactics', 'Execute & Assess']
          expect(valid_sections).to include(post.data['section'])
        end
      end
    end

    it "has payments posts with proper phases" do
      payments_posts.each do |post|
        if post.data['section']
          expect(post.data['section']).to match(/Phase \d+/)
        end
      end
    end

    it "has ACH posts with proper phases" do
      ach_posts.each do |post|
        if post.data['section']
          expect(post.data['section']).to match(/Phase \d+/)
        end
      end
    end
  end
end
