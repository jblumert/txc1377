#!/bin/bash
#sshpass -p 'Passw0rd!' ssh -o StrictHostKeyChecking=no root@10.100.1.5
mmumount fs1
mmdelfs1
mmcrfs fs1 -F nsd -A yes -D nfs4 –version “5.2.0.0” -j cluster -Q yes -S relatime -T /scale/fs1
mmmount fs1
mmquotaon fs1
mmdefquotaon fs1
mmquotaon -a
mmchfs fs1 --perfileset-quota
mmchconfig enforceFilesetQuoteOnRoot=yes -i
mmchconfig controlSetxattrImmutableSELinux=yes -i
mmchfs fs1 --filesetdf
mmchfs fs1 ---auto-inode-limit
systemctl disable firewalld
systemctl stop firewalld


