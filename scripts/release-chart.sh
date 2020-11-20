#!/bin/sh
GITHUB_PAT=$1
HEAD_BRANCH=$(git rev-parse --abbrev-ref HEAD)

if [ -z "$GITHUB_PAT" ]; then
    echo "Usage: ./release-chart.sh GITHUB_PAT"
    exit 1
fi

check_dirty() {
if [ -n "$(git status | grep modified)" ]; then
    echo "Please clean your git status before continuing."
    exit 1
fi
}

package() {
cr package charts/spark 
}

upload() {
cr upload \
    --owner GarnerCorp \
    --git-repo business-analytics-helm \
    --token $GITHUB_PAT
}

update_index() {
cr index \
    --owner GarnerCorp \
    --git-repo business-analytics-helm \
    --charts-repo https://garnercorp.github.io/business-analytics-helm/ \
    --token $GITHUB_PAT \
    --index-path . 
}

release_to_ghpages() {
git fetch
git checkout gh-pages \
&& update_index \
&& git add index.yaml \
&& git commit -m "Add index for new spark release" \
&& git push \
&& git checkout $HEAD_BRANCH
}

check_dirty
rm -rf .cr-release-packages charts/spark/Chart.lock
package && upload && release_to_ghpages
