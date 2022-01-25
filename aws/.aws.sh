# создать сервисный аккаунт с ролько storage.admin
# создать ключ доступа
# выполнить aws configure

# export bucket="$1"

# num uploads, objects
nu() {
	aws --endpoint-url=https://storage.yandexcloud.net s3api list-multipart-uploads --bucket  ${bucket} | jq '.[] | length'
}

# list objects
no(){
	aws --endpoint-url=https://storage.yandexcloud.net s3api list-objects --bucket  ${bucket} | jq '.[] | length'
}

## UPLOADS, незакоченные загрузки
# list uploads
lu(){
	aws --endpoint-url=https://storage.yandexcloud.net s3api list-multipart-uploads --bucket  ${bucket} | jq '.Uploads[].Key'
}

# clean uploads
cu() {
	aws --endpoint-url=https://storage.yandexcloud.net s3api list-multipart-uploads --bucket  ${bucket} |
	jq '.Uploads[] | "aws --endpoint-url=https://storage.yandexcloud.net s3api abort-multipart-upload --bucket  '${bucket}' --key '\''\(.Key)'\'' --upload-id '\''\(.UploadId)'\''"' |
	xargs -i bash -c 'echo {} | awk '\''{printf $8": "}'\'' && if {} >/dev/null; then echo true; else echo false; fi'
}

## OBJECTS
# list version objects
lv(){
	aws --endpoint-url=https://storage.yandexcloud.net s3api list-object-versions --bucket  ${bucket} | jq '.[][] | "\(.Key): \(.VersionId)"'
}

# clean version objects
cv() {
	aws --endpoint-url=https://storage.yandexcloud.net s3api list-object-versions --bucket ${bucket} |
	jq '.[][] | "aws --endpoint-url=https://storage.yandexcloud.net s3api delete-object --bucket '${bucket}' --key '\''\(.Key)'\'' --version-id '\''\(.VersionId)'\''"' |
	xargs -i bash -c 'echo {} | awk '\''{printf $8": "}'\'' && if {} >/dev/null; then echo true; else echo false; fi'
}

# clean objects
co(){
	aws --endpoint-url=https://storage.yandexcloud.net s3api list-objects --bucket ${bucket} |
	jq '.[][] | "aws --endpoint-url=https://storage.yandexcloud.net s3api delete-object --bucket '${bucket}' --key '\''\(.Key)'\''"' |
	xargs -i bash -c 'echo {} && {}'
}

## BUCKET
# size
sb() {
	aws --endpoint-url=https://storage.yandexcloud.net s3api list-objects --bucket  ${bucket} |
	jq -n -r  '[ inputs | .[][].Size ] | add ' |
	awk '{print $1/1024/1024/1024 " GB "}'
}

# remove bucket
rb() {
	aws --endpoint-url=https://storage.yandexcloud.net s3api delete-bucket --bucket ${bucket}
}
