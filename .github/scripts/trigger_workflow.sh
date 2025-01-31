#!/usr/bin/bash

GH_TOKEN=${GH_TOKEN:-$(gh auth token)}
GIT_REPOSITORY=${GIT_REPOSITORY:-"LiferayCloud/liferay-helm-chart"}
PUBLISH_BRANCH=${PUBLISH_BRANCH:-"gh-pages"}
WORKFLOW_NAME=${WORKFLOW_NAME:-"Deploy GitHub Pages"}

WORKFLOW_ID=$(
	curl -L -s \
		-H "Accept: application/vnd.github+json" \
		-H "Authorization: Bearer ${GH_TOKEN}" \
		-H "X-GitHub-Api-Version: 2022-11-28" \
		https://api.github.com/repos/${GIT_REPOSITORY}/actions/workflows \
		| jq ".workflows[] | select(.name == \"${WORKFLOW_NAME}\") | .id"
)

curl -L -s \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer ${GH_TOKEN}" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  https://api.github.com/repos/${GIT_REPOSITORY}/actions/workflows/${WORKFLOW_ID}/dispatches \
  --json '{"ref":"'${PUBLISH_BRANCH}'"}'
