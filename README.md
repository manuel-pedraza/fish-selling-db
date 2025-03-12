# FishSelling Database

## Introduction
The **FishSelling Database** is a structured system designed to manage and store information related to fish catches, suppliers(AKA fishermen), customers, and transactions. 

<!--
## Features
- Store and manage fish species, prices, and availability
- Track customer and supplier details
- Record transactions and sales history
- Generate reports for sales analysis 
- Secure and optimized database structure 
-->

## Technologies Used
- **Database Management System:** Microsoft SQL Server (MSSQL)
- **Containerization:** Docker
- **Scripting:** Bash for database setup and data initialization
- **Diagram:** [eraser.io](https://app.eraser.io)
- **Data generator:** [Mockaroo](https://www.mockaroo.com/)

## Usage
- Access MSSQL via a database management tool (e.g., SQL Server Management Studio, Azure Data Studio) using the configured credentials.
- Run **queries** to manage sales, customers and different species of fish. 
- Modify and extend `scripts/initDB.sh` or any `.sql` file in `scripts/tables/` to customize initial data loading.

#### Note: Example queires are in `scripts/queries`.

## Installation
1. Clone the repository:
   ```sh
   git clone https://github.com/manuel-pedraza/fish-selling-db
   ```
2. Navigate to the project directory:
   ```sh
   cd fish-selling-sb
   ```
3. Build and run the Docker container:
   ```sh
   docker-compose up -d
   ```
4. Run the database setup script:
   ```sh
   bash setup_database.sh
   ```
5. Verify the database is running:
   ```sh
   docker ps
   ```

## Disclaimer
This project is just a personal project only. The data used is randomly generated using **[Mockaroo](https://www.mockaroo.com/)**.

<!--
 and does not represent real-world transactions or businesses. Any resemblance to actual data is purely coincidental. The project should not be used for commercial or production purposes without proper modifications and validation.
-->

## Requirements
- Bash shell
- Docker

## Author
Developed by Manuel A. Pedraza S.