for folder in "extracted_courses"/*
do
  echo ""
  echo "========================="
  echo $(basename $folder)" Imports"
  echo "========================="]
  cd "./$folder/python"
  for pythonfile in $(ls -p | grep -v /)
  do
    echo $pythonfile
    echo "    "$(grep -E "^import" $pythonfile)
  done
  cd ../../..
done
