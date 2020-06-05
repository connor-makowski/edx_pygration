for folder in "extracted_courses"/*
do
  echo ""
  echo "========================="
  echo $(basename $folder)" Errors"
  echo "========================="
  cd "./$folder/python"
  for pythonfile in $(ls -p | grep -v /)
  do
    python $pythonfile
  done
  cd ../../..
done
