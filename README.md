## Avail Full-Stack Engineer Coding Challenge

Your challenged is to implement two-factor authentication within an existing sign-in flow. In an effort to boost security we as a product team want to require all users to go through an SMS-based two-factor authentication flow on login. As a user I should be prompted to enter a 4-digit PIN code after login. When I enter the correct PIN I should be taken into my account. When I enter an incorrect PIN I should be notified of the error.

Please implement the functionality described above based on the requirements listed below. We've also included a list of conventions for you to consider. These are conventions our dev team lives by and following these will best equip you for working at Avail.

**Note:** There are no traps and to reach out early and often.

### Requirements

- All users should be required to enter a PIN on login
- Entering "1111" should successfully pass and redirect me to my account home page
- Entering any other number should result in an error message and prevent me from accessing my account home page
- The flow should work correctly on desktop Chrome so don’t worry about cross-browser or device compatibility
- You can modify all parts of the existing code, but you don't need to do that to provide a great solution
- The component should be reusable. It should be possible to have multiple instances of the component on the same page
- Document your component in `SOLUTION.md`

### Stretch goals:

- Give the user the ability to remember a device
- End-to-end test coverage using Cypress.io
- Refactor existing code to be more re-usable

### Conventions:

- We use Rails service objects when possible
- We prefer functional React components (with Hooks) over class-based ones
- We try to reduce the amount of logic within the render logic of a component
- We use AirBnb's linting configuration
