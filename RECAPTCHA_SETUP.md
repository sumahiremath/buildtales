# reCAPTCHA Enterprise Setup Guide

This guide will help you set up complete reCAPTCHA Enterprise verification for your contact form.

## 🔑 Required API Keys

You need two keys from Google:

### 1. reCAPTCHA Site Key (Public)
- **Current value:** `6Le2g6crAAAAABrTyFxjbc5sCYhgnUs0Nnxuicw`
- **Used for:** Frontend reCAPTCHA widget
- **Where:** Already configured in your reCAPTCHA admin

### 2. Google Cloud API Key (Private)
- **Used for:** Backend verification with Google's API
- **Where to get:** Google Cloud Console

## 🚀 Getting Your Google Cloud API Key

### Step 1: Enable reCAPTCHA Enterprise API
1. Go to [Google Cloud Console](https://console.cloud.google.com/)
2. Select project: `build-tales-cont-1755298987457`
3. Go to **APIs & Services > Library**
4. Search for "reCAPTCHA Enterprise API"
5. Click **Enable**

### Step 2: Create API Key
1. Go to **APIs & Services > Credentials**
2. Click **+ CREATE CREDENTIALS > API Key**
3. Copy the generated API key
4. **Restrict the key** (recommended):
   - Click on the key to edit
   - Under "API restrictions", select "Restrict key"
   - Choose "reCAPTCHA Enterprise API"
   - Save

## 🔧 Environment Setup

### For Local Development
```bash
export RECAPTCHA_SITE_KEY="6Le2g6crAAAAABrTyFxjbc5sCYhgnUs0Nnxuicw"
export GOOGLE_RECAPTCHA_API_KEY="your_api_key_here"
```

### For Netlify Production
Add these environment variables in Netlify dashboard:

1. Go to your Netlify site dashboard
2. Navigate to **Site settings > Environment variables**
3. Add:
   - `RECAPTCHA_SITE_KEY` = `6Le2g6crAAAAABrTyFxjbc5sCYhgnUs0Nnxuicw`
   - `GOOGLE_RECAPTCHA_API_KEY` = `your_api_key_here`

### For GitHub Pages (Alternative)
If using GitHub Pages, add these secrets:
1. Go to repository **Settings > Secrets and variables > Actions**
2. Add:
   - `RECAPTCHA_SITE_KEY` = `6Le2g6crAAAAABrTyFxjbc5sCYhgnUs0Nnxuicw`
   - `GOOGLE_RECAPTCHA_API_KEY` = `your_api_key_here`

## 🧪 Testing the Setup

### Local Testing
1. Set environment variables
2. Run Jekyll: `bundle exec jekyll serve`
3. Visit: `http://localhost:4000/about/`
4. Fill out and submit the contact form
5. Check browser console for any errors

### Production Testing
1. Deploy to Netlify with environment variables set
2. Test the contact form on your live site
3. Check Netlify function logs for verification results

## 🔍 How It Works

1. **User submits form** → reCAPTCHA Enterprise generates token
2. **Frontend sends** → Token + form data to `/.netlify/functions/verify-recaptcha`
3. **Serverless function** → Verifies token with Google's API
4. **If verified** → Forwards form data to Formspree
5. **Success response** → User sees confirmation message

## 🛠 Troubleshooting

### Common Issues

**"API key not found"**
- Ensure `GOOGLE_RECAPTCHA_API_KEY` is set in Netlify environment variables

**"reCAPTCHA verification failed"**
- Check that your site key matches in both frontend and backend
- Verify the API key has reCAPTCHA Enterprise API enabled

**"CORS errors"**
- The Netlify function handles CORS automatically
- Ensure you're testing on the correct domain

### Debug Mode
Add this to your Netlify function logs:
```javascript
console.log('reCAPTCHA verification result:', result);
```

## 📋 Security Checklist

- ✅ API key is restricted to reCAPTCHA Enterprise API only
- ✅ Site key is domain-restricted in reCAPTCHA admin
- ✅ Environment variables are set in Netlify (not in code)
- ✅ Form submission goes through verification endpoint
- ✅ Proper error handling for failed verifications

## 🎯 Next Steps

1. Get your Google Cloud API key
2. Add it to Netlify environment variables
3. Deploy and test the contact form
4. Monitor Netlify function logs for any issues

Your reCAPTCHA Enterprise setup will then be complete! 🎉
