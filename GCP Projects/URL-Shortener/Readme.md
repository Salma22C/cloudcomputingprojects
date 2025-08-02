# 🔗 URL Shortener
## Overview
A minimal, serverless URL shortening service built with Firebase Hosting, Firestore, and vanilla JavaScript. Users can enter any long URL and get a short, shareable link. When visited, the short link redirects to the original URL using Firestore document IDs.

## Features
- 🔐 Secure NoSQL data storage with Firestore
- 🚀 Serverless deployment on Firebase Hosting
- 🔄 Real-time redirection logic with query parameters
- 🧩 Frontend powered by ES modules + Firebase SDK
- ⚠️ Graceful error handling for invalid or missing URLs

## Technologies Used
- Firebase Hosting  
- Firebase Firestore (NoSQL)  
- Firebase CLI  
- Vanilla JavaScript (ES6 Modules)  
- HTML/CSS  

## How It Works
1. User enters a long URL into the form.
2. URL is stored in Firestore and a document ID is generated.
3. A short link is returned: `https://your-site.web.app/read.html?id=abc123`
4. Visiting the short link redirects the user to the original URL.

## Skills Demonstrated
- 🔧 Firebase project configuration and deployment
- 🔐 Firestore security rules setup
- 🧠 JS async/await + DOM manipulation
- 🐛 Debugging Firebase SDK and deployment errors

## Live Link
👉 [https://url-shortener-3a84c.web.app](https://url-shortener-3a84c.web.app)
