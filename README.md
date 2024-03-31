# Record Maintenance System with JSP (Java Server Pages)

## Overview

This project is a Record Maintenance System built using Java Server Pages (JSP). It provides functionality for two types of users: students and admins. Students can sign up and make entries in the admissions form, including details such as name, father's name, CNIC, and degree. The records entered by students are stored in a SQL database. Admins can sign in and perform various operations such as viewing, deleting, and updating records. However, admins cannot edit individual records; only the super admin has the authority to do so.

## Features

- **User Authentication:** Students and admins have separate authentication mechanisms to access the system.
- **Student Registration:** Students can sign up by providing necessary details.
- **Admissions Form:** Students can fill out an admissions form with their personal and academic information.
- **Record Management:**
  - Admins can view all records stored in the database.
  - Admins can delete records as needed.
  - Admins can update records, but not individual entries.
  - Super admin has the authority to edit individual records.
- **Database Integration:** Records submitted by students are stored in an SQL database for easy retrieval and management.

## Technologies Used

- Java Server Pages (JSP)
- Java Servlets
- HTML/CSS
- MySQL Database

## Project Structure

- **/src:** Contains Java source code files, including servlets for handling requests and database operations.
- **/web:** Contains JSP files for user interface and HTML/CSS resources.
- **/WEB-INF:** Contains configuration files and additional resources for the web application.

## Installation and Setup

1. Clone the repository to your local machine.
2. Set up a MySQL database and configure the connection details in the project's database configuration file.
3. Deploy the project to a Java servlet container (e.g., Apache Tomcat).
4. Access the application through the deployed URL and register as a student or admin to start using the system.

## Usage

1. Sign up as a student or admin using the provided registration form.
2. After registration, log in using the appropriate credentials.
3. Students can fill out the admissions form with their details.
4. Admins can view, delete, and update records from the admin dashboard.
5. Only the super admin has the authority to edit individual records.
