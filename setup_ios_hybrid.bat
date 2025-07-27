@echo off
echo === Mir$$ iOS Hybrid Build Init ===

:: Set up directory
cd /workspaces/Mir-6.6.6

:: Unzip if not already
echo Unzipping project ZIP...
unzip -o "Mir$$V6.6.6.zip"

:: Install Node + Ionic CLI
echo Installing Node & Ionic...
sudo apt update
sudo apt install -y nodejs npm unzip
npm install -g @ionic/cli

:: Init Ionic App
echo Creating Ionic App...
ionic start Mir666App blank --type=angular --capacitor --no-interactive
cd Mir666App

:: Build + Capacitor
echo Building app...
ionic build
npx cap init Mir666App com.mir.server666 --web-dir=www
npx cap add ios

echo Copying payloads...
cp -r ../assets ./src/assets
cp -r ../qr_payload_logic ./src/app/

echo Final Build...
ionic build
npx cap sync ios

echo === Setup Complete. Move to macOS for Xcode compilation ===
pause
