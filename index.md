---
layout: default
title: Build Tales
---

  <!-- Hero Section -->
  <section class="py-16">
  <div class="mx-auto max-w-3xl px-4">
    <div class="hero-content">
      <!-- Hero Image (right side on desktop) -->
      <div class="hero-image">
        <img src="/assets/images/blogger.jpg" alt="Mouse working on laptop with sleeping cat" class="hero-mascot">
      </div>
      
      <!-- Hero Text Content (left side on desktop) -->
      <div class="hero-text">
        <h2 class="text-2xl font-semibold mb-6">Leadership lessons from code to culture</h2>
        <p class="hero-description">From debugging code to guiding teams, these essays share the hard-won lessons of building systems, scaling payments, and leading with clarity.</p>
        <!-- Subscribe Form -->
        <div class="hero-newsletter">

          <form id="newsletter-form-1" action="https://app.kit.com/forms/8443001/subscriptions" method="post" class="hero-form" data-sv-form="8443001" data-uid="8443001" data-format="inline" data-version="5">
            <input type="email" name="email_address" placeholder="Enter your email" required class="hero-input">
            <button type="submit" class="hero-button">Subscribe</button>
          </form>
          <div id="form-message-1" class="form-message"></div>
        </div>
      </div>
    </div>
  </div>
</section>


<!-- Start Here Section -->
<section class="py-8">
  <div class="mx-auto max-w-5xl">
    <h2 class="text-2xl font-semibold mb-6 text-center">Start here</h2>
    <div class="start-here-grid">
      <a class="start-here-card" href="/series/payments">
        <div class="teacher-image">
          <img src="/assets/images/teacher.jpg" alt="teacher mouse" class="hero-mascot">
        </div>
         <h3 class="font-semibold mb-2">How U.S. Payments Really Work</h3>
         <p class="opacity-80 text-sm">Demystify the rails moving trillions daily.</p>
       </a>

       <a class="start-here-card" href="/series/leadership">
          <div class="leader-image">
            <img src="/assets/images/leader.jpg" alt="leader mouse" class="hero-mascot">
          </div>
         <h3 class="font-semibold mb-2">Build, Break, Lead</h3>
         <p class="opacity-80 text-sm">Lessons from the trenches of engineering leadership.</p>
       </a>
       <a class="start-here-card" href="/series/systems">
          <div class="designer-image">
            <img src="/assets/images/builder.jpg" alt="designer mouse" class="hero-mascot">
          </div>
         <h3 class="font-semibold mb-2">Designing for Failure</h3>
         <p class="opacity-80 text-sm">Patterns for resilient systems that don’t go down.</p>
       </a>
       <a class="start-here-card" href="/blog">
          <div class="designer-image">
            <img src="/assets/images/explorer.jpg" alt="explorer mouse" class="hero-mascot">
          </div>         <h3 class="font-semibold mb-2">All Articles</h3>
         <p class="opacity-80 text-sm">Browse all engineering leadership, systems, and payment articles</p>
       </a>
    </div>
  </div>
</section>

<!-- Staff + Systems Thinking Signup Card -->
<section style="padding-top: 1.25em; padding-bottom: 8px; padding-left: 0; padding-right: 0; text-align: center;" class="py-8">
  <div class="mx-auto max-w-4xl px-4">
    <div class="newsletter-box">
    <div class="text-center">
      <h3 class="text-xl font-semibold text-gray-800 mb-3 text-center">Don't miss when Build, Break, Lead drops</h3>
      <p class="text-gray-600 mb-6 text-lg">Subscribe and I'll send it straight to you.</p>
      <form id="newsletter-form-2" action="https://app.kit.com/forms/8443001/subscriptions" method="post" class="convertkit-form flex flex-col sm:flex-row gap-3 max-w-md mx-auto; flex justify-center" data-sv-form="8443001" data-uid="8443001" data-format="inline" data-version="5">
        <input type="email" name="email_address" placeholder="Enter your email" required 
               class="flex-1 px-4 py-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:border-transparent text-base shadow-sm">
        <button type="submit" 
                class="px-8 py-3 text-white font-semibold rounded-lg transition-all duration-200 focus:outline-none focus:ring-2 focus:ring-offset-2 text-base whitespace-nowrap shadow-sm hover:shadow-md transform hover:-translate-y-0.5"
                style="background-color: #157878; border-color: #157878; color: white;"
                onmouseover="this.style.backgroundColor='#0f6b6b'; this.style.color='white';"
                onmouseout="this.style.backgroundColor='#157878'; this.style.color='white';">
          Subscribe
        </button>
      </form>
      <div id="form-message-2" style="margin-top: 1rem; font-size: 0.9rem; display: none; text-align: center;"></div>
    </div>
    </div>
  </div>
