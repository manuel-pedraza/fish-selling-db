# Define a mapping of countries to their correct world regions
country_to_region = {
    "Afghanistan": "South Asia",
    "Albania": "Europe and Central Asia",
    "Algeria": "Middle East and North Africa",
    "Andorra": "Europe and Central Asia",
    "Angola": "Sub-Saharan Africa",
    "Antigua and Barbuda": "Latin America and Caribbean",
    "Argentina": "Latin America and Caribbean",
    "Armenia": "Europe and Central Asia",
    "Australia": "East Asia and Pacific",
    "Austria": "Europe and Central Asia",
    "Azerbaijan": "Europe and Central Asia",
    "Bahamas": "Latin America and Caribbean",
    "Bahrain": "Middle East and North Africa",
    "Bangladesh": "South Asia",
    "Barbados": "Latin America and Caribbean",
    "Belarus": "Europe and Central Asia",
    "Belgium": "Europe and Central Asia",
    "Belize": "Latin America and Caribbean",
    "Benin": "Sub-Saharan Africa",
    "Bhutan": "South Asia",
    "Bolivia": "Latin America and Caribbean",
    "Bosnia and Herzegovina": "Europe and Central Asia",
    "Botswana": "Sub-Saharan Africa",
    "Brazil": "Latin America and Caribbean",
    "Brunei": "East Asia and Pacific",
    "Bulgaria": "Europe and Central Asia",
    "Burkina Faso": "Sub-Saharan Africa",
    "Burundi": "Sub-Saharan Africa",
    "Cabo Verde": "Sub-Saharan Africa",
    "Cambodia": "East Asia and Pacific",
    "Cameroon": "Sub-Saharan Africa",
    "Canada": "North America",
    "Central African Republic": "Sub-Saharan Africa",
    "Chad": "Sub-Saharan Africa",
    "Chile": "Latin America and Caribbean",
    "China": "East Asia and Pacific",
    "Colombia": "Latin America and Caribbean",
    "Comoros": "Sub-Saharan Africa",
    "Congo (Congo-Brazzaville)": "Sub-Saharan Africa",
    "Congo (Democratic Republic of the Congo)": "Sub-Saharan Africa",
    "Costa Rica": "Latin America and Caribbean",
    "Croatia": "Europe and Central Asia",
    "Cuba": "Latin America and Caribbean",
    "Cyprus": "Europe and Central Asia",
    "Czech Republic": "Europe and Central Asia",
    "Denmark": "Europe and Central Asia",
    "Djibouti": "Sub-Saharan Africa",
    "Dominica": "Latin America and Caribbean",
    "Dominican Republic": "Latin America and Caribbean",
    "Ecuador": "Latin America and Caribbean",
    "Egypt": "Middle East and North Africa",
    "El Salvador": "Latin America and Caribbean",
    "Equatorial Guinea": "Sub-Saharan Africa",
    "Eritrea": "Sub-Saharan Africa",
    "Estonia": "Europe and Central Asia",
    "Eswatini": "Sub-Saharan Africa",
    "Ethiopia": "Sub-Saharan Africa",
    "Fiji": "East Asia and Pacific",
    "Finland": "Europe and Central Asia",
    "France": "Europe and Central Asia",
    "Gabon": "Sub-Saharan Africa",
    "Gambia": "Sub-Saharan Africa",
    "Georgia": "Europe and Central Asia",
    "Germany": "Europe and Central Asia",
    "Ghana": "Sub-Saharan Africa",
    "Greece": "Europe and Central Asia",
    "Grenada": "Latin America and Caribbean",
    "Guatemala": "Latin America and Caribbean",
    "Guinea": "Sub-Saharan Africa",
    "Guinea-Bissau": "Sub-Saharan Africa",
    "Guyana": "Latin America and Caribbean",
    "Haiti": "Latin America and Caribbean",
    "Honduras": "Latin America and Caribbean",
    "Hungary": "Europe and Central Asia",
    "Iceland": "Europe and Central Asia",
    "India": "South Asia",
    "Indonesia": "East Asia and Pacific",
    "Iran": "Middle East and North Africa",
    "Iraq": "Middle East and North Africa",
    "Ireland": "Europe and Central Asia",
    "Israel": "Middle East and North Africa",
    "Italy": "Europe and Central Asia",
    "Jamaica": "Latin America and Caribbean",
    "Japan": "East Asia and Pacific",
    "Jordan": "Middle East and North Africa",
    "Kazakhstan": "Europe and Central Asia",
    "Kenya": "Sub-Saharan Africa",
    "Kiribati": "East Asia and Pacific",
    "Korea (North)": "East Asia and Pacific",
    "Korea (South)": "East Asia and Pacific",
    "Kuwait": "Middle East and North Africa",
    "Kyrgyzstan": "Europe and Central Asia",
    "Laos": "East Asia and Pacific",
    "Latvia": "Europe and Central Asia",
    "Lebanon": "Middle East and North Africa",
    "Lesotho": "Sub-Saharan Africa",
    "Liberia": "Sub-Saharan Africa",
    "Libya": "Middle East and North Africa",
    "Liechtenstein": "Europe and Central Asia",
    "Lithuania": "Europe and Central Asia",
    "Luxembourg": "Europe and Central Asia",
    "Macedonia": "Europe and Central Asia",
    "Madagascar": "Sub-Saharan Africa",
    "Malawi": "Sub-Saharan Africa",
    "Malaysia": "East Asia and Pacific",
    "Maldives": "South Asia",
    "Mali": "Sub-Saharan Africa",
    "Malta": "Europe and Central Asia",
    "Marshall Islands": "East Asia and Pacific",
    "Mauritania": "Sub-Saharan Africa",
    "Mauritius": "Sub-Saharan Africa",
    "Mexico": "Latin America and Caribbean",
    "Micronesia (Federated States of)": "East Asia and Pacific",
    "Moldova": "Europe and Central Asia",
    "Monaco": "Europe and Central Asia",
    "Mongolia": "East Asia and Pacific",
    "Montenegro": "Europe and Central Asia",
    "Morocco": "Middle East and North Africa",
    "Mozambique": "Sub-Saharan Africa",
    "Myanmar (formerly Burma)": "East Asia and Pacific",
    "Namibia": "Sub-Saharan Africa",
    "Nauru": "East Asia and Pacific",
    "Nepal": "South Asia",
    "Netherlands": "Europe and Central Asia",
    "New Zealand": "East Asia and Pacific",
    "Nicaragua": "Latin America and Caribbean",
    "Niger": "Sub-Saharan Africa",
    "Nigeria": "Sub-Saharan Africa",
    "North Macedonia": "Europe and Central Asia",
    "Norway": "Europe and Central Asia",
    "Oman": "Middle East and North Africa",
    "Pakistan": "South Asia",
    "Palau": "East Asia and Pacific",
    "Panama": "Latin America and Caribbean",
    "Papua New Guinea": "East Asia and Pacific",
    "Paraguay": "Latin America and Caribbean",
    "Peru": "Latin America and Caribbean",
    "Philippines": "East Asia and Pacific",
    "Poland": "Europe and Central Asia",
    "Portugal": "Europe and Central Asia",
    "Qatar": "Middle East and North Africa",
    "Romania": "Europe and Central Asia",
    "Russia": "Europe and Central Asia",
    "Rwanda": "Sub-Saharan Africa",
    "Saint Kitts and Nevis": "Latin America and Caribbean",
    "Saint Lucia": "Latin America and Caribbean",
    "Saint Vincent and the Grenadines": "Latin America and Caribbean",
    "Samoa": "East Asia and Pacific",
    "San Marino": "Europe and Central Asia",
    "Sao Tome and Principe": "Sub-Saharan Africa",
    "Saudi Arabia": "Middle East and North Africa",
    "Senegal": "Sub-Saharan Africa",
    "Serbia": "Europe and Central Asia",
    "Seychelles": "Sub-Saharan Africa",
    "Sierra Leone": "Sub-Saharan Africa",
    "Singapore": "East Asia and Pacific",
    "Slovakia": "Europe and Central Asia",
    "Slovenia": "Europe and Central Asia",
    "Solomon Islands": "East Asia and Pacific",
    "Somalia": "Sub-Saharan Africa",
    "South Africa": "Sub-Saharan Africa",
    "South Sudan": "Sub-Saharan Africa",
    "Spain": "Europe and Central Asia",
    "Sri Lanka": "South Asia",
    "Sudan": "Sub-Saharan Africa",
    "Suriname": "Latin America and Caribbean",
    "Sweden": "Europe and Central Asia",
    "Switzerland": "Europe and Central Asia",
    "Syria": "Middle East and North Africa",
    "Taiwan": "East Asia and Pacific",
    "Tajikistan": "Europe and Central Asia",
    "Tanzania": "Sub-Saharan Africa",
    "Thailand": "East Asia and Pacific",
    "Timor-Leste": "East Asia and Pacific",
    "Togo": "Sub-Saharan Africa",
    "Tonga": "East Asia and Pacific",
    "Trinidad and Tobago": "Latin America and Caribbean",
    "Tunisia": "Middle East and North Africa",
    "Turkey": "Europe and Central Asia",
    "Turkmenistan": "Europe and Central Asia",
    "Tuvalu": "East Asia and Pacific",
    "Uganda": "Sub-Saharan Africa",
    "Ukraine": "Europe and Central Asia",
    "United Arab Emirates": "Middle East and North Africa",
    "United Kingdom": "Europe and Central Asia",
    "United States": "North America",
    "Uruguay": "Latin America and Caribbean",
    "Uzbekistan": "Europe and Central Asia",
    "Vanuatu": "East Asia and Pacific",
    "Venezuela": "Latin America and Caribbean",
    "Vietnam": "East Asia and Pacific",
    "Yemen": "Middle East and North Africa",
    "Zambia": "Sub-Saharan Africa",
    "Zimbabwe": "Sub-Saharan Africa"
}


# Read the full SQL file and process it line by line
updated_lines = []
with open("Addresses.sql", "r", encoding="utf-8") as file:
    for line in file:
        # Extract the country from the SQL statement
        for country, region in country_to_region.items():
            if f"'{country}'" in line:  # Check if the country is in the line
                # Replace the incorrect worldRegion value with the correct one
                line = line.replace(line.split(",")[8], f" '{region}'")  # Update worldRegion
                break  # Stop checking once a match is found
        updated_lines.append(line)

# Save the updated SQL file
updated_file_path = "./Updated_Addresses.sql"
with open(updated_file_path, "w", encoding="utf-8") as file:
    file.writelines(updated_lines)

# Return the path of the updated file
updated_file_path
