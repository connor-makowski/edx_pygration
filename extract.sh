for file in "course_dumps"/*
do
  rm -r "./extracted_courses/$(basename $file .tar.gz)" &> /dev/null
  mkdir "./extracted_courses/$(basename $file .tar.gz)"
  tar -xf $file -C "./extracted_courses/$(basename $file .tar.gz)"
done
