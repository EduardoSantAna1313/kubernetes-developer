Exemplo com PersistentVolume (PV).

Cria um PV na pasta do host:

`/run/desktop/mnt/host/c/pv/logs`

Isso equivale ao diretório do Windows:

`C:\\pv\\logs`

Cria um PersistentVolumeClaim (PVC) para utilizar o PV e em seguida cria um POD com a referencia ao PVC.