</section>

<!-- Recent Articles Section -->
<section class="py-8">
  <div class="mx-auto max-w-3xl">
    <h2 class="text-2xl font-semibold mb-6">Recent Articles</h2>
    <div class="recent-posts-grid">
      {% assign current_date = site.time | date: '%s' %}
      {% assign published_posts = site.posts | where_exp: "post", "post.date <= site.time" | sort: 'date' | reverse %}
      {% for post in published_posts limit:4 %}
      <a href="{{ post.url }}" class="post-card-link">
        <article class="post-card">
          <!-- Clean Banner Image -->
          <div class="post-banner" 
               {% if post.banner_image %}
               style="background-image: url('{{ post.banner_image | relative_url }}');"
               {% else %}
               style="background: {{ post.banner_color | default: '#157878' }};"
               {% endif %}>
          </div>
          
          <div class="post-content">
            <!-- Date and Series Info -->
            <div class="post-meta">
              <span class="post-date">{{ post.date | date: "%b %d, %Y" }}</span>
              {% if post.series.name %}
              <span class="post-series">{{ post.series.name }} Part {{ post.series.part }}</span>
              {% endif %}
            </div>
            
            <h2 class="post-title">{{ post.title }}</h2>
            
            <p class="post-excerpt">{{ post.excerpt | strip_html | truncatewords: 25 }}</p>
            
            <div class="post-footer">
              {% if post.categories %}
              <div class="post-categories">
                {% for category in post.categories %}
                <span class="category-tag">{{ category | capitalize }}</span>
                {% endfor %}
              </div>
              {% endif %}
            </div>
          </div>
        </article>
      </a>
      {% endfor %}
    </div>
    
    <!-- See All Articles Link -->
    <div class="see-all-articles">
      <a href="/blog" class="see-all-link">See all articles →</a>
    </div>
  </div>
</section>

<style>
/* Custom styles for this page */

/* Hero Section Layout */
.hero-content {
  display: flex;
  align-items: center;
  gap: 4rem;
  text-align: left;
  flex-direction: row-reverse;
}

.hero-image {
  flex: 0 0 auto;
}

.hero-mascot {
  width: 350px;
  height: auto;
  max-width: 100%;
  object-fit: cover;
  border-radius: 12px;
}

.hero-text {
  flex: 1;
  max-width: 600px;
}

.hero-title {
  font-size: 4rem;
  font-weight: 700;
  color: #111827;
  margin: 0 0 1.5rem 0;
  line-height: 1.1;
  text-align: center;
}

.hero-description {
  font-size: 1.25rem;
  color: #4b5563;
  line-height: 1.6;
  margin: 0 0 2rem 0;
}

.hero-newsletter {
  margin-top: 2rem;
}

.hero-form {
  display: flex;
  gap: 0.75rem;
  max-width: 400px;
}

.hero-input {
  flex: 1;
  padding: 0.875rem 1rem;
  border: 2px solid #e5e7eb;
  border-radius: 8px;
  font-size: 1rem;
  transition: border-color 0.2s ease;
}

.hero-input:focus {
  outline: none;
  border-color: #157878;
  box-shadow: 0 0 0 3px rgba(21, 120, 120, 0.1);
}

.hero-button {
  padding: 0.875rem 1.5rem;
  background-color: #157878;
  color: white;
  border: none;
  border-radius: 8px;
  font-size: 1rem;
  font-weight: 600;
  cursor: pointer;
  transition: all 0.2s ease;
  white-space: nowrap;
}

.hero-button:hover {
  background-color: #0f6b6b;
  transform: translateY(-1px);
}

.form-message {
  margin-top: 0.75rem;
  font-size: 0.875rem;
  display: none;
}

