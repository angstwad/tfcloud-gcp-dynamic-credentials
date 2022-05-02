#!/bin/bash

curl --silent \
  -H "Content-type: application/json" \
  -d "{\"TFC_TOKEN\": \"${ATLAS_TOKEN}\", \"RUN_ID\": \"${TFC_RUN_ID}\"}" \
  'https://us-central1-some-project.cloudfunctions.net/generate_token'
