---
layout: default
title: "Subscribe"
---

<div class="mx-auto max-w-3xl text-center">
  <section class="py-16">
    <h1 class="text-4xl font-bold mb-6">Stay Updated</h1>
    <p class="text-lg opacity-80 mb-8">Get deep dives on engineering leadership, fintech, and systems design delivered to your inbox. No spam, just quality content you can read in 7–12 minutes.</p>
    
    <div class="card" style="max-width: 500px; margin: 0 auto;">
      <h2 class="text-xl font-semibold mb-4">What You'll Get</h2>
      <ul style="text-align: left; margin-bottom: 2rem;">
        <li style="margin-bottom: 0.5rem;">✅ Weekly deep dives on payment systems</li>
        <li style="margin-bottom: 0.5rem;">✅ Engineering leadership insights</li>
        <li style="margin-bottom: 0.5rem;">✅ Real-world systems design lessons</li>
        <li style="margin-bottom: 0.5rem;">✅ Early access to new series</li>
      </ul>
    </div>
  </section>
</div>

<!-- Newsletter Signup Form - Full Width -->
<section class="py-8">
  <div class="mx-auto max-w-5xl px-4">
    <div class="newsletter-box">
        <div class="text-center mb-6">
          <p class="text-lg font-semibold text-gray-800 mb-2" style="font-size: 1.125rem; font-weight: 600; color: #1f2937; margin-bottom: 0.5rem;">👋 Ready to Subscribe?</p>
          <p class="text-gray-600" style="color: #4b5563; line-height: 1.6;">Get new insights every week.</p>
        </div>
        <div class="flex justify-center">
          <form id="subscribe-form" action="https://app.kit.com/forms/8443001/subscriptions" method="post" class="convertkit-form flex flex-col sm:flex-row gap-3 w-full max-w-2xl" data-sv-form="8443001" data-uid="8443001" data-format="inline" data-version="5">
            <input type="email" name="email_address" placeholder="Enter your email" required 
                   class="flex-1 px-4 py-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent text-base shadow-sm">
            <button type="submit" 
                    class="px-8 py-3 text-white font-semibold rounded-lg transition-all duration-200 focus:outline-none focus:ring-2 focus:ring-offset-2 text-base whitespace-nowrap shadow-sm hover:shadow-md transform hover:-translate-y-0.5"
                    style="background-color: #157878; border-color: #157878; color: white;"
                    onmouseover="this.style.backgroundColor='#0f6b6b'; this.style.color='white';"
                    onmouseout="this.style.backgroundColor='#157878'; this.style.color='white';">
              Subscribe
            </button>
          </form>
          <div id="form-message" style="margin-top: 1rem; font-size: 0.9rem; display: none; text-align: center;"></div>
        </div>
    </div>
  </div>
</section>

<style>
ul {
  list-style: none;
  padding: 0;
}

ul li {
  padding-left: 0;
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

.flex {
  display: flex;
}

.justify-center {
  justify-content: center;
}

.gap-3 {
  gap: 12px;
}
</style>

<script>
document.addEventListener('DOMContentLoaded', function() {
  const form = document.getElementById('subscribe-form');
  const messageDiv = document.getElementById('form-message');
  
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
          showMessage('❌ Please enter a valid email address.', 'error');
          return;
        }
        
        // Show loading state
        button.textContent = 'Subscribing...';
        button.disabled = true;
        
        // Check if we're on localhost
        if (window.location.hostname === 'localhost' || window.location.hostname === '127.0.0.1') {
          // Simulate form submission for localhost
          setTimeout(() => {
            showMessage('✅ Thanks for subscribing! (Localhost simulation)', 'success');
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
            showMessage('✅ Thanks for subscribing! Welcome to the community.', 'success');
            newForm.reset();
          })
          .catch(error => {
            console.error('Subscription error:', error);
            showMessage('❌ Something went wrong. Please try again.', 'error');
          })
          .finally(() => {
            button.textContent = originalButtonText;
            button.disabled = false;
          });
        }
      });
    }, 1000); // Wait 1 second for ConvertKit to load
  }
  
  function showMessage(text, type) {
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
});
</script>
