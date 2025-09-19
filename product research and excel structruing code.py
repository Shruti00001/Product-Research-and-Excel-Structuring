import csv

# --- Product Overview ---
product_data = [
    ["Product Name", "Brand", "Category", "Price", "Rating", "Reviews", "Platform"],
    ["NovaTech Smartwatch", "NovaTech", "Electronics", 2999.00, 4.5, 1200, "Amazon"],
    ["GlowSkin Serum", "GlowSkin", "Skincare", 799.00, 4.2, 850, "Nykaa"],
    ["EcoNest Air Purifier", "EcoNest", "Home Essentials", 4999.00, 4.7, 2300, "Flipkart"],
    ["PulseGear Headphones", "PulseGear", "Electronics", 1599.00, 4.0, 950, "Amazon"],
    ["FreshAura Moisturizer", "FreshAura", "Skincare", 599.00, 4.3, 670, "Myntra"]
]

with open("product_overview.csv", "w", newline="") as f:
    writer = csv.writer(f)
    writer.writerows(product_data)

# --- Feature Matrix ---
feature_data = [
    ["Product", "Feature 1", "Feature 2", "Unique Selling Point"],
    ["NovaTech Smartwatch", "Waterproof", "Bluetooth", "Long battery life"],
    ["GlowSkin Serum", "Vitamin C", "Fragrance-free", "Dermatologist approved"],
    ["EcoNest Air Purifier", "HEPA Filter", "Silent Mode", "Eco-friendly packaging"],
    ["PulseGear Headphones", "Noise Cancellation", "Wireless", "Deep bass"],
    ["FreshAura Moisturizer", "SPF 30", "Non-greasy", "Natural ingredients"]
]

with open("feature_matrix.csv", "w", newline="") as f:
    writer = csv.writer(f)
    writer.writerows(feature_data)

# --- Customer Sentiment ---
sentiment_data = [
    ["Product", "Positive Keywords", "Negative Keywords", "Common Complaints", "Suggestions"],
    ["NovaTech Smartwatch", "Stylish, Durable", "Slow sync", "Battery drain", "Add fast charging"],
    ["GlowSkin Serum", "Glowing skin", "Sticky texture", "Packaging issues", "Improve bottle design"],
    ["EcoNest Air Purifier", "Clean air, Quiet", "Bulky", "Filter replacement", "Add smart controls"],
    ["PulseGear Headphones", "Great sound", "Loose fit", "Connectivity drops", "Improve ear grip"],
    ["FreshAura Moisturizer", "Soft skin", "Strong scent", "Allergy risk", "Offer fragrance-free version"]
]

with open("customer_sentiment.csv", "w", newline="") as f:
    writer = csv.writer(f)
    writer.writerows(sentiment_data)

print("All CSV files created successfully.")
