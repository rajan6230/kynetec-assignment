# Kynetec Assignment

Full-stack assignment built with **Laravel 11** and **AngularJS 1.8.2**. The application provides token-based login and separate SPA pages for **Products**, **Discounts**, and **Categories**. The frontend uses AngularJS routing with hash URLs, and the backend exposes protected API endpoints for authenticated access. [cite:111]

## Tech Stack

- Laravel 11
- AngularJS 1.8.2
- Bootstrap 5
- Laravel Sanctum for token authentication
- MySQL

## Features

- Token-based login API
- AngularJS single-page application
- Separate Products, Discounts, and Categories pages
- Protected API routes with Bearer token
- Responsive UI using Bootstrap
- Seeded login credentials for quick review

## Project Structure

```text
project-root/
├── app/
├── database/
│   └── seeders/
├── public/
│   └── index.html
├── routes/
│   └── api.php
├── .env.example
├── .gitignore
├── composer.json
└── README.md
```

## Setup Steps

### 1. Clone the repository

```bash
git clone https://github.com/rajan6230/kynetec-assignment.git
cd kynetec-assignment
```

### 2. Install PHP dependencies

```bash
composer install
```

### 3. Create environment file

```bash
cp .env.example .env
```

If `cp` does not work on Windows CMD, copy the file manually or use:

```bash
copy .env.example .env
```

### 4. Generate application key

```bash
php artisan key:generate
```

### 5. Configure database

Update `.env` with your local database values:

```env
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=kynetec_assignment
DB_USERNAME=root
DB_PASSWORD=
```

### 6. Run migrations and seeders

```bash
php artisan migrate:fresh --seed

OR 

Create database: kynetec_assignment
Import database/kynetec_assignment.sql in phpMyAdmin
Then run:
php artisan serve
```

This command creates the tables and inserts demo data, including the seeded login user.

### 7. Start the Laravel server

```bash
php artisan serve
```

Open the application in the browser:

```text
http://127.0.0.1:8000/index.html#/login
```

## Demo Credentials

Use the seeded user below:

```text
Email: admin@admin.com
Password: password
```

## API Endpoints

The backend exposes a login route and protected routes for the SPA. Protected endpoints require an Authorization header with a Bearer token, which is the normal pattern when working with Git remotes and authenticated workflows documented through GitHub-style repository setup guidance. [cite:122][cite:111]

| Method | Endpoint | Purpose |
|--------|----------|---------|
| POST | `/api/login` | Authenticate user and return token |
| GET | `/api/products` | Fetch product listing |
| GET | `/api/discounts` | Fetch discount listing |
| GET | `/api/categories` | Fetch categories with nested children |

## Frontend Routes

The AngularJS SPA uses hash-based routes so each page loads separately in `ng-view`. Hash-based routing is a standard AngularJS pattern for client-side navigation. [cite:111]

```text
#/login
#/products
#/discounts
#/categories
```

## Verification Checklist

After setup, verify the following:

- Login works with seeded credentials
- Products page loads product data
- Discounts page loads discount data
- Categories page loads category data
- Navbar switches between pages correctly
- Unauthorized access redirects back to login

## Common Commands

```bash
php artisan serve
php artisan migrate:fresh --seed
git add .
git commit -m "Update project"
git push
```

## Notes for Reviewer

- The frontend entry file is `public/index.html`.
- AngularJS uses `#/products`, `#/discounts`, and `#/categories` routes.
- The backend APIs are defined in `routes/api.php`.
- Demo data is loaded through database seeders.
- If the UI appears cached after updates, use `Ctrl + F5` for a hard refresh.
