# LifeFlow Notification Design System

## Overview
This document describes the modern medical-app notification design system for LifeFlow. The system provides visually distinct notification cards with clear visual hierarchy, icons, colors, and status indicators.

## Notification Types

### 1. New Patient Request
- **Purpose**: A new patient in need of blood has appeared
- **Icon**: `Icons.emergency` (Emergency/Alert icon)
- **Accent Color**: Red (`#EF4444`)
- **Background Color**: Light Red (`rgba(239, 68, 68, 0.08)`)
- **Example**: "New patient request (A+) needs blood donation nearby."
- **Blood Type**: Always displayed prominently in badge

### 2. New Donor Available
- **Purpose**: A new donor with a matching blood type has joined
- **Icon**: `Icons.favorite` (Heart icon)
- **Accent Color**: Blue (`#3B82F6`)
- **Background Color**: Light Blue (`rgba(59, 130, 246, 0.08)`)
- **Example**: "New donor available (O-) matching current requests."
- **Blood Type**: Always displayed prominently in badge

### 3. Donor Request Approved
- **Purpose**: The donor's request/application has been approved
- **Icon**: `Icons.check_circle` (Check circle icon)
- **Accent Color**: Green (`#10B981`)
- **Background Color**: Light Green (`rgba(16, 185, 129, 0.08)`)
- **Example**: "Your donation request has been approved."
- **Blood Type**: Always displayed in badge

### 4. Patient Assistance Approved
- **Purpose**: A patient's blood request has been accepted and assistance has been arranged
- **Icon**: `Icons.handshake` (Handshake icon)
- **Accent Color**: Teal (`#14B8A6`)
- **Background Color**: Light Teal (`rgba(20, 184, 166, 0.08)`)
- **Example**: "Your blood request has been approved and help is on the way."
- **Blood Type**: Always displayed in badge

## Visual Design Rules

### Notification Card
- **Background**: White
- **Padding**: 16px
- **Border Radius**: 16px
- **Elevation**: Subtle shadow (6px blur, 3px offset)
- **Unread State**: 
  - Border: 1.5px solid with 30% opacity of accent color
  - Visual indicator dot: 8px colored circle (top-right of icon)
- **Read State**: 
  - No border
  - No indicator dot
  - No opacity reduction

### Icon Container
- **Size**: 52x52dp
- **Background**: Accent color with 8% opacity
- **Border Radius**: 12px
- **Icon Size**: 28dp
- **Icon Color**: Accent color

### Blood Type Badge
- **Background**: Accent color with 8% opacity
- **Border**: 1px solid, accent color with 30% opacity
- **Border Radius**: 6px
- **Padding**: 8px horizontal, 3px vertical
- **Text**: Accent color, 11sp, semi-bold weight
- **Format**: "Blood Type: X+"

### Typography
- **Title**:
  - Font Size: 14sp
  - Font Weight: 600 (semi-bold)
  - Color: Dark Gray (`#1F2937`)
  - Line Height: 1.4
  - Max Lines: 2
  - Overflow: Ellipsis
  
- **Blood Type Badge**:
  - Font Size: 11sp
  - Font Weight: 600 (semi-bold)
  - Color: Accent color
  
- **Time**:
  - Font Size: 11sp
  - Font Weight: 400 (regular)
  - Color: Medium Gray (`#6B7280`)

### Spacing
- **Card Padding**: 16px
- **Icon-Content Gap**: 14px
- **Content-Menu Gap**: 12px
- **Section Header Spacing**: 12px top, 12px bottom
- **Notification Card Spacing**: 12px between cards

### Section Headers
- **Font Size**: 14sp
- **Font Weight**: 700 (bold)
- **Color**: Medium Gray (`#6B7280`)
- **Letter Spacing**: 0.5px
- **Grouped By**: Today, Yesterday, Earlier

## Date Grouping Logic

Notifications are automatically grouped into three categories:

1. **Today**: Notifications from the current date
2. **Yesterday**: Notifications from exactly one day ago
3. **Earlier**: All notifications older than yesterday

The grouping is done using `DateTime` comparison to ensure accuracy across different timezones.

## Interactivity

### Notification Item
- **Tap Action**: Can trigger custom action (defined via `onTap` callback)
- **Visual Feedback**: Gesture detector with customizable callback
- **Menu Icon**: Three-dot menu for future actions (expandable)

### Empty State
- **Icon**: `Icons.notifications_none`
- **Title**: "No Notifications"
- **Subtitle**: "You're all caught up!"
- **Styling**: Centered, with appropriate spacing and gray tones

## Data Model

```dart
NotificationModel {
  String title;                    // Notification message
  String time;                     // Human-readable time format
  NotificationType type;           // Enum: newPatientRequest, etc.
  String bloodType;                // Blood type (e.g., "A+", "O-")
  bool isRead;                     // Read status
  DateTime dateTime;               // Timestamp for grouping
}
```

## Notification Type Enum

```dart
enum NotificationType {
  newPatientRequest,
  newDonorAvailable,
  donorRequestApproved,
  patientAssistanceApproved,
}
```

## Implementation Guide

### Using NotificationItem Widget

```dart
NotificationItem(
  title: 'New patient request (A+) needs blood donation nearby.',
  time: 'Just now',
  notificationType: NotificationType.newPatientRequest,
  bloodType: 'A+',
  isRead: false,
  onTap: () {
    // Handle notification tap
  },
)
```

### Creating Notifications in Backend Integration

When integrating with backend APIs, map the API response to `NotificationModel`:

1. Parse the API notification type to `NotificationType` enum
2. Extract the blood type from the payload
3. Convert the timestamp to `DateTime`
4. Set the `isRead` flag based on user interaction history

## Color Palette Reference

| Type | Accent Color | Hex Value |
|------|-------------|-----------|
| New Patient Request | Red | #EF4444 |
| New Donor Available | Blue | #3B82F6 |
| Donor Request Approved | Green | #10B981 |
| Patient Assistance Approved | Teal | #14B8A6 |

## Future Enhancements

- Add swipe-to-delete functionality
- Implement notification preferences/settings
- Add animations for new notification arrivals
- Support for notification sound/vibration
- Implement "mark all as read" feature
- Add notification categories/filtering
- Support for persistent local notifications
