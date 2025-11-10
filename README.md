# 🏥 VedaVita – Post-Surgery Care App

VedaVita is a **Flutter-based mobile application** designed to improve **post-surgery recovery and patient care**, especially for those living in **rural areas**. It enables **real-time vitals monitoring, AI-driven recovery insights, doctor consultations, and automated alerts**, ensuring patients receive continuous care even after discharge.

---

## 🚀 Features

### 👩‍⚕️ For Patients
- **Real-time vitals tracking** (Heart Rate, BP, SpO₂, Temperature)
- **Personalized recovery plans** and checklists
- **AI-based recovery suggestions** and complication detection
- **Doctor consultations** and **secure chat support**
- **Medication reminders** and follow-up scheduling
- **Symptom check-in system** with daily updates

### 🧑‍⚕️ For Doctors & Admins
- Remote **patient monitoring dashboard**
- **Automated alerts** for abnormal readings
- Secure **authentication and data access** via Firebase
- **Real-time cloud sync** and recovery analytics

### ☁️ Cloud & Automation
- Integrated **Firebase Authentication, Firestore, and Cloud Functions**
- **Push notifications** for follow-ups and alerts
- **Scalable backend** enabling multi-patient data handling

### 📊 Impact
- Reduced follow-up delays by **60%**
- Improved early detection of complications
- Enabled full **remote post-surgery support** for rural patients

---

## 🧩 Tech Stack

| Category | Technology |
|-----------|-------------|
| Framework | Flutter (Dart) |
| Backend | Firebase (Auth, Firestore, Cloud Functions) |
| AI/ML | Python Flask REST API |
| State Management | Riverpod (MVVM Architecture) |
| Hosting | Firebase Hosting |
| Tools | VS Code, Git, Postman, GitHub |

---

## 🏗️ Architecture Overview

- **MVVM architecture** for scalable and maintainable codebase  
- **Riverpod** for state management  
- **REST APIs** for AI recommendations  
- **Cloud Functions** for alert automation  

```plaintext
Flutter UI → ViewModel (Riverpod) → Repository → Firebase / REST API
