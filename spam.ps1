# Danh sách các trang web
$websites = @(
    "https://www.ebay.com/",
    "https://www.amazon.com/",
    "https://www.aliexpress.com/",
    "https://www.cnn.com/",
    "https://www.walmart.com/",
    "https://www.etsy.com/",
    "https://www.wish.com/",
    "https://www.target.com/",
    "https://www.newegg.com/",
    "https://www.macys.com/",
    "https://www.frys.com/",
    "https://www.overstock.com/",
    "https://www.jomashop.com/",
    "https://www.victoriassecret.com/",
    "https://www.levi.com/",
    "https://www.lacoste.com/",
    "https://www.1saleaday.com/",
    "https://usa.tommy.com/",
    "https://www.sephora.com/",
    "https://www.ashford.com/",
    "https://www.walmart.com/",
    "https://www.compusa.com/",
    "https://www.costco.com/",
    "https://www.usababy.com/",
    "https://www.kmart.com/",
    "https://www.walgreens.com/",
    "https://www.rayban.com/",
    "https://www.disneystore.com/",
    "https://www.binoculars.com/"
)

# Trang web cố định
$fixed_websites = @(
    "https://chrome.google.com/webstore/detail/webrtc-leak-prevent/eiadekoaikejlgdbkbdfeijglgfdalml",
    "https://whoer.net",
    "https://pixelscan.net"
)

# Số lượng trang web ngẫu nhiên để mở (từ 2 đến 5)
$num_websites = Get-Random -Minimum 2 -Maximum 6

# Chọn số trang web ngẫu nhiên từ danh sách chung
$random_websites = Get-Random -InputObject $websites -Count $num_websites

# Kết hợp trang web cố định và trang web ngẫu nhiên
$websites_to_open = $fixed_websites + $random_websites

# Mở trình duyệt Chrome với các trang web được chọn
$websites_to_open | ForEach-Object { Start-Process "chrome.exe" -ArgumentList $_ }
