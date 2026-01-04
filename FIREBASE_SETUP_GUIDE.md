# Firebase Console Setup Guide

This guide outlines all the steps needed to configure Firebase Console for the Foody app.

## Prerequisites
- Firebase project already created (project ID: `foody-flutter-740d4`)
- Firebase options file already generated (`firebase_options.dart`)

---

## 1. Enable Firebase Authentication

### Steps:
1. Go to [Firebase Console](https://console.firebase.google.com/)
2. Select your project: **foody-flutter-740d4**
3. Navigate to **Authentication** → **Sign-in method**
4. Click on **Email/Password**
5. Enable **Email/Password** (toggle ON)
6. Click **Save**

### What this enables:
- Users can sign up and sign in with username/password (mapped to email format)
- Password reset functionality
- User authentication state management

---

## 2. Create Firebase Realtime Database

### Steps:
1. In Firebase Console, go to **Realtime Database**
2. Click **Create Database**
3. Choose a location (recommended: **us-central1** or closest to your users)
4. Choose **Start in test mode** (we'll update rules in the next step)
5. Click **Enable**

### Database URL:
After creation, note your database URL (e.g., `https://foody-flutter-740d4-default-rtdb.firebaseio.com/`)

---

## 3. Configure Database Security Rules

### Steps:
1. In **Realtime Database**, go to the **Rules** tab
2. Replace the default rules with the following:

```json
{
  "rules": {
    "users": {
      "$uid": {
        // Users can read their own data
        ".read": "$uid === auth.uid",
        // Users can write their own data (including during sign-up)
        ".write": "$uid === auth.uid",
        ".validate": "newData.hasChildren(['username', 'created_at'])"
      }
    },
    "usernames": {
      "$username": {
        // Anyone can check if username exists (for sign-up validation)
        ".read": true,
        // Only authenticated users can write (during sign-up)
        ".write": "auth != null",
        ".validate": "newData.hasChildren(['uid', 'email', 'created_at'])"
      }
    },
    "orders": {
      ".read": "auth != null",
      "$orderId": {
        ".read": "auth != null",
        ".write": "auth != null && newData.child('user_id').val() === auth.uid",
        ".validate": "newData.hasChild('user_id') && newData.child('user_id').val() === auth.uid"
      }
    },
    "order_items": {
      ".read": "auth != null",
      "$orderItemId": {
        ".read": "auth != null",
        ".write": "auth != null && (!data.exists() || root.child('orders').child(data.child('order_id').val()).child('user_id').val() === auth.uid)",
        ".validate": "newData.hasChild('order_id')"
      }
    },
    "payments": {
      ".read": "auth != null",
      "$paymentId": {
        ".read": "auth != null",
        ".write": "auth != null && (!data.exists() || root.child('orders').child(data.child('order_id').val()).child('user_id').val() === auth.uid)",
        ".validate": "newData.hasChild('order_id')"
      }
    },
    "deliveries": {
      ".read": "auth != null",
      "$deliveryId": {
        ".read": "auth != null",
        ".write": "auth != null && (!data.exists() || root.child('orders').child(data.child('order_id').val()).child('user_id').val() === auth.uid)",
        ".validate": "newData.hasChild('order_id')"
      }
    },
    "drivers": {
      ".read": "auth != null",
      "$driverId": {
        ".read": "auth != null",
        ".write": "auth != null"
      }
    },
    "restaurants": {
      ".read": true,
      ".write": "auth != null"
    },
    "menus": {
      ".read": true,
      ".write": "auth != null"
    },
    "reviews": {
      ".read": true,
      ".write": "auth != null"
    },
    ".read": false,
    ".write": false
  }
}
```

3. Click **Publish**

### Security Rules Explanation:
- **users/{uid}**: Users can only read/write their own data
- **usernames/{username}**: Public read (to check availability), authenticated write (during sign-up)
- **orders/{orderId}**: Authenticated users can read, but only write their own orders (validates user_id matches auth.uid)
- **order_items/{orderItemId}**: Authenticated users can read, but only write items for their own orders
- **payments/{paymentId}**: Authenticated users can read, but only write payments for their own orders
- **deliveries/{deliveryId}**: Authenticated users can read, but only write deliveries for their own orders
- **drivers/{driverId}**: Authenticated users can read, any authenticated user can write (for admin/testing purposes)
- **restaurants**: Public read, authenticated write (for admin/testing purposes)
- **menus**: Public read, authenticated write (for admin/testing purposes)
- **reviews**: Public read, authenticated write (users can leave reviews)

---

## 4. (Optional) Configure Authentication Settings

### Email Templates (Optional):
1. Go to **Authentication** → **Templates**
2. Customize email templates if needed:
   - Email address verification
   - Password reset

### User Actions (Optional):
1. Go to **Authentication** → **Users**
2. Review user management options
3. You can manually add/remove users here if needed

---

## 5. Database Structure

Your database will have the following structure:

```
foody-flutter-740d4-default-rtdb/
├── users/
│   └── {uid}/
│       ├── username: "johndoe"
│       ├── full_name: "John Doe"
│       ├── email: "john@example.com" (optional)
│       ├── phone: "+1234567890" (optional)
│       ├── address: "123 Main St" (optional)
│       ├── auth_email: "johndoe@foody.app"
│       ├── created_at: "2026-01-03T..."
│       └── updated_at: "2026-01-03T..."
│
├── usernames/
│   └── {username}/
│       ├── uid: "{user_uid}"
│       ├── email: "{username}@foody.app"
│       └── created_at: "2026-01-03T..."
│
├── orders/
│   └── {orderId}/
│       ├── user_id: "{uid}"
│       ├── restaurant_id: "..."
│       ├── order_status: "pending"
│       ├── total_amount: 25.99
│       └── created_at: "..."
│
├── restaurants/
│   └── {restaurantId}/
│       ├── restaurant_id: "..."
│       ├── name_ar: "..."
│       ├── name_en: "..."
│       ├── address_ar: "..."
│       ├── address_en: "..."
│       ├── phone: "..."
│       ├── image_url: "..."
│       ├── rating: 4.5
│       └── cuisine_type_ar/en: "..."
│
├── menus/
│   └── {restaurantId}/
│       └── menu/
│           └── {menuId}/
│               ├── menu_id: "..."
│               ├── restaurant_id: "..."
│               ├── item_name_ar: "..."
│               ├── item_name_en: "..."
│               ├── description_ar: "..."
│               ├── description_en: "..."
│               ├── price: 15.99
│               └── image_url: "..."
│
├── order_items/
│   └── {orderItemId}/
│       ├── order_item_id: "..."
│       ├── order_id: "..."
│       ├── menu_id: "..."
│       ├── quantity: 2
│       └── price: 15.99
│
├── payments/
│   └── {paymentId}/
│       ├── payment_id: "..."
│       ├── order_id: "..."
│       ├── payment_method: "card"
│       ├── payment_status: "completed"
│       ├── transaction_id: "..."
│       ├── amount: 25.99
│       └── paid_at: "..."
│
├── deliveries/
│   └── {deliveryId}/
│       ├── delivery_id: "..."
│       ├── order_id: "..."
│       ├── driver_id: "..."
│       ├── delivery_status: "on_the_way"
│       ├── estimated_time: 30
│       └── actual_time: "..."
│
├── drivers/
│   └── {driverId}/
│       ├── driver_id: "..."
│       ├── name: "..."
│       ├── phone: "..."
│       ├── vehicle_type: "Motorcycle"
│       └── availability_status: true
│
└── reviews/
    └── {reviewId}/
        ├── review_id: "..."
        ├── user_id: "{uid}"
        ├── restaurant_id: "..."
        ├── order_id: "..."
        ├── rating: 4.5
        ├── comment: "Great food!"
        └── created_at: "..."
```

---

## 6. Testing the Setup

### Test Authentication:
1. Run your Flutter app
2. Try to sign up with a new username
3. Check **Authentication** → **Users** in Firebase Console to see the new user
4. Check **Realtime Database** → **Data** to see user data stored

### Test Database:
1. Sign up a new user
2. Verify data appears in:
   - `users/{uid}` - Complete user profile
   - `usernames/{username}` - Username mapping

   

---

## 8. Troubleshooting

### Common Issues:


**Issue**: "Permission denied" when writing to database
- **Solution**: Check that:
  1. User is authenticated
  2. Security rules allow the operation
  3. Database is in the correct region
  4. App uses VPN in Syria

**Issue**: "Database not found"
- **Solution**: Ensure Realtime Database is created and rules are published

---

## Summary Checklist

- [ ] Firebase Authentication enabled with Email/Password
- [ ] Realtime Database created
- [ ] Security rules configured and published
- [ ] Test sign-up works
- [ ] Test sign-in works
- [ ] User data appears in database
- [ ] Username mapping works correctly

---

## Need Help?

- [Firebase Documentation](https://firebase.google.com/docs)
- [Firebase Realtime Database Rules](https://firebase.google.com/docs/database/security)
- [Firebase Authentication Guide](https://firebase.google.com/docs/auth)

