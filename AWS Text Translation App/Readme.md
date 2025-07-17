# 🌍 AWS Text Translation App

A fully serverless text translation web app using AWS Lambda, Amazon Translate, API Gateway, and a static frontend hosted on S3.

---

## ✅ Features

### 🔤 1. Text Translation API
- **Backend**: AWS Lambda (Python) using `boto3.translate`
- **API Gateway**: Exposes a `POST /Translator` endpoint
- **Functionality**:
  - Takes JSON input: `{ "text": "...", "target": "fr" }`
  - Auto-detects source language with `SourceLanguageCode='auto'`
  - Returns JSON:
    ```json
    {
      "translatedText": "...",
      "detectedLanguage": "en",
      "confidence": 1.0
    }
    ```

---

### 🌐 2. Static Web UI (S3 Hosted)
- **Frontend**: Pure HTML + JS
- **Hosted**: On Amazon S3 (Static Website Hosting enabled)
- **UI Includes**:
  - A `<textarea>` for input
  - A `<select>` dropdown for language selection (`de`, `fr`, `es`, `ar`, `hi`)
  - A translate button using `fetch()` to call the API
  - Result section showing translation, detected language, and confidence score

---

## ⚠️ Challenges Faced

| Component       | Problem                                                                 |
|----------------|-------------------------------------------------------------------------|
| API Gateway     | Worked via `curl`, but browser calls failed due to missing CORS         |
| Lambda          | No logs appeared when frontend called API due to browser blocking       |
| JavaScript UI   | `translate is not a function` due to wrong function name binding        |
| CORS Preflight  | Browser sent `OPTIONS` requests before `POST`, causing silent failures  |

---

## ✅ Solutions Implemented

### 🛠 1. CORS Configuration
- **In Lambda response**:
  ```python
  'headers': {
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Headers': 'Content-Type'
  }
  ```
## 🛠 2. In API Gateway

- Added `OPTIONS /Translator` route with **no integration**
- Enabled **CORS response headers**:
  ```http
  Access-Control-Allow-Origin: *
  Access-Control-Allow-Methods: POST, OPTIONS
  Access-Control-Allow-Headers: Content-Type
  ```
 ## 🛠 3. JavaScript Fixes
- Removed broken inline `onclick="translate()"`
- Replaced with:
  ```
  document.querySelector('button').addEventListener('click', doTranslate);
  ```
  
