for folder in "extracted_courses"/*
do
  cd "$folder/python"
  for pythonfile in $(ls -p | grep -v /)
  do
    python $pythonfile
  done
  cd ../..
done
