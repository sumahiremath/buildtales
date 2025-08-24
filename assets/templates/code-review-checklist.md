# AI-Assisted Code Review Checklist

## Overview
This checklist ensures AI-generated code meets quality standards and follows team best practices. Use it for both AI-assisted reviews and human reviews of AI-generated code.

---

## Pre-Review Setup

### ✅ Context Preparation
- [ ] AI has access to relevant files and context
- [ ] Review scope is clearly defined
- [ ] AI understands project requirements
- [ ] Relevant documentation is available
- [ ] Previous review feedback is considered

### 🤖 AI Configuration
- [ ] Cursor Rules are up-to-date
- [ ] AI has proper project context
- [ ] Review guidelines are clear
- [ ] Quality thresholds are set
- [ ] Review focus areas are specified

---

## Code Quality Review

### 🏗️ Architecture & Design
- [ ] Code follows established patterns
- [ ] Separation of concerns is maintained
- [ ] Dependencies are properly managed
- [ ] Code is modular and reusable
- [ ] Design principles are followed (SOLID, DRY, etc.)

### 📝 Code Style & Standards
- [ ] Follows team coding standards
- [ ] Consistent naming conventions
- [ ] Proper formatting and indentation
- [ ] No code duplication
- [ ] Functions are focused and small

### 🔒 Security & Safety
- [ ] Input validation is implemented
- [ ] Authentication/authorization is proper
- [ ] Sensitive data is protected
- [ ] SQL injection is prevented
- [ ] XSS vulnerabilities are avoided
- [ ] Rate limiting is implemented
- [ ] Error messages don't leak information

### 🧪 Testing & Coverage
- [ ] Unit tests are present and passing
- [ ] Test coverage meets requirements (>80%)
- [ ] Edge cases are tested
- [ ] Error scenarios are covered
- [ ] Integration tests are included
- [ ] Test data is properly managed

---

## AI-Specific Review Items

### 🤖 AI Generation Quality
- [ ] Code is logically sound
- [ ] No hallucinated APIs or libraries
- [ ] Generated code follows best practices
- [ ] AI didn't introduce anti-patterns
- [ ] Code is maintainable and readable

### 🔍 Context Understanding
- [ ] AI understood the requirements correctly
- [ ] Generated code fits the existing architecture
- [ ] No conflicts with existing patterns
- [ ] Dependencies are properly identified
- [ ] Integration points are correct

### 📚 Documentation & Comments
- [ ] Complex logic is explained
- [ ] API endpoints are documented
- [ ] Configuration options are clear
- [ ] Usage examples are provided
- [ ] Comments explain "why" not "what"

---

## Performance & Scalability

### ⚡ Performance
- [ ] No obvious performance bottlenecks
- [ ] Efficient algorithms are used
- [ ] Database queries are optimized
- [ ] Caching is implemented where appropriate
- [ ] Resource usage is reasonable

### 📈 Scalability
- [ ] Code can handle increased load
- [ ] No hardcoded limits that could cause issues
- [ ] Resource usage scales appropriately
- [ ] Database connections are managed properly
- [ ] Async operations are handled correctly

---

## Error Handling & Resilience

### 🚨 Error Handling
- [ ] Errors are caught and handled gracefully
- [ ] User-friendly error messages are provided
- [ ] Errors are logged for debugging
- [ ] Fallback mechanisms are in place
- [ ] Error states don't crash the application

### 🔄 Resilience
- [ ] Code handles edge cases gracefully
- [ ] Network failures are handled
- [ ] Timeout scenarios are considered
- [ ] Retry logic is implemented where appropriate
- [ ] Circuit breakers are used for external services

---

## Accessibility & User Experience

### ♿ Accessibility
- [ ] ARIA labels are properly implemented
- [ ] Keyboard navigation is supported
- [ ] Color contrast meets standards
- [ ] Screen reader compatibility is ensured
- [ ] Focus management is proper

### 👥 User Experience
- [ ] Loading states are implemented
- [ ] Error states are user-friendly
- [ ] Success feedback is provided
- [ ] User input is validated clearly
- [ ] Responsive design is maintained

---

## Compliance & Standards

