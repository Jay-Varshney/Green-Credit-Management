# Green-Credit-Management
A full-stack Green Credit Management System to track, predict, and audit sustainability credits.


## Tech Stack
* **Frontend:** React (UI, dashboard visualizations, forms)
* **Backend:** Spring Boot / Java (Business logic, credit calculation, approval workflows, role-based access)
* **Database:** SQL (MySQL / PostgreSQL) (Stores user profiles, credit wallets, transaction ledgers, and operation data)

## System Architecture
* **Client Interface:** Handles user inputs, data visualization, and role-specific dashboards.
* **API Layer:** Processes ledger entries, handles prediction calculations based on historical data, and manages the audit/approval trail.
* **Data Layer:** Maintains ACID compliance for the credit wallet and logs all history to ensure the ledger remains credible and queryable.

## Local Setup & Installation
1. Clone the repository: `git clone <repository-url>`
2. **Database:** Create a local SQL database and update the connection string in your backend configuration (e.g., `application.properties`).
3. **Backend:** Navigate to the backend directory and start the server (e.g., `mvn spring-boot:run`).
4. **Frontend:** Navigate to the frontend directory, install dependencies (`npm install`), and start the development server (`npm start`).
