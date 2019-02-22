# README

## Description

### Careful about `rm -rf` !!!

Try avoid use `rm -rf` in shell script. If non-avoiable, check the path carefully.

### undelete NTFS volumn

[ntfs-3g_ntfsprogs](https://tuxera.com/opensource/ntfs-3g_ntfsprogs-2016.2.22.tgz) is a useful tool for NTFS filesystem. The __ntfsundelete__ tool can recovers a deleted file from an NTFS volume.

[About ntfsprogs](http://www.linuxfromscratch.org/blfs/view/svn/postlfs/ntfs-3g.html).

### recognize the recorved files

Not all files recorvered by __ntfsundelete__ has a filename, so use __file__ util to recognize the recorved files' type, and rename with suffixes automally by the shell scripts.

Add more supported file types in `parseFiles.sh` as you need. Cause the new office files are stored as `zip` archive, use `parseZip.sh` to recognize them and reset their suffixes.

## Usage

Just run the scripts in the work directory.

## Version

v0.1: First release.