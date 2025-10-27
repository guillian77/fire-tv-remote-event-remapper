# Fire TV remove event remapper

## Features
- Remap any buttons like: HOME_BUTTON, NETFLIX_BUTTON, ...
- Overload default app launcher on boot
- Reboot on failure

## Overview

<img width="852" height="562" alt="image" src="https://github.com/user-attachments/assets/0c16e576-3dee-4009-83b8-c87a08a6f2c6" />


## Install

1. Clone repository
```shell
git clone git@github.com:guillian77/fire-tv-remote-event-remapper.git
```
2. Copy or rename `config.sh.sample` to `config.sh`
3. Edit `DEVICE_IP` with your Fire TV IP address under `config.sh`
4. Start up the stack
```shell
docker compose up -d
```

## Listen events

### Samples

TRIGGER FIRE TV POWERING
> Listen to Fire TV boot by using `Amazon Fire TV Remote` event string.
<img width="954" height="69" alt="image" src="https://github.com/user-attachments/assets/8cc8cbfc-5a96-4ccd-9795-ee7ec7d5c72d" />


REMAP HOME BUTTON
> Remap "HOME" button event by launching Fire Wolf Launcher for Amazon Fire TV.
<img width="959" height="98" alt="image" src="https://github.com/user-attachments/assets/648c7aa5-0f78-4f31-83c7-a045527886a1" />

REMAP NETFLIX BUTTON
> Remap "NETFLIX" button event by launching Plex application.
<img width="826" height="96" alt="image" src="https://github.com/user-attachments/assets/1039861d-49c9-46cd-b504-a6f69cdde18c" />

### Configure your event

> Edit `events.sh` file and customize it with your own event codes.

> You can listen your events and remap them has your needs by editing these lines.
<img width="494" height="333" alt="image" src="https://github.com/user-attachments/assets/281edc9e-88d6-4828-9674-063f78709a31" />
