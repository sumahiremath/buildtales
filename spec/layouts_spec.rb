require 'spec_helper'

RSpec.describe "Layouts and Templates" do
  describe "Default Layout" do
    let(:default_layout) { layouts['default'] }

    it "exists" do
      expect(default_layout).to be_present
    end

    it "has proper HTML structure" do
      content = default_layout.content
      expect(content).to include('<!DOCTYPE html>')
      expect(content).to include('<html')
      expect(content).to include('<head>')
      expect(content).to include('<body>')
      expect(content).to include('</html>')
    end

    it "includes required meta tags" do
      content = default_layout.content
      expect(content).to include('<meta charset="UTF-8">')
      expect(content).to include('<meta name="viewport"')
      expect(content).to include('og:title')
      expect(content).to include('og:description')
      expect(content).to include('og:image')
    end

    it "includes navigation" do
      content = default_layout.content
      expect(content).to include('Home')
      expect(content).to include('Series')
      expect(content).to include('Articles')
      expect(content).to include('About')
      expect(content).to include('Subscribe')
    end

    it "includes search functionality" do
      content = default_layout.content
      expect(content).to include('header-search')
      expect(content).to include('Search articles')
    end

    it "includes footer" do
      content = default_layout.content
      expect(content).to include('footer-container')
      expect(content).to include('© 2025 BuildTales.Dev')
    end

    it "includes social media icons" do
      content = default_layout.content
      expect(content).to include('LinkedIn')
      expect(content).to include('Email')
      expect(content).to include('RSS Feed')
    end
  end

  describe "Custom Footer Include" do
    let(:custom_footer) { includes['custom-footer'] }

    it "exists" do
      expect(custom_footer).to be_present
    end

    it "has proper footer structure" do
      content = custom_footer.content
      expect(content).to include('footer-container')
      expect(content).to include('footer-nav')
      expect(content).to include('footer-connect')
      expect(content).to include('footer-copyright')
    end

    it "includes all navigation links" do
      content = custom_footer.content
      expect(content).to include('href="/"')
      expect(content).to include('href="/series"')
      expect(content).to include('href="/blog"')
      expect(content).to include('href="/about"')
      expect(content).to include('href="/subscribe"')
    end

    it "includes social media links" do
      content = custom_footer.content
      expect(content).to include('linkedin.com/in/sumamanjunath')
      expect(content).to include('href="/feed.xml"')
    end
  end

  describe "CSS and Styling" do
    let(:default_layout) { layouts['default'] }

    it "includes CSS styling" do
      content = default_layout.content
      expect(content).to include('<style>')
      expect(content).to include('</style>')
    end

    it "has responsive design rules" do
      content = default_layout.content
      expect(content).to include('@media')
      expect(content).to include('max-width')
    end

    it "includes proper color scheme" do
      content = default_layout.content
      expect(content).to include('#157878') # Primary teal color
    end
  end

  describe "JavaScript Functionality" do
    let(:default_layout) { layouts['default'] }

    it "includes ConvertKit integration" do
      content = default_layout.content
      expect(content).to include('convertkit')
      expect(content).to include('ck.5.js')
    end

    it "includes reCAPTCHA" do
      content = default_layout.content
      expect(content).to include('recaptcha')
      expect(content).to include('g-recaptcha')
    end

    it "includes search functionality" do
      content = default_layout.content
      expect(content).to include('header-search')
    end
  end
end
