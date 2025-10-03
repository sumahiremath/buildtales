const https = require('https');

exports.handler = async (event, context) => {
  // Only allow POST requests
  if (event.httpMethod !== 'POST') {
    return {
      statusCode: 405,
      body: JSON.stringify({ error: 'Method not allowed' })
    };
  }

  try {
    const { token, formData } = JSON.parse(event.body);
    
    if (!token) {
      return {
        statusCode: 400,
        body: JSON.stringify({ error: 'reCAPTCHA token is required' })
      };
    }

    // Verify reCAPTCHA token with Google
    const recaptchaResult = await verifyRecaptcha(token);
    
    if (!recaptchaResult.success) {
      return {
        statusCode: 400,
        body: JSON.stringify({ 
          error: 'reCAPTCHA verification failed',
          details: recaptchaResult
        })
      };
    }

    // If reCAPTCHA passes, submit to Formspree
    const formspreeResult = await submitToFormspree(formData);
    
    return {
      statusCode: 200,
      headers: {
        'Access-Control-Allow-Origin': '*',
        'Access-Control-Allow-Headers': 'Content-Type',
        'Access-Control-Allow-Methods': 'POST, OPTIONS'
      },
      body: JSON.stringify({
        success: true,
        recaptcha: recaptchaResult,
        formspree: formspreeResult
      })
    };

  } catch (error) {
    console.error('Error:', error);
    return {
      statusCode: 500,
      body: JSON.stringify({ 
        error: 'Internal server error',
        message: error.message 
      })
    };
  }
};

async function verifyRecaptcha(token) {
  const secretKey = process.env.RECAPTCHA_SECRET_KEY;
  
  if (!secretKey) {
    throw new Error('RECAPTCHA_SECRET_KEY environment variable is required');
  }

  const url = 'https://www.google.com/recaptcha/api/siteverify';
  
  return new Promise((resolve, reject) => {
    const postData = `secret=${secretKey}&response=${token}`;
    
    const options = {
      hostname: 'www.google.com',
      path: '/recaptcha/api/siteverify',
      method: 'POST',
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Content-Length': Buffer.byteLength(postData)
      }
    };

    const req = https.request(options, (res) => {
      let data = '';
      
      res.on('data', (chunk) => {
        data += chunk;
      });
      
      res.on('end', () => {
        try {
          const result = JSON.parse(data);
          
          // Check if verification was successful
          if (result.success) {
            resolve({
              success: true,
              score: result.score || 0.5, // v3 provides score, v2 doesn't
              action: result.action || 'contact_form',
              hostname: result.hostname,
              challenge_ts: result.challenge_ts,
              response: result
            });
          } else {
            resolve({
              success: false,
              error: 'reCAPTCHA verification failed',
              errorCodes: result['error-codes'] || [],
              response: result
            });
          }
        } catch (parseError) {
          reject(new Error(`Failed to parse reCAPTCHA response: ${parseError.message}`));
        }
      });
    });

    req.on('error', (error) => {
      reject(new Error(`reCAPTCHA request failed: ${error.message}`));
    });

    req.write(postData);
    req.end();
  });
}

async function submitToFormspree(formData) {
  const formspreeUrl = 'https://formspree.io/f/xblkbevy';
  
  return new Promise((resolve, reject) => {
    const postData = new URLSearchParams(formData).toString();
    
    const options = {
      method: 'POST',
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Content-Length': Buffer.byteLength(postData)
      }
    };

    const req = https.request(formspreeUrl, options, (res) => {
      let data = '';
      
      res.on('data', (chunk) => {
        data += chunk;
      });
      
      res.on('end', () => {
        if (res.statusCode >= 200 && res.statusCode < 300) {
          resolve({
            success: true,
            status: res.statusCode,
            response: data
          });
        } else {
          resolve({
            success: false,
            status: res.statusCode,
            response: data
          });
        }
      });
    });

    req.on('error', (error) => {
      reject(new Error(`Formspree request failed: ${error.message}`));
    });

    req.write(postData);
    req.end();
  });
}

// Handle CORS preflight requests
exports.handler = async (event, context) => {
  if (event.httpMethod === 'OPTIONS') {
    return {
      statusCode: 200,
      headers: {
        'Access-Control-Allow-Origin': '*',
        'Access-Control-Allow-Headers': 'Content-Type',
        'Access-Control-Allow-Methods': 'POST, OPTIONS'
      },
      body: ''
    };
  }
  
  return exports.handler(event, context);
};