/* Mobile Responsive */
@media (max-width: 768px) {
  .hero-content {
    flex-direction: column;
    text-align: center;
    gap: 2rem;
  }
  
  .hero-title {
    font-size: 3rem;
  }
  
  .hero-description {
    font-size: 1.125rem;
  }
  
  .hero-form {
    flex-direction: column;
    align-items: center;
  }
  
  .hero-input,
  .hero-button {
    width: 100%;
    max-width: 300px;
  }
}

.container {
  display: flex;
  margin-top: 1em;
  justify-content: center;
  align-items: center;
  text-align: center; /* Optional: Center text inside */
}

/* Newsletter Box Styling */
.newsletter-box {
  background: #f8fafc;
  border: 1px solid #e2e8f0;
  border-radius: 12px;
  padding: 2rem;
  margin: 1rem 0;
  box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
}

/* Recent Articles - Finshots Style */
.recent-posts-grid {
  display: grid;
  grid-template-columns: repeat(2, 1fr);
  gap: 1.5rem;
  margin-top: 1.5rem;
}

/* See All Articles Link */
.see-all-articles {
  text-align: center;
  margin-top: 2rem;
}

.see-all-link {
  color: #157878;
  text-decoration: none;
  font-size: 1.125rem;
  font-weight: 600;
  transition: color 0.2s ease;
}

.see-all-link:hover {
  color: #157878;
  text-decoration: underline;
}

/* Ensure cards don't nest and display properly */
.recent-posts-grid .post-card-link {
  display: block;
  width: 100%;
}

.recent-posts-grid .post-card {
  width: 100%;
  position: relative;
}

/* Post Card Link - Entire Card Clickable */
.post-card-link {
  display: block !important;
  text-decoration: none;
  color: inherit;
  transition: all 0.2s ease;
  width: 100%;
  height: 100%;
}

.post-card-link:hover {
  text-decoration: none;
  color: inherit;
}

.post-card {
  background: white;
  border: 1px solid #e5e7eb;
  border-radius: 12px;
  overflow: hidden;
  transition: all 0.2s ease;
  box-shadow: 0 1px 3px rgba(0, 0, 0, 0.05);
  height: 100%;
  display: flex;
  flex-direction: column;
}

.post-card-link:hover .post-card {
  border-color: var(--accent);
  box-shadow: 0 8px 24px rgba(0, 0, 0, 0.12);
  transform: translateY(-2px);
}

/* Clean Post Banner */
.post-banner {
  height: 160px;
  background-size: cover;
  background-position: center;
  background-repeat: no-repeat;
}

.post-content {
  padding: 1.5rem;
  display: flex;
  flex-direction: column;
  flex: 1;
}

.post-content .post-meta {
  display: flex;
  align-items: center;
  gap: 0.75rem;
  margin-bottom: 0.75rem;
}

.post-date {
  font-size: 0.875rem;
  color: #6b7280;
  font-weight: 500;
}

.post-series {
  font-size: 0.75rem;
  background: #f3f4f6;
  color: #374151;
  padding: 0.25rem 0.5rem;
  border-radius: 4px;
  font-weight: 500;
}

.post-title {
  margin: 0 0 0.75rem 0;
  font-size: 1.25rem;
  font-weight: 600;
  line-height: 1.3;
  color: #111827;
  transition: color 0.2s ease;
}

.post-card-link:hover .post-title {
  color: var(--accent);
}

.post-excerpt {
  color: #4b5563;
  line-height: 1.6;
  margin: 0 0 1rem 0;
  font-size: 0.95rem;
  flex: 1;
  display: -webkit-box;
  -webkit-line-clamp: 3;
  -webkit-box-orient: vertical;
  overflow: hidden;
  text-overflow: ellipsis;
}

.post-footer {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding-top: 0.75rem;
  border-top: 1px solid #f3f4f6;
  margin-top: auto;
}

.post-categories {
  display: flex;
  gap: 0.5rem;
}

.category-tag {
  font-size: 0.75rem;
  background: #157878;
  color: #ffffff;
  padding: 0.25rem 0.5rem;
  border-radius: 12px;
  font-weight: 500;
}

