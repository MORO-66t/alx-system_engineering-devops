#!/usr/bin/python3
"""
Contains the number_of_subscribers function
"""

import requests


def number_of_subscribers(subreddit):
    """Returns the number of subscribers for a given subreddit"""
    if not subreddit or not isinstance(subreddit, str):
        return 0

    url = f'https://www.reddit.com/r/{subreddit}/about.json'
    headers = {'User-Agent': '0x16-api_advanced:project:v1.0.0 (by /u/firdaus_cartoon_jr)'}
    
    try:
        response = requests.get(url, headers=headers, allow_redirects=False)
        if response.status_code == 200:
            data = response.json().get("data", {})
            return data.get("subscribers", 0)
        else:
            return 0
    except requests.RequestException:
        return 0
