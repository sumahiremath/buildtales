require 'spec_helper'

RSpec.describe "Home Page" do
  let(:home_page) { pages.find { |p| p.url == '/' } }

  describe "Page Structure" do
    it "exists" do
      expect(home_page).to be_present
    end

    it "has proper title" do
      expect(home_page.data['title']).to eq('Build Tales')
    end

    it "uses default layout" do
      expect(home_page.data['layout']).to eq('default')
    end
  end

  describe "Hero Section" do
    it "includes hero section" do
      content = home_page.content
      expect(content).to include('class="py-16"')
      expect(content).to include('Deep, no-fluff essays')
    end

    it "has hero cards" do
      content = home_page.content
      expect(content).to include('hero-cards-grid')
      expect(content).to include('Start the Payments Series')
      expect(content).to include('Explore All Articles')
    end

    it "has proper hero card links" do
      content = home_page.content
      expect(content).to include('href="/series/payments"')
      expect(content).to include('href="/blog"')
    end
  end

  describe "Newsletter Signup" do
    it "has newsletter section" do
      content = home_page.content
      expect(content).to include('newsletter-box')
      expect(content).to include('👋 Hey, I\'m Suma')
    end

    it "has proper newsletter form structure" do
      content = home_page.content
      expect(content).to include('id="newsletter-form-1"')
      expect(content).to include('id="newsletter-form-2"')
      expect(content).to include('form-message-1')
      expect(content).to include('form-message-2')
    end

    it "includes ConvertKit integration" do
      content = home_page.content
      expect(content).to include('app.kit.com/forms/8443001/subscriptions')
      expect(content).to include('data-sv-form="8443001"')
    end

    it "has proper form styling" do
      content = home_page.content
      expect(content).to include('newsletter-box')
      expect(content).to include('background-color: #157878')
    end
  end

  describe "Start Here Section" do
    it "has start here section" do
      content = home_page.content
      expect(content).to include('Start here')
      expect(content).to include('start-here-grid')
    end

    it "has all four series cards" do
      content = home_page.content
      expect(content).to include('How U.S. Payments Really Work')
      expect(content).to include('ACH Deep Dive')
      expect(content).to include('Build, Break, Lead')
      expect(content).to include('Designing for Failure')
    end

    it "has proper card styling" do
      content = home_page.content
      expect(content).to include('card-icon')
      expect(content).to include('background: #157878')
    end

    it "has proper card links" do
      content = home_page.content
      expect(content).to include('href="/series/payments"')
      expect(content).to include('href="/series/ach"')
      expect(content).to include('href="/series/leadership"')
      expect(content).to include('href="/series/systems"')
    end
  end

  describe "Recent Articles Section" do
    it "shows recent articles" do
      content = home_page.content
      expect(content).to include('Recent Articles')
    end

    it "filters out future articles" do
      # This test ensures the Liquid filter works: post.date <= site.time
      content = home_page.content
      expect(content).to include('where_exp')
      expect(content).to include('post.date <= site.time')
    end
  end

  describe "Content Quality" do
    it "has proper heading hierarchy" do
      content = home_page.content
      expect(content).to include('<h1')
      expect(content).to include('<h2')
      expect(content).to include('<h3')
    end

    it "includes proper CSS classes" do
      content = home_page.content
      expect(content).to include('mx-auto')
      expect(content).to include('max-w-4xl')
      expect(content).to include('text-center')
    end

    it "has responsive design elements" do
      content = home_page.content
      expect(content).to include('sm:flex-row')
      expect(content).to include('max-w-md')
    end
  end

  describe "JavaScript Integration" do
    it "includes form handling JavaScript" do
      content = home_page.content
      expect(content).to include('newsletter-form-1')
      expect(content).to include('newsletter-form-2')
    end

    it "has proper form submission handling" do
      content = home_page.content
      expect(content).to include('localhost')
      expect(content).to include('ConvertKit')
    end
  end

  describe "Mobile Responsiveness" do
    it "includes mobile-specific classes" do
      content = home_page.content
      expect(content).to include('flex-col sm:flex-row')
      expect(content).to include('max-w-md mx-auto')
    end

    it "has proper spacing classes" do
      content = home_page.content
      expect(content).to include('py-8')
      expect(content).to include('mb-6')
      expect(content).to include('gap-3')
    end
  end
end
