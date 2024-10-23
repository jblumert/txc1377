#!/bin/bash
sshpass -p 'Passw0rd' scp -o StrictHostKeyChecking=no gpfspatch.sh root@10.100.1.5:
sshpass -p 'Passw0rd' ssh -o StrictHostKeyChecking=no root@10.100.1.5 ./gpfspatch.sh
