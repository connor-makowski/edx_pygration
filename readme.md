# edx_pygration
Test in problem python code for [edX] courses

## Features

- Users can:
  - Get all problem based python code out of the course automatically
  - Get python_lib.zip python code out of the course automatically
  - Test environment based functionality for all pulled python code.

## Requires
A UNIX based OS (tested on Ubuntu 20.04 Focal Fassa)

## Use

### Clone the Repo to your local machine
```
git clone https://github.com/connor-makowski/edx_pygration.git
```

### Chmod the Repo
```
sudo chmod -R 777 ./edx_pygration/
```

### Export Course Data
In edx Studio:
  - Navigate to Tools > Export
  - Export the course content
  - Download the exported course content
On your local machine
  - Place the exported `tar.gz` file in `edx_pygration/course_dumps`

### Extract all courses in course_dumps and preprocess all python data
```
./extract.sh
./preprocess.sh
```
Note: All python code should now cleanly be located in each item in `edx_pygration/extracted_courses/{course_name}/python`

### Set up a test virtualenv
```
virtualenv -p python36 venv
source venv/bin/activate
pip install -r requirements.txt
```
Note: You can use any python environment you want to

### Using extra python imports
You can install extra python packages into your local `venv` for testing purposes.

If you use extra requirements or imports in your python scripts in edx, you can adjust `edx_pygration/preprocess.sh` to meet your needs by adding the following line:
```
echo "import mypackage" >> "./$folder/python/$(basename $xmlfile .xml).py"
```

This line should go between the following two lines:
```
echo "import math, random, scipy, numpy" > "./$folder/python/$(basename $xmlfile .xml).py"
sed -n '/^.*<script.*python.*$/,/^.*<\/script>.*$/p' $xmlfile | sed '1d;$d' >> "./$folder/python/$(basename $xmlfile .xml).py"
```
- Note: Make sure to adjust `mypackage` to any package you want to import.
- Note: Feel free to add multiple lines here.

### Test all python files in all courses for errors
```
./test.sh
```



[//]: # (These are reference links used in the body of this note and get stripped out when the markdown processor does its job.)

[edX]: <https://www.edx.org/>
