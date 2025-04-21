describe('Users API', () => {
    const baseUrl = 'http://localhost:3000';
  
    it('should return empty array on GET /users initially', () => {
      cy.request(`${baseUrl}/users`)
        .its('body')
        .should('deep.equal', []);
    });
  
    it('should create a user on POST /users', () => {
      const user = { name: 'CypressUser' };
  
      cy.request('POST', `${baseUrl}/users`, user)
        .its('body')
        .should('include', user);
    });
  
    it('should return array with one user after POST', () => {
      cy.request(`${baseUrl}/users`)
        .its('body')
        .should('deep.include', { name: 'CypressUser' });
    });
  });
  