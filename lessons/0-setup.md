# 🏁 Lesson 0: Setting Up Your Environment with Docker, Dremio & MinIO

Welcome to the *Intro to SQL with Dremio* workshop! Before we dive into querying data, we need to set up our environment. This lesson will walk you through running a local lakehouse environment using [Docker Compose](https://docs.docker.com/compose/) with the following key components:

- **Dremio OSS** – Our SQL query engine and UI
- **MinIO** – A self-hosted S3-compatible object storage system
- **Sample Data** – CSV files for practice

---

## 📋 Prerequisites

Before you begin, ensure you have the following installed:

- [Docker Desktop](https://www.docker.com/products/docker-desktop/)
- Basic knowledge of the command line

All services run locally in containers via `docker-compose`, so you don’t need to install Dremio or MinIO manually.

---

## 🧰 What We're Setting Up

### ⚙️ Dremio OSS

Dremio is a high-performance SQL engine for data lakehouse analytics. It will let us connect to data in MinIO and run SQL queries through a browser-based interface.

### 📦 MinIO (S3-Compatible Storage)

MinIO simulates AWS S3 locally and serves as the object storage layer. We'll create three buckets:

- `warehouse` – Reserved for future Iceberg exercises
- `datalakehouse` – General Lakehouse storage
- `sampledata` – Holds CSVs for SQL practice

### 🗃 Sample Data Loader

A helper container (`minio-setup`) initializes the buckets and uploads sample CSV files to MinIO automatically when the environment spins up.

---

## 🚀 Step-by-Step Setup

### 1. Clone This Repository

```bash
git clone https://github.com/AlexMercedCoder/dremio-intro-to-sql
```
Then after cloning the repo, navigate to the directory:

```bash
cd intro-to-sql-dremio
```

### 2. Prepare Your Sample Data

Place your CSV files inside the `/sampledata` directory in this repo (files needed for these lessons are already in `/sampledata`). For example:

```bash
sampledata/
└── normalized_sales.csv
```

While our sample data is already here, in the future if you wanted to load your own data, you can do so by placing your CSV/JSON/PARQUET/XLS files in the `/sampledata` directory before starting up the environment.

### 3. Start the Environment
In the root of the repository, run:

```bash
docker-compose up
```

This will:

- Start the MinIO object storage at `http://localhost:9001` (UI login: admin / password)

- Load sample data into MinIO

- Launch Dremio at `http://localhost:9047`

### 🧩 4. Connect MinIO to Dremio
Once Dremio is up (it may take a few minutes), go to http://localhost:9047 in your browser and set up your sources.

We’ll connect to the MinIO bucket where our CSVs live:

Click on + Add Source > Amazon S3

Fill in the following:

#### GENERAL
- **Name:** sampledata

- **Credentials:** AWS Access Key

- **Access Key:** admin

- **Secret Key:** password

- **Encrypt Connection:** false

#### ADVANCED OPTIONS

- **Enable compatibility mode:** ✅

- **Root Path:** /sampledata

- **Connection Properties:**

```bash
fs.s3a.path.style.access = true
fs.s3a.endpoint = storage:9000
```

- Click Save to connect.

💡 **Why this matters:** This step allows Dremio to browse and query CSV/PARQUET/XLS/JSON/DELTA/ICEBERG datasets stored in your object storage without copying the data elsewhere.

**(Optional) Add the lakehouse Source
This will be used later for Lakehouse/Iceberg table exercises:**

Repeat the above steps, but name it lakehouse and set the root path to /datalakehouse.

### ✅ 5. Verification
To ensure everything is working:

- Navigate to the sampledata source in Dremio.

- You should see your normalized_sales.csv (or other files) listed.

- Hove the mouse to the right and select "Format" on the menu to turn this csv into a queryable table.

- Adjust settings till the preview of the data looks good, should only have to check the box to treat the first row as column names.

## 🧠 Recap: Why This Setup?
Docker Compose simplifies the setup by bundling all services together.

- MinIO acts as our S3-style object storage for practicing on open formats (like CSV, Parquet, Iceberg).

- Dremio allows us to run powerful SQL queries over files without needing to move or preprocess the data.

In the next lesson, we'll begin learning basic SQL commands by querying sales_data.csv.

## 🛑 Stopping the Environment
When you’re done, press Ctrl + C in the terminal, then run:

```bash
docker-compose down -v
```

This will tear down the containers and remove any data stored in MinIO.
