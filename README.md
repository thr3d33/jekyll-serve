## Jekyll Serve w/Drafts

Development image for jekyll. <br>
Using:
`ruby:3.1-slim-bullseye` <br>
Options:
`--drafts` 
`--live_pooling`
`-H 0.0.0.0`
`-P 4040`

Build Image:

```bash
cd jekyll-serve
# Build using Dockerfile
docker build -t thr3d33/jekyll-serve . 
```

Copy compose.yaml file:

```bash
# Copy compose.yaml to your Jekyll website root directory.
cp compose.yaml <JEKYLL_PROJECT>
# Navigate to your site directory.
cd <JEKYLL_PROJECT>
# Run the compose.yaml file you copied over.
docker compose up -d && docker compose logs -f 
```
Alternativly, edit compose.yaml and point it to your project directory.

```bash
# Edit your volume mount in the compose.yaml file.
    volumes:
      - <JEKYLL_PROJECT>:/site
```

Navigate:
http://<SERVER_IP>:4040