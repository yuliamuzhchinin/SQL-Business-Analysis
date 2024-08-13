

# PostgreSQL Exercises and Python Integration

## Overview

This repository contains a series of exercises designed to demonstrate proficiency in working with complex PostgreSQL tables. The exercises cover various tasks, including creating, merging, and indexing tables, as well as extracting and manipulating data. Additionally, the project integrates Python to further process and analyze the extracted data, showcasing the ability to bridge SQL with Python for more advanced data workflows.

## Features

- **Complex Table Operations**: Demonstrates skills in creating and managing complex relational database structures.
- **Data Extraction**: Includes exercises focused on efficiently querying and extracting specific information from large datasets.
- **Table Merging and Indexing**: Covers advanced topics such as merging tables using different types of joins, and optimizing queries through indexing.
- **Python Integration**: Utilizes Python to connect to the PostgreSQL database, extract data, and perform additional processing or analysis.

## Tech Stack

- **PostgreSQL**: Primary database management system used for all SQL exercises.
- **Python**: Used for database connectivity, data extraction, and further analysis.
- **Psycopg2**: Python adapter for PostgreSQL used to interact with the database.

## Installation

1. **Clone the repository**:

   ```bash
   git clone https://github.com/your-username/postgresql-exercises.git
   cd postgresql-exercises
   ```

2. **Set up the PostgreSQL Database**:
   - Install PostgreSQL on your system if not already installed.
   - Create a new database and set up the required tables by running the SQL scripts provided in the `sql/` directory.

   ```sql
   psql -U your-username -d your-database -f sql/setup.sql
   ```

3. **Install Python Dependencies**:

   - Create a virtual environment and activate it:

   ```bash
   python -m venv venv
   source venv/bin/activate  # On Windows use `venv\Scripts\activate`
   ```

   - Install the required Python packages:

   ```bash
   pip install -r requirements.txt
   ```

## Usage

1. **Run PostgreSQL Exercises**:
   - Navigate to the `sql/` directory and execute the SQL scripts in the order provided to complete the exercises.

   ```sql
   psql -U your-username -d your-database -f sql/exercise1.sql
   psql -U your-username -d your-database -f sql/exercise2.sql
   ```

2. **Python Integration**:
   - Use the Python scripts in the `python/` directory to connect to the PostgreSQL database, extract data, and perform additional analysis.

   ```bash
   python python/extract_data.py
   python python/analyze_data.py
   ```

3. **Output**:
   - SQL query results can be reviewed in the PostgreSQL console or exported as needed.
   - Python scripts will generate outputs such as processed data files or visualizations.

## Project Structure

- `sql/`: Contains SQL scripts for database setup, exercises, and table operations.
- `python/`: Includes Python scripts for database connection, data extraction, and analysis.
- `requirements.txt`: Lists Python dependencies needed for the project.

## License

This project is licensed under the MIT License. See the LICENSE file for more details.

---

## Contributing

Contributions are welcome! Please feel free to submit issues or pull requests to enhance the exercises or Python integration.

---

## Contact

For any questions or further information, please reach out to muzhchinin18@gmail.com