/* Start Here Section - 4 Cards Layout */
.start-here-grid {
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  gap: 1.5rem;
  margin-top: 2rem;
}

.start-here-card {
  background: white;
  border: 2px solid #e5e7eb;
  border-radius: 12px;
  padding: 1.5rem 1rem;
  text-decoration: none;
  color: inherit;
  display: flex;
  flex-direction: column;
  align-items: center;
  text-align: center;
  transition: all 0.3s ease;
  position: relative;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.05);
  min-height: 180px;
}

.start-here-card:hover {
  transform: translateY(-3px);
  box-shadow: 0 8px 20px rgba(0, 0, 0, 0.12);
  border-color: var(--accent);
  text-decoration: none;
}

.card-icon {
  width: 50px;
  height: 50px;
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 20px;
  margin-bottom: 1rem;
}

.start-here-card h3 {
  color: #333;
  margin-bottom: 0.5rem;
  font-size: 1rem;
  line-height: 1.3;
}

.start-here-card p {
  color: #666;
  margin-bottom: 1rem;
  flex-grow: 1;
  font-size: 0.875rem;
}


}

@media (max-width: 768px) {
  .start-here-grid {
    grid-template-columns: repeat(2, 1fr);
    gap: 1.25rem;
  }
  
  .start-here-card {
    padding: 1.25rem 1rem;
    min-height: 160px;
  }
  
  .card-icon {
    width: 45px;
    height: 45px;
    font-size: 18px;
  }
}

@media (max-width: 480px) {
  .start-here-grid {
    grid-template-columns: 1fr;
    gap: 1rem;
  }
  
  .start-here-card {
    padding: 1rem;
    min-height: 140px;
  }
}

@media (max-width: 768px) {
  .start-here-grid {
    grid-template-columns: 1fr;
    gap: 1rem;
  }
}

/* Newsletter and subscription mobile adjustments - only vertical spacing */
@media (max-width: 640px) {
  .newsletter-box {
    margin: 1.5rem 0;
    padding: 1em;
  }
  
  /* Hero section mobile adjustments - only vertical spacing */
  .hero-section {
    padding: 2rem 1rem;
  }
  
  /* Section spacing consistency - only vertical */
  section {
    padding: 2rem 1rem;
  }
  
  .py-8 {
    padding-top: 2rem;
    padding-bottom: 2rem;
  }
}

/* Hero Cards - Card-style CTAs */
.hero-cards-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
  gap: 2rem;
  margin-top: 3rem;
  max-width: 800px;
  margin-left: auto;
  margin-right: auto;
}

.hero-card {
  background: white;
  border: 2px solid #e5e7eb;
  border-radius: 16px;
  padding: 2rem;
  text-decoration: none;
  color: inherit;
  display: flex;
  flex-direction: column;
  align-items: center;
  text-align: center;
  transition: all 0.3s ease;
  position: relative;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
  min-height: 200px;
}

.hero-card:hover {
  transform: translateY(-4px);
  box-shadow: 0 12px 32px rgba(0, 0, 0, 0.15);
  text-decoration: none;
}

