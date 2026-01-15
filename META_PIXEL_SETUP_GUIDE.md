# Meta Pixel Event Setup Tool - Button Detection Guide

## Where to Check: Meta Events Manager

### Step 1: Access Meta Events Manager
1. Go to [Meta Business Suite](https://business.facebook.com/) or [Meta Events Manager](https://business.facebook.com/events_manager2)
2. Log in with your Meta Business account
3. Select your business account (V Pharmacy)

### Step 2: Open Event Setup Tool
1. In the left sidebar, click on **"Events Manager"**
2. Click on **"Test Events"** or **"Event Setup Tool"** (depending on your Meta version)
3. You should see options like:
   - **"Test Events"** - For real-time event testing
   - **"Event Setup Tool"** - For configuring button/URL tracking

### Step 3: Use Event Setup Tool
1. Click on **"Event Setup Tool"** or **"Set up events"**
2. You'll see a popup/modal window
3. Enter your website URL: `https://vpharmacy.in` or your domain
4. Click **"Open Website"** or **"Continue"**

## How to Verify Button Detection

### Method 1: Check in Browser DevTools (Technical Verification)

1. **Open your website** in a browser: `https://vpharmacy.in`
2. **Open Developer Tools**:
   - Press `F12` or `Right-click → Inspect`
   - Or `Ctrl+Shift+I` (Windows) / `Cmd+Option+I` (Mac)
3. **Go to Elements/Console tab**
4. **Search for the button**:
   - Press `Ctrl+F` (Windows) or `Cmd+F` (Mac)
   - Type: `meta-pixel-submit-button`
   - You should see the hidden button element

**What to look for:**
```html
<button id="meta-pixel-submit-button" 
        data-fb-event-name="Purchase"
        data-fb-event-type="button"
        data-fb-content-name="Medicine Order"
        name="submit_order"
        style="display: none;">
  Submit Order
</button>
```

### Method 2: Using Meta Event Setup Tool (Client-Friendly)

1. **In Meta Event Setup Tool**:
   - The tool will scan your page
   - Look for the section: **"Events on this Page"** or **"Trackable Elements"**

2. **What the client should see**:
   - If detected: You'll see a button listed with event name "Purchase"
   - If not detected: You'll see "No events found" (this is normal for Flutter Web)

3. **Manual Setup Option**:
   - Click **"+ Track new button"** or **"Manually Add Events"**
   - Select **"Purchase"** from event dropdown
   - Configure parameters:
     - `content_name`: `Medicine Order`
     - `content_category`: `{selected_category}` (dynamic)

### Method 3: Test Events (Real-time Verification)

1. **Go to Test Events**:
   - In Events Manager, click **"Test Events"**
   - You'll see a real-time event stream

2. **Test the button**:
   - Keep the Test Events page open
   - Go to your website: `https://vpharmacy.in`
   - Navigate to the order form
   - Fill out the form and click **"Submit Order"**

3. **What to see**:
   - Within 1-2 seconds, you should see a **"Purchase"** event appear
   - Event details will show:
     - Event Name: `Purchase`
     - Parameters:
       - `content_name`: `Medicine Order`
       - `content_category`: `{category from form}`
       - URL parameters (if any)

## Troubleshooting

### If button is NOT detected in Event Setup Tool:

**This is NORMAL for Flutter Web apps** because:
- Flutter renders to Canvas, not HTML elements
- Meta's tool can't detect Canvas-rendered buttons automatically

**Solution**: Use **Manual Event Configuration**:

1. In Event Setup Tool, click **"Manually Add Events"**
2. Select **"Purchase"** event
3. Choose trigger: **"Custom"** or **"When someone clicks a button"**
4. Add event parameters:
   ```
   content_name: Medicine Order
   content_category: {dynamic from form}
   ```
5. Save the configuration

### Verify Events Are Working:

**Best way to verify**:
1. Go to **Test Events** in Meta Events Manager
2. Click the submit button on your website
3. You should see the event appear in real-time
4. This confirms tracking is working correctly!

## Client Dashboard Locations Summary

| Location | Purpose | How to Access |
|----------|---------|---------------|
| **Events Manager** | Main dashboard | business.facebook.com → Events Manager |
| **Test Events** | Real-time event testing | Events Manager → Test Events tab |
| **Event Setup Tool** | Configure button tracking | Events Manager → Event Setup Tool |
| **Events** | View all tracked events | Events Manager → Events tab |

## Quick Verification Checklist

- [ ] Hidden button exists in browser DevTools (search: `meta-pixel-submit-button`)
- [ ] Purchase event fires when clicking submit (check Test Events)
- [ ] Event includes correct parameters (content_name, content_category)
- [ ] URL parameters are tracked (if present in URL)
- [ ] Event appears in Meta dashboard within 1-2 seconds

## Important Notes

1. **Events ARE working** - Your request URL shows events are firing correctly
2. **Button detection** - May not work automatically in Event Setup Tool (Flutter limitation)
3. **Manual setup is fine** - You can manually configure the event in Meta dashboard
4. **Test Events is best** - Use Test Events to verify everything is working

## Support

If the client needs help:
- Show them the **Test Events** page (most reliable)
- Demonstrate clicking the button and seeing the event appear
- Explain that manual configuration is normal for Flutter Web apps

