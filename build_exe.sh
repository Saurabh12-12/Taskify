#!/bin/bash
echo "🤖 Taskify App Builder (macOS/Linux)"
echo "====================================="

# Check Python
if ! command -v python3 &> /dev/null; then
    echo "❌ Python3 not found!"
    echo "💡 Install: brew install python3 (macOS) or apt install python3 (Linux)"
    exit 1
fi

# Install PyInstaller
echo "📦 Installing PyInstaller..."
python3 -m pip install --upgrade pyinstaller

# Clean previous builds
rm -rf dist build __pycache__ *.spec

# Build app
echo "🔨 Building AI-ToDo..."
python3 -m PyInstaller --onefile --windowed \
    --name "Taskify" \
    --distpath dist \
    --clean \
    Taskify_App.py

if [ $? -eq 0 ]; then
    echo "✅ SUCCESS! Taskify in dist/"
    echo "📱 Test: ./dist/Taskify"
else
    echo "❌ Build failed!"
    echo "💡 Try: python3 build_exe.py"
fi