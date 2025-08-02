# 🔐 Secret Sharing App

A simple serverless web application to share confidential messages via unique, one-time-access links. Built using Firebase Hosting, Firestore, and vanilla JavaScript.

## 🚀 Features

- 🔒 Store secrets securely using Firestore (NoSQL)
- 🔗 Generate unique links for secret retrieval
- 🧾 Secrets can be read once — not stored in local storage
- ☁️ Fully serverless using Firebase (Firestore + Hosting)
- ⚡ Fast, minimal UI for ease of use

## 🛠️ Tech Stack

- **Frontend**: HTML, CSS, JavaScript
- **Backend/Database**: Firebase Firestore
- **Hosting**: Firebase Hosting
- **Dev Tools**: Firebase CLI

## 📁 Folder Structure
```
secret-sharing-app/
├── public/
│ ├── index.html # Main interface to save secrets
│ ├── read.html # Page to read secrets
│ └── script.js # Firebase integration logic
├── firebase.json # Firebase Hosting config
└── .firebaserc # Firebase project alias
```
### 💡 Inspiration

This project was created to learn about serverless cloud applications using Firebase. It simulates use cases like secure password or message sharing with expiring links.

