---
layout: default
title: Search
permalink: /search/
---

<style>
.search-container {
  max-width: 800px;
  margin: 0 auto;
}

.search-box {
  width: 100%;
  padding: 12px 16px;
  font-size: 16px;
  border: 2px solid #157878;
  border-radius: 4px;
  margin-bottom: 1rem;
  box-sizing: border-box;
}

.search-box:focus {
  outline: none;
  border-color: #0f5f5f;
  box-shadow: 0 0 5px rgba(21, 120, 120, 0.3);
}

.search-stats {
  color: #666;
  font-size: 0.9rem;
  margin-bottom: 1.5rem;
}

.search-result {
  border-bottom: 1px solid #eee;
  padding: 1.5rem 0;
  margin-bottom: 0;
}

.search-result:last-child {
  border-bottom: none;
}

.search-result h3 {
  margin: 0 0 0.5rem 0;
  font-size: 1.2rem;
}

.search-result h3 a {
  color: #157878;
  text-decoration: none;
}

.search-result h3 a:hover {
  text-decoration: underline;
}

.search-result-meta {
  color: #666;
  font-size: 0.9rem;
  margin: 0.25rem 0;
}

.search-result-excerpt {
  color: #555;
  line-height: 1.5;
  margin: 0.5rem 0 0 0;
}

.search-highlight {
  background-color: #fff3cd;
  padding: 1px 2px;
  border-radius: 2px;
}

.no-results {
  text-align: center;
  color: #666;
  font-style: italic;
  margin: 2rem 0;
}

.loading {
  text-align: center;
  color: #666;
  margin: 2rem 0;
}

@media (max-width: 768px) {
  .search-box {
    font-size: 16px; /* Prevents zoom on iOS */
  }
}
</style>

<div class="search-container">
  <h1>Search Articles</h1>
  <p>Find articles on fintech, engineering leadership, payments, and systems design.</p>
  
  <input type="text" id="search-input" class="search-box" placeholder="Search for articles..." autocomplete="off">
  
  <div id="search-stats" class="search-stats" style="display: none;"></div>
  <div id="search-results"></div>
</div>

<script>
(function() {
  let searchData = [];
  let searchInput = document.getElementById('search-input');
  let searchResults = document.getElementById('search-results');
  let searchStats = document.getElementById('search-stats');
  
  // Load search data
  function loadSearchData() {
    fetch('/search.json')
      .then(response => response.json())
      .then(data => {
        searchData = data;
        // Check if there's a search query in URL
        const urlParams = new URLSearchParams(window.location.search);
        const query = urlParams.get('q');
        if (query) {
          searchInput.value = query;
          performSearch(query);
        }
      })
      .catch(error => {
        console.error('Error loading search data:', error);
        searchResults.innerHTML = '<div class="no-results">Error loading search data. Please try again later.</div>';
      });
  }
  
  // Debounce function to limit search frequency
  function debounce(func, wait) {
    let timeout;
    return function executedFunction(...args) {
      const later = () => {
        clearTimeout(timeout);
        func(...args);
      };
      clearTimeout(timeout);
      timeout = setTimeout(later, wait);
    };
  }
  
  // Highlight search terms in text
  function highlightText(text, searchTerm) {
    if (!searchTerm || !text) return text;
    const regex = new RegExp(`(${escapeRegex(searchTerm)})`, 'gi');
    return text.replace(regex, '<span class="search-highlight">$1</span>');
  }
  
  // Escape regex special characters
  function escapeRegex(string) {
    return string.replace(/[.*+?^${}()|[\]\\]/g, '\\$&');
  }
  
  // Score search results
  function scoreResult(post, searchTerms) {
    let score = 0;
    const titleWeight = 10;
    const excerptWeight = 5;
    const contentWeight = 1;
    const categoryWeight = 8;
    const tagWeight = 6;
    
    searchTerms.forEach(term => {
      const regex = new RegExp(escapeRegex(term), 'gi');
      
      // Title matches
      const titleMatches = (post.title.match(regex) || []).length;
      score += titleMatches * titleWeight;
      
      // Category matches
      if (post.categories) {
        post.categories.forEach(category => {
          const categoryMatches = (category.match(regex) || []).length;
          score += categoryMatches * categoryWeight;
        });
      }
      
      // Tag matches
      if (post.tags) {
        post.tags.forEach(tag => {
          const tagMatches = (tag.match(regex) || []).length;
          score += tagMatches * tagWeight;
        });
      }
      
      // Excerpt matches
      const excerptMatches = (post.excerpt.match(regex) || []).length;
      score += excerptMatches * excerptWeight;
      
      // Content matches (limited to avoid performance issues)
      const contentSample = post.content.substring(0, 1000);
      const contentMatches = (contentSample.match(regex) || []).length;
      score += contentMatches * contentWeight;
    });
    
    return score;
  }
  
  // Perform search
  function performSearch(query) {
    if (!query || query.trim().length < 2) {
      searchResults.innerHTML = '';
      searchStats.style.display = 'none';
      updateURL('');
      return;
    }
    
    const searchTerms = query.trim().toLowerCase().split(/\s+/);
    let results = [];
    
    searchData.forEach(post => {
      const score = scoreResult(post, searchTerms);
      if (score > 0) {
        results.push({ ...post, score });
      }
    });
    
    // Sort by score (highest first)
    results.sort((a, b) => b.score - a.score);
    
    displayResults(results, query);
    updateURL(query);
  }
  
  // Display search results
  function displayResults(results, query) {
    if (results.length === 0) {
      searchResults.innerHTML = '<div class="no-results">No articles found matching your search.</div>';
      searchStats.style.display = 'none';
      return;
    }
    
    // Show stats
    const resultCount = results.length;
    const statsText = `Found ${resultCount} article${resultCount === 1 ? '' : 's'} matching "${query}"`;
    searchStats.textContent = statsText;
    searchStats.style.display = 'block';
    
    // Generate results HTML
    const resultsHTML = results.map(post => {
      const highlightedTitle = highlightText(post.title, query);
      const highlightedExcerpt = highlightText(post.excerpt, query);
      
      return `
        <article class="search-result">
          <h3><a href="${post.url}">${highlightedTitle}</a></h3>
          <div class="search-result-meta">${post.date}</div>
          <div class="search-result-excerpt">${highlightedExcerpt}</div>
        </article>
      `;
    }).join('');
    
    searchResults.innerHTML = resultsHTML;
  }
  
  // Update URL with search query
  function updateURL(query) {
    const url = new URL(window.location);
    if (query) {
      url.searchParams.set('q', query);
    } else {
      url.searchParams.delete('q');
    }
    window.history.replaceState({}, '', url);
  }
  
  // Event listeners
  const debouncedSearch = debounce((query) => performSearch(query), 300);
  
  searchInput.addEventListener('input', (e) => {
    debouncedSearch(e.target.value);
  });
  
  searchInput.addEventListener('keypress', (e) => {
    if (e.key === 'Enter') {
      performSearch(e.target.value);
    }
  });
  
  // Initialize
  loadSearchData();
})();
</script>