.hero-card.primary {
  border-color: #157878;
  background: linear-gradient(135deg, #157878 0%, #1a8a8a 100%);
  color: white;
}

.hero-card.primary:hover {
  box-shadow: 0 12px 32px rgba(21, 120, 120, 0.3);
  color: white;
}

.hero-card.secondary {
  border-color: #157878;
}

.hero-card.secondary:hover {
  border-color: #157878;
  background: #f8fffe;
}

.hero-card-icon {
  font-size: 2.5rem;
  margin-bottom: 1rem;
  display: flex;
  align-items: center;
  justify-content: center;
}

.hero-card h3 {
  font-size: 1.25rem;
  font-weight: 600;
  margin: 0 0 0.75rem 0;
  color: inherit;
}

.hero-card p {
  font-size: 0.95rem;
  opacity: 0.9;
  margin: 0 0 1.5rem 0;
  flex-grow: 1;
  color: inherit;
}

.hero-card-action {
  font-size: 0.9rem;
  font-weight: 600;
  opacity: 0.8;
  text-transform: uppercase;
  letter-spacing: 0.5px;
}

/* Card styles */
.card {
  display: block;
  text-decoration: none;
  color: inherit;
}

.card h3 {
  color: #333;
}

.card:hover {
  text-decoration: none;
}

.card:hover h3 {
  color: var(--accent);
}

.flex {
  display: flex;
}

.justify-center {
  justify-content: center;
}

.gap-3 {
  gap: 12px;
}

/* Mobile responsive */
@media (max-width: 640px) {
  .hero-cards-grid {
    grid-template-columns: 1fr;
    gap: 1.5rem;
    margin-top: 2rem;
  }
  
  .hero-card {
    padding: 1.5rem;
    min-height: 160px;
  }
  
  .hero-card-icon {
    font-size: 2rem;
    margin-bottom: 0.75rem;
  }
  
  .hero-card h3 {
    font-size: 1.125rem;
  }
  
  .flex {
    flex-direction: column;
    align-items: center;
  }
  
  .btn-primary,
  .btn-secondary {
    width: 100%;
    max-width: 300px;
    text-align: center;
  }
}

@media (max-width: 768px) {
  .recent-posts-grid {
    grid-template-columns: 1fr;
    gap: 1.25rem;
  }
  
  .start-here-grid {
    grid-template-columns: repeat(2, 1fr);
    gap: 1.25rem;
  }
}
</style>

<script>
document.addEventListener('DOMContentLoaded', function() {
  // Handle both newsletter forms
  function setupForm(formId, messageId) {
    const form = document.getElementById(formId);
    const messageDiv = document.getElementById(messageId);
    
    if (form) {
      // Wait a bit for ConvertKit to load, then override its behavior
      setTimeout(() => {
        // Remove any existing ConvertKit event listeners
        const newForm = form.cloneNode(true);
        form.parentNode.replaceChild(newForm, form);
        
        // Add our custom handler to the new form
        newForm.addEventListener('submit', function(e) {
          e.preventDefault();
          e.stopPropagation();
          
          const email = newForm.querySelector('input[name="email_address"]').value;
          const button = newForm.querySelector('button[type="submit"]');
          const originalButtonText = button.textContent;
          
          if (!email || !email.includes('@')) {
            showMessage(messageDiv, '❌ Please enter a valid email address.', 'error');
            return;
          }
          
          // Show loading state
          button.textContent = 'Subscribing...';
          button.disabled = true;
          
          // Check if we're on localhost
          if (window.location.hostname === 'localhost' || window.location.hostname === '127.0.0.1') {
            // Simulate form submission for localhost
            setTimeout(() => {
              showMessage(messageDiv, '✅ Thanks for subscribing! (Localhost simulation)', 'success');
              newForm.reset();
              button.textContent = originalButtonText;
              button.disabled = false;
            }, 1000);
          } else {
            // Production submission using ConvertKit API
            const formData = new FormData();
            formData.append('email_address', email);
            formData.append('form', '8443001');
            
            fetch('https://app.kit.com/forms/8443001/subscriptions', {
              method: 'POST',
              body: formData,
              mode: 'no-cors' // This is important for ConvertKit
            })
            .then(() => {
              // Since we're using no-cors, we can't read the response
              // But ConvertKit typically succeeds if the request goes through
              showMessage(messageDiv, '✅ Thanks for subscribing! Welcome to the community.', 'success');
              newForm.reset();
            })
            .catch(error => {
              console.error('Subscription error:', error);
              showMessage(messageDiv, '❌ Something went wrong. Please try again.', 'error');
            })
            .finally(() => {
              button.textContent = originalButtonText;
              button.disabled = false;
            });
          }
        });
      }, 1000); // Wait 1 second for ConvertKit to load
    }
  }
  
  function showMessage(messageDiv, text, type) {
    if (messageDiv) {
      messageDiv.textContent = text;
      messageDiv.style.display = 'block';
      messageDiv.style.color = type === 'success' ? '#059669' : '#dc2626';
      messageDiv.style.fontWeight = '500';
      
      // Hide message after 5 seconds
      setTimeout(() => {
        messageDiv.style.display = 'none';
      }, 5000);
    }
  }
  
  // Setup both forms
  setupForm('newsletter-form-1', 'form-message-1');
  setupForm('newsletter-form-2', 'form-message-2');
});
</script>
