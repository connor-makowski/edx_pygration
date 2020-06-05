rm -r "./extracted_courses/" &> /dev/null
mkdir "./extracted_courses/" &> /dev/null
for file in "course_dumps"/*
do
  mkdir "./extracted_courses/$(basename $file .tar.gz)"
  tar -xf $file -C "./extracted_courses/$(basename $file .tar.gz)"
done
