for folder in "extracted_courses"/*
do
  rm -r "./$folder/python" &> /dev/null
  mkdir "./$folder/python"
  for xmlfile in $(grep -l "<script.*python.*>" "./$folder/course/problem"/*)
  do
    rm -r "./$folder/python/$(basename $xmlfile .xml).py" &> /dev/null
    touch "./$folder/python/$(basename $xmlfile .xml).py"
    echo "import math, random, scipy, numpy" > "./$folder/python/$(basename $xmlfile .xml).py"
    sed -n '/^.*<script.*python.*$/,/^.*<\/script>.*$/p' $xmlfile | sed '1d;$d' >> "./$folder/python/$(basename $xmlfile .xml).py"
    sed -i 's/&amp;/&/g' "./$folder/python/$(basename $xmlfile .xml).py"
    sed -i 's/&lt;/</g' "./$folder/python/$(basename $xmlfile .xml).py"
    sed -i 's/&gt;/>/g' "./$folder/python/$(basename $xmlfile .xml).py"
  done

  unzip -qq "./$folder/course/static/python_lib.zip" -d "./$folder/python"


done
