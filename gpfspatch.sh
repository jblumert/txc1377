#!/bin/bash
echo "unmounting fs1"
mmumount fs1
echo "deleting fs1"
mmdelfs1
echo "creating fs1"
mmcrfs fs1 -F nsd -A yes -D nfs4 –version “5.2.0.0” -j cluster -Q yes -S relatime -T /scale/fs1
echo "mounting fs1"
mmmount fs1
echo "checking fs1"
df -h
mmlsfs fs1
echo setting quota for fs1
mmquotaon fs1
mmdefquotaon fs1
mmquotaon -a
mmchfs fs1 --perfileset-quota
mmchconfig enforceFilesetQuoteOnRoot=yes -i
mmchconfig controlSetxattrImmutableSELinux=yes -i
mmchfs fs1 --filesetdf
mmchfs fs1 ---auto-inode-limit
echo "disabling firewall"
systemctl disable firewalld
systemctl stop firewalld
