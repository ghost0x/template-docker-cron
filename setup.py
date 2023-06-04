"""
setup.py

This setup.py file uses os.walk to recursively search for all requirements.txt files 
in the project directory and its subdirectories. It reads the contents of each file 
and adds the requirements to a list. Then, it defines the package metadata 
(name, version, packages, and install requirements) using setuptools.setup. When you 
run python setup.py install, it will install all of the required packages 
listed in the requirements.txt files.

Usage: 
pip install --editable .
"""

import os
import setuptools

# Find all requirements.txt files in subdirectories
requirements = []
for root, dirs, files in os.walk("."):
    if "requirements.txt" in files:
        path = os.path.join(root, "requirements.txt")
        with open(path, "r") as f:
            requirements.extend(f.read().splitlines())

# Define package metadata
setuptools.setup(
    name="aristotle-s3-extractor",
    version="0.1",
    packages=setuptools.find_packages(),
    install_requires=requirements,
)
