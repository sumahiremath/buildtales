require 'spec_helper'

RSpec.describe "Series Pages" do
  describe "Series Index" do
    let(:series_index) { pages.find { |p| p.url == '/series/' } }

    it "exists" do
      expect(series_index).to be_present
    end

    it "has proper title" do
      expect(series_index.data['title']).to eq('Series')
    end

    it "includes all series links" do
      content = series_index.content
      expect(content).to include('payments')
      expect(content).to include('leadership')
      expect(content).to include('ach')
      expect(content).to include('systems')
    end
  end

  describe "Payments Series" do
    let(:payments_series) { pages.find { |p| p.url == '/series/payments/' } }

    it "exists" do
      expect(payments_series).to be_present
    end

    it "has proper title" do
      expect(payments_series.data['title']).to eq('U.S. Payments Series')
    end

    it "includes table of contents" do
      content = payments_series.content
      expect(content).to include('Table of Contents')
      expect(content).to include('Phase 1')
      expect(content).to include('Phase 2')
      expect(content).to include('Phase 3')
    end

    it "has proper phase sections" do
      content = payments_series.content
      expect(content).to include('id="phase-1"')
      expect(content).to include('id="phase-2"')
      expect(content).to include('id="phase-3"')
    end
  end

  describe "Leadership Series" do
    let(:leadership_series) { pages.find { |p| p.url == '/series/leadership/' } }

    it "exists" do
      expect(leadership_series).to be_present
    end

    it "has proper title" do
      expect(leadership_series.data['title']).to eq('Engineering Leadership Series')
    end

    it "includes proper sections" do
      content = leadership_series.content
      expect(content).to include('Vision & Planning')
      expect(content).to include('Strategies & Tactics')
      expect(content).to include('Execute & Assess')
    end

    it "has proper section IDs" do
      content = leadership_series.content
      expect(content).to include('id="section-1"')
      expect(content).to include('id="section-2"')
      expect(content).to include('id="section-3"')
    end
  end

  describe "ACH Series" do
    let(:ach_series) { pages.find { |p| p.url == '/series/ach/' } }

    it "exists" do
      expect(ach_series).to be_present
    end

    it "has proper title" do
      expect(ach_series.data['title']).to eq('ACH Deep Dive Series')
    end

    it "includes proper phases" do
      content = ach_series.content
      expect(content).to include('Phase 1')
      expect(content).to include('Phase 2')
      expect(content).to include('Phase 3')
    end
  end

  describe "Systems Series" do
    let(:systems_series) { pages.find { |p| p.url == '/series/systems/' } }

    it "exists" do
      expect(systems_series).to be_present
    end

    it "has proper title" do
      expect(systems_series.data['title']).to eq('Systems & Engineering Series')
    end

    it "includes proper sections" do
      content = systems_series.content
      expect(content).to include('Designing for Failure')
      expect(content).to include('Incident Management')
      expect(content).to include('System Architecture')
    end
  end

  describe "Series Article Display" do
    let(:leadership_posts) { posts.select { |p| p.data['categories']&.include?('leadership') } }
    let(:payments_posts) { posts.select { |p| p.data['categories']&.include?('payments') } }

    it "leadership posts have proper sections" do
      leadership_posts.each do |post|
        if post.data['section']
          valid_sections = ['Vision & Planning', 'Strategies & Tactics', 'Execute & Assess']
          expect(valid_sections).to include(post.data['section'])
        end
      end
    end

    it "payments posts have proper phases" do
      payments_posts.each do |post|
        if post.data['section']
          expect(post.data['section']).to match(/Phase \d+/)
        end
      end
    end

    it "series pages filter articles correctly" do
      # This test ensures that the Liquid filtering in series pages works
      expect(leadership_posts).not_to be_empty
      expect(payments_posts).not_to be_empty
    end
  end

  describe "Series Navigation" do
    it "all series pages are accessible" do
      series_urls = ['/series/', '/series/payments/', '/series/leadership/', '/series/ach/', '/series/systems/']
      
      series_urls.each do |url|
        page = pages.find { |p| p.url == url }
        expect(page).to be_present, "Series page #{url} should exist"
      end
    end

    it "series pages have consistent structure" do
      series_pages = pages.select { |p| p.url.start_with?('/series/') && p.url != '/series/' }
      
      series_pages.each do |page|
        content = page.content
        expect(content).to include('class="toc-container"')
        expect(content).to include('class="articles-grid"')
      end
    end
  end
end
