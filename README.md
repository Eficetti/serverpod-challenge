# 🏆 Serverpod Challenge

A challenge project built with **Serverpod**, demonstrating backend capabilities with user and tag management.

---

## 📋 Requirements

### ✅ Completed
- Create a Serverpod project.
- Add a model for a **User** and **Tag**.
- Users can have multiple tags, and tags can be associated with multiple users.
- **User**:
  - Attributes: `name`, `email`, `createdAt`, `updatedAt`.
- **Tag**:
  - Attributes: `name`, `image` (string), `createdAt`, `updatedAt`.
- Default value for `image` when creating a new tag with an empty image.
- Write tests to verify endpoint methods work as expected.
- Create endpoints for **User** and **Tag**:
  - Methods: Add, Update, Delete, Get by ID, Get all objects.

### ⏳ Pending

---
## 🚀 **How to Run the Project**

Follow these simple steps to set up and run the project:

### 1️⃣ **Build and Run the Docker Container**
Run the following command to build and start the container in detached mode:  
```bash
docker compose up --build --detach
```

### 2️⃣ Generate Code with Serverpod
Generate the necessary code for the project. Use the `--watch` flag if you want it to regenerate automatically when files are modified:
```bash
serverpod generate --watch
```

### 3️⃣ Start the Server
You have two options to start the server:

- **Option 1:** Use the launch option (F5) in Visual Studio Code.  
- **Option 2:** Run the following command in your terminal:

```bash
dart serverpod_challenge/serverpod_challenge_server/bin/main.dart --apply-migrations
```

## 📂 Postman Collection

To test the API, import the Postman collection:

1. Locate the `serverpod_challenge` folder in the project directory.
2. Import the provided `.json` file into Postman.

---

## 🧪 Testing

- Comprehensive tests are implemented to validate all endpoint methods.
- Ensure the code adheres to expected behavior under various scenarios.

---

## ✨ Highlights

- **ORM-backed Models**: Seamless integration with Serverpod's ORM for User and Tag management.
- **Robust Testing**: Verified endpoints to ensure data consistency and reliability.
- **Dynamic Tag Images**: Default image handling ensures no blank values.
