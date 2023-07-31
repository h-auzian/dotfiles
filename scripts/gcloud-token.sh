# Simple script to generate a GCloud token, copying it to the system clipboard.
# Requires xclip installed.

token="$(gcloud auth print-identity-token)"
echo -n $token | xclip -selection clipboard
