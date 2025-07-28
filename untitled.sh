#!/bin/bash

# اطمینان از اینکه سرور به‌روز است
echo "به روز رسانی سرور..."
sudo apt update && sudo apt upgrade -y

# نصب وابستگی‌های مورد نیاز
echo "نصب وابستگی‌ها..."
sudo apt install git curl build-essential libssl-dev zlib1g-dev libcurl4-openssl-dev -y

# دانلود سورس کد MTProto Proxy
echo "دانلود MTProto Proxy..."
git clone https://github.com/TelegramMessenger/MTProxy
cd MTProxy

# کامپایل پروکسی
echo "کامپایل MTProto Proxy..."
make

# ساخت Secret جدید
SECRET=$(head -c 16 /dev/urandom | xxd -ps)
echo "Secret ساخته شد: $SECRET"

# ساخت Base64 از لینک کانال اسپانسری
echo "لطفاً لینک کانال اسپانسری خود را وارد کنید (مثال: t.me/YourSponsorChannel):"
read CHANNEL_LINK
CHANNEL_BASE64=$(echo -n "$CHANNEL_LINK" | base64)

echo "Base64 کانال اسپانسری: $CHANNEL_BASE64"

# اجرای پروکسی
echo "اجرای پ
