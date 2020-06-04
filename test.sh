for folder in "extracted_courses"/*
do
  cd "./$folder/python"
  for pythonfile in ./*
  do
    python $pythonfile
  done
  cd ../..
done
