[0;1;32m●[0m mpd.service - Music Player Daemon
     Loaded: loaded (]8;;file://Titanic/etc/systemd/system/mpd.service\/etc/systemd/system/mpd.service]8;;\; [0;1;32menabled[0m; preset: ignored)
    Drop-In: /nix/store/nm48wbfynrrwb211qb7bh17iz64wyc7k-system-units/mpd.service.d
             └─]8;;file://Titanic/nix/store/nm48wbfynrrwb211qb7bh17iz64wyc7k-system-units/mpd.service.d/overrides.conf\overrides.conf]8;;\
     Active: [0;1;32mactive (running)[0m since Sun 2026-07-26 22:51:24 EDT; 5s ago
 Invocation: a2f61ff95f9d4345bc1c2b1c2c01e1a8
       Docs: ]8;;man:mpd(1)\man:mpd(1)]8;;\
             ]8;;man:mpd.conf(5)\man:mpd.conf(5)]8;;\
    Process: 227317 ExecStartPre=/nix/store/p3xpmj7j4j4plbmj92wrbn3jxi85hjk3-unit-script-mpd-pre-start/bin/mpd-pre-start (code=exited, status=0/SUCCESS)
   Main PID: 227324 (mpd)
         IP: 0B in, 0B out
         IO: 0B read, 0B written
      Tasks: 3[0;38:5:245m (limit: 38333)[0m
     Memory: 10.5M (peak: 11.2M)
        CPU: 168ms
     CGroup: /system.slice/mpd.service
             └─[0;38:5:245m227324 /nix/store/4q2id3h7xa9acqa37zpj8x0wnpn6mq72-mpd-0.24.13/bin/mpd --systemd /run/mpd/mpd.conf[0m

Jul 26 22:51:24 Titanic systemd[1]: Starting Music Player Daemon...
Jul 26 22:51:24 Titanic mpd[227324]: exception: Failed to access /home/expressive-synapse/mntMedia/Music: Permission denied
Jul 26 22:51:24 Titanic mpd[227324]: output: No 'audio_output' defined in config file
Jul 26 22:51:24 Titanic mpd[227324]: alsa_output: Error opening default ALSA device: Host is down
Jul 26 22:51:24 Titanic mpd[227324]: output: Successfully detected a jack audio device
Jul 26 22:51:24 Titanic systemd[1]: Started Music Player Daemon.