### 📋 Industry Standards
- [ ] Follows language/framework best practices
- [ ] Meets industry security standards
- [ ] Complies with relevant regulations
- [ ] Uses recommended libraries and tools
- [ ] Follows established design patterns

### 🏢 Team Standards
- [ ] Follows team coding guidelines
- [ ] Meets project-specific requirements
- [ ] Uses established naming conventions
- [ ] Follows team architecture patterns
- [ ] Meets team quality thresholds

---

## Review Process

### 🔍 Review Execution
- [ ] AI review is completed first
- [ ] Human review validates AI findings
- [ ] All checklist items are reviewed
- [ ] Issues are documented clearly
- [ ] Priority levels are assigned to issues

### 📝 Feedback Documentation
- [ ] Issues are clearly described
- [ ] Suggested fixes are provided
- [ ] Context and reasoning are explained
- [ ] Examples are given where helpful
- [ ] Follow-up actions are specified

### ✅ Review Completion
- [ ] All critical issues are resolved
- [ ] Code meets quality standards
- [ ] Tests are passing
- [ ] Documentation is updated
- [ ] Review is approved by reviewer

---

## AI Review Prompts

### 🎯 Effective Review Prompts
Use these prompts to get better AI reviews:

**General Review:**
```
Review this code for quality, security, and best practices. Focus on:
- Code quality and maintainability
- Security vulnerabilities
- Performance issues
- Testing coverage
- Documentation quality
```

**Security-Focused Review:**
```
Perform a security-focused code review. Check for:
- Input validation issues
- Authentication/authorization problems
- Data exposure risks
- Injection vulnerabilities
- Security best practices
```

**Performance Review:**
```
Review this code for performance issues. Look for:
- Inefficient algorithms
- Database query problems
- Memory leaks
- Resource usage issues
- Optimization opportunities
```

**Architecture Review:**
```
Review the architecture and design of this code. Consider:
- Design patterns used
- Separation of concerns
- Code organization
- Maintainability
- Scalability
```

---

## Quality Gates

### 🚦 Review Approval Criteria
**Must Pass:**
- [ ] All critical security issues resolved
- [ ] All critical bugs fixed
- [ ] Test coverage meets minimum requirements
- [ ] Code follows team standards
- [ ] Performance meets requirements

**Should Pass:**
- [ ] All major issues resolved
- [ ] Documentation is complete
- [ ] Code is well-structured
- [ ] Error handling is comprehensive
- [ ] Accessibility requirements met

**Nice to Have:**
- [ ] Code is optimized for performance
- [ ] Additional tests are included
- [ ] Documentation is exemplary
- [ ] Code follows best practices perfectly
- [ ] Performance exceeds requirements

---

## Post-Review Actions

### 📋 Issue Resolution
- [ ] All issues are tracked in issue management system
- [ ] Priority levels are assigned
- [ ] Assignees are designated
- [ ] Deadlines are set
- [ ] Progress is monitored

### 🔄 Follow-up
- [ ] Code changes are reviewed after fixes
- [ ] Quality gates are re-checked
- [ ] Performance impact is measured
- [ ] User feedback is collected
- [ ] Lessons learned are documented

---

## Continuous Improvement

### 📊 Metrics Tracking
- [ ] Review completion time
- [ ] Issues found per review
- [ ] Time to resolve issues
- [ ] Code quality scores
- [ ] Team satisfaction with reviews

### 🎯 Process Improvement
- [ ] Review process is regularly evaluated
- [ ] AI review effectiveness is measured
- [ ] Team feedback is collected
- [ ] Process improvements are implemented
- [ ] Best practices are shared

---

## Template Usage

### 📝 How to Use This Checklist
1. **Copy this template** for each review
2. **Customize** based on project needs
3. **Use AI assistance** to complete reviews faster
4. **Validate AI findings** with human review
5. **Track progress** through completion
6. **Share learnings** with the team

### 🔄 Customization
- Add project-specific requirements
- Adjust quality thresholds
- Include team-specific standards
- Add compliance requirements
- Modify review focus areas

---

*This checklist is a living document. Update it based on team feedback and project requirements.*
