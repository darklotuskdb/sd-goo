# sd-goo.sh - Google Dorking Subdomain Finder

`sd-goo.sh` is a script designed to automate the process of finding subdomains associated with a domain using Google Dorks. This tool goes beyond traditional Google dorking methods by automatically navigating through multiple pages and bypassing CAPTCHA, ensuring comprehensive results and saving time.

## Features

- **Automated Search Across Multiple Pages**: Unlike traditional Google Dork tools where you have to manually switch to the next page to fetch results, `sd-goo.sh` automatically proceeds to the next pages, ensuring no subdomain is missed.

- **Bypassed Page Filter**: Google only provides up to 32 results per query, and you often need to run multiple queries to capture all subdomains. `sd-goo.sh` bypasses that limitation by automatically fetching results from multiple pages.

- **Cookie-based Authentication**: Google may block repetitive search queries, requiring CAPTCHA verification. This tool allows you to provide cookies (copied from Burp Suite or your browser), which ensures the tool works continuously without interruptions.

- **Efficient Domain Search**: The tool accepts domain and cookie input as flags, which can be used to easily search for subdomains of the target domain.

## Installation

1. Clone the repository:

    ```
    git clone https://github.com/darklotuskdb/sd-goo.git
    ```

2. Navigate to the repository folder:

    ```
    cd sd-goo
    ```

3. Make the script executable:

    ```
    chmod +x sd-goo.sh
    ```

## Usage

The tool requires two arguments:

- **`-d`**: The domain to search for subdomains.
- **`-c`**: The cookies string to bypass CAPTCHA protection, which can be copied from Burp Suite or your browser.

### Syntax:

```
./sd-goo.sh -d <domain> -c "<cookies>"
```

### Example:

```
./sd-goo.sh -d example.com -c "Cookie: session=leet; id=1337;..."
```

## How It Works:
- **Automated Page Navigation:** Once you start the tool, it begins searching for subdomains related to the specified domain using Google Dorks. It will automatically go to the next pages and fetch all available results.
- **Subdomain Extraction:** The tool extracts all subdomains from the Google search results and filters out any unnecessary entries, providing only valid and unique subdomains.
- **Handling CAPTCHA:** If the tool is blocked by Google due to multiple queries in a short time, the tool requires you to manually pass the CAPTCHA challenge. Once passed, the tool will continue fetching results using the provided cookies.

## Why This Tool is Better Than Other Google Dorking Tools:
- **Automatic Page Navigation:** Other tools require you to manually click through pages or repeat the dorking process several times. sd-goo.sh takes care of that automatically, fetching results from multiple pages at once.
- **Cookie-based Authentication:** Many Google dorking tools struggle with CAPTCHA blocks. With sd-goo.sh, you can bypass CAPTCHA protection by providing cookies, making it more efficient and less prone to interruption.

### Screenshot
![sd-goo](https://user-images.githubusercontent.com/29382875/117357011-0b3f6000-aed2-11eb-8f9a-1c4e9f5e0113.png)


## Donate
[BuyMeACoffee](https://www.buymeacoffee.com/darklotus) If you like my work <3

## About Me

* **DarkLotus** - *Cyber Security Researcher* - [DarkLotusKDB](https://github.com/darklotuskdb)

### Social Media Handles
* [Twitter](https://twitter.com/darklotuskdb)
* [Medium](https://medium.com/@darklotus)
* [Linkedin](https://www.linkedin.com/in/kamaldeepbhati/)
* [Instagram](https://www.instagram.com/kamaldeepbhati/)
