#!/bin/bash
image_name="shms_be"
registry="konghuan42"
name_docker_run="shms_be_"
# Gửi yêu cầu đến Docker Hub API để lấy phiên bản (tag) mới nhất
latest_version=$(curl -s "https://hub.docker.com/v2/repositories/$registry/$image_name/tags?page_size=1&page=1" | grep -o '"name":"[^"]*' | head -n 1 | sed 's/"name":"//')
# latest_version="v2.0.0"
# Kiểm tra nếu lấy được phiên bản mới nhất
if [ -n "$latest_version" ]; then
  echo "Phiên bản mới nhất của $registry/$image_name là: $latest_version"
    # Phân tách phiên bản thành các phần x, y, z
  IFS='.' read -r major minor patch <<< "$latest_version"

  # Tăng phiên bản bản vá (patch) lên 1
  patch=$((patch + 1))

  # Tạo phiên bản mới
  new_version="$major.$minor.$patch"
  echo "Phiên bản mới sẽ là: $new_version"
else
  echo "Không thể lấy phiên bản mới nhất của $registry/$image_name"
fi


# echo Started version build images $version
docker build --no-cache -t $image_name:$new_version .
# docker run -p 3000:9001 ielts_fe:$version
# docker run -d -p 9001:9001 --name $name_docker_run$new_version $registry/$image_name:$new_version


docker tag $image_name:$new_version $registry/$image_name:$new_version

docker push $registry/$image_name:$new_version


