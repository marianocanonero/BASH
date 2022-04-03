#!/bin/bash

find $1 -name "*<file_type>" -print0 | while IFS= read -r -d '' file;
    do
        if [ "$(grep -c "<string>" "$file")" -ge 1 ]; then

            echo "$file";

            awk '{gsub(/<string>/, "<string_replacemente>"); print $0;}' "$file" > ./tempFile 
            && mv ./tempFile "$file" 
            && chmod 777 "$file";
        fi
    done
