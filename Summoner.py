import subprocess
import os

# The name of your file
script_name = "ya.py"

# Check if the file actually exists in the current directory first
if os.path.exists(script_name):
    for i in range(50):
        # 'python' might need to be 'python3' depending on your setup
        subprocess.Popen(["python", script_name])
        print(f"Started instance {i+1}")
else:
    print(f"Error: {script_name} not found in the current directory.")