# COM3021 2026 — Getting started

Use this repository once at the beginning of the module. It provides the shared Cloud Shell configuration and read-only checks used by all workshops.

## First-time setup

Clone this repository, create the shared configuration in your Cloud Shell home directory, and run the preflight check:

`git clone https://github.com/hsbarbosa/com3021-2026-getting-started.git`

`cd com3021-2026-getting-started`

`mkdir -p ~/com3021`

`cp config/project.env.example ~/com3021/project.env`

`nano ~/com3021/project.env`

`bash scripts/preflight.sh`

Use the Google account associated with your workshop credits. Do not create service-account keys and do not commit `project.env`.

## Before each workshop

Run `bash scripts/diagnose.sh`, then clone only the weekly repository released through Moodle. Weekly scripts use the same `~/com3021/project.env` file.

If there is a problem, save the diagnostic output and show it to the instructor before retrying commands that may create billable resources.
