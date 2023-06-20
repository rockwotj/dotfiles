
# Use the latest version of golang if gvm is installed
if command -v gvm &> /dev/null
then
  gvm use 1.20 &> /dev/null
fi
